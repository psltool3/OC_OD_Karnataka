<?php

require('../util/Connection.php');
require '../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$month = "";
	$query = "SELECT * FROM optimised_table_leg1 ORDER BY last_updated DESC LIMIT 1";
	$result = mysqli_query($con,$query);
$response = array();
	while($row = mysqli_fetch_array($result))
	{
		$month = $row["month"];
		$year = $row["year"];
	}


// Check if format is specified in GET request
if (isset($_GET['format'])) {
    $format = $_GET['format'];
	$district = $_GET['district'];
    
    #$columns = ["scenario","from","from_state","from_id","from_name","from_district","from_lat","from_long","to","to_state","to_id","to_name","to_district","to_lat","to_long","commodity","quantity","distance","new_id_district","reason_district","new_distance_district","approve_district","approve_admin","reason_admin","new_id_admin","new_distance_admin"];
	$columns = ["scenario","from","from_state","from_id","from_name","from_district","from_block","from_lat","from_long","to","to_state","to_id","to_name","to_district","to_block","to_lat","to_long","commodity","quantity","distance","status","approve_district","new_id_admin","reason_admin","new_distance_admin"];
	$columns_pdf = ["scenario","from","from_id","from_name","from_district","from_block","from_lat","from_long","to","to_id","to_name","to_district","to_block","to_lat","to_long","commodity","quantity","distance","status","approve_district","new_id_admin","reason_admin","new_distance_admin"];

    $query = "SELECT * FROM optimised_table_leg1 WHERE month='$month' AND year='$year'";
	$result = mysqli_query($con,$query);
	$numrow = mysqli_num_rows($result);
	$id = "";
	if($numrow>0){
		$row = mysqli_fetch_assoc($result);
		$id = $row['id'];
	}

	$tablename = "optimiseddata_leg1_".$id;
	$query = "SELECT * FROM ".$tablename." WHERE 1";
	
	if($district!="" and $district!="all"){
		$query = "SELECT * FROM ".$tablename." WHERE to_district='$district'";
	}
    $result = mysqli_query($con,$query);
    $numrows = mysqli_num_rows($result);
    $tableData = array();
	$tableData_pdf = array();
    $label_map = [
        'from_block' => 'from_taluka',
        'to_block' => 'to_taluka',
        'approve_district' => 'RO Accepted',
        'new_id_admin' => 'FCI Release Warehouse',
        'reason_admin' => 'Reason for not Approve',
        'new_distance_admin' => 'Distance'
    ];
    $header_csv = array_map(function($v) use ($label_map) { return isset($label_map[$v]) ? $label_map[$v] : $v; }, $columns);
    $header_pdf = array_map(function($v) use ($label_map) { return isset($label_map[$v]) ? $label_map[$v] : $v; }, $columns_pdf);
    array_push($tableData, $header_csv);
    array_push($tableData_pdf, $header_pdf);

    if($numrows>0){
        while($row = mysqli_fetch_array($result)){
			if($row['new_id_admin']!=null or $row['new_id_admin']!=""){
				$new_id = $row['new_id_admin'];
				$query_warehouse = "SELECT latitude,longitude,district FROM warehouse_leg1_".$id." WHERE id='$new_id'";
				$result_warehouse = mysqli_query($con,$query_warehouse);
				$numrows_warehouse = mysqli_num_rows($result_warehouse);
				if($numrows_warehouse!=0){
					$row_warehouse = mysqli_fetch_assoc($result_warehouse);
					$row["from_lat"] = $row_warehouse['latitude'];
					$row["from_long"] = $row_warehouse['longitude'];
					$row["from_district"] = $row_warehouse['district'];
				}
				$row["from_id"] = $row['new_id_admin'];
				$row["from_name"] = $row['new_name_admin'];
				$row["distance"] = $row['new_distance_admin'];
			}
			else if(($row['new_id_district']!=null or $row['new_id_district']!="") and $row['approve_admin']=="yes"){
				$new_id = $row['new_id_district'];
				$query_warehouse = "SELECT latitude,longitude,district FROM warehouse_leg1_".$id." WHERE id='$new_id'";
				$result_warehouse = mysqli_query($con,$query_warehouse);
				$numrows_warehouse = mysqli_num_rows($result_warehouse);
				if($numrows_warehouse!=0){
					$row_warehouse = mysqli_fetch_assoc($result_warehouse);
					$row["from_lat"] = $row_warehouse['latitude'];
					$row["from_long"] = $row_warehouse['longitude'];
					$row["from_district"] = $row_warehouse['district'];
				}
				$row["from_id"] = $row['new_id_district'];
				$row["from_name"] = $row['new_name_district'];
				$row["distance"] = $row['new_distance_district'];
			}
			$isImplemented = (
				isset($row["status"]) && strtolower(trim($row["status"])) === 'implemented'
			);
			$row["status"] = $isImplemented ? 'Implemented' : 'Not Implemented';
            $temp = array();
			$temp_pdf = array();
            for($i=0;$i<count($columns);$i++){
                array_push($temp,$row[$columns[$i]]);
            }
            for($i=0;$i<count($columns_pdf);$i++){
                array_push($temp_pdf,$row[$columns_pdf[$i]]);
            }
            array_push($tableData,$temp);
            array_push($tableData_pdf,$temp_pdf);
        }
    }
    
    // Filename for the downloaded file
    $filename = 'table_data';

    // Set headers for the chosen format
    switch ($format) {
        case 'csv':
            header('Content-Type: text/csv');
            header('Content-Disposition: attachment; filename="' . $filename . '.csv"');
            outputCSV($tableData);
            break;

        case 'xlsx':
            // Create a new PhpSpreadsheet object
            $spreadsheet = new Spreadsheet();
            $sheet = $spreadsheet->getActiveSheet();

            // Set column names as the first row
            /*$columnIndex = 1;
            foreach ($columns as $columnName) {
                $sheet->setCellValueByColumnAndRow($columnIndex, 1, $columnName);
                $columnIndex++;
            }*/

            // Insert data tableData
            $rowIndex = 1;
            foreach ($tableData as $rowData) {
                $columnIndex = 1;
                foreach ($rowData as $value) {
                    $sheet->setCellValueByColumnAndRow($columnIndex, $rowIndex, $value);
                    $columnIndex++;
                }
                $rowIndex++;
            }


            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="' . $filename . '.xlsx"');
            header('Cache-Control: max-age=0');

            $writer = new Xlsx($spreadsheet);
            $writer->save('php://output');
            break;

        case 'pdf':
            require_once('fpdf/fpdf.php');
            if (!class_exists('PDF_Table')) {
                class PDF_Table extends FPDF {
                    function NbLines($w, $txt) {
                        $cw = &$this->CurrentFont['cw'];
                        if ($w == 0) $w = $this->w - $this->rMargin - $this->x;
                        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
                        $s = str_replace("", '', (string)$txt);
                        $nb = strlen($s);
                        if ($nb > 0 && $s[$nb - 1] == "
") $nb--;
                        $sep = -1; $i = 0; $j = 0; $l = 0; $nl = 1;
                        while ($i < $nb) {
                            $c = $s[$i];
                            if ($c == "
") {
                                $i++; $sep = -1; $j = $i; $l = 0; $nl++; continue;
                            }
                            if ($c == ' ') $sep = $i;
                            $l += $cw[$c] ?? 0;
                            if ($l > $wmax) {
                                if ($sep == -1) {
                                    if ($i == $j) $i++;
                                } else {
                                    $i = $sep + 1;
                                }
                                $sep = -1; $j = $i; $l = 0; $nl++;
                            } else {
                                $i++;
                            }
                        }
                        return $nl;
                    }
                    function rowHeight($row, $colWidths, $lineHeight) {
                        $max = 1; $i = 0;
                        foreach ($row as $txt) {
                            $w = $colWidths[$i];
                            $lines = $this->NbLines($w, strval($txt));
                            $max = max($max, $lines);
                            $i++;
                        }
                        return $lineHeight * $max + 2;
                    }
                    function drawRow($row, $colWidths, $lineHeight, $isHeader = false) {
                        $startX = $this->GetX(); $y = $this->GetY();
                        $h = $this->rowHeight($row, $colWidths, $lineHeight);
                        $i = 0;
                        foreach ($row as $cell) {
                            $w = $colWidths[$i]; $x = $this->GetX();
                            if ($isHeader) $this->SetFillColor(215, 225, 245);
                            else $this->SetFillColor(255, 255, 255);
                            $this->Rect($x, $y, $w, $h, 'F');
                            $cellText = strval($cell);
                            $lines = $this->NbLines($w, $cellText);
                            $textHeight = $lines * $lineHeight;
                            $topPadding = max(0, ($h - $textHeight) / 2);
                            $this->SetXY($x, $y + $topPadding);
                            $this->MultiCell($w, $lineHeight, $cellText, 0, 'C');
                            $this->Rect($x, $y, $w, $h, 'D');
                            $this->SetXY($x + $w, $y);
                            $i++;
                        }
                        $this->SetXY($startX, $y + $h);
                    }
                }
            }
            $pdf = new PDF_Table('L', 'mm', 'A4');
            $pdf->SetMargins(5, 8, 5);
            $pdf->SetAutoPageBreak(false);
            $pdf->AddPage();
            $pageWidth = $pdf->GetPageWidth() - 10;
            $lineHeight = 3.2;
            
            $numCols = count($tableData[0]);
            $colWidths = [];
            for ($i = 0; $i < $numCols; $i++) {
                $colWidths[] = $pageWidth / $numCols;
            }
            
            $pdf->SetFont('Arial', 'B', 5.5);
            $pdf->drawRow($tableData[0], $colWidths, $lineHeight, true);
            $pdf->SetFont('Arial', '', 5);
            $pageHeight = $pdf->GetPageHeight();
            $bottomMargin = 10;
            for ($i = 1; $i < count($tableData); $i++) {
                $nextHeight = $pdf->rowHeight($tableData[$i], $colWidths, $lineHeight);
                if ($pdf->GetY() + $nextHeight > $pageHeight - $bottomMargin) {
                    $pdf->AddPage();
                    $pdf->SetFont('Arial', 'B', 5.5);
                    $pdf->drawRow($tableData[0], $colWidths, $lineHeight, true);
                    $pdf->SetFont('Arial', '', 5);
                }
                $pdf->drawRow($tableData[$i], $colWidths, $lineHeight);
            }
            header('Content-Type: application/pdf');
            header('Content-Disposition: attachment; filename="' . $filename . '.pdf"');
            echo $pdf->Output('S');
            break;

        default:
            echo 'Error : Invalid format specified.';
            break;
    }
} else {
    echo 'Error : Please specify a format in the GET request (e.g., ?format=pdf).';
}



// Function to output CSV data
function outputCSV($data) {
    $output = fopen('php://output', 'w');
    foreach ($data as $row) {
        fputcsv($output, $row);
    }
    fclose($output);
}

exit();
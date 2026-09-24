<?php
error_reporting(0);
ini_set('display_errors', 0);

require('../util/Connection.php');
require '../vendor/autoload.php';
require('../util/SessionCheck.php');


use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


// Check if format is specified in GET request
if (isset($_GET['format'])) {
    $format = $_GET['format'];
    $district = $_SESSION['district_district'];
    $columns = ["scenario","from","from_state","from_id","from_name","from_district","from_block","from_lat","from_long","to","to_state","to_id","to_name","to_district","to_block","to_lat","to_long","commodity","quantity","distance","status"];
	$columns_pdf = ["scenario","from","from_id","from_name","from_district","from_block","from_lat","from_long","to","to_id","to_name","to_district","to_block","to_lat","to_long","commodity","quantity","distance","status"];

	$column_labels = [
		"scenario" => "Scenario",
		"from" => "From",
		"from_state" => "From_State",
		"from_id" => "From_ID",
		"from_name" => "From_Name",
		"from_district" => "From_District",
		"from_block" => "from_taluka",
		"from_lat" => "From_Lat",
		"from_long" => "From_Long",
		"to" => "To",
		"to_state" => "To_State",
		"to_id" => "To_ID",
		"to_name" => "To_Name",
		"to_district" => "To_District",
		"to_block" => "to_taluka",
		"to_lat" => "To_Lat",
		"to_long" => "To_Long",
		"commodity" => "Commodity",
		"quantity" => "quantity(Qtl)",
		"distance" => "Distance(Km)",
		"status" => "Status"
	];

	
	$query = "SELECT * FROM optimised_table ORDER BY last_updated DESC LIMIT 1";
	$result = mysqli_query($con,$query);
	$numrow = mysqli_num_rows($result);
	$id = "";
	if($numrow>0){
		$row = mysqli_fetch_assoc($result);
		$id = $row['id'];
	}

	$tablename = "optimiseddata_".$id;
    $query = "SELECT * FROM ".$tablename." WHERE to_district='$district'";
    $result = mysqli_query($con,$query);
    $numrows = mysqli_num_rows($result);
    $tableData = array();
    $tableData_pdf = array();

	$header = array();
	foreach($columns as $c) {
		$header[] = $column_labels[$c] ?? $c;
	}
	$header_pdf = array();
	foreach($columns_pdf as $c) {
		$header_pdf[] = $column_labels[$c] ?? $c;
	}
    array_push($tableData,$header);
    array_push($tableData_pdf,$header_pdf);

    if($numrows>0){
        while($row = mysqli_fetch_array($result)){
			if($row['new_id_admin']!=null or $row['new_id_admin']!=""){
				$id = $row['new_id_admin'];
				$query_warehouse = "SELECT latitude,longitude,district FROM warehouse WHERE id='$id'";
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
				$id = $row['new_id_district'];
				$query_warehouse = "SELECT latitude,longitude,district FROM warehouse WHERE id='$id'";
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
			// $isImplemented = (
			// 	isset($row["status"]) && strtolower(trim($row["status"])) === 'implemented' &&
			// 	isset($row["approve_district"]) && strtolower(trim($row["approve_district"])) === 'yes'
			// );
			// $row["status"] = $isImplemented ? 'Implemented' : '';
            $isImplemented = (
    isset($row["status"]) && strtolower(trim($row["status"])) === 'implemented' &&
    isset($row["approve_district"]) && strtolower(trim($row["approve_district"])) === 'yes'
);

$row["status"] = $isImplemented ? 'Implemented' : 'Not Implemented';
            $temp = array();
            $temp_pdf = array();
            for($i=0;$i<count($columns);$i++){
                array_push($temp,$row[$columns[$i]] ?? "");
            }
            for($i=0;$i<count($columns_pdf);$i++){
                array_push($temp_pdf,$row[$columns_pdf[$i]] ?? "");
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
            $columnIndex = 1;
            foreach ($columns as $columnName) {
                $sheet->setCellValueByColumnAndRow($columnIndex, 1, $column_labels[$columnName] ?? $columnName);
                $columnIndex++;
            }

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
                        if ($w == 0) {
                            $w = $this->w - $this->rMargin - $this->x;
                        }
                        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
                        $s = str_replace("\r", '', (string)$txt);
                        $nb = strlen($s);
                        if ($nb > 0 && $s[$nb - 1] == "\n") {
                            $nb--;
                        }
                        $sep = -1;
                        $i = 0;
                        $j = 0;
                        $l = 0;
                        $nl = 1;
                        while ($i < $nb) {
                            $c = $s[$i];
                            if ($c == "\n") {
                                $i++;
                                $sep = -1;
                                $j = $i;
                                $l = 0;
                                $nl++;
                                continue;
                            }
                            if ($c == ' ') {
                                $sep = $i;
                            }
                            $l += $cw[$c] ?? 0;
                            if ($l > $wmax) {
                                if ($sep == -1) {
                                    if ($i == $j) {
                                        $i++;
                                    }
                                } else {
                                    $i = $sep + 1;
                                }
                                $sep = -1;
                                $j = $i;
                                $l = 0;
                                $nl++;
                            } else {
                                $i++;
                            }
                        }
                        return $nl;
                    }

                    function rowHeight($row, $colWidths, $lineHeight) {
                        $max = 1;
                        $i = 0;
                        foreach ($row as $txt) {
                            $w = $colWidths[$i];
                            $lines = $this->NbLines($w, strval($txt));
                            $max = max($max, $lines);
                            $i++;
                        }
                        return $lineHeight * $max + 2;
                    }

                    function drawRow($row, $colWidths, $lineHeight, $isHeader = false) {
                        $startX = $this->GetX();
                        $y = $this->GetY();
                        $h = $this->rowHeight($row, $colWidths, $lineHeight);
                        $i = 0;

                        foreach ($row as $cell) {
                            $w = $colWidths[$i];
                            $x = $this->GetX();

                            if ($isHeader) {
                                $this->SetFillColor(215, 225, 245);
                            } else {
                                $this->SetFillColor(255, 255, 255);
                            }
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

            $col_weights = [
                "scenario"               => 0.9,
                "from"                   => 0.7,
                "from_id"                => 0.9,
                "from_name"              => 1.7,
                "from_district"          => 1.1,
                "from_block"             => 1.0,
                "from_lat"               => 0.9,
                "from_long"              => 0.9,
                "to"                     => 0.6,
                "to_id"                  => 0.9,
                "to_name"                => 1.7,
                "to_district"            => 1.1,
                "to_block"               => 1.0,
                "to_lat"                 => 0.9,
                "to_long"                => 0.9,
                "commodity"              => 1.0,
                "quantity"               => 0.9,
                "distance"               => 0.9,
                "status"                 => 0.9
            ];

            $total_weight = 0;
            foreach ($columns_pdf as $col) {
                $total_weight += isset($col_weights[$col]) ? $col_weights[$col] : 1.0;
            }
            $colWidths = [];
            foreach ($columns_pdf as $col) {
                $colWidths[] = (($col_weights[$col] ?? 1.0) / $total_weight) * $pageWidth;
            }

            $pdf->SetFont('Arial', 'B', 5.5);
            $pdf->drawRow($tableData_pdf[0], $colWidths, $lineHeight, true);

            $pdf->SetFont('Arial', '', 5);
            $pageHeight = $pdf->GetPageHeight();
            $bottomMargin = 10;

            for ($i = 1; $i < count($tableData_pdf); $i++) {
                $nextHeight = $pdf->rowHeight($tableData_pdf[$i], $colWidths, $lineHeight);
                if ($pdf->GetY() + $nextHeight > $pageHeight - $bottomMargin) {
                    $pdf->AddPage();
                    $pdf->SetFont('Arial', 'B', 5.5);
                    $pdf->drawRow($tableData_pdf[0], $colWidths, $lineHeight, true);
                    $pdf->SetFont('Arial', '', 5);
                }
                $pdf->drawRow($tableData_pdf[$i], $colWidths, $lineHeight);
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
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
    	$columns = ["scenario","from","from_state","from_id","from_name","from_district","from_block","from_lat","from_long","to","to_state","to_id","to_name","to_district","to_block","to_lat","to_long","commodity","quantity","distance"];
	$columns_pdf = ["scenario","from","from_id","from_name","from_district","from_block","from_lat","from_long","to","to_id","to_name","to_district","to_block","to_lat","to_long","commodity","quantity","distance"];

	$column_labels = [
		"scenario" => "Scenario",
		"from" => "From",
		"from_state" => "From_State",
		"from_id" => "From_ID",
		"from_name" => "From_Name",
		"from_district" => "From_District",
		"from_block" => "From_Taluka",
		"from_lat" => "From_Lat",
		"from_long" => "From_Long",
		"to" => "To",
		"to_state" => "To_State",
		"to_id" => "To_ID",
		"to_name" => "To_Name",
		"to_district" => "To_District",
		"to_block" => "To_Taluka",
		"to_lat" => "To_Lat",
		"to_long" => "To_Long",
		"commodity" => "Commodity",
		"quantity" => "quantity(Qtl)",
		"distance" => "Distance(Km)"
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
            require('fpdf/fpdf.php');
            $pdf = new FPDF('L', 'mm', 'A4');
            $pdf->AddPage();

            $pageWidth = $pdf->GetPageWidth() - 20;
            $lineHeight = 4; // Use slightly smaller line height for multi-line cells

            $col_weights = [
                "scenario" => 0.8,
                "from" => 0.8,
                "from_id" => 1.0,
                "from_name" => 2.5,
                "from_district" => 1.2,
                "from_block" => 1.2,
                "from_lat" => 1.0,
                "from_long" => 1.0,
                "to" => 0.8,
                "to_id" => 1.0,
                "to_name" => 2.5,
                "to_district" => 1.2,
                "to_block" => 1.2,
                "to_lat" => 1.0,
                "to_long" => 1.0,
                "commodity" => 1.0,
                "quantity" => 1.0,
                "distance" => 1.0
            ];

            $total_weight = 0;
            foreach ($columns_pdf as $col) {
                $total_weight += isset($col_weights[$col]) ? $col_weights[$col] : 1.0;
            }
            $colWidths = [];
            foreach ($columns_pdf as $col) {
                $colWidths[] = (($col_weights[$col] ?? 1.0) / $total_weight) * $pageWidth;
            }

            if (!function_exists('rowHeight')) {
                function rowHeight($pdf, $row, $colWidths, $lineHeight) {
                    $max = 1;
                    $i = 0;
                    foreach ($row as $txt) {
                        $w = $colWidths[$i];
                        $lines = ceil($pdf->GetStringWidth(strval($txt)) / ($w - 2));
                        $max = max($max, $lines);
                        $i++;
                    }
                    return $lineHeight * $max;
                }
            }

            if (!function_exists('drawRow')) {
                function drawRow($pdf, $row, $colWidths, $lineHeight, $isHeader = false) {
                    $x = $pdf->GetX();
                    $y = $pdf->GetY();
                    $h = rowHeight($pdf, $row, $colWidths, $lineHeight);
                    $i = 0;
                    $pdf->SetFillColor($isHeader ? 220 : 255, $isHeader ? 220 : 255, $isHeader ? 220 : 255);
                    foreach ($row as $cell) {
                        $w = $colWidths[$i];
                        $pdf->Rect($x, $y, $w, $h);
                        $pdf->MultiCell($w, $lineHeight, strval($cell), 0, 'C', $isHeader);
                        $x += $w;
                        $pdf->SetXY($x, $y);
                        $i++;
                    }
                    $pdf->Ln($h);
                }
            }

            $pdf->SetFont('Arial', 'B', 5);
            drawRow($pdf, $tableData_pdf[0], $colWidths, $lineHeight, true);

            $pdf->SetFont('Arial', '', 5);
            for ($i = 1; $i < count($tableData_pdf); $i++) {
                $nextHeight = rowHeight($pdf, $tableData_pdf[$i], $colWidths, $lineHeight);
                if ($pdf->GetY() + $nextHeight > $pdf->GetPageHeight() - 15) {
                    $pdf->AddPage();
                    $pdf->SetFont('Arial', 'B', 5);
                    drawRow($pdf, $tableData_pdf[0], $colWidths, $lineHeight, true);
                    $pdf->SetFont('Arial', '', 5);
                }
                drawRow($pdf, $tableData_pdf[$i], $colWidths, $lineHeight);
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
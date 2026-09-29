<?php

require('../util/Connection.php');
require '../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


// Check if format is specified in GET request
if (isset($_GET['format'])) {
    $format = $_GET['format'];
    
    $tablename = isset($_GET['tableName']) ? $_GET['tableName'] : '';
    $is_fci = (strpos($tablename, 'fci_') !== false);
    if ($is_fci) {
        $columns = ["district","taluka","name","id","type","latitude","longitude","demand","demand_rice"];
    } else {
        $columns = ["district","taluka","name","id","warehousetype","type","latitude","longitude","storage","ragi","jowar"];
    }

    if (!function_exists('get_cell_val')) {
        function get_cell_val($row, $col, $is_fci) {
            if ($col == "taluka") {
                return isset($row['taluka']) ? $row['taluka'] : (isset($row['block']) ? $row['block'] : '');
            }
            if ($col == "type" && $is_fci) {
                return isset($row['type']) ? $row['type'] : (isset($row['warehousetype']) ? $row['warehousetype'] : '');
            }
            if ($col == "demand") {
                return isset($row['demand']) ? $row['demand'] : (isset($row['storage']) ? $row['storage'] : '');
            }
            if ($col == "demand_rice") {
                return isset($row['demand_rice']) ? $row['demand_rice'] : (isset($row['frice']) ? $row['frice'] : '');
            }
            if ($col == "ragi") {
                return isset($row['ragi']) ? $row['ragi'] : (isset($row['Ragi']) ? $row['Ragi'] : '');
            }
            if ($col == "jowar") {
                return isset($row['jowar']) ? $row['jowar'] : (isset($row['Jowar']) ? $row['Jowar'] : '');
            }
            return isset($row[$col]) ? $row[$col] : '';
        }
    }

    if (!function_exists('outputCSV')) {
        function outputCSV($data) {
            $output = fopen('php://output', 'w');
            foreach ($data as $row) {
                fputcsv($output, $row);
            }
            fclose($output);
        }
    }

	if(isset($_GET['tableName1']))
	{
		$tablename1 = $_GET['tableName1'];
	}
	else{
		$tablename1="";
	}
	$tableData = array();
    array_push($tableData,$columns);

	$district = isset($_GET['district']) ? trim($_GET['district']) : '';
	$where = " WHERE 1";
	if ($district != "" && strtolower($district) != "all") {
		$where .= " AND district='" . mysqli_real_escape_string($con, $district) . "'";
	}

	$query = "SELECT * FROM ".$tablename.$where;
    $result = mysqli_query($con,$query);
    $numrows = $result ? mysqli_num_rows($result) : 0;
    
    if($numrows>0){
        while($row = mysqli_fetch_array($result)){
            $temp = array();
            for($i=0;$i<count($columns);$i++){
                if($columns[$i]=="from_id"){
                    if(strlen($row["new_id"])>0 and $row["approve"]=="yes"){
                        array_push($temp,$row["new_id"]);
                    }
                    else{
                        array_push($temp, get_cell_val($row, $columns[$i], $is_fci));
                    }
                }
                else{            
                    array_push($temp, get_cell_val($row, $columns[$i], $is_fci));
                }
            }
            array_push($tableData,$temp);
        }
    }
	
	if($tablename!=$tablename1 and $tablename1!="")
	{
		$where1 = " WHERE NOT EXISTS (
					  SELECT 1 FROM " . $tablename . " t1 
					  WHERE t.name = t1.name AND t.id = t1.id
					)";
		if ($district != "" && strtolower($district) != "all") {
			$where1 .= " AND t.district='" . mysqli_real_escape_string($con, $district) . "'";
		}
		$query = "SELECT * FROM " . $tablename1 . " t " . $where1;
		$result = mysqli_query($con,$query);
		$numrows = $result ? mysqli_num_rows($result) : 0;
		
		if($numrows>0){
			while($row = mysqli_fetch_array($result)){
				$temp = array();
				for($i=0;$i<count($columns);$i++){
					if($columns[$i]=="from_id"){
						if(strlen($row["new_id"])>0 and $row["approve"]=="yes"){
							array_push($temp,$row["new_id"]);
						}
						else{
							array_push($temp, get_cell_val($row, $columns[$i], $is_fci));
						}
					}
					else{            
						array_push($temp, get_cell_val($row, $columns[$i], $is_fci));
					}
				}
				array_push($tableData,$temp);
			}
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
                $sheet->setCellValueByColumnAndRow($columnIndex, 1, $columnName);
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
                        if ($w == 0) $w = $this->w - $this->rMargin - $this->x;
                        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
                        $s = str_replace("", '', (string)$txt);
                        $nb = strlen($s);
                        if ($nb > 0 && $s[$nb - 1] == "\n") $nb--;
                        $sep = -1; $i = 0; $j = 0; $l = 0; $nl = 1;
                        while ($i < $nb) {
                            $c = $s[$i];
                            if ($c == "\n") {
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
            for ($i = 0; $i < numCols; $i++) {
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

//exit();
?>
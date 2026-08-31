<?php
error_reporting(0);
ini_set('display_errors', 0);

require('../util/Connection.php');
require('../util/SessionCheck.php');
require '../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

if (isset($_GET['format'])) {
    $format = $_GET['format'];

    $columns = [
        "scenario","from","from_state","from_id","from_name","from_district","from_block",
        "from_lat","from_long","to","to_state","to_id","to_name","to_district","to_block",
        "to_lat","to_long","commodity","quantity","distance","status"
    ];

    $columns_pdf = [
        "scenario","from","from_id","from_name","from_district","from_block",
        "from_lat","from_long","to","to_id","to_name","to_district","to_block",
        "to_lat","to_long","commodity","quantity","distance","status"
    ];

    // ================= COLUMN DISPLAY NAMES =================
    $column_labels = [
        "scenario" => "Scenario",
        "from" => "From",
        "from_state" => "From State",
        "from_id" => "From ID",
        "from_name" => "From Name",
        "from_district" => "From District",
        "from_block" => "From_Taluka",
        "from_lat" => "From Latitude",
        "from_long" => "From Longitude",
        "to" => "To",
        "to_state" => "To State",
        "to_id" => "To ID",
        "to_name" => "To Name",
        "to_district" => "To District",
        "to_block" => "To_Taluka",
        "to_lat" => "To Latitude",
        "to_long" => "To Longitude",
        "commodity" => "Commodity",
        "quantity" => "Quantity",
        "distance" => "Distance",

        "new_id_district" => "District Suggested Warehouse",
        "reason_district" => "District Reason for not Approve",
        "new_distance_district" => "District Suggested Warehouse Distance",
        "approve_district" => "District Reviewed",
        "approve_admin" => "Approve / Not Approve",
        "reason_admin" => "Reason for not Approve",
        "new_id_admin" => "Suggested Warehouse",
        "new_distance_admin" => "Suggested Warehouse Distance",
        "status" => "Status"
    ];

    // ================= INPUT =================
    $month = $_GET['month'];
    $district = $_GET['district'];

    $parts = explode('_', $month);
    $month = $parts[0];
    $year = $parts[1];

    // ================= FETCH TABLE =================
    $query = "SELECT * FROM optimised_table WHERE month='$month' AND year='$year'";
    $result = mysqli_query($con, $query);
    $id = "";

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $id = $row['id'];
    }

    $tablename = "optimiseddata_" . $id;

    $query = "SELECT * FROM $tablename WHERE to_district='$district'";
    if ($district == "" || $district == "all") {
        $query = "SELECT * FROM $tablename WHERE status='implemented'";
    }

    $result = mysqli_query($con, $query);

    $tableData = [];
    $tableData_pdf = [];

    $column_labels_pdf = [
        "scenario" => "Scenario",
        "from" => "From",
        "from_id" => "From ID",
        "from_name" => "From Name",
        "from_district" => "From District",
        "from_block" => "From_Taluka",
        "from_lat" => "From Lat",
        "from_long" => "From Long",
        "to" => "To",
        "to_id" => "To ID",
        "to_name" => "To Name",
        "to_district" => "To District",
        "to_block" => "To_Taluka",
        "to_lat" => "To Lat",
        "to_long" => "To Long",
        "commodity" => "Commodity",
        "quantity" => "Quantity",
        "distance" => "Distance",
        "new_id_district" => "District Warehouse",
        "reason_district" => "District Reason",
        "new_distance_district" => "District Distance",
        "approve_district" => "District Review",
        "approve_admin" => "Admin Approve",
        "reason_admin" => "Admin Reason",
        "new_id_admin" => "Suggest Warehouse",
        "new_distance_admin" => "Suggest Distance"
    ];

    // ================= HEADERS =================
    $header = [];
    foreach ($columns as $c) {
        $header[] = $column_labels[$c];
    }
    $tableData[] = $header;

    $header_pdf = [];
    foreach ($columns_pdf as $c) {
        $header_pdf[] = $column_labels_pdf[$c] ?? $column_labels[$c];
    }
    $tableData_pdf[] = $header_pdf;

    // ================= DATA ROWS (UNCHANGED LOGIC) =================
    while ($row = mysqli_fetch_array($result)) {

        if ($row['new_id_admin'] != null && $row['new_id_admin'] != "") {
            $wid = $row['new_id_admin'];
            $qr = "SELECT latitude,longitude,district FROM warehouse WHERE id='$wid'";
            $rw = mysqli_query($con, $qr);
            if (mysqli_num_rows($rw) > 0) {
                $wh = mysqli_fetch_assoc($rw);
                $row["from_lat"] = $wh['latitude'];
                $row["from_long"] = $wh['longitude'];
                $row["from_district"] = $wh['district'];
            }
            $row["from_id"] = $row['new_id_admin'];
            $row["from_name"] = $row['new_name_admin'];
            $row["distance"] = $row['new_distance_admin'];
        }
        else if ($row['new_id_district'] != null && $row['new_id_district'] != "" && $row['approve_admin'] == "yes") {
            $wid = $row['new_id_district'];
            $qr = "SELECT latitude,longitude,district FROM warehouse WHERE id='$wid'";
            $rw = mysqli_query($con, $qr);
            if (mysqli_num_rows($rw) > 0) {
                $wh = mysqli_fetch_assoc($rw);
                $row["from_lat"] = $wh['latitude'];
                $row["from_long"] = $wh['longitude'];
                $row["from_district"] = $wh['district'];
            }
            $row["from_id"] = $row['new_id_district'];
            $row["from_name"] = $row['new_name_district'];
            $row["distance"] = $row['new_distance_district'];
        }

        $isImplemented = (
            isset($row["status"]) && strtolower(trim($row["status"])) === 'implemented'
        );
        $row["status"] = $isImplemented ? 'Implemented' : 'Not Implemented';

        $temp = [];
        $temp_pdf = [];

        foreach ($columns as $c) {
            $temp[] = $row[$c] ?? "";
        }
        foreach ($columns_pdf as $c) {
            $temp_pdf[] = $row[$c] ?? "";
        }

        $tableData[] = $temp;
        $tableData_pdf[] = $temp_pdf;
    }

    $filename = "table_data";

    // ================= EXPORT =================
    switch ($format) {

        case 'csv':
            header('Content-Type: text/csv');
            header('Content-Disposition: attachment; filename="' . $filename . '.csv"');
            outputCSV($tableData);
            break;

        case 'xlsx':
            $spreadsheet = new Spreadsheet();
            $sheet = $spreadsheet->getActiveSheet();

            $r = 1;
            foreach ($tableData as $rowData) {
                $c = 1;
                foreach ($rowData as $val) {
                    $sheet->setCellValueByColumnAndRow($c, $r, $val);
                    $c++;
                }
                $r++;
            }

            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment; filename="' . $filename . '.xlsx"');
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
                "new_id_district"        => 1.2,
                "reason_district"        => 1.7,
                "new_distance_district"  => 1.1,
                "approve_district"       => 0.9,
                "approve_admin"          => 0.9,
                "reason_admin"           => 1.7,
                "new_id_admin"           => 1.2,
                "new_distance_admin"     => 1.1
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
    }
}

function outputCSV($data) {
    $out = fopen('php://output', 'w');
    foreach ($data as $row) {
        fputcsv($out, $row);
    }
    fclose($out);
}

exit();

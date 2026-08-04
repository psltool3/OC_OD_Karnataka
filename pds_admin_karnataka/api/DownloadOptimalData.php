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
        "scenario","from","from_state","from_id","from_name","from_district",
        "from_lat","from_long","to","to_state","to_id","to_name","to_district",
        "to_lat","to_long","commodity","quantity","distance",
        "new_id_district","reason_district","new_distance_district",
        "approve_district","approve_admin","reason_admin",
        "new_id_admin","new_distance_admin"
    ];

    $columns_pdf = [
        "scenario","from","from_id","from_name","from_district",
        "from_lat","from_long","to","to_id","to_name","to_district",
        "to_lat","to_long","commodity","quantity","distance",
        "new_id_district","reason_district","new_distance_district",
        "approve_district","approve_admin","reason_admin",
        "new_id_admin","new_distance_admin"
    ];

    // ================= COLUMN DISPLAY NAMES =================
    $column_labels = [
        "scenario" => "Scenario",
        "from" => "From",
        "from_state" => "From State",
        "from_id" => "From ID",
        "from_name" => "From Name",
        "from_district" => "From District",
        "from_lat" => "From Latitude",
        "from_long" => "From Longitude",
        "to" => "To",
        "to_state" => "To State",
        "to_id" => "To ID",
        "to_name" => "To Name",
        "to_district" => "To District",
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
        "new_distance_admin" => "Suggested Warehouse Distance"
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
        $query = "SELECT * FROM $tablename WHERE 1";
    }

    $result = mysqli_query($con, $query);

    $tableData = [];
    $tableData_pdf = [];

    // ================= HEADERS =================
    $header = [];
    foreach ($columns as $c) {
        $header[] = $column_labels[$c];
    }
    $tableData[] = $header;

    $header_pdf = [];
    foreach ($columns_pdf as $c) {
        $header_pdf[] = $column_labels[$c];
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
            require('fpdf/fpdf.php');

            $pdf = new FPDF('L', 'mm', 'A4');
            $pdf->AddPage();

            $pageWidth = $pdf->GetPageWidth() - 20;
            $lineHeight = 4; // Smaller line height for better layout

            $col_weights = [
                "scenario" => 0.8,
                "from" => 0.8,
                "from_id" => 1.0,
                "from_name" => 2.5,
                "from_district" => 1.2,
                "from_lat" => 1.0,
                "from_long" => 1.0,
                "to" => 0.8,
                "to_id" => 1.0,
                "to_name" => 2.5,
                "to_district" => 1.2,
                "to_lat" => 1.0,
                "to_long" => 1.0,
                "commodity" => 1.0,
                "quantity" => 1.0,
                "distance" => 1.0,
                "new_id_district" => 1.2,
                "reason_district" => 2.5,
                "new_distance_district" => 1.2,
                "approve_district" => 1.0,
                "approve_admin" => 1.0,
                "reason_admin" => 2.5,
                "new_id_admin" => 1.2,
                "new_distance_admin" => 1.2
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

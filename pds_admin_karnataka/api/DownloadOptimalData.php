<?php

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
            $temp[] = $row[$c];
        }
        foreach ($columns_pdf as $c) {
            $temp_pdf[] = $row[$c];
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
            $numCols = count($tableData_pdf[0]);
            $colWidth = $pageWidth / $numCols;
            $lineHeight = 6;

            function rowHeight($pdf, $row, $colWidth, $lineHeight) {
                $max = 1;
                foreach ($row as $txt) {
                    $lines = ceil($pdf->GetStringWidth($txt) / ($colWidth - 2));
                    $max = max($max, $lines);
                }
                return $lineHeight * $max;
            }

            function drawRow($pdf, $row, $colWidth, $lineHeight) {
                $x = $pdf->GetX();
                $y = $pdf->GetY();
                $h = rowHeight($pdf, $row, $colWidth, $lineHeight);

                foreach ($row as $cell) {
                    $pdf->Rect($x, $y, $colWidth, $h);
                    $pdf->MultiCell($colWidth, $lineHeight, $cell, 0, 'C');
                    $x += $colWidth;
                    $pdf->SetXY($x, $y);
                }
                $pdf->Ln($h);
            }

            $pdf->SetFont('Arial', 'B', 5);
            drawRow($pdf, $tableData_pdf[0], $colWidth, $lineHeight);

            $pdf->SetFont('Arial', '', 5);
            for ($i = 1; $i < count($tableData_pdf); $i++) {
                if ($pdf->GetY() > $pdf->GetPageHeight() - 20) {
                    $pdf->AddPage();
                    $pdf->SetFont('Arial', 'B', 5);
                    drawRow($pdf, $tableData_pdf[0], $colWidth, $lineHeight);
                    $pdf->SetFont('Arial', '', 5);
                }
                drawRow($pdf, $tableData_pdf[$i], $colWidth, $lineHeight);
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

<?php
require('util/Connection.php'); 
$_GET['format'] = 'csv';
$_GET['district'] = '';
include('api/DownloadOptimalDataLeg1.php');

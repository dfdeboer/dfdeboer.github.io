<?php
if(!preg_match("/\.pdf$/",$_GET['file'])) { exit; } // make sure the requested file is a PDF
if(!file_exists(dirname(__FILE__)."/".$_GET['file'])) { exit; } // make sure the file exists
header("Content-type: application/pdf"); // tell the browser it's a PDF file
header("Content-Length: ".filesize(dirname(__FILE__)."/".$_GET['file'])); // tell the browser how big the file is
header("Content-Disposition: attachment; filename=".$_GET['file']); // tell the browser the name of the file
$fp = fopen(dirname(__FILE__)."/".$_GET['file'],'r'); // open the file, read only
if(!$fp) { exit; } // exit if the file couldn't be opened
while(!feof($fp)) {
echo fread($fp, 4096); // send the file to the browser, in 4k chunks
ob_flush(); // flush the buffer
}
fclose($fp); // close the file
// Done!
?>
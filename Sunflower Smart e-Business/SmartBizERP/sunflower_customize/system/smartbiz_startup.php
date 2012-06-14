<?php
// smartbiz class
$smartbizSystemDir = DIR_SYSTEM . 'smartbiz';
if (is_dir($smartbizSystemDir)) {
	$files = array();
	$smartbizSystemDir = rtrim($smartbizSystemDir, '/').'/';  

    if (is_readable($smartbizSystemDir)) {
    	$items = (array) glob($smartbizSystemDir.'*');
		foreach ($items as $index => $item) {
        	$files[] = str_replace('\\', '/', $item);
		}
	}
	foreach ($files as $file) {
		require_once($file);
	}
}
?>
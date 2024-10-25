<?php

$item = null;
$value = null;
$order = "sales";

$products = ControllerProducts::ctrShowProducts($item, $value, $order);

$colours = array("red","green","yellow","aqua","purple","blue","cyan","magenta","orange","gold");

$salesTotal = ControllerProducts::ctrShowAddingOfTheSales();


?>


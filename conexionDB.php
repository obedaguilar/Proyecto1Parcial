<?php 
	global $host , $user, $pass, $database;

	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$database = 'celular';

	//$link = mysqli_connect($host,$user,$pass) or die ("conexion fallida");
	//mysqli_select_db($link,$database) or die ("error al conectarse con la base de datos".mysqli_error($link));

	$link = new mysqli ($host,$user,$pass,$database) or die ("conexion fallida");


 ?>
<?php

/*
	
Este archivo recibe la instantánea JPEG
de webcam.swf como una solicitud POST.
*/

//Nosotros necesitamos manejar las solicitudes POST
if(strtolower($_SERVER['REQUEST_METHOD']) != 'post'){
	exit;
}

$folder = 'uploads/';
$filename = md5($_SERVER['REMOTE_ADDR'].rand()).'.jpg';

$original = $folder.$filename;

// The JPEG snapshot is sent as raw input:
$input = file_get_contents('php://input');

if(md5($input) == '7d4df9cc423720b7f1f3d672b89362be'){
	// Imagen en blanco No necesitamos este.
	exit;
}

$result = file_put_contents($original, $input);
if (!$result) {
	echo '{
		"error"		: 1,
		"message"	: "Error al guardar la imagen. Asegúrate de cambiar la carpeta de cargas y sus subcarpetas a 777".
	}';
	exit;
}

$info = getimagesize($original);
if($info['mime'] != 'image/jpeg'){
	unlink($original);
	exit;
}

// Mover el archivo temporal a la carpeta de originales:
rename($original,'uploads/original/'.$filename);
$original = 'uploads/original/'.$filename;

// Usando la librería GD para redimensionar
// La imagen dentro de thumbail

$origImage	= imagecreatefromjpeg($original);
$newImage	= imagecreatetruecolor(154,110);
imagecopyresampled($newImage,$origImage,0,0,0,0,154,110,520,370); 

imagejpeg($newImage,'uploads/thumbs/'.$filename);

echo '{"status":1,"message":"Success!","filename":"'.$filename.'"}';
?>

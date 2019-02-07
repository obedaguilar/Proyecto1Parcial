<?php

/*
	
En este archivo estamos escaneando las carpetas de imágenes y
devuelve un objeto JSON con nombres de archivos. Es utilizado por
jQuery para mostrar las imágenes en la primera página:
*/

// The standard header for json data:
header('Content-type: application/json');

$perPage = 24;

// Scanning the thumbnail folder for JPG images:
$g = glob('uploads/thumbs/*.jpg');

if(!$g){
	$g = array();
}

$names = array();
$modified = array();

// Repasamos los nombres de archivo devueltos por glob,
// y rellenamos un segundo archivo con marcas de tiempo modificadas.

for($i=0,$z=count($g);$i<$z;$i++){
	$path = explode('/',$g[$i]);
	$names[$i] = array_pop($path);
	
	$modified[$i] = filemtime($g[$i]);
}

// Multisort ordenará la matriz con los nombres de archivo
// De acuerdo a sus sellos de tiempo, dados en $ modificados:

array_multisort($modified,SORT_DESC,$names);

$start = 0;

// browse.php también puede paginar los resultados con un opcional
// GET parámetro con el nombre de archivo de la imagen para comenzar a partir de:

if(isset($_GET['start']) && strlen($_GET['start'])>1){
	$start = array_search($_GET['start'],$names);
	
	if($start === false){
		// Si una imagen no es encontrada
		$start = 0;
	}
}

//nextStart se devuelve junto con los nombres de archivo,
// para que el script pueda pasarlo como $ _GET ['start']
// parámetro a este script si se hace clic en "Cargar más"

$nextStart = '';

if($names[$start+$perPage]){
	$nextStart = $names[$start+$perPage];
}

$names = array_slice($names,$start,$perPage);

// Formatting and returning the JSON object:

echo json_encode(array(
	'files' => $names,
	'nextStart'	=> $nextStart
));

?>
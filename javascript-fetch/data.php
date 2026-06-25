<?php
header('Content-Type: application/json');

$europe = [
	["id" => 1, "name" => "Deutschland"],
	["id" => 3, "name" => "France"],
	["id" => 5, "name" => "England"]
];

$afrique = [
	["id" => 2, "name" => "Sénegal"],
	["id" => 4, "name" => "Mali"],
	["id" => 6, "name" => "Burkina Fasso"]
];

if ($_GET) {
	switch ($_GET['continent']) {
		case 'europe':
			echo json_encode($europe);
			break;
		case 'afrique':
			echo json_encode($afrique);
			break;
	}
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$data = json_decode(file_get_contents("php://input"));
	$message = "Der selektierte Kontinent ist: " . $data->continent . ", die Land-ID ist : " . $data->country . " und die Anzahl der Tage ist:" . $data->day;
	echo json_encode($message);
}

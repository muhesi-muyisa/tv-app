<?php

$curl = curl_init();

curl_setopt_array($curl, [
	CURLOPT_URL => "https://youtube-v31.p.rapidapi.com/channels?part=snippet%2Cstatistics&id=UCBVjMGOIkavEAhyqpxJ73Dw",
	CURLOPT_RETURNTRANSFER => true,
	CURLOPT_ENCODING => "",
	CURLOPT_MAXREDIRS => 10,
	CURLOPT_TIMEOUT => 30,
	CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	CURLOPT_CUSTOMREQUEST => "GET",
	CURLOPT_HTTPHEADER => [
		"X-RapidAPI-Host: youtube-v31.p.rapidapi.com",
		"X-RapidAPI-Key: 91d10d6040mshdc8ddc4a53b4a9ep1575b2jsn78261667cbf6"
	],
]);

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
	echo "cURL Error #:" . $err;
} else {
	echo $response;
}
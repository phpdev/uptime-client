<?php

$uptimeApiUrl = $_SERVER['UPTIME_API_URL'];
$uptimeApiKey = $_SERVER['UPTIME_API_KEY'];
$clientName = $_SERVER['UPTIME_CLIENT_NAME'];

$data = [
    'apiKey' => $uptimeApiKey,
    'clientDateTime' => (new DateTime())->format(DateTimeInterface::W3C),
    'clientName' => $clientName,
];

file_get_contents($uptimeApiUrl . '?' . http_build_query($data));


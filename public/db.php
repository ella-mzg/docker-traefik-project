<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$host = 'db';
$port = '5432';
$dbname = 'mydb';
$user = 'user';
$password = trim(file_get_contents('/run/secrets/postgres_password'));

try {
#	echo "Connecting to PostgreSQL...<br>";
	$dsn = "pgsql:host=$host;port=$port;dbname=$dbname;";
	$pdo = new PDO($dsn, $user, $password);
	$pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
#	echo "Executing query... <br>";
	$query = $pdo->query("SELECT content FROM data LIMIT 1");
	$result = $query->fetch(PDO::FETCH_ASSOC);

	if ($result) {
#		echo "Query successful.<br>";
		echo $result['content'];
	} else {
		echo "No data found.<br>";
	}
} catch (PDOException $e) {
	echo "Error: " . $e->getMessage();
}
?>

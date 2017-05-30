<?php 
session_start();
require 'db.php';

// Suppression des variables de session et de la session
$_SESSION = array();
if(session_destroy()){
	
	
	header('location: http://localhost/sitePPE/Espace%20membre/Connecter.php');
}

	?>
<?php

session_start();
if(isset($auth))
{
if(isset($_SESSION['Auth'],$_SESSION['NumC'],$_SESSION['NOM'],$_SESSION['EMAIL']))
	{
		header('location: reservation/menu.php');
	}
}
?>

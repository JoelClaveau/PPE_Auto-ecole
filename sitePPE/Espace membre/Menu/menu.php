
<?php    
session_start();



require 'db.php';




//verifie si les id existe et est superieur a 0
if(isset($_GET['id']) AND $_GET['id'] > 0){
	
	//Permet de securiser la variable
	$getid = intval($_GET['id']);
	

$req = $bdd->prepare("SELECT * FROM client WHERE NumC = ?");
$req->execute(array($getid));
$userinfo = $req->fetch();


?>

<!DOCTYPE html>


<html >
<head>
  <meta charset="UTF-8">
  <title>Menu</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
  <nav class="menu" tabindex="0">
	<div class="smartphone-menu-trigger"></div>
  <header class="avatar">
		<img src="aa.jpg" />
   

	
	 <?php if(isset($_SESSION['NumC'])AND $userinfo['NumC'] == $_SESSION['NumC']){
	  
	  
	  
	  ?>
	
	
	<h2>    Bonjour  <?php echo $userinfo['NOM']; ?> </h2>




  </header>
  
  
 
	<ul>
    <a href='http://localhost/sitePPE/Espace%20membre/Menu1/lister.php' ><li tabindex="0" class="icon-dashboard"><span>Planning</span></li></a>
   
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/reservation.php"> <li tabindex="0" class="icon-users"><span>Réservation</span></li> </a>
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/modif.php"> <li tabindex="0" class="icon-settings"><span>Modifier profil</span></li> </a>
   <a href="http://localhost/sitePPE/Espace%20membre/Menu1/deconecter.php"><li tabindex="0"  class="icon-customers"><span>Se déconnecter</span></li> </a>
  
 </ul>
 
  <?php }  ?>
</nav>

<main>
  <div class="helper">
    WELCOME
		</div>
</main>
  
    <script src="js/index.js"></script>

</body>
</html>
<?php

 } 
 else{
	 header ('location: http://localhost/sitePPE/Espace%20membre/Connecter.php');

 }

 ?>
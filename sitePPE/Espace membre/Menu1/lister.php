
<?php    
session_start();

require 'db.php';


//verifie si les id existe et est superieur a 0
if(isset($_SESSION['NumC'])){
	
$req = $bdd->prepare("SELECT * FROM client WHERE NumC = ?");
$req->execute(array($_SESSION['NumC']));
$user = $req->fetch();
	
	
	
	
	//Si l'utilisateur a reserver plus de 20 lecon alors la prochaine reservation tarif = 55 euro
	
		$numC = ($_SESSION['NumC']);
	$affiche = $bdd->prepare('SELECT * from lecon WHERE NumeroC = ? ');
	$affiche->execute(array( $numC ));
    
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

	
 <h2>    Bonjour <br><?php echo $user['NOM']; ?>

 
 </h2>


  </header>
	<ul>
    <a  href="http://localhost/sitePPE/Espace%20membre/Menu1/lister.php" ><li tabindex="0" class="icon-dashboard"><span>Planning</span></li></a>
	<a href="http://localhost/sitePPE/Espace%20membre/Menu1/reservation.php"> <li tabindex="0" class="icon-users"><span>Réservation</span></li> </a>
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/modif.php"> <li tabindex="0" class="icon-settings"><span>Modifier profil</span></li> </a>
   <a href="http://localhost/sitePPE/Espace%20membre/Menu1/deconecter.php"><li tabindex="0"  class="icon-customers"><span>Se déconnecter</span></li> </a>
  </ul>
</nav>

<main>
  <div class="helper">
   Vos reservation
		</div>
		<div class="koko">
	<?php while ($info = $affiche->fetch()){     ?>
		
<p class='jojo'>
    <strong>Heure</strong> : <?php echo $info['HEURE']; ?><br />
   <strong>DATE</strong> : <?php echo $info['DATEL']; ?><br />
   <?php if($info['DATEL'] < date('d/m/y')){ ?>
	   
	 <img src='ok2.png'/>
<?php   }else {
	   
	?>    <img src='tt.png'/>
 <?php  }
   ?>
</p>

<?php
}

$affiche->closeCursor(); // Termine le traitement de la requête

?>
  </div>
</main>
	
  
    <script src="js/index.js"></script>

</body>
</html>
<?php    } 
 else{
	 header ('location: http://localhost/sitePPE/Espace%20membre/Connecter.php');

 }
?>

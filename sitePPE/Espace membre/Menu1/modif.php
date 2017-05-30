
<?php    

session_start();
require 'db.php';
//require 'auth.php';



if(isset($_SESSION['NumC'])){
	
	$req = $bdd->prepare("SELECT * FROM client WHERE NumC = ?");
$req->execute(array($_SESSION['NumC']));
$user = $req->fetch();

// NOM
if(isset($_POST['newNOM']) AND !empty($_POST['newNOM']) AND $_POST['newNOM'] != $user['NOM']){
	
	$newNOM = htmlspecialchars($_POST['newNOM']);
	$insertNOM = $bdd->prepare('UPDATE client SET NOM = ? WHERE NumC = ?');
	$insertNOM->execute(array($newNOM , $_SESSION['NumC']));
	header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
}

// PRENOM
if(isset($_POST['newPRENOM']) AND !empty($_POST['newPRENOM']) AND $_POST['newPRENOM'] != $user['PRENOM']){
	
	$newPRENOM = htmlspecialchars($_POST['newPRENOM']);
	$insertPRENOM = $bdd->prepare('UPDATE client SET PRENOM = ? WHERE NumC = ?');
	$insertPRENOM->execute(array($newPRENOM , $_SESSION['NumC']));
	header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
}

// EMAIL
if(isset($_POST['newEMAIL']) AND !empty($_POST['newEMAIL']) AND $_POST['newEMAIL'] != $user['EMAIL']){
	
	$newEMAIL = htmlspecialchars(filter_var($_POST['newEMAIL'], FILTER_VALIDATE_EMAIL));
	$insertEMAIL = $bdd->prepare('UPDATE client SET EMAIL = ? WHERE NumC = ?');
	$insertEMAIL->execute(array($newEMAIL , $_SESSION['NumC']));
	header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
}

// MDP
if(isset($_POST['newMDP']) AND isset($_POST['newMDP2']) AND !empty($_POST['newMDP']) AND $_POST['newMDP']){
	
	$newMDP = sha1($_POST['newMDP']);
	$newMDP2 = sha1($_POST['newMDP2']);
	if($newMDP == $newMDP2){
		
		$insertMDP = $bdd->prepare('UPDATE client SET MDP = ? WHERE NumC = ?');
		$insertMDP->execute(array($newMDP , $_SESSION['NumC']));
		header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
	}
	ELSE{
		
		$msg = 'Vos deux mots de passe de coresponde pas';
		
	}
}	
	
//TELEPHONE	
if(isset($_POST['newTELEPHONE']) AND !empty($_POST['newTELEPHONE']) AND $_POST['newTELEPHONE'] != $user['TELEPHONE']){
	
	
	$newTELEPHONE = htmlspecialchars($_POST['newTELEPHONE']);
	$newTELEPHONE = !preg_match('/^[0-9]{10}+$/');
	$insertTELEPHONE = $bdd->prepare('UPDATE client SET TELEPHONE = ? WHERE NumC = ?');
	$insertTELEPHONE->execute(array($newTELEPHONE , $_SESSION['NumC']));
	header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
}

// ADRESSE
if(isset($_POST['newADRESSE']) AND !empty($_POST['newADRESSE']) AND $_POST['newADRESSE'] != $user['ADRESSE']){
	
	$newADRESSE = htmlspecialchars(($_POST['newADRESSE']));
	$insertADRESSE = $bdd->prepare('UPDATE client SET ADRESSE = ? WHERE NumC = ?');
	$insertADRESSE->execute(array($newADRESSE, $_SESSION['NumC']));
	header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
}


// MODE DE PAEMENT
if(isset($_POST['newMODE_FACTURATION']) AND !empty($_POST['newMODE_FACTURATION']) AND $_POST['newMODE_FACTURATION'] != $user['MODE_FACTURATION']){
	
	$newMODE_FACTURATION = htmlspecialchars($_POST['newMODE_FACTURATION']);
	$insertMODE_FACTURATION= $bdd->prepare('UPDATE client SET MODE_FACTURATION= ? WHERE NumC = ?');
	$insertMODE_FACTURATION->execute(array($newMODE_FACTURATION , $_SESSION['NumC']));
	header ('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php?id='.$_SESSION['NumC']);
}



 
 
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

	
 <h2>    Bonjour <?php echo $user['NOM']; ?>

 
 </h2>


  </header>
	<ul>
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/lister.php" ><li tabindex="0" class="icon-dashboard"><span>Planning</span></li></a>
  <a href="http://localhost/sitePPE/Espace%20membre/Menu1/reservation.php"> <li tabindex="0" class="icon-users"><span>Réservation</span></li> </a>
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/modif.php"> <li tabindex="0" class="icon-settings"><span>Modifier profil</span></li> </a>
   <a href="http://localhost/sitePPE/Espace%20membre/Menu1/deconecter.php"><li tabindex="0"  class="icon-customers"><span>Se déconnecter</span></li> </a>
  </ul>
</nav>

<main>
  <div class="helper">
    Modifier ses informations
		</div>
		
		<div class='zz'>
<form method="POST" enctype="multipart/form-data" action="">
	

<legend class='pp'> Edition de mon profil</legend>	



<label for="">Nom </label>
<input type="text" name="newNOM" class="form-control" value="<?php echo $user["NOM"];  ?>"/><br>



<label for="">Prénom </label>
<input type="text" name="newPRENOM"  class="form-control" value="<?php echo $user["PRENOM"]; ?>"/><br>


	
<label for="">Email </label>
<input type="tel" name="newEMAIL"  class="form-control" value="<?php echo $user["EMAIL"]; ?>"/><br>



<label for="">Mot de passe </label>
<input type="password" name="newTELEPHONE" value="" class="form-control" maxlenght="10"/><br>

<label for="">Confirmation </label>
<input type="password" name="newMDP" value="" class="form-control" maxlenght="10"/><br>


<label for="">Téléphone </label>
<input type="tel" name="newMDP2" value="" class="form-control" maxlenght="10"/><br>



<label for="">Adresse </label>
<input type="text" name="newADRESSE" value="" class="form-control "/><br>



<label for="">Mode de facturation </label>
<br>						
<span style='color:white;'> 

<select name="newMODE_FACTURATION"> 
<option>Espèce <br>
 <option>Carte banquaire<br>
</select>
</span>

<br>
<br>

<button type="submit" class="btn btn-primary">Mettre a jour mon profil</button>
<br>
<br>
 </div>

</form>
<?php if(isset($msg)) {echo $msg;} ?>


 
</main>
  
    <script src="js/index.js"></script>

</body>
</html>
<?php    } 
 else{
	 header ('location: http://localhost/sitePPE/Espace%20membre/Connecter.php');

 }
   ?>
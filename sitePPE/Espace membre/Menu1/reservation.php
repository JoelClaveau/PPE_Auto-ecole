
<?php    
session_start();

require 'db.php';


//verifie si les id existe et est superieur a 0
if(isset($_SESSION['NumC'])){
	
$req = $bdd->prepare("SELECT * FROM client WHERE NumC = ?");
$req->execute(array($_SESSION['NumC']));
$user = $req->fetch();
	
	
	
	if ((!empty($_POST['HEURE'])) && (!empty($_POST['DATEL']))  && (!empty($_POST['TARIF_HEURE']))){
	

	//Si l'utilisateur a reserver plus de 20 lecon alors la prochaine reservation tarif = 55 euro
	
	$verifTARIF = $bdd->prepare('SELECT count(NumLECON < 20) from lecon WHERE NumeroC = ? ');
	
	if($verifTARIF){
		
	$numC = ($_SESSION['NumC']);
	$heure = ($_POST['HEURE']);
	$date = ($_POST['DATEL']);
	$tarif = ($_POST['TARIF_HEURE']);
	$insert = $bdd->prepare('INSERT INTO lecon SET HEURE = ? , DATEL = ? , NumeroC = ? , TARIF_HEURE = ?');
	$insert->execute(array($heure , $date, $numC, $tarif));
	}
	else {
	$numC = ($_SESSION['NumC']);
	$heure = ($_POST['HEURE']);
	$date = ($_POST['DATEL']);
	$insertHeure = $bdd->prepare('INSERT INTO lecon SET HEURE = ? , DATEL = ? , NumeroC = ? ');
	$insertHeure->execute(array($heure , $date, $numC));
		
	}
	
	
	
	?>	
	
	<th>
	<?php echo 'Vous avez bien reserver'; ?>
	</th>
	
	<tr>
	<td>Heure:
	<?php echo $heure; ?>
	</tr>
	</td>
	
	<tr>
	<td>Date:
	<?php echo $date; ?>
	</tr>
	</td>

	<?php
	} 
	else{
	echo 'Vous devez remplir tous les champs';
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

	
 <h2>    Bonjour <br><?php echo $user['NOM']; ?>

 
 </h2>


  </header>
	<ul>
   <a href='http://localhost/sitePPE/Espace%20membre/Menu1/lister.php'>  <li tabindex="0" class="icon-dashboard"><span>Planning</span></li>
   
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/reservation.php"> <li tabindex="0" class="icon-users"><span>Réservation</span></li> </a>
    <a href="http://localhost/sitePPE/Espace%20membre/Menu1/modif.php"> <li tabindex="0" class="icon-settings"><span>Modifier profil</span></li> </a>
   <a href="http://localhost/sitePPE/Espace%20membre/Menu1/deconecter.php"><li tabindex="0"  class="icon-customers"><span>Se déconnecter</span></li> </a>
  </ul>
</nav>

<main>
  <div class="helper">
   Réservation
		</div>
		<div class='zz'>
		
		<form method="POST" enctype="multipart/form-data" action="">
	



<label for="">Heure leçon :</label>  


  <input class="form-control"   placeholder="" type="time" name="HEURE" maxlength="5" size='10'  min='06:00'   max='19:00'/>
<br>
  <label for="">Date leçon :</label>
 
  <input   class="form-control"   placeholder="<?php echo date('d/m/Y '); ?>" type="date" name="DATEL" max="<?php date('d/m/Y '); ?>"  />
<br>

<label for="">TARIF </label>
<br>						
<span style='color:white;'> 

<select name="TARIF_HEURE"> 
<option>55 euros<br>
</select>
</span>
<br>
<br>
  <button type="submit" class="btn btn-primary">Réserver</button>

</form>

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
?>
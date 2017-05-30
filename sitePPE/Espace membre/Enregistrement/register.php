<?php

if(isset($_SESSION['NumC'])){
		
		header('location: http://localhost/sitePPE/Espace%20membre/reservation/menu.php');
		
		
	}
if(!empty($_POST)){

    $errors = array();
    require 'db.php';
	//require 'auth.php';
	if(isset($_SESSION['NumC'])){
	header('location: http://localhost/sitePPE/Espace%20membre/Menu/menu.php');
}
// Vérifiquation du nom
		if(empty($_POST['NOM']) || !preg_match('/^[A-Z]{1}[a-z_]+$/', $_POST['NOM'])){
        $errors['NOM'] = "Votre nom n'est pas valide (alphanumérique)";
		}	
		
		//Vérifiquation de prenom
		if(empty($_POST['PRENOM']) || !preg_match('/^[A-Z]{1}[a-z_]+$/', $_POST['PRENOM'])){
        $errors['PRENOM'] = "Votre prénom n'est pas valide (alphanumérique)";
		}	
		
		
		// Vérifiquation de l'adresse email 
if(empty($_POST['EMAIL']) || !filter_var($_POST['EMAIL'], FILTER_VALIDATE_EMAIL)){
        $errors['EMAIL'] = "Votre email n'est pas valide";
    } 
	else {
        $req = $pdo->prepare('SELECT NumC FROM client WHERE EMAIL = ?');
        $req->execute([$_POST['EMAIL']]);
        $user = $req->fetch();
        if($user){
            $errors['EMAIL'] = 'Cet email est déjà utilisé pour un autre compte';
        }
    }

	//Vérification de du mot de passe
    if(empty($_POST['MDP']) || $_POST['MDP'] != $_POST['password_confirm']){
        $errors['MDP'] = "Vous devez rentrer un mot de passe valide";
    }
	
	//Vérification que l'un des deux est selectionner
	if(empty($_POST['CODE']) && $_POST['PERMIS'] = 'NULL'){
	$errors['CODE'] = 'Vous devez cochez au moins un examen';
	
	}


    if(empty($errors)){

    $req = $pdo->prepare("INSERT INTO client SET NOM = ?, PRENOM = ?, EMAIL = ?, DATE_N = ?, CODE = ?, PERMIS = ?, MDP = ?");
   
   $password = sha1($_POST['MDP']);
   $password_confirm = sha1($_POST['password_confirm']);
    $req->execute([$_POST['NOM'],$_POST['PRENOM'],$_POST['EMAIL'],$_POST['DATE_N'],$_POST['CODE'],$_POST['PERMIS'], $password]);
  $_SESSION['flash']['success'] = 'Votre compte a bien ete creer';
    
	
	header('Location: http://localhost/sitePPE/Espace%20membre/Connecter.php');
    exit();
}
}
?>

<!DOCTYPE HTML>  
<html>
<head>
<meta charset="utf-8" />

<link rel="stylesheet" href="Créer un compte.css"/>
<title>Auto Ecole</title>

</head>
<body>  
<?php if(!empty($errors)): ?>
<div class="alert alert-danger">
    <p>Vous n'avez pas rempli le formulaire correctement</p>
    <ul>
        <?php foreach($errors as $error): ?>
           <li><?= $error; ?></li>
        <?php endforeach; ?>
    </ul>
</div>
<?php endif; ?>


<a class= "w" href="Accueil/Accueil.html">Accueil</a>  

<h1 class="ee"><mark>Castellane Auto</mark></h1>


<a class="T">C</a><a>réer un compte</a>

<br><br>
<br>
<BR>
<div class="zz">	

<form method="POST" enctype="multipart/form-data" action="">

<br>
<br>
<br>

<fieldset>


<legend class="pp">Saississer votre profil</legend>



<label for="">Nom:</label>
<br>						
<input type="text" name="NOM" value="" class="form-control"/><br>



<label for="">Prénom:</label>
<br>				
<input type="text" name="PRENOM" value="" class="form-control"/><br>



<label for="">Adresse E-mail:</label>
<br>
<input type="email" name="EMAIL" value="" class="form-control"/><br>

<input type="hidden" name="DATE_INSCRIPTION" value='<?php date('d/m/Y')?>' class="form-control" /><br>
<select type="hidden" name="newMODE_FACTURATION"> 
<option><?php date('d/m/Y')?> <br>
 
</select>



<label for="">Date de naissance:</label>
<br>
<input type="date" name="DATE_N" value="" class="form-control"   /><br>


<h3>Exam:</h3>
<label>Code</label>
<input type="checkbox" name="CODE[]"  class="form-control">

<label>Permis</label><input type="checkbox" name="PERMIS[]" class="form-control">



<br>
<label for="">Mot de passe:</label>
<br>
<input type="password" name="MDP" value="" class="form-control"/><br>


<label for="">Confirmer mot de passe:</label>
<br>
<input type="password" name="password_confirm" value="" class="form-control"/><br>



<br>

<button type="submit" class="btn btn-primary">M'inscrire</button>

</fieldset>
</nav>
<br>
<br>
<a class="re" href="http://localhost/sitePPE/Espace%20membre/Connecter.php" >Retour</a>
</form>
</div>

</body>

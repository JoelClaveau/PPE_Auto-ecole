  
<html>
<head>
<meta charset="utf-8" />

<link rel="stylesheet" href="css/lister.css"/>
  <body>
  
  <br>
  <h1 class="ee"><mark>Castellane Auto</mark></h1>
  <br>
 <a class="P">R</a><a>éservation</a>
<?php 
  
try
{
	// On se connecte à MySQL

	$bdd = new PDO('mysql:dbname=castellane;host=localhost', 'root', '');
$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$bdd->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

}
catch(Exception $e)
{
	// En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}

// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table client
$reponse = $bdd->query('SELECT * FROM  WHERE NOM_CLIENT ="?",PRENOM_CLIENT="?"');


while ($donnees = $reponse->fetch())
{
?>
<table>
<tr>

    <th> <strong>Nom :</strong></th> <br>
	 <th>  <strong>Prenom : </strong></th>
	
</tr>

<tr>

<form method="POST" enctype="multipart/form-data" action="voir.php">
<fieldset>
<label for="">Nom</label>
<br>						
<input type="text" name="NOM_CLIENT" value="" class="form-control"/><br>
 </label>    
	 
	 
	 
<label for="">Prenom</label>
<br>						
<input type="text" name="PRENOM_CLIENT" value="" class="form-control"/><br>
<button type="submit" class="btn btn-primary">Rechercher</button>


</label>
</fieldset>


</tr>
</table>

<?php echo $donnees['NOM_CLIENT']; ?></td>
<?php echo $donnees['PRENOM_CLIENT']; ?></td>

<?php
}

$reponse->closeCursor(); // Termine le traitement de la requête

?>
<br>
<a class= "joel" href="http://localhost/sitePPE/Admin/connect/co.php">Retour</a>
      </body>
</html>
  
  





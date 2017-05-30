  
<html>
<head>
<meta charset="utf-8" />

<link rel="stylesheet" href="css/lister.css"/>
  <body>
  
  <br>
  <h1 class="ee"><mark>Castellane Auto</mark></h1>
  <br>
 <a class="P">C</a><a>lient</a>
<?php 
  
try
{
	// On se connecte à MySQL

	$bdd = new PDO('mysql:dbname=castellane2;host=localhost', 'root', '');
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
$reponse = $bdd->query('SELECT * FROM client ORDER BY Nom  ');
?>
<table>
<tr>

    <th> <strong>Nom</strong></th> <br>
	 <th>  <strong>Prenom</strong></th>
	 <th>  <strong>Date de naissance</strong></th>
	 <th>  <strong>Telephone </strong></th><br>
	 <th>  <strong>Date inscription  </strong></th><br>
	 <th>  <strong>Adresse-Email </strong></th><br>
	 <th>  <strong>Adresse </strong></th> <br>
	 	 <th>  <strong>Examen Code</strong></th> <br>
	  <th>  <strong>Examen Permis</strong></th> <br>
</tr>
<?php
// On affiche chaque entrée une à une
while ($donnees = $reponse->fetch())
{
?>


<tr>
<td><?php echo $donnees['NOM']; ?></td>
<td><?php echo $donnees['PRENOM']; ?></td>
<td><?php echo $donnees['DATE_N']; ?></td>
<td><?php echo $donnees['TELEPHONE']; ?></td>
<td><?php echo $donnees['DATE_INSCRIPTION']; ?></td>
<td><?php echo $donnees['EMAIL']; ?></td>
<td><?php echo $donnees['ADRESSE']; ?></td>
<td><?php 

if ( $donnees['CODE']=="Array")
{
	 ?> <img src='ok2.png'/><?php
}
else 
{
	 ?> <img src='tt.png'/><?php
}
?></td>
<td><?php
 
if ( $donnees['PERMIS']=="Array")
{
	 ?> <img src='ok2.png'/><?php
}
else 
{
	 ?> <img src='tt.png'/><?php
} ?></td>
</tr>


<?php
}

$reponse->closeCursor(); // Termine le traitement de la requête

?>
</table>
<br>
<br>
<a class= "joel" href="http://localhost/sitePPE/Admin/connect/co.php">Retour</a>
      </body>
</html>
  
  

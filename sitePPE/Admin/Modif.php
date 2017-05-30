<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title></title>
    </head>
    <body>
    
        <?php
		
		try
{
	// On se connecte à MySQL
	$bdd = new PDO('mysql:host=localhost;dbname=test;charset=utf8', 'root', '');
}
catch(Exception $e)
{
	// En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}
		
                  $reponse = $bdd->query('SELECT * FROM Admin WHERE Identifiant');

	
    if (isset($_POST['Identifiant'])  AND $_POST['Identifiant'] ==  "ha" or "po" or "jo" or "co" or "al");
		
	if (isset($_POST['MDP'] ) AND $_POST['MDP'] ==  "mdp"){    // Si le mot de passe est bon


 header('Location: http://localhost/sitePPE/Admin/connect/co.php');
  exit();

		

 }else // Sinon, on affiche un message d'erreur
    {
	 header('Location: http://localhost/sitePPE/Admin/warning/danger.php');
  exit();
 
	
	}

	

		
?>
    
      
    </body>
</html>
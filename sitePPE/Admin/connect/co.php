<?php 
if (session_id()=='')
session_start();

			  
		if(isset($_SESSION['token'])){
        if($_POST['token'] == $_SESSION['token']){		  
				  
     



		}
		}else {
			
			echo'erreur';
		}

?>
<!DOCTYPE html>
<html >

<head>
  <meta charset="UTF-8">
  <title>navigation</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>
<br>
<br>
<h1 class="ee"><mark>Castellane Auto</mark></h1>
<br>
<br>
<a class="P">E</a><a>space ADMIN</a>
  <nav>
  <div class="nav-wrapper">
    <div class="main-button button">
      <i class="material-icons">menu</i>
	  
    </div>

  
    <div class="nav-button button btn-2"><a  href="http://localhost/sitePPE/Admin/connect/lister.php" >
      <i class="material-icons">group</i></a>
    </div>
    <div class="nav-button button btn-3"><a  href="http://localhost/sitePPE/Admin/connect/voir.php" >
      <i class="material-icons">event</i></a>
    </div>
    </div>
</nav>
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>

    <script src="js/index.js"></script>
	<img src='azert.jpg'/>
<br>
<br>
<p><a class="btn btn-default" href="http://www.visite-medicale-permis-conduire.org/category/selection-des-derniers-textes-parus-au-journal-officiel-dans-le-domaine-de-la-conduite" role="button">View details &raquo;</a></p>
<br>
	
<br>
</body>
</html>

<?php
    include '_inc.php';
?><!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
 
	<link rel="stylesheet" href="http://localhost/sitePPE/Contact/Contact.css"/>
    <style>
        body {
            padding-top: 50px;
        }
        .starter-template {
            padding-top: 40px;
        }
    </style>
</head>
<body>



<a class= "w" href="http://localhost/sitePPE/Accueil/Accueil.php">Accueil</a>  

<h1 class="rr"><mark class="tt">Castellane Auto</mark></h1>
<br>

<a class="T">C</a><a>ontact</a>

<p>Activité : Enseignement de la conduite (8553Z)

<p>Adresse : 27 boulevard du Général-de-Gaulle  - 83100 TOULON Cedex </p>

<p> Tél / Fax : + (33)07 87 10 89 72 </p>


<p>Email : castellane.auto02@gmail.com </p></a>


<p>Siret : 42189633300059</p>
</link>

<div class="container">

    <div class="starter-template">

        <?php if(array_key_exists('errors', $_SESSION)): ?>
            <div class="alert alert-danger">
                <?= implode('<br>', $_SESSION['errors']); ?>
            </div>
        <?php endif; ?>
        <?php if(array_key_exists('success', $_SESSION)): ?>
            <div class="alert alert-success">
                Votre email a bien été envoyé
            </div>
        <?php endif; ?>


        <form action="post_contact.php" method="POST">
            <?php $form = new Form(isset($_SESSION['inputs']) ? $_SESSION['inputs'] : []); ?>
            <div class="row">
                <div class="col-xs-4">
                    <?= $form->text('name', 'Votre Nom'); ?>
                </div>
                <div class="col-xs-4">
                    <?= $form->email('email', 'Votre Email'); ?>
                </div>
                <div class="col-xs-4">
                    <?= $form->select('service', 'Service', ['Contact']); ?>
                </div>
                <div class="col-xs-12">
                    <?= $form->textarea('message', 'Votre message'); ?>
                    <?= $form->submit('Envoyer'); ?>
                </div>
            </div>
        </form>

       
    </div>
	

</div>
<br>
<br>
<a class= "joel" href="http://localhost/sitePPE/Photos/Photos.html">Page précédente</a> 
</body>
</html><?php
unset($_SESSION['inputs']);
unset($_SESSION['success']);
unset($_SESSION['errors']);
?>
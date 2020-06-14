<!DOCTYPE html>
<html lang="fr">
	<head>
    <meta name = "author"
  	content = "BOUMERXP HAJBA" >
  	<meta name="description"
  	content="C'est un site pour faire de la musique" />
  	<meta name="keywords"
  	content="musique" >
  	<meta charset="utf-8">
  	<title>SuperMusique</title>
  	<link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" href="images/favicon.ico" />
	</head>
	<body>
	<header>
			
	</header>
	<main class="content">
		<?php
		/*************************************************************************
				nom du script : connexion.php
				Description   : Ce script propose un  formulaire de connexion.
								Une fois le formulaire soumis les données sont
								comparées à celles enregistrées dans la BD.
								Si les paramètres de connexions sont correctes
								on enregistre l'email de l'utilisateur dans une 
								variable de session et on indique à l'utilisateur 
								qu'il est connecté
				Version : 1.0
				Date	: 13/12/2019
				Auteur	: BOUMERXP HAJBA
			*************************************************************************/
		
			// on determine si on doit afficher ou traiter le formulaire
			if (isset($_POST["Valider"]))
			{
				// traitement des données envoyées par le formulaire
				
				/* on recupere les données du formulaire et on les "aseptise" avant de les utiliser 
				   pour cela on va creer une fonction de nettoyage qu'on va utiliser
				*/
				  /* on recupere de manière brut les données */
				$email_Lue 			= utf8_decode($_POST['zoneEmail']);
				$Mdp_Lue 			= utf8_decode($_POST['zoneMdp']);
				
				/* on aseptise les données récupérées avant de les utiliser pour 
				   lutter contre la faille XSS */
				$email_Lue  		= sanitizeString($email_Lue);
				$Mdp_Lue  			= sanitizeString($Mdp_Lue);
								
				// on se connecte au SGBD
				
				// paramètres de connexion
				$host 	= 'localhost';
				$user 	= 'root' ;   
				$passwd = 'READinfinite45';
				$mabase = 'SiteSuperMusique';
			
				//tentative de connexion au SGBD MySQL  
				if ($conn = mysqli_connect($host,$user,$passwd,$mabase))
				{
									
					// preparation de la requete de récuparation des données de l'utilisateur
					$req  = "SELECT * FROM user WHERE email = '$email_Lue'";
					              
					// on tente d'envoyer la requête
					if($result = mysqli_query($conn, $req))
					{
						/* On teste pour voir si la requete à renvoyé des éléments.
						   Si c'est le cas on compare le mot de passe crypté avec celui
						   fournit par l'utilisateur.
						   Si tout est OK on cree une variable de session pour mémoriser
						   de page en page l'émail de l'utilisateur
						*/
						
						// on teste que le nombre de ligne renvoyé par la requete est > 0
						$nbLignes = mysqli_num_rows($result);
						if ($nbLignes==1)
						{
							// extraction de la ligne envoyée par la requête
							$row =mysqli_fetch_assoc($result);
							
							// recuperation du mot de passe dans la ligne
							$Mdp_crypt_BD= $row['password'];
							
							// on compare le mot passe envoyé à celui enregistré(crypté)
							
							if (password_verify($Mdp_Lue, $Mdp_crypt_BD)) 
							{
								// enregistrement dans une variable de session de l'email de l'utilisateur
								
								// demarrer le mecanisme des sessions
								session_start();
								// enregistrer l'émail dans la variable de session "emailUser"
								$_SESSION['emailUser'] = $email_Lue ;
								echo 'Vous êtes connecté vous pouvez accéder au site <br> ';
								echo '<a href="accueil.html">Accueil site</a>';
							} 					
							else 
							{
								echo 'paramètres de connexion non valide';
							}
							
						}	
						else
						{
							echo "paramètres de connexion non valide ";
						}
					}
					else
					{
						// erreur de requête
						die ("erreur de requête");
					}
				}	
				else
				{
					// echec de la connexion à la BD 
					die("problême de connexion au serveur de base de données");	
				}
			}
			else
			{
				// afficher le formulaire
                ?>
               
                <h1>Page de Connexion</h1>
				<form action="<?php $_SERVER['PHP_SELF'] ?>" method="post">
					<div>
						<!-- zone de l'émail -->
						<label for="zoneEmail">Email : </label>
						<input type="email" id="zoneEmail" placeholder="Entrez votre émail"
						  name = "zoneEmail" required>
					</div>
					<div>
						<label for="zoneMdp">Mot de passe : </label>
						<input type="password" id="zoneMdp" placeholder="Entrez votre mot de passe"
						  name = "zoneMdp" required>
					</div>
					<div class="button">
						<!-- Zone du bouton valider -->
						<button type="submit" name= "Valider"> Valider </button>
					</div>
					<div>

                </form>
				<form action = inscription.php class="button_login" >
  		 		<button>S'inscrire</button>
		 		</form>
		 		</div>
				 
				<?php
				
				
			}
			
			
			/* Fonctions pour aseptiser les données utilisateurs */
			// aseptiser les chaines de caractères
			function sanitizeString($var)
			{
				if (get_magic_quotes_gpc())
				{
					// supprimer les slashes
					$var = stripslashes($var);
				}
				// suppression des tags
				$var = strip_tags($var);
				// convertir la chaine en HTML
				$var = htmlentities ($var);
				return $var;
			}
			
		?>
		</main>
		<footer>
		<p>&copy; 2020 BOUMERXP HAJBA</p>
		</footer>
	</body>
	</html>
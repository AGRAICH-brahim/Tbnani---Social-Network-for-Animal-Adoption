<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 27/11/2023
  Time: 01:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="./css/signup.css">
</head>
<body>

<div class="container1">
    <div class="creer"><h1>Créer Votre Compte</h1>
        <div class="text-danger text-center">
            <p class=""> ${message}</p>
        </div>
    </div>
    <div class="container11">
        <div class="form-container">

            <p class="title"><a href="index.jsp"><img src="./css/images/LOGO.png" alt="logo"></a>Personnal informations</p>
            <form class="form"  action="signup" method="post">
                <div class="groupe">
                    <div class="input-group">
                        <label for="nom">Nom</label>
                        <input type="text" name="nom" id="nom" placeholder="">
                    </div>
                    <div class="input-group">
                        <label for="prenom">Prenom</label>
                        <input type="text" name="prenom" id="prenom" placeholder="">
                    </div>
                </div>
                <div class="input-group">
                    <label for="datedenaissance">Date de naissance</label>
                    <input type="date" name="datedenaissance" id="datedenaissance" placeholder="">
                </div>
                <div class="input-group">
                    <label >Sex</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="gender" value="M"> Masculin
                        </label>
                        <label>
                            <input type="radio" name="gender" value="F"> Féminin
                        </label>
                    </div>
                </div>
                <div class="input-group">
                    <label for="telephone">Téléphone</label>
                    <input type="text" name="telephone" id="telephone" placeholder="">
                </div>
                <div class="input-group">
                    <label for="adresse">Addresse</label>
                    <input type="text" name="adresse" id="adresse" placeholder="">
                </div>

        </div>

        <div class="form-container">

            <p class="title"><a href="index.jsp"><img src="./css/images/LOGO.png" alt="logo"></a>Acount informations</p>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="text" name="email" id="email" placeholder="">
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="">
            </div>
            <div class="input-group">
                <label for="Confirmepassword">Confirme Password</label>
                <input type="password" name="Confirmepassword" id="Confirmepassword" placeholder="">
                <div class="forgot">
                    <a rel="noopener noreferrer" href="#">Forgot Password ?</a>
                </div>
            </div>
            <button class="sign">Sign in</button>
            </form>

            <div>
                <p class="signup">Alredy have an acount :
                    <a rel="noopener noreferrer" href="login" class="">log in</a>
                </p>
            </div>

        </div>
    </div>
</div>

</body>
</html>

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
    <title>signup</title>
</head>
<body>
<h2>Add User</h2>
<form action="signup" method="post">
    <label for="nom">Nom:</label>
    <input type="text" id="nom" name="nom" required><br>
    <input type="text" id="prenom" name="prenom" required><br>
    <input type="text" id="email" name="email" required><br>
    <input type="date" id="datedenaissance" name="datedenaissance" required><br>
    <input type="text" id="age" name="age" required><br>
    <input type="text" id="sex" name="sex" required><br>
    <input type="text" id="tel" name="tel" required><br>
    <input type="text" id="adresse" name="adresse" required><br>
    <input type="text" id="username" name="username" required><br>
    <input type="text" id="password" name="password" required><br>
    <input type="text" id="type" name="type" required><br>

    <!-- Ajoutez d'autres champs du formulaire pour les attributs de l'utilisateur -->

    <button type="submit">Add User</button>
</form>

</body>
</html>

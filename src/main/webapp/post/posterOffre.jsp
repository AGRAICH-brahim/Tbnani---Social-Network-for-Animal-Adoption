<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 09/12/2023
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    poster
    <h1>Créer une offre</h1>

    <form action="posterOffre" method="post" enctype="multipart/form-data">
        <label for="description">Description de l'offre :</label>
        <textarea id="description" name="description" rows="4" cols="50" required></textarea><br>

        <h2>Informations sur l'animal</h2>

        <label for="categorieAnimal">Catégorie de l'animal :</label>
        <input type="text" id="categorieAnimal" name="categorieAnimal" required><br>

        <label for="sexeAnimal">Sexe de l'animal :</label>
        <input type="text" id="sexeAnimal" name="sexeAnimal" required><br>

        <label for="ageAnimal">Âge de l'animal :</label>
        <input type="number" id="ageAnimal" name="ageAnimal" required><br>

        <label for="raceAnimal">Race de l'animal :</label>
        <input type="text" id="raceAnimal" name="raceAnimal" required><br>

        <label for="etatDeSanteAnimal">État de santé de l'animal :</label>
        <input type="text" id="etatDeSanteAnimal" name="etatDeSanteAnimal" required><br>

        <label for="descriptionAnimal">Description de l'animal :</label>
        <textarea id="descriptionAnimal" name="descriptionAnimal" rows="4" cols="50" required></textarea><br>

        <label for="nomAnimal">Nom de l'animal :</label>
        <input type="text" id="nomAnimal" name="nomAnimal" required><br>

        <label for="addressAnimal">Adresse de l'animal :</label>
        <input type="text" id="addressAnimal" name="addressAnimal" required><br>

        <h2>Charger une photo</h2>
        <label for="image">Sélectionnez une image :</label>
        <input type="file" id="image" name="image" accept="image/*" required><br>

        <input type="submit" value="Créer l'offre">
    </form>
</body>
</html>

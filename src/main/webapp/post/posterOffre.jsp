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
    <title>Poster une offre d'adoption</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form id="myForm" action="posterOffre" method="post" enctype="multipart/form-data" autocomplete = "off">
    <h1 align = center>Publier l'offre</h1>

    <div style="text-align:center;">
        <span class="step" id = "step-1">1</span>
        <span class="step" id = "step-2">2</span>
    </div>

    <div class="tab" id = "tab-1">
        <label for="description">Description de l'offre :</label>
        <div>
            <textarea style="width: 100%;" id="description" name="description"  required></textarea><br>
        </div>
        <label for="image">Sélectionnez une image :</label>
        <input type="file" id="image" name="image" accept="image/*" required><br>

        <div class="index-btn-wrapper">
            <div class="index-btn" onclick="run(1, 2);">Next</div>
        </div>
    </div>

    <div class="tab" id = "tab-2">
        <h2>Informations sur l'animal</h2>
        <div class="rooow">
            <div>
                <label for="categorieAnimal">Catégorie de l'animal :</label>
                <select id="categorieAnimal" name="categorieAnimal"  required>
                    <option value="" disabled selected>Choisir une catégorie d'animal</option>
                    <option value="Mammifères">Mammifères</option>
                    <option value="Oiseaux">Oiseaux</option>
                    <option value="Reptiles">Reptiles</option>
                    <option value="Amphibiens">Amphibiens</option>
                    <option value="Poissons">Poissons</option>
                    <option value="Insectes">Insectes</option>
                    <option value="Arachnides">Arachnides (araignées, scorpions, etc.)</option>
                    <option value="Mollusques">Mollusques</option>
                    <option value="Crustacés">Crustacés</option>
                    <option value="Animaux marins">Animaux marins</option>
                    <option value="Animaux terrestres">Animaux terrestres</option>
                    <option value="Animaux volants">Animaux volants</option>
                    <option value="Animaux aquatiques">Animaux aquatiques</option>
                    <option value="Animaux sauvages">Animaux sauvages</option>
                    <option value="Animaux domestiques">Animaux domestiques</option>
                    <option value="Animaux herbivores">Animaux herbivores</option>
                    <option value="Animaux carnivores">Animaux carnivores</option>
                    <option value="Animaux omnivores">Animaux omnivores</option>
                    <option value="Animaux en voie de disparition">Animaux en voie de disparition</option>
                    <option value="Animaux nocturnes">Animaux nocturnes</option>
                </select>
            </div>
            <div>
                <label>Sexe de l'animal :</label>
                <div style=" display: flex; flex-direction: row; align-items: center; gap: 30px; justify-content: space-between;">
                    <div style="display: flex; flex-direction: row; align-items: center;">
                        <input type="radio" id="sexeMale" name="sexeAnimal" value="M" required>
                        <label for="sexeMale">Mâle</label>
                    </div>
                    <div style="display: flex; flex-direction: row; align-items: center;">
                        <input type="radio" id="sexeFemelle" name="sexeAnimal" value="F" required>
                        <label for="sexeFemelle">Femelle</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="rooow">
            <div style="width: 50%;">
                <label for="ageAnimal">Âge de l'animal :</label>
                <input type="number" id="ageAnimal" name="ageAnimal" required><br>
            </div>
            <div style="width: 50%;">
                <label for="nomAnimal">Nom de l'animal :</label>
                <input type="text" id="nomAnimal" name="nomAnimal" required><br>
            </div>
        </div>

        <div class="rooow">
            <div style="width: 50%;">
                <label for="raceAnimal">Race de l'animal :</label>
                <input type="text" id="raceAnimal" name="raceAnimal" ><br>
            </div>
            <div style="width: 50%;">
                <label for="etatDeSanteAnimal">État de santé de l'animal :</label>
                <input type="text" id="etatDeSanteAnimal" name="etatDeSanteAnimal" ><br>
            </div>
        </div>

        <div>
            <label for="addressAnimal">Adresse de l'animal :</label>
            <input type="text" id="addressAnimal" name="addressAnimal" required><br>
        </div>


        <label for="descriptionAnimal">Description de l'animal :</label>
        <div>
            <textarea style="width: 100%;" id="descriptionAnimal" name="descriptionAnimal" required></textarea><br>
        </div>
        <div class="index-btn-wrapper">
            <div class="index-btn" onclick="run(2, 1);">Previous</div>
            <button class = "index-btn" type="submit" name="submit" style = "background: blue;">Submit</button>
        </div>
    </div>
</form>

<style>
    body{
        background: #eaeaea;
    }

    form{
        background: #ffffff;
        margin: 100px auto;
        padding: 15px 40px 40px 40px;
        width: 70%;
    }

    .tab p{
        font-size: 20px;
        margin: 0 0 10px 0;
    }

    input , select{
        margin: 10px 0;
        padding: 10px;
        box-sizing: border-box;
        width: 100%;
        font-size: 15px;
        border: 1px solid #aaaaaa;
    }

    .index-btn-wrapper{
        display: flex;
    }

    .index-btn{
        margin: 20px 15px 0 0;
        background: #04AA6D;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        font-size: 17px;
        cursor: pointer;
        transition: 0.3s;
    }

    .index-btn:hover{
        opacity: 0.8;
    }
    .rooow {
        display: flex;
        flex-direction: row;
        gap: 30px;
    }
    .step{
        height: 30px;
        width: 30px;
        line-height: 30px;
        margin: 0 2px;
        color: white;
        background: green;
        border-radius: 50%;
        display: inline-block;
        opacity: 0.25;
    }
</style>
<script>
    // Default tab
    $(".tab").css("display", "none");
    $("#tab-1").css("display", "block");

    function run(hideTab, showTab){
        if(hideTab < showTab){ // If not press previous button
            // Validation if press next button
            var currentTab = 0;
            x = $('#tab-'+hideTab);
            y = $(x).find("input")
            for (i = 0; i < y.length; i++){
                if (y[i].value == ""){
                    $(y[i]).css("background", "#ffdddd");
                    return false;
                }
            }
        }

        // Progress bar
        for (i = 1; i < showTab; i++){
            $("#step-"+i).css("opacity", "1");
        }

        // Switch tab
        $("#tab-"+hideTab).css("display", "none");
        $("#tab-"+showTab).css("display", "block");
        $("input").css("background", "#fff");
    }
</script>
</body>
</html>


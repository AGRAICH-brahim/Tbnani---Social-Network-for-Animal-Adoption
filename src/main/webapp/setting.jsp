<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/02/2024
  Time: 01:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Setting | Tebnani social media</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v2.1.6/css/unicons.css"
    />
    <link rel="stylesheet" href="./css/accueil.css">

</head>
<body>
<nav>
    <div class="container">
        <h2 class="logo"><img src="./css/images/LOGO.png" alt=""></h2>
        <div class="search-bar">
            <i class="uil uil-search"></i>
            <input
                    type="search" onkeyup="search_animal()"
                    name="search" id="searchbar"
                    placeholder="Search for creators, inspirations and projects"
            />
        </div>
        <div class="create">
            <label class="btn btn-primary" ><a href="posterOffre">+ Create Post</a> </label>
            <div class="profile-pic">
                <c:choose>
                    <c:when test="${not empty user.image}">
                        <img style="width: 55px; height: 55px;" src="data:image/png;base64,${Base64.getEncoder().encodeToString(user.image)}" alt="Image de l'utilisateur">
                    </c:when>
                    <c:otherwise>
                        <img src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="handle">
                <h4>Profile</h4>
                <p class="text-muted"><a href="profile">${user.nom} ${user.prenom}</a></p>
            </div>
        </div>
    </div>
</nav>

<main>
    <div class="container">
        <div class="left">

            <div class="sidebar">
                <a class="menu-item " href="accueil">
                    <span><i class="uil uil-hoe"><svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32"><path fill="currentColor" d="M16.612 2.214a1.01 1.01 0 0 0-1.242 0L1 13.419l1.243 1.572L4 13.621V26a2.004 2.004 0 0 0 2 2h20a2.004 2.004 0 0 0 2-2V13.63L29.757 15L31 13.428ZM18 26h-4v-8h4Zm2 0v-8a2.002 2.002 0 0 0-2-2h-4a2.002 2.002 0 0 0-2 2v8H6V12.062l10-7.79l10 7.8V26Z"/></svg>
                </i></span> <h3>Home</h3>
                </a>
                <a class="menu-item " href="profile">
                    <span><i class="uil uil-compss"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="2"><path stroke-linejoin="round" d="M4 18a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2Z"/><circle cx="12" cy="7" r="3"/></g></svg>
                    </i></span> <h3>Profile</h3>
                </a>
                <a class="menu-item" id="notifications">
                    <span><i class="uil uil-ell">
                        <small class="notification-count">9+</small><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none"><path d="M24 0v24H0V0h24ZM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018Zm.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022Zm-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01l-.184-.092Z"/><path fill="currentColor" d="M15 19a2 2 0 0 1-1.85 1.995L13 21h-2a2 2 0 0 1-1.995-1.85L9 19h6ZM12 2a7 7 0 0 1 6.996 6.76L19 9v3.764l1.822 3.644a1.1 1.1 0 0 1-.869 1.586l-.115.006H4.162a1.1 1.1 0 0 1-1.03-1.487l.046-.105L5 12.764V9a7 7 0 0 1 7-7Z"/></g></svg>
                    </i></span> <h3>Notifications</h3>
                    <div class="notifications-popup">
                        <div>
                            <div class="profile-pic">
                                <img src="./images/profile-10.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Abigail Willey</b> accepted your friend request
                                <small class="text-muted">2 DAYS AGO</small>
                            </div>
                        </div>
                        <div>
                            <div class="profile-pic">
                                <img src="./images/profile-11.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Varun Nair</b> commented on your post
                                <small class="text-muted">1 HOUR AGO</small>
                            </div>
                        </div>
                        <div>
                            <div class="profile-pic">
                                <img src="./images/profile-12.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Marry Opmong</b> and 210 other liked your post
                                <small class="text-muted">4 MINUTES AGO</small>
                            </div>
                        </div>
                        <div>
                            <div class="profile-pic">
                                <img src="./images/profile-13.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Wilson Fisk</b> started following you
                                <small class="text-muted"> 11 HOURS AGO</small>
                            </div>
                        </div>
                    </div>
                </a>
                <a class="menu-item" id="messages-notifications">
                    <span><i class="uil uil-evelope"><small class="notification-count">6</small><svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26"><path fill="currentColor" d="M23 4H3C1.3 4 0 5.3 0 7v12c0 1.7 1.3 3 3 3h20c1.7 0 3-1.3 3-3V7c0-1.7-1.3-3-3-3zm.8 15.4L16 13.8l-3 2l-3.1-2l-7.7 5.6l6.3-6.5l-7.7-6L13 13.5L25.1 7l-7.6 6l6.3 6.4z"/></svg>
                    </i></span><h3>Messages</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-bookmark"></i></span> <h3>Enregistrer</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-analytics"></i></span> <h3>Analytics</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-alette">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M17.5 12a1.5 1.5 0 0 1-1.5-1.5A1.5 1.5 0 0 1 17.5 9a1.5 1.5 0 0 1 1.5 1.5a1.5 1.5 0 0 1-1.5 1.5m-3-4A1.5 1.5 0 0 1 13 6.5A1.5 1.5 0 0 1 14.5 5A1.5 1.5 0 0 1 16 6.5A1.5 1.5 0 0 1 14.5 8m-5 0A1.5 1.5 0 0 1 8 6.5A1.5 1.5 0 0 1 9.5 5A1.5 1.5 0 0 1 11 6.5A1.5 1.5 0 0 1 9.5 8m-3 4A1.5 1.5 0 0 1 5 10.5A1.5 1.5 0 0 1 6.5 9A1.5 1.5 0 0 1 8 10.5A1.5 1.5 0 0 1 6.5 12M12 3a9 9 0 0 0-9 9a9 9 0 0 0 9 9a1.5 1.5 0 0 0 1.5-1.5c0-.39-.15-.74-.39-1c-.23-.27-.38-.62-.38-1a1.5 1.5 0 0 1 1.5-1.5H16a5 5 0 0 0 5-5c0-4.42-4.03-8-9-8Z"/></svg>
                    </i></span> <h3>Theme</h3>
                </a>
                <a class="menu-item active">
                    <span><i class="uil uil-stting">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="12" r="3"/><path d="M13.765 2.152C13.398 2 12.932 2 12 2c-.932 0-1.398 0-1.765.152a2 2 0 0 0-1.083 1.083c-.092.223-.129.484-.143.863a1.617 1.617 0 0 1-.79 1.353a1.617 1.617 0 0 1-1.567.008c-.336-.178-.579-.276-.82-.308a2 2 0 0 0-1.478.396C4.04 5.79 3.806 6.193 3.34 7c-.466.807-.7 1.21-.751 1.605a2 2 0 0 0 .396 1.479c.148.192.355.353.676.555c.473.297.777.803.777 1.361c0 .558-.304 1.064-.777 1.36c-.321.203-.529.364-.676.556a2 2 0 0 0-.396 1.479c.052.394.285.798.75 1.605c.467.807.7 1.21 1.015 1.453a2 2 0 0 0 1.479.396c.24-.032.483-.13.819-.308a1.617 1.617 0 0 1 1.567.008c.483.28.77.795.79 1.353c.014.38.05.64.143.863a2 2 0 0 0 1.083 1.083C10.602 22 11.068 22 12 22c.932 0 1.398 0 1.765-.152a2 2 0 0 0 1.083-1.083c.092-.223.129-.483.143-.863c.02-.558.307-1.074.79-1.353a1.617 1.617 0 0 1 1.567-.008c.336.178.579.276.819.308a2 2 0 0 0 1.479-.396c.315-.242.548-.646 1.014-1.453c.466-.807.7-1.21.751-1.605a2 2 0 0 0-.396-1.479c-.148-.192-.355-.353-.676-.555A1.617 1.617 0 0 1 19.562 12c0-.558.304-1.064.777-1.36c.321-.203.529-.364.676-.556a2 2 0 0 0 .396-1.479c-.052-.394-.285-.798-.75-1.605c-.467-.807-.7-1.21-1.015-1.453a2 2 0 0 0-1.479-.396c-.24.032-.483.13-.82.308a1.617 1.617 0 0 1-1.566-.008a1.617 1.617 0 0 1-.79-1.353c-.014-.38-.05-.64-.143-.863a2 2 0 0 0-1.083-1.083Z"/></g></svg>
                    </i></span> <h3>Settings</h3>
                </a>
                <a class="menu-item " href="logout">
                <span><i class="uil uil-signout"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-width="2"><path stroke-dasharray="46" stroke-dashoffset="46" d="M16 5V4C16 3.44772 15.5523 3 15 3H6C5.44771 3 5 3.44772 5 4V20C5 20.5523 5.44772 21 6 21H15C15.5523 21 16 20.5523 16 20V19"><animate fill="freeze" attributeName="stroke-dashoffset" dur="0.5s" values="46;0"/></path><path stroke-dasharray="12" stroke-dashoffset="12" d="M10 12h11" opacity="0"><set attributeName="opacity" begin="0.6s" to="1"/><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.6s" dur="0.2s" values="12;0"/></path><path stroke-dasharray="6" stroke-dashoffset="6" d="M21 12l-3.5 -3.5M21 12l-3.5 3.5" opacity="0"><set attributeName="opacity" begin="0.8s" to="1"/><animate fill="freeze" attributeName="stroke-dashoffset" begin="0.8s" dur="0.2s" values="6;0"/></path></g></svg>
                </i></span><h3>Logout</h3>
                </a>

                <label class="btn btn-primary" ><a href="posterOffre">+ Create Post</a></label>

            </div>
        </div>

        <div class="middle">
            <div style="width: 100%; display: flex; justify-content: center; padding: 15px;">
                <h1>Mes informations </h1>
            </div>
            <div style="padding: 20px;">
                <button onclick="toggleContent('contenu')" style="width:  10cm; padding: 20px; background-color: rgba(215,226,243,0.21); ">Modifier mes information de contact ></button>
                <div id="contenu" style="display: none; transition: max-height 0.6s ease-out; position: relative; top: 10px; padding: 30PX;
box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px; width: 100%;
">
                    <!-- Votre contenu à afficher/masquer va ici -->
                    <div>
                        <form action="EditNumber" method="post" style="position:relative; left: 50px;">
                            <div>
                                <label style="padding: 10px;">modifier numéro de telephone :</label>
                            </div>
                            <input class="input" type="hidden" name="iduser" value="${user.idUser}">
                            <input class="input" type="text" name="telephone" value="${user.telephone}">
                            <button style="position: relative; top: 20px; height: 50px;">
                                <span class="text">Submit changes</span>
                            </button>
                        </form>
                    </div>
                </div>

            </div>
            <div style="padding: 20px;">
                <button onclick="toggleContent('contenu1')" style="width:  10cm; padding: 20px; background-color: rgba(215,226,243,0.21); ">Modifier mes information personnel ></button>
                <div id="contenu1" style="display: none; transition: max-height 0.6s ease-out; position: relative; top: 10px; padding: 30PX;
box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px; width: 100%;">
                    <!-- Votre contenu à afficher/masquer va ici -->
                    <div>
                        <form action="EditInfo" method="post" style="position:relative; left: 50px;">
                            <input class="input" type="hidden" name="iduser" value="${user.idUser}">

                            <div>
                                <label style="padding: 10px;">Nom</label>
                            </div>
                            <input class="input" name="nom" value="${user.nom}" type="text" placeholder="">
                            <div>
                                <label style="padding: 10px;">Prènom</label>
                            </div>
                            <input class="input" name="prenom" value="${user.prenom}" type="text" placeholder="">
                            <div>
                                <label style="padding: 10px;">date de naissance</label>
                            </div>
                            <input class="input" name="datedenaissance" value="${user.dateNaissance}" type="date" placeholder="">
                            <div>
                                <label style="padding: 10px;">Address</label>
                            </div>
                            <input class="input" name="address" type="text" value="${user.adresse}" placeholder="">
                            <button style="position: relative; top: 20px; height: 50px;">
                                <span class="text">Submit changes</span>
                            </button>
                        </form>
                    </div>
                </div>

            </div>
            <div style="padding: 20px;">
                <button onclick="toggleContent('contenu2')" style="width:  10cm; padding: 20px; background-color: rgba(215,226,243,0.21); ">Modifier le mot de passe ></button>
                <div id="contenu2" style="display: none; transition: max-height 0.6s ease-out; position: relative; top: 10px; padding: 30PX;
box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px; width: 100%;">
                    <!-- Votre contenu à afficher/masquer va ici -->
                    <div>
                        <form action="" method="" style="position:relative; left: 50px;">
                            <div>
                                <label style="padding: 10px;">Nom</label>
                            </div>
                            <input class="input" type="text" placeholder="">
                            <button style="position: relative; top: 20px; height: 50px;">
                                <span class="text">Submit</span>
                            </button>
                        </form>
                    </div>
                </div>

            </div>
        </div>

        <script>
            function toggleContent(id) {
                var contenu = document.getElementById(id);
                if (contenu.style.display === "none") {
                    contenu.style.display = "block";
                } else {
                    contenu.style.display = "none";
                }
            }
        </script>

        <style>
            .input {
                border: 2px solid transparent;
                width: 25em;
                height: 2.9em;
                padding-left: 0.8em;
                outline: none;
                overflow: hidden;
                background-color: #F3F3F3;
                border-radius: 10px;
                transition: all 0.5s;
            }

            .input:hover,
            .input:focus {
                border: 2px solid #4A9DEC;
                box-shadow: 0px 0px 0px 7px rgb(74, 157, 236, 20%);
                background-color: white;
            }
            button {
                align-items: center;
                background-image: linear-gradient(144deg,#AF40FF, #5B42F3 50%,#00DDEB);
                border: 0;
                border-radius: 8px;
                box-shadow: rgba(151, 65, 252, 0.2) 0 15px 30px -5px;
                box-sizing: border-box;
                color: #FFFFFF;
                display: flex;
                font-family: Phantomsans, sans-serif;
                font-size: 18px;
                justify-content: center;
                line-height: 1em;
                max-width: 100%;
                min-width: 140px;
                padding: 3px;
                text-decoration: none;
                user-select: none;
                -webkit-user-select: none;
                touch-action: manipulation;
                white-space: nowrap;
                cursor: pointer;
                transition: all .3s;
            }

            button:active,
            button:hover {
                outline: 0;
            }

            button span {
                background-color: rgb(5, 6, 45);
                padding: 16px 24px;
                border-radius: 6px;
                width: 100%;
                height: 100%;
                transition: 300ms;
            }

            button:hover span {
                background: none;
            }

            button:active {
                transform: scale(0.9);
            }
        </style>
    </div>
</main>

<script src="css/index.js"></script>
</body>
</html>

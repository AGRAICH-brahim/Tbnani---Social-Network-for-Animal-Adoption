<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 07/12/2023
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.myproject_s3.entities.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>


<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="css/profile.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v2.1.6/css/unicons.css"
    />
</head> 
<body>
<nav>
    <div class="container">
        <h2 class="logo"><img src="./css/images/LOGO.png" alt=""></h2>
        <div class="search-bar">
            <i class="uil uil-search"></i>
            <input
                    type="search"
                    placeholder="Search for creators, inspirations and projects"
            />
        </div>
        <div class="create">
            <label class="btn btn-primary" ><a href="posterOffre">+ Create</a> </label>
            <div class="profile-pic">
                <c:choose>
                    <c:when test="${not empty userEntity.image}">
                        <img style="width: 55px; height: 55px;" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userEntity.image)}" alt="Image de l'utilisateur">
                    </c:when>
                    <c:otherwise>
                        <img src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="handle">
                <h4>Profile</h4>
                <p class="text-muted"><a href="profile">${infoUser.nom} ${infoUser.prenom}</a></p>
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
                <a class="menu-item active" href="profile">
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
                <a class="menu-item ">
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
            <div class="container1">

                <div class="profile">

                    <div class="profile-image">
                        <c:choose>
                            <c:when test="${not empty userEntity.image}">
                                <img style="width: 140px; height: 140px; border-radius: 50%;" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userEntity.image)}" alt="Image de l'utilisateur">
                            </c:when>
                            <c:otherwise>
                                <img src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                            </c:otherwise>
                        </c:choose>
                        <div class="round">
                            <form id="myForm" action="UpdateImage" method="post" enctype="multipart/form-data">
                                <input type="file" name="image" id="fileInput" required>
                                <i class="fa fa-camera" style="color: #fff;"></i>
                                <!-- Bouton de soumission caché -->
                                <button type="submit" id="submitBtn" style="display: none;">submit</button>
                            </form>
                            <script>
                                // Sélectionnez l'élément input de type file
                                const fileInput = document.getElementById("fileInput");

                                // Sélectionnez le bouton de soumission
                                const submitBtn = document.getElementById("submitBtn");

                                // Ajoutez un écouteur d'événements change sur l'input file
                                fileInput.addEventListener("change", function() {
                                    // Montrez le bouton de soumission
                                    submitBtn.style.display = "block";

                                    // Cliquez automatiquement sur le bouton de soumission
                                    submitBtn.click();
                                });
                            </script>
                        </div>
                    </div>
                    <style>

                        .profile-image .round{
                            position: relative;
                            bottom: -40PX;
                            right: 40px;
                            background: #00B4FF;
                            width: 22px;
                            height: 22px;
                            line-height: 33px;
                            text-align: center;
                            border-radius: 50%;
                        }

                        .profile-image .round input[type = "file"]{
                            position: absolute;
                            transform: scale(2);
                            opacity: 0;
                        }

                         input[type=file]::-webkit-file-upload-button{
                            cursor: pointer;
                        }
                    </style>

                    <div class="profile-user-settings">
                        <h1 class="profile-user-name">${infoUser.nom}  ${infoUser.prenom}</h1>
                        <button class="btn profile-edit-btn">Edit Profile</button>
                        <button class="btn profile-settings-btn" aria-label="profile settings"><i class="fas fa-cog" aria-hidden="true"></i></button>
                    </div>
                    <div class="profile-stats">
                        <ul>
                            <li><span class="profile-stat-count">email : </span> ${userEntity.email}</li>
                            <li><span class="profile-stat-count">telephone : </span>  ${userEntity.telephone}</li>
                            <li><span class="profile-stat-count">206</span> following</li>
                        </ul>
                    </div>

                    <div class="profile-bio">
                        <p><span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor sit, amet consectetur adipisicing elit 📷✈️🏕️</p>
                    </div>


                </div>
                <!-- End of profile section -->

            </div>
            <!-- End of container -->
            <div class="LIGNE">
                <div class="ligne-separation"></div>
            </div>

            <div class="container11">
                <div class="sessionof">
                    <h4>PUBLICATION</h4>
                </div>
                <div class="gallery">
                    <c:forEach var="offre" items="${offres}">
                        <c:if test="${photosMap[offre.idOffre] ne null}">
                            <div class="gallery-item" tabindex="0">
                                <img src="data:image/jpeg;base64,${photosMap[offre.idOffre]}" class="gallery-image" style="height: 7cm;" alt="Image de l'offre">
                                <div class="gallery-item-info">
                                    <ul>
                                        <li class="gallery-item-likes">
                                            <p class="openModal" data-modal-id="modal-${offre.idOffre}">voir plus</p>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                            <div class="modal" id="modal-${offre.idOffre}">
                                <!-- had chi dyal l pop up -->
                                <div class="container_close">
                                    <img class="closeModal" data-modal-id="modal-${offre.idOffre}" src="./css/images/proche.png" alt="fermé le modal">
                                </div>
                                <div class="containerr">
                                    <!-- had chi dyal l pop up -->
                                    <div class="modal-inner">
                                        <div class="img_animal">
                                            <img src="data:image/jpeg;base64,${photosMap[offre.idOffre]}" class="animal_img" alt="animal photo">
                                            <div class="info_animal">
                                                <div class="ligne1of_info">
                                                    <div>
                                                        <p><strong>Description: </strong> ${animalsForOffreMap[offre.idOffre].description}</p>
                                                    </div>
                                                </div>
                                                <div class="ligne2of_info">
                                                    <div>
                                                        <p><strong>Nom Animal:</strong>  ${animalsForOffreMap[offre.idOffre].nomAnimal}</p>
                                                    </div>
                                                    <div>
                                                        <p><strong>Catégorie: </strong> ${animalsForOffreMap[offre.idOffre].categorie} </p>
                                                    </div>
                                                    <div>
                                                        <p><strong>Sexe: </strong> ${animalsForOffreMap[offre.idOffre].sexe}</p>
                                                    </div>
                                                </div>
                                                <div class="ligne2of_info">
                                                    <div>
                                                        <p><strong>Race: </strong>${animalsForOffreMap[offre.idOffre].race} </p>
                                                    </div>
                                                    <div>
                                                        <p><strong>Etat:</strong> ${animalsForOffreMap[offre.idOffre].etatDeSante}</p>
                                                    </div>
                                                    <div>
                                                        <p><strong>Age:</strong> ${animalsForOffreMap[offre.idOffre].age}</p>
                                                    </div>
                                                </div>
                                                <div class="ligne1of_info">
                                                    <div>
                                                        <p><strong>Adresse:</strong>  ${animalsForOffreMap[offre.idOffre].address}  </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="side_img_">
                                            <div class="profile_info_">
                                                <div class="profile_info">
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${not empty userEntity.image}">
                                                                <img class="profile_img" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userEntity.image)}" alt="Image de l'utilisateur">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div>
                                                        <p>${infoUser.nom}  ${infoUser.prenom}</p>
                                                        <p style="font-size: 10px; position: relative; ">adresse</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <ul>
                                                        <div class="list">
                                                            <li>
                                                                <button>
                                                                    <img src="./css/images/option.png" class="option_" alt="">
                                                                </button>
                                                                <ul>
                                                                    <li>
                                                                        <form method="post" action="editOffreForm">
                                                                            <input type="hidden" value="${offre.getIdOffre()}" name="idoffre">
                                                                            <input type="hidden" value="${offre.getIdAnimal()}" name="idanimal">
                                                                            <button style="width: 230px; background: none;"> Modifier l'offre d'adoption</button>
                                                                        </form>
                                                                    </li>
                                                                    <li>
                                                                        <form method="post" action="DeleteOffre">
                                                                            <input type="hidden" value="${offre.getIdOffre()}" name="idoffre">
                                                                            <input type="hidden" value="${offre.getIdAnimal()}" name="idanimal">
                                                                            <button style="width: 230px; background: none;"> Supprimer l'offre d'adoption
                                                                                    </button>
                                                                        </form>
                                                                    </li>
                                                                </ul>
                                                            </li>

                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="ligne_separatio"></div>
                                            <div class="comments_info">
                                                <div class="offre_info_">
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${not empty userEntity.image}">
                                                                <img class="profile_img" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userEntity.image)}" alt="Image de l'utilisateur">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div>
                                                        <p><a style="text-decoration: none;" href="">${infoUser.nom}  ${infoUser.prenom}</a> ${offre.description}</p>
                                                        <p style="font-size: 10px; position: relative; ">date: ${offre.dateTime} </p>
                                                    </div>
                                                </div>

                                                <div class="offre_info_">
                                                    <div>
                                                        <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="profile">
                                                    </div>
                                                    <div>
                                                        <p><a style="text-decoration: none;" href="">Brahim Agraich</a> rrrrrrrrrezzzz </p>
                                                        <p style="font-size: 10px; position: relative; ">date: zzz </p>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="input-groupp">
                                                <div>

                                                </div>
                                                <input type="text" class="inputt" id="content" name="content" placeholder="ajouter un commentaire ..." autocomplete="off">
                                                <input class="button--submit" value="Pubier" type="submit">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <script>
                        const openBtns = document.querySelectorAll(".openModal");
                        const closeBtns = document.querySelectorAll(".closeModal");

                        openBtns.forEach((openBtn) => {
                            openBtn.addEventListener("click", (event) => {
                                const modalId = event.target.getAttribute("data-modal-id");
                                const modal = document.getElementById(modalId);
                                modal.classList.add("open");
                            });
                        });

                        closeBtns.forEach((closeBtn) => {
                            closeBtn.addEventListener("click", (event) => {
                                const modalId = event.target.getAttribute("data-modal-id");
                                const modal = document.getElementById(modalId);
                                modal.classList.remove("open");
                            });
                        });
                    </script>
<style>
    .modal {
        background-color: rgba(0, 0, 0, 0.8);
        opacity: 0;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        transition: all 0.3s ease-in-out;
        z-index: -1;



    }
    .modal.open {
        opacity: 1;
        z-index: 999;
    }
    .containerr {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        transition: all 0.3s ease-in-out;
        z-index: -1;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .modal-inner{
        background-color: whitesmoke;
        min-height: 85vh;
        width: 60%;
        display: flex;
        flex-direction: row;
        border-radius: 6px;
    }
    .container_close {
        display: flex;
        width: 100%;
        justify-content: end;
        padding: 20px;
    }
    img.closeModal{
        width: 40px;
        cursor: pointer;
        padding: 10px;
    }
    img.closeModal:hover {
        display: flex;
        position: relative;
        top: 2px;
    }
    .img_animal{
        width: 55%;
    }
    .img_animal img.animal_img {
        width: 100%;
        height: 300px;
        border-radius: 6px;
    }
    .info_animal{
        display: flex;
        flex-direction: column;
        padding: 15px;
        width: 100%;
        font-size: 12px;
        height: 50%;
        gap: 7px;
        box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px;
    }
    .info_animal .ligne2of_info {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .side_img_ {
        width: 45%;
        min-height: 85vh;
    }
    .side_img_ .profile_info img.profile_img {
        width: 36px;
        height: 36px;
        border-radius: 50%;
    }
    .side_img_ .profile_info_ img.option_ {
        width: 60px;
        padding-inline: 17px;
        padding-block: 5px;
        cursor: pointer;
    }
    .side_img_ .profile_info_ img.option_:hover {
        position: relative;
        top: -1px;
    }

    .list button {
        padding: 7px 10px;
        background-color: whitesmoke;
        border: none;
        position: relative;
    }

    .list button:hover {
        background-color: rgba(243, 213, 213, 0.047);
        border: 1px solid rgb(221, 221, 175);
        color: red;
    }
    ul li {
        display: inline-block;
        position: relative;
    }

    ul li a {
        display: block;
        padding: 15px;
    }

    ul li ul {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 1;
    }

    ul li:hover ul {
        display: block;
    }

    ul li ul li {
        display: flex;
        background-color: #ffffff;
        width: 250px;
        box-shadow: rgba(0, 0, 0, 0.05) 0px 0px 0px 1px;
        transition: all 0.2s ease;
    }

    ul li ul li:hover {
        background-color: rgb(244, 223, 223);
        border: 1px solid rgb(221, 221, 175);
        color: red;
        padding: 2px;
    }

    ul li ul li a:hover{
        color: red;
    }

    ul li ul li a {
        display: flex;
        position: relative;
        font-style: none ;
        gap: 3px;
        text-decoration: none;
        padding: 10px;
    }


    .profile_info_ {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        font-size: 12px;
        padding:10px;
        padding-block: 4px;
        width: 100%;
    }
    .profile_info {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 16px;
    }

    .ligne_separatio {
        display: flex;
        width: 100%;
        height: 1px;
        position: relative;
        background-color: rgba(0, 0, 0, 0.107);
    }
    .comments_info {
        display: flex;
        flex-direction: column;
        font-size: 12px;
        height: 67vh;
        max-height: 67vh; /* Ajoutez une hauteur maximale ici */
        overflow: hidden;
        overflow-y: scroll;
        width: 100%;
        padding: 10px;
        gap: 5px;
    }
    .side_img_ .offre_info_ img.profile_img {
        width: 36px;
        height: 36px;
        border-radius: 50%;
    }
    .offre_info_ {
        display: flex;
        flex-direction: row;
        gap: 16px;
    }

    .input-groupp {
        display: flex;
        align-items: center;
        width: 100%;
        justify-content: flex-end; /* Ajoutez cette ligne pour aligner l'élément à la fin */
        margin-bottom: 0%;
        padding-top: 15px;
        font-size: 12px;
        align-self: flex-end;
    }

    .inputt {
        min-height: 36.7px;
        width: 80%;
        padding: 0 1rem;
        color: #000000;
        font-size: 12px;
        border: 1px solid #5e4dcd;
        border-radius: 6px 0 0 6px;
        background-color: transparent;
    }

    .button--submit {
        min-height: 38px;
        width: 20%;
        padding: .5em 1em;
        border: none;
        border-radius: 0 6px 6px 0;
        background-color: #5e4dcd;
        color: #fff;
        font-size: 12px;
        cursor: pointer;
        transition: background-color .3s ease-in-out;
    }

    .button--submit:hover {
        background-color: #25247fd3;
    }

    .inputt:focus, .input:focus-visible {
        border-color: #3898EC;
        outline: none;
    }


</style>

                <!-- End of gallery -->
            </div>
        </div>
    </div>
    </div>
</main>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        console.log("DOM chargé");
        // Votre code JavaScript ici
        var menuItems = document.querySelectorAll('.menu-item');
        console.log(menuItems);  // Vérifiez ce que retourne querySelectorAll

        // Vérifier si menuItems est non nul et non vide
        if (menuItems && menuItems.length > 0) {
            // Ajouter un écouteur d'événements à chaque élément '.menu-item'
            menuItems.forEach(function(menuItem) {
                menuItem.addEventListener('click', function() {
                    // Code à exécuter lorsqu'un élément '.menu-item' est cliqué
                    console.log('Menu item cliqué !');
                });
            });
        }

        //remove active class from all menu items
        const changeActiveItem = () => {
            menuItems.forEach(item => {
                item.classList.remove('active');
            });
        };

        menuItems.forEach(item => {
            item.addEventListener('click', () => {
                changeActiveItem();
                item.classList.add('active');

                if (item.id != 'notifications') {
                    document.querySelector('.notifications-popup').style.display = 'none';
                } else {
                    document.querySelector('.notifications-popup').style.display = 'block';
                    document.querySelector('#notifications .notification-count').style.display = 'none';
                }
            });
        });

        const messagesNotification = document.querySelector('#messages-notifications');
        const messages = document.querySelector('.messages');
        const message = messages.querySelectorAll('.message');
        const messageSearch = document.querySelector('#message-search');

        const searchMessage = () => {
            const val = messageSearch.value.toLowerCase();
            message.forEach(chat => {
                let name = chat.querySelector('h5').textContent.toLowerCase();
                if (name.indexOf(val) != -1) {
                    chat.style.display = 'flex';
                } else {
                    chat.style.display = 'none';
                }
            });
        };

        messageSearch.addEventListener('keyup', searchMessage);

        messagesNotification.addEventListener('click', () => {
            messages.style.boxShadow = '0 0 1rem var(--color-primary)';
            messagesNotification.querySelector('.notification-count').style.display = 'none';
            setTimeout(() => {
                messages.style.boxShadow = 'none';
            }, 2000);
        });
    });
</script>



</body>
</html>

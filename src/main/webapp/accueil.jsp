<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/12/2023
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.myproject_s3.dao.photo.PhotoDaoImp" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home | Tebnani social media</title>
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
                <a class="menu-item active" href="accueil">
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
                <a class="menu-item" href="UserSetting">
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
            <form class="create-post">
                <div class="profile-pic">
                    <c:choose>
                        <c:when test="${not empty user.image}">
                            <img style="width: 50px; height: 50px;" src="data:image/png;base64,${Base64.getEncoder().encodeToString(user.image)}" alt="Image de l'utilisateur">
                        </c:when>
                        <c:otherwise>
                            <img  src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                        </c:otherwise>
                    </c:choose>

                </div>
                <input type="text" placeholder="What's on your mind Chirag?" id="create-post">
                <input type="submit" value="Post" class="btn btn-primary">
            </form>
            <div class="feeds">
                <c:forEach var="offre" items="${offres}">
                <div class="feed">
                    <div class="head">
                        <c:set var="userOffreEntity" value="${usersMap[offre.idOffre]}" />

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <c:choose>
                                <c:when test="${not empty userOffreEntity.image}">
                                    <img style="width: 55px; height: 55px;" class="profile_img" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userOffreEntity.image)}" alt="Image de l'utilisateur">
                                </c:when>
                                <c:otherwise>
                                    <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <div class="info">
                            <form action="profileuser" method="post">
                                <input type="hidden" value="${userOffreEntity.idUser}" name="idUserToShow">
                                <h3 style="text-decoration: none; color: black; cursor: pointer"><button style="background-color: rgba(255,250,250,0); cursor: pointer; padding: 2px;">
                                     ${userOffreEntity.nom} ${userOffreEntity.prenom}
                            </button></h3>
                            </form>
                            <small> ${offre.dateTime}</small>
                        </div>
                        <SPAN class="edit" style="display: flex; width: 50%; justify-content: end; ">
                            <ul>
                                <li>
                                    <i style="cursor: pointer; border-radius: 50%;
                            height: 20px;" class="uil uil-ellipsis-h"></i>
                                <c:if test="${userOffreEntity.getIdUser() == user.getIdUser()}">
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
                                </c:if>
                                </li>

                            </ul>

                        </SPAN>
                        <style>
                            .edit i:hover{
                                background-color: rgba(0, 0, 0, 0.22);
                            }
                        </style>
                    </div>
                        <div>
                            <p style="padding-inline: 15px; padding-top: 10px; white-space: pre-line;"><c:out value="${offre.description}" /></p>
                        </div>
                    <div class="photo">
                        <c:if test="${photosMap[offre.idOffre] ne null}">
                            <img style="max-height: 11cm;" src="data:image/jpeg;base64,${photosMap[offre.idOffre]}" alt="Image de l'offre">
                        </c:if>
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment openModal"  data-modal-id="modal-${offre.idOffre}"></i></span>
                            <span><i class="uil uil-share"></i></span>
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
                                                    <p><strong>Adresse:</strong>  ${animalsForOffreMap[offre.idOffre].address}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="side_img_">
                                        <div class="profile_info_">
                                            <div class="profile_info">
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${not empty userOffreEntity.image}">
                                                            <img class="profile_img" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userOffreEntity.image)}" alt="Image de l'utilisateur">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div>
                                                    <p>${userOffreEntity.nom}  ${userOffreEntity.prenom}</p>
                                                    <p style="font-size: 10px; position: relative; ">${userOffreEntity.adresse}</p>
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
                                                                <li><a href="#">Modifier l'offre </a></li>
                                                                <li><a href="#">Supprimer l'offre </a></li>
                                                                <li><a href="#">Registration</a></li>
                                                                <li><a href="#">Publishing</a></li>
                                                                <li><a href="#">Smart CFP</a></li>
                                                            </ul></li>

                                                    </div>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="ligne_separatio"></div>
                                        <div class="comments_info">
                                            <div class="offre_info_">
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${not empty userOffreEntity.image}">
                                                            <img class="profile_img" src="data:image/png;base64,${Base64.getEncoder().encodeToString(userOffreEntity.image)}" alt="Image de l'utilisateur">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="Image de l'utilisateur">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div>
                                                    <p><a style="text-decoration: none;" href="">${userOffreEntity.nom}  ${userOffreEntity.prenom}</a> ${offre.description}</p>
                                                    <p style="font-size: 10px; position: relative; ">date: ${offre.dateTime} </p>
                                                </div>
                                            </div>

                                            <c:forEach var="commentaire" items="${commentaires}">
                                                <c:if test="${commentaire.id_offre == offre.idOffre}">
                                                    <div class="offre_info_">
                                                        <div>
                                                            <img class="profile_img" src="./css/images/profile-par-defaut.webp" alt="profile">
                                                        </div>
                                                        <div>
                                                            <p><a style="text-decoration: none;" href="">${commentaire.userName} ${commentaire.userPrenom}</a> ${commentaire.content} </p>
                                                            <p style="font-size: 10px; position: relative; ">date: ${commentaire.datetime} </p>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>


                                        </div>
                                        <div class="input-groupp">
                                            <div>

                                            </div>
                                            <form id="commentForm" action="addCommentaire" method="post" style="display: flex; width: 100%;">
                                                <input type="hidden" value="${offre.idOffre}" name="offreid">
                                                <input type="text" class="inputt" id="content" name="commentaire_saisie" placeholder="ajouter un commentaire ..." autocomplete="off">
                                                <input class="button--submit" value="Pubier" type="submit">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <style>
                            .action-button .interaction-button span i:hover , .bookmark i:hover , .bookmark span svg:hover{
                                position: relative;
                                top: -2px;
                                background-color: rgba(0, 0, 0, 0.24);
                                border-radius: 50%;
                                cursor: pointer;
                            }
                        </style>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                            <span><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="#000000" d="M6.19 21.855a.75.75 0 0 1-1.187-.61V6.25A3.25 3.25 0 0 1 8.253 3h7.498a3.25 3.25 0 0 1 3.25 3.25v14.996a.75.75 0 0 1-1.188.609l-5.81-4.181z"/></svg></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-15.jpg"></span>
                        <span><img src="./css/images/profile-16.jpg"></span>
                        <span><img src="./css/images/profile-17.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>220 others</b></p>
                    </div>

                    <div class="caption">
                        <p style="max-height: 40px; overflow: hidden;"><b >${userOffreEntity.nom} ${userOffreEntity.prenom}</b><c:out value="${offre.description}" />
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 130 comments</div>
                </div>
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
            </div>
        </div>

        <div class="right">
            <div class="messages">
                <div class="heading">
                    <h4>Messages</h4>
                    <span><i class="uil uil-edit"></i></span>
                </div>

                <div class="search-bar">
                    <span><i class="uil uil-search"></i></span>
                    <input type="search" placeholder="Search Messages" id="message-search">
                </div>

                <div class="category">
                    <h6 class="active">Primary</h6>
                    <h6>General</h6>
                    <h6 class="message-requests">Requests(7)</h6>
                </div>
                <div class="message">
                    <div class="profile-pic">
                        <img src="./css/images/profile-17.jpg">
                        <div class="active"></div>
                    </div>
                    <div class="message-body">
                        <h5>Kareena Joshua</h5>
                        <p class="text-muted">Just woke up bruh..</p>
                    </div>
                </div>

                <div class="message">
                    <div class="profile-pic">
                        <img src="./css/images/profile-18.jpg">
                        <div class="active"></div>
                    </div>
                    <div class="message-body">
                        <h5>Dan Smith</h5>
                        <p class="text-bold">2 New Messages</p>
                    </div>
                </div>
                <style>
                    .right .messages .message{
                        display: flex;
                        gap: 1rem;
                        margin-bottom: 1rem;
                        align-items: start;
                        cursor: pointer;
                        padding: 5px;
                        transition: 0.5s;
                    }

                    .right .messages .message:hover {
                        background-color: #eeeeee;
                        border-radius: 5px;
                    }

                </style>
                <div class="message">
                    <div class="profile-pic">
                        <img src="./css/images/profile-15.jpg">
                    </div>
                    <div class="message-body">
                        <h5>Chris Brown</h5>
                        <p class="text-muted">Lol u right</p>
                    </div>
                </div>
                <div class="message">
                    <div class="profile-pic">
                        <img src="./css/images/profile-14.jpg">
                    </div>
                    <div class="message-body">
                        <h5>Lana Rose</h5>
                        <p class="text-bold">Birthday tomorrow!!</p>
                    </div>
                </div>
                <div class="message">
                    <div class="profile-pic">
                        <img src="./css/images/profile-11.jpg">
                    </div>
                    <div class="message-body">
                        <h5>Varun Nair</h5>
                        <p class="text-muted">Ssup?</p>
                    </div>
                </div>
                <div class="message">
                    <div class="profile-pic">
                        <img src="./css/images/profile-1.jpg">
                        <div class="active"></div>
                    </div>
                    <div class="message-body">
                        <h5>Jahnvi Doifode</h5>
                        <p class="text-bold">3 New Messages</p>
                    </div>
                </div>
            </div>
            <div class="friend-requests">
                <h4>Requests</h4>
                <div class="request">
                    <div class="info">
                        <div class="profile-pic">
                            <img src="./css/images/profile-13.jpg">
                        </div>
                        <div>
                            <h5>Wilson Fisk</h5>
                            <p class="text-muted">8 mutual friends</p>

                        </div>
                    </div>
                    <div class="action">
                        <button class="btn btn-primary">Accept</button>
                        <button class="btn">Decline</button>
                    </div>
                </div>
                <div class="request">
                    <div class="info">
                        <div class="profile-pic">
                            <img src="./css/images/profile-20.jpg">
                        </div>
                        <div>
                            <h5>Srishti Tirkey</h5>
                            <p class="text-muted">2 mutual friends</p>

                        </div>
                    </div>
                    <div class="action">
                        <button class="btn btn-primary">Accept</button>
                        <button class="btn">Decline</button>
                    </div>
                </div>
                <div class="request">
                    <div class="info">
                        <div class="profile-pic">
                            <img src="./css/images/profile-5.jpg">
                        </div>
                        <div>
                            <h5>Christ Kahea</h5>
                            <p class="text-muted">1 mutual friend</p>

                        </div>
                    </div>
                    <div class="action">
                        <button class="btn btn-primary">Accept</button>
                        <button class="btn">Decline</button>
                    </div>
                </div>

            </div>



        </div>
    </div>
</main>

<script src="css/index.js"></script>
</body>

</html>

<script>
    // JavaScript code

    function search_animal() {
        let input = document.getElementById('searchbar').value
        input = input.toLowerCase();
        let x = document.getElementsByClassName('feed');

        for (i = 0; i < x.length; i++) {
            if (!x[i].innerHTML.toLowerCase().includes(input)) {
                x[i].style.display = "none";
            }
            else {
                x[i].style.display = "";
            }
        }
    }

</script>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/12/2023
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.myproject_s3.entities.UserEntity" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Base64" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <link rel="stylesheet" href="./css/dashboard.css">

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title>
</head>
<body>

<nav>
    <div class="logo-name">
        <div class="logo-image">
            <img src="./css/images/LOGO.png" alt="logo">
        </div>

        <span class="logo_name">Tbnani</span>
    </div>

    <div class="menu-items">
        <ul class="nav-links">
            <li><a href="dashboard">
                <i class="uil uil-estate"></i>
                <span class="link-name">Dahsboard</span>
            </a></li>
            <li><a href="Content">
                <i class="uil uil-files-landscapes"></i>
                <span class="link-name">Content</span>
            </a></li>
            <li><a href="#">
                <i class="uil uil-chart"></i>
                <span class="link-name">Analytics</span>
            </a></li>
            <li><a href="listeusers">
                <i class="uil uil-thumbs-up"></i>
                <span class="link-name">Liste Users</span>
            </a></li>
            <li><a href="#">
                <i class="uil uil-comments"></i>
                <span class="link-name">Comment</span>
            </a></li>
            <li><a href="#">
                <i class="uil uil-share"></i>
                <span class="link-name">Share</span>
            </a></li>
        </ul>

        <ul class="logout-mode">
            <li><a href="logout">
                <i class="uil uil-signout"></i>
                <span class="link-name">Logout</span>
            </a></li>

            <li class="mode">
                <a href="#">
                    <i class="uil uil-moon"></i>
                    <span class="link-name">Dark Mode</span>
                </a>

                <div class="mode-toggle">
                    <span class="switch"></span>
                </div>
            </li>
        </ul>
    </div>
</nav>

<section class="dashboard">
    <div class="top">
        <i class="uil uil-bars sidebar-toggle"></i>

        <div class="search-box">
            <i class="uil uil-search"></i>
            <input type="text" placeholder="Search here...">
        </div>

        <img src="../css/images/img_4.png" alt="">
    </div>

    <div class="dash-content">
        <div class="overview">
            <div class="title">
                <i class="uil uil-tachometer-fast-alt"></i>
                <span class="text">Dashboard</span>
            </div>

            <div class="boxes">
                <div class="box box1">
                    <i class="uil uil-thumbs-up"></i>
                    <span class="text">Total Likes</span>
                    <span class="number">50,120</span>
                </div>
                <div class="box box2">
                    <i class="uil uil-comments"></i>
                    <span class="text">Comments</span>
                    <span class="number">20,120</span>
                </div>
                <div class="box box3">
                    <i class="uil uil-share"></i>
                    <span class="text">Total Share</span>
                    <span class="number">10,120</span>
                </div>
            </div>
        </div>

        <div class="activity">
            <div class="title">
                <i class="uil uil-clock-three"></i>
                <span class="text">Recent Content</span>
            </div>
<c:forEach var="offre" items="${offres}">
            <div class="content1">
                <c:set var="userOffreEntity" value="${usersMap[offre.idOffre]}" />
                <div style="display: flex; flex-direction: row; gap: 20px;">
                    <div style="width: 100%;">
                        <c:if test="${photosMap[offre.idOffre] ne null}">
                        <img style="width: 100%; height: 40vh" src="data:image/jpeg;base64,${photosMap[offre.idOffre]}" alt="Image de l'offre">
                        </c:if>
                    </div>
                    <div style="width: 100%; ">
                    <div  style="width: 100%; height: 25vh;
        max-height: 25vh; /* Ajoutez une hauteur maximale ici */
        overflow: hidden;
        overflow-y: scroll;">
                        <p ><c:out value="${offre.description}" /></p>
                    </div>
                        <div style="display: flex; gap: 15px; position: relative; top: 30px;">
                            <div>
                            <button  class="cta openModal" data-modal-id="modal-${offre.idOffre}">
                                <span class="hover-underline-animation"> Voir les details </span>
                                <svg
                                        id="arrow-horizontal"
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="30"
                                        height="10"
                                        viewBox="0 0 46 16"
                                >
                                    <path
                                            id="Path_10"
                                            data-name="Path 10"
                                            d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z"
                                            transform="translate(30)"
                                    ></path>
                                </svg>
                            </button>
                            </div>
                            <div>
                            <form method="post" action="Deleteposte" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette offre?');">
                                <input type="hidden" value="${offre.getIdOffre()}" name="idoffre">
                                <input type="hidden" value="${offre.getIdAnimal()}" name="idanimal">
                            <button style="background-color: #dc0000;" class="cta">
                                <span class="hover-underline-animation"> Supprimer </span>
                                <svg
                                        id="arrow-horizontal"
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="30"
                                        height="10"
                                        viewBox="0 0 46 16"
                                >
                                    <path
                                            id="Path_10"
                                            data-name="Path 10"
                                            d="M8,0,6.545,1.455l5.506,5.506H-30V9.039H12.052L6.545,14.545,8,16l8-8Z"
                                            transform="translate(30)"
                                    ></path>
                                </svg>
                            </button>
                            </form>
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

                        </div>
                    </div>
                </div>
            </div>
</c:forEach>
            <style>
                .content1 {
                    padding: 50px;
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;

                }
                .cta {
                    border: none;
                    background: none;
                    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
                    cursor: pointer;
                    padding: 20px;
                    border-radius: 5px;
                }

                .cta span {
                    padding-bottom: 7px;
                    letter-spacing: 4px;
                    font-size: 14px;
                    padding-right: 15px;
                    text-transform: uppercase;
                }

                .cta svg {
                    transform: translateX(-8px);
                    transition: all 0.3s ease;
                }

                .cta:hover svg {
                    transform: translateX(0);
                }

                .cta:active svg {
                    transform: scale(0.9);
                }

                .hover-underline-animation {
                    position: relative;
                    color: black;
                    padding-bottom: 20px;
                }

                .hover-underline-animation:after {
                    content: "";
                    position: absolute;
                    width: 100%;
                    transform: scaleX(0);
                    height: 2px;
                    bottom: 0;
                    left: 0;
                    background-color: #000000;
                    transform-origin: bottom right;
                    transition: transform 0.25s ease-out;
                }

                .cta:hover .hover-underline-animation:after {
                    transform: scaleX(1);
                    transform-origin: bottom left;
                }

            </style>
        </div>
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
        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Recent Orders</h3>
                    <i class='bx bx-search' ></i>
                    <i class='bx bx-filter' ></i>
                </div>

            </div>

</section>

<script src="./css/script.js"></script>
</body>
</html>

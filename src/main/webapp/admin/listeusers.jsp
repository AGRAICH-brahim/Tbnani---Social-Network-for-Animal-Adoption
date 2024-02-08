<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/12/2023
  Time: 02:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.myproject_s3.entities.UserEntity" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!----======== CSS ======== -->
    <link rel="stylesheet" href="../css/listeUsers.css">

    <!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <title>Admin Dashboard Panel</title>
</head>
<body>
dashboard
<nav>
    <div class="logo-name">
        <div class="logo-image">
            <img src="../css/images/LOGO.png" alt="logo">
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
                <span class="link-name">Liste users</span>
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


        <div class="table-data">
            <div class="order">
                <div class="head">
                    <h3>Recent Users</h3>
                    <i class='bx bx-search' ></i>
                    <i class='bx bx-filter' ></i>
                </div>
                <table  data-toggle="table"
                        data-search="true"
                        data-filter-control="true"
                        data-show-export="true"
                        data-click-to-select="true"
                        data-toolbar="#toolbar">
                    <thead>
                    <tr>
                        <th >User</th>
                        <th>Email</th>
                        <th>Telephone</th>
                        <th>address</th>
                        <th>Sex</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty users}">
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>
                                    <img src="./css/images/profile-2.jpg">
                                    <p>${user.idUser} ${user.nom} ${user.prenom}</p>
                                </td>
                                <td>${user.email}</td>
                                <td>${user.adresse}</td>
                                <td>${user.telephone}</td>
                                <td>${user.sex}</td>
                                <td>
                                    <div class="supprimer">
                                        <form action="DeleteUser" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette utilisateur?');">
                                            <input type="hidden" name="userIdToDelete" value="${user.idUser}">
                                            <button class="noselect"><span class="text">Delete</span><span class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"></path></svg></span></button>
                                        </form>
                                        <form action="accueil" method="post">
                                            <input type="hidden" value="${user.idUser}">
                                            <button class="btn" style="background: #040f16;">
                                                <span class="icon">
                                                    <svg viewBox="0 0 175 80" width="40" height="40">
                                                        <rect width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                                                        <rect y="30" width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                                                        <rect y="60" width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                                                    </svg>
                                                </span>
                                                <span class="text">Log in</span>
                                            </button>                                        </form>

                                        <style>
                                            .supprimer {
                                                display: flex;
                                                align-items: center;
                                                gap: 5px;
                                            }
                                            .supprimer button {
                                                width: 80px;
                                                height: 30px;
                                                cursor: pointer;
                                                display: flex;
                                                align-items: center;
                                                background: red;
                                                border: none;
                                                border-radius: 5px;
                                                box-shadow: 1px 1px 3px rgba(0,0,0,0.15);
                                                background: #e62222;
                                            }

                                            .supprimer button, .supprimer button span {
                                                transition: 200ms;
                                            }

                                            .supprimer button .text {
                                                transform: translateX(5px);
                                                color: white;
                                                font-weight: bold;
                                            }

                                            .supprimer button .icon {
                                                position: absolute;
                                                border-left: 1px solid #c41b1b;
                                                transform: translateX(60px);
                                                height: 20px;
                                                width: 20px;
                                                display: flex;
                                                align-items: center;
                                                justify-content: center;
                                            }

                                            .supprimer button svg {
                                                width: 15px;
                                                fill: #eee;
                                            }

                                            .supprimer button:hover {
                                                background: #ff3636;
                                            }

                                            .supprimer button:hover .text {
                                                color: transparent;
                                            }

                                            .supprimer button:hover .icon {
                                                width: 80px;
                                                border-left: none;
                                                transform: translateX(0);
                                            }

                                            .supprimer button:focus {
                                                outline: none;
                                            }

                                            .supprimer button:active .icon svg {
                                                transform: scale(0.8);
                                            }
                                            .supprimer.btn {
                                                width: 80px;
                                                height: 30px;
                                                border-radius: 5px;
                                                border: none;
                                                transition: all 0.5s ease-in-out;
                                                font-size: 20px;
                                                font-weight: 500;
                                                display: flex;
                                                align-items: center;
                                                background: #040f16;
                                                color: #f5f5f5;
                                            }

                                            .supprimer .btn:hover {
                                                box-shadow: 0 0 20px 0px #2e2e2e3a;
                                            }

                                            .supprimer .btn .icon {
                                                position: absolute;
                                                height: 20px;
                                                width: 20px;
                                                display: flex;
                                                justify-content: center;
                                                align-items: center;
                                                transition: all 0.5s;
                                            }

                                            .btn .text {
                                                transform: translateX(25px);
                                            }

                                            .supprimer .btn:hover .icon {
                                                width: 80px;
                                            }

                                            .btn:hover .text {
                                                transition: all 0.5s;
                                                opacity: 0;
                                            }

                                            .btn:focus {
                                                outline: none;
                                            }

                                            .btn:active .icon {
                                                transform: scale(0.85);
                                            }
                                        </style>
                                    </div>

                                    </td>
                            </tr>
                        </c:forEach>
                    </c:if>


                    </tbody>
                </table>
            </div>
</section>

<script src="./css/script.js"></script>
</body>
</html>


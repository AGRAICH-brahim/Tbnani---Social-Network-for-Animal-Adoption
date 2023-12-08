<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/12/2023
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width= , initial-scale=1.0" />
    <title>Chirag social</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <script src="./css/index.js"></script>
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
                    type="search"
                    placeholder="Search for creators, inspirations and projects"
            />
        </div>
        <div class="create">
            <label class="btn btn-primary" for="create-post">Create</label>
            <div class="profile-pic">
                <img src="./css/images/profile-8.jpg" alt="pic 1" />
            </div>
            <div class="handle">
                <h4>Profil</h4>
                <p class="text-muted"><a href="/profile">@chirag</a></p>
            </div>
        </div>

    </div>
</nav>

<main>
    <div class="container">
        <div class="left">

            <div class="sidebar">
                <a class="menu-item active">
                    <span><i class="uil uil-home"></i></span> <h3>Home</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-compass"></i></span> <h3>Profile</h3>
                </a>
                <a class="menu-item" id="notifications">
                    <span><i class="uil uil-bell"><small class="notification-count">9+</small></i></span> <h3>Notifications</h3>
                    <div class="notifications-popup">
                        <div>
                            <div class="profile-pic">
                                <img src="././css/images/profile-10.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Abigail Willey</b> accepted your friend request
                                <small class="text-muted">2 DAYS AGO</small>
                            </div>
                        </div>
                        <div>
                            <div class="profile-pic">
                                <img src="././css/images/profile-11.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Varun Nair</b> commented on your post
                                <small class="text-muted">1 HOUR AGO</small>
                            </div>
                        </div>
                        <div>
                            <div class="profile-pic">
                                <img src="././css/images/profile-12.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Marry Opmong</b> and 210 other liked your post
                                <small class="text-muted">4 MINUTES AGO</small>
                            </div>
                        </div>
                        <div>
                            <div class="profile-pic">
                                <img src="././css/images/profile-13.jpg" >
                            </div>
                            <div class="notification-body">
                                <b>Wilson Fisk</b> started following you
                                <small class="text-muted"> 11 HOURS AGO</small>
                            </div>
                        </div>
                    </div>
                </a>
                <a class="menu-item" id="messages-notifications">
                    <i class="uil uil-envelope"><small class="notification-count">6</small></i></span><h3>Messages</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-bookmark"></i></span> <h3>Enregistrer</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-analytics"></i></span> <h3>Analytics</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-palette"></i></span> <h3>Theme</h3>
                </a>
                <a class="menu-item ">
                    <span><i class="uil uil-setting"></i></span> <h3>Settings</h3>
                </a>

                <label class="btn btn-primary" for="create-post">Create Post</label>
            </div>
        </div>



        <div class="middle">

            <form class="create-post">
                <div class="profile-pic">
                    <img src="./css/images/profile-8.jpg" alt="">
                </div>
                <input type="text" placeholder="What's on your mind Chirag?" id="create-post">
                <input type="submit" value="Post" class="btn btn-primary">
            </form>

            <div class="feeds">
                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-14.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>Lana Rose</h3>
                            <small>Dubai, 15 MINUTES AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-1.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-15.jpg"></span>
                        <span><img src="./css/images/profile-16.jpg"></span>
                        <span><img src="./css/images/profile-17.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>220 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>Lana Rose</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 130 comments</div>
                </div>

                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-15.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>Chris Brown</h3>
                            <small>New York, 1 HOUR AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-2.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-2.jpg"></span>
                        <span><img src="./css/images/profile-4.jpg"></span>
                        <span><img src="./css/images/profile-6.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>188 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>Chirs Brown</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 40 comments</div>
                </div>

                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-16.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>John Samron</h3>
                            <small>Amsterdam, 7 HOURS AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-3.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-3.jpg"></span>
                        <span><img src="./css/images/profile-5.jpg"></span>
                        <span><img src="./css/images/profile-7.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>130 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>John Samron</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 15 comments</div>
                </div>

                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-17.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>Kareena Joshua</h3>
                            <small>USA, 3 HOURS AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-4.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-8.jpg"></span>
                        <span><img src="./css/images/profile-10.jpg"></span>
                        <span><img src="./css/images/profile-12.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>280 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>Kareena Joshua</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 110 comments</div>
                </div>

                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-18.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>Dan Smith</h3>
                            <small>Paris, 1 DAY AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-5.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-9.jpg"></span>
                        <span><img src="./css/images/profile-11.jpg"></span>
                        <span><img src="./css/images/profile-13.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>420 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>Dan Smith</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 120 comments</div>
                </div>

                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-19.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>Karim Benzema</h3>
                            <small>Mumbai, 30 MINUTES AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-6.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-15.jpg"></span>
                        <span><img src="./css/images/profile-14.jpg"></span>
                        <span><img src="./css/images/profile-17.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>150 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>Karim Benzema</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 30 comments</div>
                </div>
                <div class="feed">
                    <div class="head">

                    </div>
                    <div class="user">
                        <div class="profile-pic">
                            <img src="./css/images/profile-20.jpg" alt="">
                        </div>
                        <div class="info">
                            <h3>Srishti Tirkey</h3>
                            <small>Bangalore, 11 HOURS AGO</small>
                        </div >
                        <SPAN class="edit"><i class="uil uil-ellipsis-h"></i></SPAN>
                    </div>

                    <div class="photo">
                        <img src="./css/images/feed-7.jpg" alt="">
                    </div>

                    <div class="action-button">
                        <div class="interaction-button">
                            <span><i class="uil uil-thumbs-up"></i></span>
                            <span><i class="uil uil-comment"></i></span>
                            <span><i class="uil uil-share"></i></span>
                        </div>
                        <div class="bookmark">
                            <span><i class="uil uil-bookmark"></i></span>
                        </div>
                    </div>

                    <div class="liked-by">
                        <span><img src="./css/images/profile-15.jpg"></span>
                        <span><img src="./css/images/profile-13.jpg"></span>
                        <span><img src="./css/images/profile-10.jpg"></span>
                        ,<p>Liked by <b>Enrest Achiever</b>snd <b>530 others</b></p>
                    </div>

                    <div class="caption">
                        <p><b>Srishti Tirkey</b>Lorem ipsum dolor storiesquiquam eius.
                            <span class="hash-tag">#lifestyle</span></p>
                    </div>
                    <div class="comments text-muted">View all 190 comments</div>
                </div>
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


</body>

</html>
<script>
    //sidebar
    const menuItems = document.querySelectorAll('.menu-item');
    const messagesNotification = document.querySelector('#messages-notifications');
    const messages = document.querySelector('.messages');
    const message = messages.querySelectorAll('.message');
    const messageSearch = document.querySelector('#message-search');

    //remove active class from all menu items
    const changeActiveItem = () => {
        menuItems.forEach(item => {
            item.classList.remove('active');
        })
    }


    menuItems.forEach(item => {
        item.addEventListener('click', () => {
            changeActiveItem();
            item.classList.add('active');

            if (item.id != 'notifications') {
                document.querySelector('.notifications-popup').style.display = 'none';
            } else {
                document.querySelector('.notifications-popup').style.display = 'block';
                document.querySelector('#notifications .notification-count').style.display='none';
            }
        })
    })


    const searchMessage = () => {
        const val = messageSearch.value.toLowerCase();
        message.forEach(chat => {
            let name=chat.querySelector('h5').textContent.toLowerCase();
            if(name.indexOf(val) != -1){
                chat.style.display = 'flex';
            } else{
                chat.style.display = 'none';
            }
        })
    }

    messageSearch.addEventListener('keyup', searchMessage);


    messagesNotification.addEventListener('click', () => {
        messages.style.boxShadow = '0 0 1rem var(--color-primary)';
        messagesNotification.querySelector('.notification-count').style.display = 'none';
        setTimeout(() => {
            messages.style.boxShadow = 'none';
        }, 2000);
    })
</script>
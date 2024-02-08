//sidebar
const menuItems = document.querySelectorAll('.menu-item');
const messagesNotification = document.querySelector('#messages-notifications');
const messages = document.querySelector('.messages');
const message = messages.querySelectorAll('.message');
const messageSearch = document.querySelector('#message-search');

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
});

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

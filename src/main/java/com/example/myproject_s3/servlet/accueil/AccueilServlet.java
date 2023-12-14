package com.example.myproject_s3.servlet.accueil;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.offre.OffreDao;
import com.example.myproject_s3.dao.offre.OffreDaoImp;
import com.example.myproject_s3.dao.photo.PhotoDao;
import com.example.myproject_s3.dao.photo.PhotoDaoImp;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import com.example.myproject_s3.entities.OffreEntity;
import com.example.myproject_s3.entities.PhotoEntity;
import com.example.myproject_s3.entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "AccueilServlet", value = "/AccueilServlet")
public class AccueilServlet extends HttpServlet {
    private UserDao userDao;
    private OffreDao offreDao;
    private PhotoDao photoDao;
    public void init() throws ServletException{
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);
        this.offreDao = new OffreDaoImp(daoFactory);
        this.photoDao = new PhotoDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Changer le type de Long à Integer
        Integer iduser = (Integer) session.getAttribute("sessionuser");

        UserEntity userEntity = userDao.getUserById(iduser);

        // Stocker la liste d'utilisateurs dans la portée de la requête
        request.setAttribute("user", userEntity);

        List<OffreEntity> offres = offreDao.getAllOffres();
        Map<Integer, UserEntity> usersMap = new HashMap<>();

        // Récupérer les photos associées à chaque offre
        Map<Integer, String> photosMap = new HashMap<>();
        for (OffreEntity offre : offres) {
            UserEntity userOffreEntity = userDao.getUserByIdOffre(offre.getIdOffre());
            usersMap.put(offre.getIdOffre(), userOffreEntity);

            List<PhotoEntity> photos = photoDao.getPhotosByOffreId(offre.getIdOffre());
            if (!photos.isEmpty()) {
                // Supposons que vous prenez la première photo associée à chaque offre
                // Supposons que vous prenez la première photo associée à chaque offre
                photosMap.put(offre.getIdOffre(), photos.get(0).getBase64EncodedContent());            }
        }

        // Stocker les données dans la portée de la requête
        request.setAttribute("offres", offres);
        request.setAttribute("photosMap", photosMap);
        request.setAttribute("usersMap", usersMap);
        System.out.println(usersMap);


        request.getRequestDispatcher("accueil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
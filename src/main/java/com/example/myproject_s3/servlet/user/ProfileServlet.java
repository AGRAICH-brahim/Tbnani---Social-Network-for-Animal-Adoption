package com.example.myproject_s3.servlet.user;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.animal.AnimalDao;
import com.example.myproject_s3.dao.animal.AnimalDaoImp;
import com.example.myproject_s3.dao.offre.OffreDao;
import com.example.myproject_s3.dao.offre.OffreDaoImp;
import com.example.myproject_s3.dao.photo.PhotoDao;
import com.example.myproject_s3.dao.photo.PhotoDaoImp;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import com.example.myproject_s3.entities.AnimalEntity;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private UserDao userDao;
    private OffreDao offreDao;
    private PhotoDao photoDao;
    private AnimalDao animalDao;
    public void init() throws ServletException{
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);
        this.offreDao = new OffreDaoImp(daoFactory);
        this.photoDao = new PhotoDaoImp(daoFactory);
        this.animalDao = new AnimalDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        Integer iduser = (Integer) session.getAttribute("sessionuser");

        if (iduser != null) {
            UserEntity userEntity = userDao.getUserById(iduser);
            request.setAttribute("userEntity", userEntity);

            List<OffreEntity> offres = offreDao.getOffresByIdUser(iduser);

            Map<Integer, String> photosMap = new HashMap<>();

            Map<Integer, AnimalEntity> animalsForOffresMap = new HashMap<>(); // Correction ici

            for (OffreEntity offre : offres) {
                List<PhotoEntity> photos = photoDao.getPhotosByOffreId(offre.getIdOffre());

                if (!photos.isEmpty()) {
                    photosMap.put(offre.getIdOffre(), photos.get(0).getBase64EncodedContent());
                }
                AnimalEntity animalsForOffre = animalDao.getAnimalById(offre.getIdAnimal());
                animalsForOffresMap.put(offre.getIdOffre(), animalsForOffre); // Utiliser l'ID de l'offre comme clé
            }

            UserEntity sessionUser = (UserEntity) session.getAttribute("infoUser");
            request.setAttribute("infoUser", sessionUser);
            request.setAttribute("offres", offres);
            request.setAttribute("animalsForOffreMap", animalsForOffresMap);
            request.setAttribute("photosMap", photosMap);
        }

        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
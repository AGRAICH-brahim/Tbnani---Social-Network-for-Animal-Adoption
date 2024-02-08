package com.example.myproject_s3.servlet.visitprofileuser;

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


@WebServlet(name = "VisiteProfileServlet", value = "/VisiteProfileServlet")
public class VisitProfileServlet extends HttpServlet {
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer iduser = Integer.valueOf(request.getParameter("idUserToShow"));

        if (iduser != null) {
            UserEntity userEntity = userDao.getUserById(iduser);
            request.setAttribute("userEntity", userEntity);

            List<OffreEntity> offres = offreDao.getOffresByIdUser(iduser);

            Map<Integer, String> photosMap = new HashMap<>();
            for (OffreEntity offre : offres) {
                List<PhotoEntity> photos = photoDao.getPhotosByOffreId(offre.getIdOffre());

                if (!photos.isEmpty()) {
                    photosMap.put(offre.getIdOffre(), photos.get(0).getBase64EncodedContent());
                }
             System.out.println(offre.getIdOffre());

            }
            HttpSession session = request.getSession();
            UserEntity sessionUser = (UserEntity) session.getAttribute("infoUser");
            request.setAttribute("infoUser", sessionUser);

            request.setAttribute("offres", offres);
            request.setAttribute("photosMap", photosMap);
        }

        request.getRequestDispatcher("showprofile.jsp").forward(request, response);

    }
}
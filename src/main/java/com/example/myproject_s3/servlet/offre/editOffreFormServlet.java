package com.example.myproject_s3.servlet.offre;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.animal.AnimalDao;
import com.example.myproject_s3.dao.animal.AnimalDaoImp;
import com.example.myproject_s3.dao.offre.OffreDao;
import com.example.myproject_s3.dao.offre.OffreDaoImp;
import com.example.myproject_s3.dao.photo.PhotoDao;
import com.example.myproject_s3.dao.photo.PhotoDaoImp;
import com.example.myproject_s3.entities.AnimalEntity;
import com.example.myproject_s3.entities.OffreEntity;
import com.example.myproject_s3.entities.PhotoEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "editOffreFormServlet", value = "/editOffreFormServlet")
public class editOffreFormServlet extends HttpServlet {
    private OffreDao offreDao;
    private AnimalDao animalDao;
    private PhotoDao photoDao;

    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.offreDao = new OffreDaoImp(daoFactory);
        this.animalDao = new AnimalDaoImp(daoFactory);
        this.photoDao = new PhotoDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("./post/editerOffre.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idoffre = request.getParameter("idoffre");
        String idanimal = request.getParameter("idanimal");

        AnimalEntity animal = animalDao.getAnimalById(Integer.parseInt(idanimal));
        OffreEntity offre = offreDao.getOffreById(Integer.parseInt(idoffre));
        PhotoEntity photo = photoDao.getPhotoById(Integer.parseInt(idoffre));

        request.setAttribute("animal", animal);
        request.setAttribute("offre", offre);
        request.setAttribute("photo", photo);

        request.getRequestDispatcher("./post/editerOffre.jsp").forward(request, response);

    }
}
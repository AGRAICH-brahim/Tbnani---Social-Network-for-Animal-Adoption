package com.example.myproject_s3.servlet.offre;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.animal.AnimalDao;
import com.example.myproject_s3.dao.animal.AnimalDaoImp;
import com.example.myproject_s3.dao.commentaire.CommentaireDao;
import com.example.myproject_s3.dao.commentaire.CommentaireDaoImp;
import com.example.myproject_s3.dao.offre.OffreDao;
import com.example.myproject_s3.dao.offre.OffreDaoImp;
import com.example.myproject_s3.dao.photo.PhotoDao;
import com.example.myproject_s3.dao.photo.PhotoDaoImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "DeleteOffreServlet", value = "/DeleteOffreServlet")
public class DeleteOffreServlet extends HttpServlet {
    private OffreDao offreDao;
    private AnimalDao animalDao;
    private PhotoDao photoDao;
    private CommentaireDao commentaireDao;
    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.offreDao = new OffreDaoImp(daoFactory);
        this.animalDao = new AnimalDaoImp(daoFactory);
        this.photoDao = new PhotoDaoImp(daoFactory);
        this.commentaireDao = new CommentaireDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idOffre = Integer.parseInt(request.getParameter("idoffre"));
        int idAnimal = Integer.parseInt(request.getParameter("idanimal"));

        commentaireDao.deleteByIdOffre(idOffre);
        photoDao.deletePhoto(idOffre);
        offreDao.deleteOffre(idOffre);
        animalDao.deleteAnimal(idAnimal);

        response.sendRedirect("http://localhost:8081/profile");

    }
}
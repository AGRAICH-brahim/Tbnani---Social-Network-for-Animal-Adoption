package com.example.myproject_s3.servlet.commentaire;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.commentaire.CommentaireDao;
import com.example.myproject_s3.dao.commentaire.CommentaireDaoImp;
import com.example.myproject_s3.entities.CommentaireEntity;
import com.example.myproject_s3.entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "addCommentaireServlet", value = "/addCommentaireServlet")
public class addCommentaireServlet extends HttpServlet {
    private CommentaireDao commentaireDao;

    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.commentaireDao = new CommentaireDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Integer iduser = (Integer) session.getAttribute("sessionuser");
        try {
            // Récupérer les paramètres du formulaire
            String offreid = request.getParameter("offreid");
            String content = request.getParameter("commentaire_saisie");

            // Créer un objet CommentaireEntity avec les données du formulaire
            CommentaireEntity newCommentaire = new CommentaireEntity();
            newCommentaire.setId_user(iduser);
            newCommentaire.setId_offre(Integer.parseInt(offreid));
            newCommentaire.setContent(content);
            newCommentaire.setDatetime(new java.sql.Timestamp(System.currentTimeMillis()));

            commentaireDao.create(newCommentaire);

            response.sendRedirect("http://localhost:8081/accueil");

        } catch (Exception e) {
            // En cas d'erreur, envoyez une réponse JSON indiquant l'échec
            System.out.println("error adding comment gggggggggg");
            response.sendRedirect("http://localhost:8081/accueil");

        }
    }

}
package com.example.myproject_s3.servlet.user;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import com.example.myproject_s3.entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;


@MultipartConfig(maxFileSize = 1617721500) // Taille maximale de la photo (en octets)
@WebServlet(name = "UpdateImageServlet", value = "/UpdateImage")
public class UpdateImageServlet extends HttpServlet {
    private UserDao userDao;

    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();

            UserEntity infoUser = (UserEntity) session.getAttribute("infoUser");

            // Récupérer le fichier image
            Part imagePart = request.getPart("image");
            InputStream imageInputStream = imagePart.getInputStream();
            // Créer un objet BlogEntity avec les données du formulaire
            UserEntity newImage = new UserEntity();

            // Convertir l'InputStream de l'image en tableau d'octets (byte[])
            byte[] imageBytes = imageInputStream.readAllBytes();
            newImage.setImage(imageBytes);
            newImage.setIdUser(infoUser.getIdUser());

            userDao.updateImageUser(newImage);
            System.out.println("gooooooooooooooooooooooood upload");
            // Rediriger vers une page de confirmation ou autre
            response.sendRedirect("http://localhost:8081/profile");
        } catch (Exception e) {
            // Gérer les erreurs
            e.printStackTrace();
            System.out.println("taille de l'image   nooooooooooooooooooooooooooooooooooooooo");

            response.sendRedirect("http://localhost:8081/profile");
        }

    }
}
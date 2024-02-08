package com.example.myproject_s3.servlet.usersetting;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import com.example.myproject_s3.entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "EditInfoServelt", value = "/EditInfoServelt")
public class EditInfoServelt extends HttpServlet {
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

        UserEntity userEntity = new UserEntity();

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateNaissance = request.getParameter("datedenaissance");
        String adresse = request.getParameter("address");
        String iduser = request.getParameter("iduser");

        // Assurez-vous de mettre les valeurs dans l'objet UserEntity
        userEntity.setNom(nom);
        userEntity.setPrenom(prenom);

        // Convertir la date de naissance en java.sql.Date
        if (dateNaissance != null && !dateNaissance.isEmpty()) {
            java.sql.Date sqlDate = java.sql.Date.valueOf(dateNaissance);
            userEntity.setDateNaissance(sqlDate);
        }

        userEntity.setAdresse(adresse);
        userEntity.setIdUser(Integer.parseInt(iduser));

        // Mettre à jour les informations de l'utilisateur
        userDao.updateInfo(userEntity);

        response.sendRedirect("http://localhost:8081/UserSetting");
    }
}
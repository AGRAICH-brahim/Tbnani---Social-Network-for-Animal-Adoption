package com.example.myproject_s3.servlet.user;

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
import java.sql.Date;


@WebServlet(name = "AddUserServlet", value = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=request.getServletPath();
        if (path.equals("/signup")) {
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String dateNaissanceStr = request.getParameter("datedenaissance");
        // Convertir la date de naissance en java.sql.Date
        Date dateNaissance = Date.valueOf(dateNaissanceStr);
        String ageStr = request.getParameter("age");
        // Convertir l'âge en Integer
        Integer age = Integer.parseInt(ageStr);
        String sex = request.getParameter("sex");
        String telephone = request.getParameter("tel");
        String adresse = request.getParameter("adresse");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String dateTimeStr = request.getParameter("dateTime");
        String typeUser = request.getParameter("type");

        // Créer un objet UserEntity avec les données du formulaire
        UserEntity userEntity = new UserEntity();
        userEntity.setNom(nom);
        userEntity.setPrenom(prenom);
        userEntity.setEmail(email);
        userEntity.setDateNaissance(Date.valueOf(dateNaissanceStr));
        userEntity.setSex(sex);
        userEntity.setAge(age);
        userEntity.setTelephone(telephone);
        userEntity.setAdresse(adresse);
        userEntity.setUsername(username);
        userEntity.setPassword(password);
        userEntity.setDateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        userEntity.setTypeUser(typeUser);

        // Ajouter l'utilisateur à la base de données
        UserDao userDAO = new UserDaoImp(DAOFactory.getInstance()); // Remplacez DAOFactory.getInstance() par votre méthode pour obtenir une instance de DAOFactory
        userDAO.addUser(userEntity);

        // Rediriger vers une page de confirmation ou autre
        response.sendRedirect("index.jsp");

    }
}
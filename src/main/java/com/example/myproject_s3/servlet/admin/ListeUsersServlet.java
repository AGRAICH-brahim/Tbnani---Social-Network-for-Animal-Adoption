package com.example.myproject_s3.servlet.admin;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import com.example.myproject_s3.entities.UserEntity;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "ListUsersServlet", value = "/ListUsersServlet")
public class ListeUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDaoImp(DAOFactory.getInstance());
        ArrayList<UserEntity> users = userDao.getAllUsers();

        // Stocker la liste d'utilisateurs dans la portée de la requête
        request.setAttribute("users", users);

        RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/listeusers.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
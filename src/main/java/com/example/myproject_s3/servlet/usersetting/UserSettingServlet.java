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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "UserSettingServlet", value = "/UserSettingServlet")
public class UserSettingServlet extends HttpServlet {
    private UserDao userDao;
    public void init() throws ServletException{
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Changer le type de Long à Integer
        Integer iduser = (Integer) session.getAttribute("sessionuser");

        UserEntity userEntity = userDao.getUserById(iduser);

        // Stocker la liste d'utilisateurs dans la portée de la requête
        request.setAttribute("user", userEntity);




        request.getRequestDispatcher("setting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
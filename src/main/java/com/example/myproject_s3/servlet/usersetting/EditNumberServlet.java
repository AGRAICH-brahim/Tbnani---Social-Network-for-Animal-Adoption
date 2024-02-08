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


@WebServlet(name = "EditNumberServlet", value = "/EditNumberServlet")
public class EditNumberServlet extends HttpServlet {
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

        String telephone = request.getParameter("telephone");
        String iduser = request.getParameter("iduser");

        userEntity.setTelephone(telephone);
        userEntity.setIdUser(Integer.parseInt(iduser));

        userDao.updateContact(userEntity);

        response.sendRedirect("http://localhost:8081/UserSetting");

    }
}
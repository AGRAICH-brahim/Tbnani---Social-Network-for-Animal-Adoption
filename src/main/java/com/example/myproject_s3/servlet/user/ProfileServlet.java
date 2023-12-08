package com.example.myproject_s3.servlet.user;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private UserDao userDao;
    public void init() throws ServletException{
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=request.getServletPath();

        if (path.equals("/profile")) {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
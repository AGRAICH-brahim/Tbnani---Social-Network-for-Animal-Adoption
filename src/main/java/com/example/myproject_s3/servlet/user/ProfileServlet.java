package com.example.myproject_s3.servlet.user;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.offre.OffreDao;
import com.example.myproject_s3.dao.offre.OffreDaoImp;
import com.example.myproject_s3.dao.photo.PhotoDao;
import com.example.myproject_s3.dao.photo.PhotoDaoImp;
import com.example.myproject_s3.dao.user.UserDao;
import com.example.myproject_s3.dao.user.UserDaoImp;
import com.example.myproject_s3.entities.OffreEntity;
import com.example.myproject_s3.entities.PhotoEntity;
import com.example.myproject_s3.entities.UserEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "ProfileServlet", value = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private UserDao userDao;
    private OffreDao offreDao;
    private PhotoDao photoDao;
    public void init() throws ServletException{
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.userDao = new UserDaoImp(daoFactory);
        this.offreDao = new OffreDaoImp(daoFactory);
        this.photoDao = new PhotoDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();

        // Changer le type de Long à Integer
        Integer iduser = (Integer) session.getAttribute("sessionuser");

        UserEntity userEntity = userDao.getUserById(iduser);

        // Stocker la liste d'utilisateurs dans la portée de la requête
        request.setAttribute("userEntity", userEntity);


        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
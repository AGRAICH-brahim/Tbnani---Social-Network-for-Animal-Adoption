package com.example.myproject_s3.servlet.login;

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
import java.sql.SQLException;


@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=request.getServletPath();

        if (path.equals("/login")) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserEntity userEntity = null;
        UserDao userDAO = new UserDaoImp(DAOFactory.getInstance()); // Remplacez DAOFactory.getInstance() par votre méthode pour obtenir une instance de DAOFactory

        try {
            userEntity = userDAO.isValidUser(email, password);
        } catch (SQLException e) {

            e.printStackTrace();
        }
        if(userEntity != null){

            session.setAttribute("sessionuser",userEntity.getIdUser());

            //Vérifiez si est un médecin ou patient et dirige chacun vers sa espace
            String  accountType = userEntity.getTypeUser() ;
            if(accountType.equals("utilisateur")){
                request.setAttribute("user",userEntity);
                response.sendRedirect("http://localhost:8081/accueil");
            } else if(accountType.equals("admin")) {
                response.sendRedirect("http://localhost:8081/dashboard");

                //this.getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
            }
        } else {
            String message = "Email et/ou Mot de passe incorrect(s)";
            request.setAttribute("message", message);
            doGet(request, response);
        }

    }
}
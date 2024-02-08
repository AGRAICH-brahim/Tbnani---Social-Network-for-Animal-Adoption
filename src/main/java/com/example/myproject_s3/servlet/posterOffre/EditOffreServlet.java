package com.example.myproject_s3.servlet.posterOffre;

import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.dao.animal.AnimalDao;
import com.example.myproject_s3.dao.animal.AnimalDaoImp;
import com.example.myproject_s3.dao.offre.OffreDao;
import com.example.myproject_s3.dao.offre.OffreDaoImp;
import com.example.myproject_s3.dao.photo.PhotoDao;
import com.example.myproject_s3.dao.photo.PhotoDaoImp;
import com.example.myproject_s3.entities.AnimalEntity;
import com.example.myproject_s3.entities.OffreEntity;
import com.example.myproject_s3.entities.PhotoEntity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet(name = "EditOffreServlet", value = "/EditOffreServlet")
@MultipartConfig
public class EditOffreServlet extends HttpServlet {
    private OffreDao offreDao;
    private AnimalDao animalDao;
    private PhotoDao photoDao;

    public void init() throws ServletException {
        DAOFactory daoFactory = DAOFactory.getInstance();
        this.offreDao = new OffreDaoImp(daoFactory);
        this.animalDao = new AnimalDaoImp(daoFactory);
        this.photoDao = new PhotoDaoImp(daoFactory);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Connection connection = null; // Déclarer la variable connection ici

        // Changer le type de Long à Integer
        Integer iduser = (Integer) session.getAttribute("sessionuser");

        AnimalEntity animalEntity = new AnimalEntity();
        OffreEntity offreEntity = new OffreEntity();
        PhotoEntity photoEntity = new PhotoEntity();
        DAOFactory daoFactory = null;
        try {
            // Démarrer la transaction
            daoFactory = DAOFactory.getInstance();
            connection = daoFactory.getConnection();
            connection.setAutoCommit(false);


            // Créer un objet UserEntity avec les données du formulaire
            offreEntity.setDescription(request.getParameter("description"));
            offreEntity.setDateTime(new java.sql.Timestamp(System.currentTimeMillis()));
            // Vérifier si les paramètres idoffre et idanimal ne sont pas nuls avant de les convertir
            String idOffreParam = request.getParameter("idoffre");
            String idAnimalParam = request.getParameter("idanimal");

            if (idOffreParam != null && idAnimalParam != null) {
                offreEntity.setIdOffre(Integer.parseInt(idOffreParam));
                animalEntity.setIdAnimal(Integer.parseInt(idAnimalParam));
            } else {
                // Gérer le cas où l'un ou les deux paramètres sont nuls
                // Vous pouvez choisir une valeur par défaut ou gérer différemment selon vos besoins
            }

            animalEntity.setCategorie(request.getParameter("categorieAnimal"));
            animalEntity.setSexe(request.getParameter("sexeAnimal"));
            String ageAnimalParam = request.getParameter("ageAnimal");
            if (ageAnimalParam != null && !ageAnimalParam.isEmpty()) {
                animalEntity.setAge(Integer.parseInt(ageAnimalParam));
            } else {
                // Gérer le cas où ageAnimalParam est nul ou vide
                animalEntity.setAge(1); // Valeur par défaut ou toute autre valeur par défaut que vous souhaitez
            }
            animalEntity.setRace(request.getParameter("raceAnimal"));
            animalEntity.setEtatDeSante(request.getParameter("etatDeSanteAnimal"));
            animalEntity.setDescription(request.getParameter("descriptionAnimal"));
            animalEntity.setNomAnimal(request.getParameter("nomAnimal"));
            animalEntity.setAddress(request.getParameter("addressAnimal"));

            // Récupérer l'image depuis la requête (vérifier si elle n'est pas nulle)
            Part imagePart = request.getPart("image");
            // Enregistrer l'animal
            offreDao.updateOffre(offreEntity);
            animalDao.updateAnimal(animalEntity);

            if (imagePart != null) {
                // Enregistrer l'image
                InputStream imageInputStream = imagePart.getInputStream();
                byte[] imageBytes = imageInputStream.readAllBytes();
                if (imageBytes != null && imageBytes.length > 0) {
                    PhotoEntity photo = new PhotoEntity();
                    photo.setPhotoContent(imageBytes);
                    photo.setIdOffre(Integer.parseInt(request.getParameter("idoffre")));

                    // Mettre à jour la photo uniquement si le tableau d'octets n'est pas vide
                    photoDao.updatePhoto(photo);
                }
                // Commit de la transaction
            }
            connection.commit();
        } catch (SQLException | IOException e) {
            // Gérer les exceptions (rollback)
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace(); // Gérer l'erreur de rollback
                }
            }
            e.printStackTrace(); // Gérer l'erreur principale
        } finally {
            // Remettre la configuration par défaut (auto-commit) et fermer la connexion
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace(); // Gérer l'erreur
                }
            }
        }
        response.sendRedirect("http://localhost:8081/profile");

    }
}
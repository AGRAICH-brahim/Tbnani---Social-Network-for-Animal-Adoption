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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;


@WebServlet(name = "addPostServlet", value = "/addPostServlet")
public class addPostServlet extends HttpServlet {
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
        String path=request.getServletPath();
        if (path.equals("/posterOffre")) {
            request.getRequestDispatcher("./post/posterOffre.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

// Changer le type de Long à Integer
        Integer iduser = (Integer) session.getAttribute("sessionuser");

        AnimalEntity animalEntity = new AnimalEntity();
        OffreEntity offreEntity = new OffreEntity();
        PhotoEntity photoEntity = new PhotoEntity();

// Créer un objet UserEntity avec les données du formulaire
        offreEntity.setDescription(request.getParameter("description"));
        offreEntity.setDateTime(new java.sql.Timestamp(System.currentTimeMillis()));
        offreEntity.setIdProprietaire(iduser);

        animalEntity.setCategorie(request.getParameter("categorieAnimal"));
        animalEntity.setSexe(request.getParameter("sexeAnimal"));
        String ageAnimalParam = request.getParameter("ageAnimal");
        if (ageAnimalParam != null && !ageAnimalParam.isEmpty()) {
            animalEntity.setAge(Integer.parseInt(ageAnimalParam));
        } else {
            // Gérer le cas où ageAnimalParam est nul ou vide
            animalEntity.setAge(Integer.parseInt("1"));

        }        animalEntity.setRace(request.getParameter("raceAnimal"));
        animalEntity.setEtatDeSante(request.getParameter("etatDeSanteAnimal"));
        animalEntity.setDescription(request.getParameter("descriptionAnimal"));
        animalEntity.setNomAnimal(request.getParameter("nomAnimal"));
        animalEntity.setAddress(request.getParameter("addressAnimal"));

// Récupérer l'image depuis la requête (vérifier si elle n'est pas nulle)
        Part imagePart = request.getPart("image");
        if (imagePart != null) {

            // Enregistrer l'animal
            Long idAnimal = animalDao.addAnimal(animalEntity);

            // Enregistrer l'offre
            offreEntity.setIdAnimal(Math.toIntExact(idAnimal));
            Long idOffre = offreDao.addOffre(offreEntity);

            // Enregistrer l'image
            InputStream imageInputStream = imagePart.getInputStream();
            byte[] imageBytes = imageInputStream.readAllBytes();

            PhotoEntity photo = new PhotoEntity();
            photo.setIdAnimal(Math.toIntExact(idAnimal));
            photo.setIdOffre(Math.toIntExact(idOffre));
            photo.setPhotoContent(imageBytes);  // Suppose que votre champ namePhoto dans PhotoEntity est de type Blob
            photoDao.addPhoto(photo);
        }
        response.sendRedirect("http://localhost:8081/accueil");

    }
}
package com.example.myproject_s3.dao.photo;

import com.example.myproject_s3.dao.DAOException;
import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.entities.PhotoEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class PhotoDaoImp implements PhotoDao{
    private DAOFactory daoFactory;

    public PhotoDaoImp(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    private PhotoEntity map(ResultSet resultSet) throws SQLException {
        PhotoEntity photoEntity = new PhotoEntity();
        photoEntity.setIdPhoto(resultSet.getInt("id_photo"));
        photoEntity.setIdAnimal(resultSet.getInt("id_animal"));
        photoEntity.setIdOffre(resultSet.getInt("id_offre"));
        photoEntity.setPhotoContent(resultSet.getBytes("file"));
        return photoEntity;
    }
    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }

    @Override
    public void addPhoto(PhotoEntity photo) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "INSERT INTO photo (id_animal, id_offre, file) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, photo.getIdAnimal());
            preparedStatement.setInt(2, photo.getIdOffre());
            preparedStatement.setBytes(3, photo.getPhotoContent());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Error adding photo to the database", e);
        } finally {
            ResultSet resultSet = null;
            closeResources(resultSet, preparedStatement, connection);
        }
    }


    @Override
    public PhotoEntity getPhotoById(int photoId) {
        return null;
    }

    @Override
    public List<PhotoEntity> getPhotosByOffreId(int offreId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<PhotoEntity> photos = new ArrayList<>();

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM photo WHERE id_offre = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, offreId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                PhotoEntity photoEntity = map(resultSet);
                photos.add(photoEntity);
            }
        } catch (SQLException e) {
            throw new DAOException("Error getting photos by offreId from the database", e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return photos;
    }

    public class Util {
        public static String bytesToBase64(byte[] bytes) {
            return Base64.getEncoder().encodeToString(bytes);
        }
    }
    @Override
    public List<PhotoEntity> getAllPhotos() {
        return null;
    }

    @Override
    public void updatePhoto(PhotoEntity photo) {

    }

    @Override
    public void deletePhoto(int photoId) {

    }

    // Méthode utilitaire pour fermer les ressources JDBC
    private void closeResources(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Gérer les exceptions liées à la fermeture des ressources
        }
    }

}

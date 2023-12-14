package com.example.myproject_s3.dao.offre;

import com.example.myproject_s3.dao.DAOException;
import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.entities.OffreEntity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OffreDaoImp implements OffreDao{
    private DAOFactory daoFactory;

    public OffreDaoImp(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }
    private static OffreEntity map(ResultSet resultSet) throws SQLException {
        OffreEntity offre = new OffreEntity();
        offre.setIdOffre(resultSet.getInt("id_offre"));
        offre.setIdProprietaire(resultSet.getInt("id_proprietaire"));
        offre.setIdAnimal(resultSet.getInt("id_animal"));
        offre.setDescription(resultSet.getString("description"));
        offre.setDateTime(resultSet.getTimestamp("timestamp"));

        return offre;
    }
    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }
    @Override
    public Long addOffre(OffreEntity offre) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generatedKeys = null;

        try {
            connection = daoFactory.getConnection();

            String sql = "INSERT INTO offre (id_proprietaire, id_animal, description, timestamp) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setInt(1, offre.getIdProprietaire());
            preparedStatement.setLong(2, offre.getIdAnimal());
            preparedStatement.setString(3, offre.getDescription());
            preparedStatement.setTimestamp(4, offre.getDateTime());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new DAOException("L'ajout de l'offre a échoué, aucune ligne affectée.");
            }

            generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getLong(1);  // Retourner l'ID généré de l'offre
            } else {
                throw new DAOException("L'ajout de l'offre a échoué, aucun ID généré obtenu.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(generatedKeys, preparedStatement, connection);
        }
    }

    private static final String SQL_SELECT_OFFRE_BY_ID = "SELECT * FROM offre WHERE id_offre = ?";

    @Override
    public OffreEntity getOffreById(Long offreId) {


            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            OffreEntity offreEntity = null;

            try {
                connection = daoFactory.getConnection();
                preparedStatement = initRequestPrepare(connection, SQL_SELECT_OFFRE_BY_ID, offreId);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    offreEntity = map(resultSet);
                }
            } catch (SQLException e) {
                throw new DAOException("Error getting offre by ID: " + offreId, e);
            } finally {
                closeResources(resultSet, preparedStatement, connection);
            }

            return offreEntity;
    }

    public List<OffreEntity> getOffresByIdUser(Integer offreId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<OffreEntity> offresuser = new ArrayList<>();

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM offre where id_proprietaire = ?";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                OffreEntity offre = map(resultSet);  // Utilisez votre méthode de mappage
                offresuser.add(offre);
            }
        } catch (SQLException e) {
            throw new DAOException("Error retrieving all offres from the database", e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return offresuser;
    }

    @Override
    public List<OffreEntity> getAllOffres() {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<OffreEntity> offres = new ArrayList<>();

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM offre order by timestamp desc ";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                OffreEntity offre = map(resultSet);  // Utilisez votre méthode de mappage
                offres.add(offre);
            }
        } catch (SQLException e) {
            throw new DAOException("Error retrieving all offres from the database", e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return offres;
    }

    @Override
    public void updateOffre(OffreEntity offre) {

    }

    @Override
    public void deleteOffre(Long offreId) {

    }

    // Méthode utilitaire pour fermer les ressources JDBC
    private void closeResources(ResultSet generatedKeys, PreparedStatement preparedStatement, Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        }
    }
}

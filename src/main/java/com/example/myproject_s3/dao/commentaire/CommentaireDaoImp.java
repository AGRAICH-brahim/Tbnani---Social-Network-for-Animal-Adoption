package com.example.myproject_s3.dao.commentaire;

import com.example.myproject_s3.dao.DAOException;
import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.entities.CommentaireEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentaireDaoImp implements CommentaireDao {
    private DAOFactory daoFactory;

    public CommentaireDaoImp(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    public static CommentaireEntity map(ResultSet resultSet) throws SQLException {
        CommentaireEntity commentaire = new CommentaireEntity();
        commentaire.setId(resultSet.getInt("id"));
        commentaire.setId_user(resultSet.getInt("id_user"));
        commentaire.setId_offre(resultSet.getInt("id_offre"));
        commentaire.setContent(resultSet.getString("content"));
        commentaire.setDatetime(resultSet.getTimestamp("timestamp"));

        // Nouvelle propriété pour le nom de l'utilisateur
        commentaire.setUserName(resultSet.getString("user_name"));
        commentaire.setUserPrenom(resultSet.getString("user_prenom"));

        return commentaire;
    }


    public static PreparedStatement initRequestPrepare(Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }

    @Override
    public void create(CommentaireEntity commentaire) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "INSERT INTO commentaire (id_user, id_offre, content, timestamp) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, commentaire.getId_user());
            preparedStatement.setInt(2, commentaire.getId_offre());
            preparedStatement.setString(3, commentaire.getContent());
            preparedStatement.setTimestamp(4, commentaire.getDatetime());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Error adding data to the database", e);
        } finally {
            closeResources(null, preparedStatement, connection);
        }
    }
    public boolean isDuplicateComment(int userId, int offreId, String content) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT COUNT(*) FROM commentaire WHERE id_user = ? AND id_offre = ? AND content = ?";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, offreId);
            preparedStatement.setString(3, content);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
            return false;
        } catch (SQLException e) {
            throw new DAOException("Error checking for duplicate comment", e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }
    }

    @Override
    public List<CommentaireEntity> getAllCommentsByOffreId(int offreId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        List<CommentaireEntity> commentaires = new ArrayList<>();

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT c.*, u.nom AS user_name , u.prenom AS user_prenom FROM commentaire c " +
                    "JOIN user u ON c.id_user = u.id_user " +
                    "WHERE id_offre=?";
            preparedStatement = initRequestPrepare(connection, sql, offreId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                CommentaireEntity commentaire = map(resultSet);
                commentaire.setUserName(resultSet.getString("user_name"));
                commentaires.add(commentaire);
            }
        } catch (SQLException e) {
            throw new DAOException("Error fetching data from the database", e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return commentaires;
    }

    @Override
    public void update(CommentaireEntity commentaire) {

    }

    @Override
    public void delete(int id) {

    }
    @Override
    public void deleteByIdOffre(int idOffre) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = this.daoFactory.getConnection();
            String sql = "DELETE FROM commentaire WHERE id_offre = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, idOffre);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Erreur lors de la suppression des commentaires liés à l'offre avec l'ID : " + idOffre, e);
        } finally {
            // Fermez les ressources (PreparedStatement, Connection) dans le bloc finally
            // pour vous assurer qu'elles sont correctement fermées, même en cas d'exception.
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Gérer l'erreur de fermeture
            }
        }
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

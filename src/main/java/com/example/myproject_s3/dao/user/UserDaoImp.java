package com.example.myproject_s3.dao.user;

import com.example.myproject_s3.dao.DAOException;
import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.entities.UserEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDaoImp implements UserDao {

    private DAOFactory daoFactory;

    public UserDaoImp(DAOFactory daoFactory) {

        this.daoFactory = daoFactory;
    }
    private static UserEntity map( ResultSet resultSet ) throws SQLException {
        UserEntity userEntity = new UserEntity();

        userEntity.setIdUser(resultSet.getInt("id_user"));
        userEntity.setNom(resultSet.getString("nom"));
        userEntity.setPrenom(resultSet.getString("prenom"));
        userEntity.setEmail(resultSet.getString("email"));
        userEntity.setDateNaissance(resultSet.getDate("date_naissance"));
        userEntity.setSex(resultSet.getString("sex"));
        userEntity.setTelephone(resultSet.getString("telephone"));
        userEntity.setAdresse(resultSet.getString("adresse"));
        userEntity.setPassword(resultSet.getString("password"));
        userEntity.setDateTime(resultSet.getTimestamp("date_time"));
        userEntity.setTypeUser(resultSet.getString("type_user"));
        userEntity.setImage(resultSet.getBytes("image"));


        //System.out.println(userEntity);
        return userEntity;
    }

    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }

    @Override
    public void addUser(UserEntity user) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Récupérer une connexion depuis la DAOFactory
            connection = daoFactory.getConnection();

            // Requête SQL d'insertion
            String sql = "INSERT INTO user (nom, prenom, email, date_naissance, sex, telephone, adresse, password, date_time, type_user) " + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Préparer la requête avec les valeurs de l'utilisateur
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getNom());
            preparedStatement.setString(2, user.getPrenom());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setDate(4, user.getDateNaissance());
            preparedStatement.setString(5, user.getSex());
            preparedStatement.setString(6, user.getTelephone());
            preparedStatement.setString(7, user.getAdresse());
            preparedStatement.setString(8, user.getPassword());
            preparedStatement.setTimestamp(9, user.getDateTime());
            preparedStatement.setString(10,user.getTypeUser());

            // Exécuter la requête
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            // Gérer les exceptions liées à la base de données
            e.printStackTrace(); // Vous pouvez remplacer cela par une gestion plus appropriée des exceptions
        } finally {
            // Fermer les ressources
            ResultSet resultSet = null;
            closeResources(preparedStatement, connection);
        }
    }

    // Méthode utilitaire pour fermer les ressources JDBC
    private void closeResources(PreparedStatement preparedStatement, Connection connection) {
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

    private static final String SQL_SELECT_PAR_ID = "SELECT * FROM user where id_user = ? ";
    @Override
    public UserEntity getUserById(int userId) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        UserEntity userEntity = null;

        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initRequestPrepare( connexion, SQL_SELECT_PAR_ID , userId);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            if (resultSet.next()) {
                userEntity = map(resultSet);
                System.out.println(resultSet.getString("nom"));
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        }
        return userEntity;
    }

    @Override
    public ArrayList<UserEntity> getAllUsers() {
        final String SQL_SELECT = "SELECT * FROM user";
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        UserEntity userEntity = null;

        ArrayList<UserEntity> users = new ArrayList<UserEntity>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = daoFactory.getConnection();
            preparedStatement = initRequestPrepare( connexion, SQL_SELECT);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            while ( resultSet.next() ) {

                userEntity = map( resultSet );
                System.out.println(resultSet.getString("nom"));
                users.add(userEntity);
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        }
        return users;
    }

    @Override
    public void updateUser(UserEntity user) {

    }

    @Override
    public void updateImageUser(UserEntity user) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "UPDATE user SET image=? WHERE id_user=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBytes(1, user.getImage());
            preparedStatement.setInt(2, user.getIdUser());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Error adding data to the database", e);
        } finally {
            ResultSet resultSet = null;
            closeResources(preparedStatement, connection);
        }
    }

    @Override
    public void updateContact(UserEntity user) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "UPDATE user SET telephone=? WHERE id_user=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getTelephone());
            preparedStatement.setInt(2, user.getIdUser());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Error adding data to the database", e);
        } finally {
            ResultSet resultSet = null;
            closeResources(preparedStatement, connection);
        }
    }
    @Override
    public void updateInfo(UserEntity user) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "UPDATE user SET nom=?, prenom=?, date_naissance=?, adresse=? WHERE id_user=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getNom());
            preparedStatement.setString(2, user.getPrenom());
            preparedStatement.setDate(3, user.getDateNaissance());
            preparedStatement.setString(4, user.getAdresse());
            preparedStatement.setInt(5, user.getIdUser());


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Error adding data to the database", e);
        } finally {
            ResultSet resultSet = null;
            closeResources(preparedStatement, connection);
        }
    }

    private static final String SQL_DELETE_USER = "DELETE FROM user WHERE id_user = ?";

    @Override
    public void deleteUser(Long userId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = daoFactory.getConnection();
            preparedStatement = connection.prepareStatement(SQL_DELETE_USER);
            preparedStatement.setLong(1, userId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Error deleting user with ID: " + userId, e);
        } finally {
            closeResources(preparedStatement, connection);
        }
    }


    @Override
    public UserEntity isValidUser(String email, String password)  throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        UserEntity userEntity = null;
        ResultSet resultSet = null;
        try {
            // Récupérer une connexion depuis la DAOFactory
            connection = daoFactory.getConnection();

            String sql = "SELECT * FROM user WHERE email = ? and password= ? ";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userEntity = map(resultSet);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        }
        return userEntity;
    }

    @Override
    public boolean isExist(String email)  throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        boolean exist = true;
        // Récupérer une connexion depuis la DAOFactory
        connection = daoFactory.getConnection();

        String sql = "SELECT id_user FROM user WHERE email = ? ";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, email);
        ResultSet resultSet = preparedStatement.executeQuery();

        exist = resultSet.next() ? true : false ;
        preparedStatement.close();

        return exist ;
    }
    private static final String SQL_SELECT_PAR_ID_OFFRE = "SELECT u.* FROM user u " +
            "JOIN offre o ON u.id_user = o.id_proprietaire " +
            "WHERE o.id_offre = ?";

    @Override
    public UserEntity getUserByIdOffre(int idOffre) {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        UserEntity userOffreEntity = null;

        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initRequestPrepare(connexion, SQL_SELECT_PAR_ID_OFFRE, idOffre);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                userOffreEntity = map(resultSet);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(preparedStatement, connexion);
        }

        return userOffreEntity;
    }
}

package com.example.myproject_s3.dao.animal;

import com.example.myproject_s3.dao.DAOException;
import com.example.myproject_s3.dao.DAOFactory;
import com.example.myproject_s3.entities.AnimalEntity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AnimalDaoImp implements AnimalDao {
    private DAOFactory daoFactory;

    public AnimalDaoImp(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private AnimalEntity map(ResultSet resultSet) throws SQLException {
        AnimalEntity animalEntity = new AnimalEntity();
        animalEntity.setIdAnimal(resultSet.getInt("id_animal"));
        animalEntity.setCategorie(resultSet.getString("categorie"));
        animalEntity.setSexe(resultSet.getString("sexe"));
        animalEntity.setAge(resultSet.getInt("age"));
        animalEntity.setRace(resultSet.getString("race"));
        animalEntity.setEtatDeSante(resultSet.getString("etat_de_sante"));
        animalEntity.setDescription(resultSet.getString("description"));
        animalEntity.setNomAnimal(resultSet.getString("nom_animal"));
        animalEntity.setAddress(resultSet.getString("adresse"));
        return animalEntity;
    }
    public static PreparedStatement initRequestPrepare( Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }
    @Override
    public Long addAnimal(AnimalEntity animal) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generatedKeys = null;

        try {
            connection = daoFactory.getConnection();

            String sql = "INSERT INTO animal (categorie, sexe, age, race, etat_de_sante, description, nom_animal, adresse) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, animal.getCategorie());
            preparedStatement.setString(2, animal.getSexe());
            preparedStatement.setInt(3, animal.getAge());
            preparedStatement.setString(4, animal.getRace());
            preparedStatement.setString(5, animal.getEtatDeSante());
            preparedStatement.setString(6, animal.getDescription());
            preparedStatement.setString(7, animal.getNomAnimal());
            preparedStatement.setString(8, animal.getAddress());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("La création de l'animal a échoué, aucune ligne ajoutée.");
            }

            generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getLong(1); // Renvoie l'ID généré
            } else {
                throw new SQLException("La création de l'animal a échoué, aucun ID généré retourné.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(generatedKeys, preparedStatement, connection);
        }
    }

    @Override
    public AnimalEntity getAnimalById(int animalId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        AnimalEntity animalEntity = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM animal WHERE id_animal = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, animalId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                animalEntity = map(resultSet);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return animalEntity;
    }

    @Override
    public List<AnimalEntity> getAnimalsByOffre(int offreId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<AnimalEntity> animals = new ArrayList<>();

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM animal WHERE id_animal = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, offreId);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AnimalEntity animalEntity = map(resultSet);
                animals.add(animalEntity);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return animals;
    }

    @Override
    public ArrayList<AnimalEntity> getAllAnimals() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<AnimalEntity> animals = new ArrayList<AnimalEntity>();

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM animal";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                AnimalEntity animalEntity = map(resultSet);
                animals.add(animalEntity);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(resultSet, preparedStatement, connection);
        }

        return animals;
    }

    @Override
    public void updateAnimal(AnimalEntity animal) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generatedKeys = null;

        try {
            connection = daoFactory.getConnection();

            String sql = "UPDATE animal SET categorie = ?, sexe = ?, age = ?, race = ?, etat_de_sante = ?, description = ?, nom_animal = ?, adresse = ? WHERE id_animal = ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, animal.getCategorie());
            preparedStatement.setString(2, animal.getSexe());
            preparedStatement.setInt(3, animal.getAge());
            preparedStatement.setString(4, animal.getRace());
            preparedStatement.setString(5, animal.getEtatDeSante());
            preparedStatement.setString(6, animal.getDescription());
            preparedStatement.setString(7, animal.getNomAnimal());
            preparedStatement.setString(8, animal.getAddress());
            preparedStatement.setLong(9, animal.getIdAnimal());

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("La mise à jour de l'animal a échoué, aucune ligne modifiée.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(null, preparedStatement, connection);
        }
    }


    @Override
    public void deleteAnimal(int animalId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = this.daoFactory.getConnection();
            String sql = "DELETE FROM animal WHERE id_animal = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, animalId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Erreur lors de la suppression de l'animal avec l'ID : " + animalId, e);
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

    @Override
    public AnimalEntity recupererDernierAnimal() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        AnimalEntity dernierAnimal = null;

        try {
            connection = daoFactory.getConnection();
            String sql = "SELECT * FROM animal ORDER BY id_animal DESC LIMIT 1";
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                dernierAnimal = map(resultSet);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        } finally {
            closeResources(preparedStatement, connection);
        }

        return dernierAnimal;
    }
    // Ajoutez des méthodes supplémentaires si nécessaire

    private void closeResources(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            closeResources(preparedStatement, connection);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void closeResources(PreparedStatement preparedStatement, Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

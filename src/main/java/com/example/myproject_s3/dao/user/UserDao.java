package com.example.myproject_s3.dao.user;

import com.example.myproject_s3.entities.UserEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface UserDao {
    void addUser(UserEntity user);
    UserEntity getUserById(int userId);
    ArrayList<UserEntity> getAllUsers();
    void updateUser(UserEntity user);
    void deleteUser(Long userId);
    UserEntity isValidUser(String email, String password) throws SQLException;
    public boolean isExist(String email) throws SQLException;
    UserEntity getUserByIdOffre(int idOffre);
    void updateImageUser(UserEntity user);
    void updateInfo(UserEntity user);
    void updateContact(UserEntity user);

}

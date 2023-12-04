package com.example.myproject_s3.dao.user;

import com.example.myproject_s3.entities.UserEntity;

import java.util.ArrayList;
import java.util.List;

public interface UserDao {
    void addUser(UserEntity user);
    UserEntity getUserById(Long userId);
    ArrayList<UserEntity> getAllUsers();
    void updateUser(UserEntity user);
    void deleteUser(Long userId);
    boolean isValidUser(String username, String password);
}

package com.food.dao;


import java.util.List;

import com.food.model.User;

public interface UserDAO {

    boolean addUser(User user);

    User getUserById(int userId);

    User getUserByUsername(String username);

    List<User> getAllUsers();

    boolean updateUser(User user);

    boolean deleteUser(int userId);
}
package com.food.test;


import com.food.dao.UserDAO;
import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

public class UserDAOTest {

    public static void main(String[] args) {

        UserDAO dao = new UserDAOImpl();

        User user = new User();

        user.setUsername("admin");

        user.setPassword("1234");

        user.setEmail("admin@gmail.com");

        user.setAddress("Hyderabad");

        user.setRole("ADMIN");

        boolean status =  dao.addUser(user);

        System.out.println(status);
    }
}
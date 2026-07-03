package com.food.servlet;


import java.io.IOException;

import com.food.dao.UserDAO;
import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet
extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        String username =
                request.getParameter(
                        "username");

        String password =
                request.getParameter(
                        "password");

        String email =
                request.getParameter(
                        "email");

        String address =
                request.getParameter(
                        "address");

        User user =
                new User();

        user.setUsername(
                username);

        user.setPassword(
                password);

        user.setEmail(
                email);

        user.setAddress(
                address);

        user.setRole(
                "CUSTOMER");

        UserDAO dao =
                new UserDAOImpl();

        boolean status =
                dao.addUser(user);

        if(status) {

            response.sendRedirect(
                    "login.jsp");
        }
        else {

            response.getWriter()
                    .println(
                    "Registration Failed");
        }
    }
}
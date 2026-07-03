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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet
extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        String username = request.getParameter( "username");

        String password = request.getParameter( "password");

        UserDAO dao =
                new UserDAOImpl();

        User user =
                dao.getUserByUsername(
                        username);

        if(user != null &&
           user.getPassword()
                   .equals(password)) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "loggedUser",
                    user);

            response.sendRedirect(
                    "restaurants");
        }
        else {

            response.getWriter()
                    .println(
                    "Invalid Username or Password");
        }
    }
}
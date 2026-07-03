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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        User user =
                (User)session.getAttribute(
                        "loggedUser");

        String email =
                request.getParameter("email");

        String address =
                request.getParameter("address");

        String password =
                request.getParameter("password");

        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(password);

        UserDAO dao =
                new UserDAOImpl();

        dao.updateUser(user);

        session.setAttribute(
                "loggedUser",
                user);

        response.sendRedirect(
                "profile.jsp");
    }
}

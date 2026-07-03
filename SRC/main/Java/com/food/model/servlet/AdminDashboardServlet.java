package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.dao.RestaurantDAO;
import com.food.dao.UserDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.daoimpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO =
                new UserDAOImpl();

        OrderDAO orderDAO =
                new OrderDAOImpl();

        RestaurantDAO restaurantDAO =
                new RestaurantDAOImpl();

        int totalUsers =
                userDAO.getAllUsers().size();
        List<User> users =
                userDAO.getAllUsers();
        request.setAttribute(
                "users",
                users);

        int totalOrders =
                orderDAO.getAllOrders().size();

        int totalRestaurants =
                restaurantDAO.getAllRestaurants().size();

        double totalRevenue = 0;

        for(var order :
                orderDAO.getAllOrders()) {

            totalRevenue +=
                    order.getTotalAmount();
        }

        request.setAttribute(
                "totalUsers",
                totalUsers);

        request.setAttribute(
                "totalOrders",
                totalOrders);

        request.setAttribute(
                "totalRestaurants",
                totalRestaurants);

        request.setAttribute(
                "totalRevenue",
                totalRevenue);

        request.getRequestDispatcher(
                "adminDashboard.jsp")
                .forward(
                        request,
                        response);
    }
}
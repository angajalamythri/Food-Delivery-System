package com.food.servlet;


import java.io.IOException;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAO dao =
                new RestaurantDAOImpl();

        String keyword =
                request.getParameter(
                        "keyword");

        List<Restaurant> restaurants;

        if(keyword != null &&
           !keyword.trim().isEmpty()) {

            restaurants =
                    dao.searchRestaurants(
                            keyword);

        } else {

            restaurants =
                    dao.getAllRestaurants();
        }
        System.out.println(
        	    "Restaurant Count = "
        	    + restaurants.size());

        request.setAttribute(
                "restaurants",
                restaurants);

        request.getRequestDispatcher(
                "home.jsp")
                .forward(request, response);
    }
}
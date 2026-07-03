package com.food.servlet;


import java.io.IOException;
import java.util.List;

import com.food.dao.MenuDAO;
import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Menu;
import com.food.dao.ReviewDAO;
import com.food.daoimpl.ReviewDAOImpl;
import com.food.model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println(
    	        request.getParameter(
    	                "restaurantId"));
        int restaurantId =
                Integer.parseInt(
                        request.getParameter(
                                "restaurantId"));

        MenuDAO dao =
                new MenuDAOImpl();

        List<Menu> menuList =
                dao.getMenuByRestaurant(
                        restaurantId);
        ReviewDAO reviewDAO =
                new ReviewDAOImpl();

        List<Review> reviews =
                reviewDAO.getReviewsByRestaurant(
                        restaurantId);

        double avgRating =
                reviewDAO.getAverageRating(
                        restaurantId);
        System.out.println("Restaurant ID = " + restaurantId);
        System.out.println("Average Rating = " + avgRating);
        System.out.println("Review Count = " + reviews.size());
        
        request.setAttribute(
                "reviews",
                reviews);

        request.setAttribute(
                "avgRating",
                avgRating);
        
        request.setAttribute(
                "menuList",
                menuList);

        request.setAttribute(
                "restaurantId",
                restaurantId);

        request.getRequestDispatcher(
                "menu.jsp")
                .forward(request, response);
    }
}
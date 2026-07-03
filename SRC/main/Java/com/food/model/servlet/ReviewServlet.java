package com.food.servlet;

import java.io.IOException;

import com.food.dao.ReviewDAO;
import com.food.daoimpl.ReviewDAOImpl;
import com.food.model.Review;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/review")
public class ReviewServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        User user =
                (User)session.getAttribute(
                        "loggedUser");

        if(user == null){

            response.sendRedirect(
                    "login.jsp");

            return;
        }

        int restaurantId =
                Integer.parseInt(
                request.getParameter(
                        "restaurantId"));

        int rating =
                Integer.parseInt(
                request.getParameter(
                        "rating"));

        String comment =
                request.getParameter(
                        "comment");

        Review review =
                new Review();

        review.setUserId(
                user.getUserId());

        review.setRestaurantId(
                restaurantId);

        review.setRating(
                rating);

        review.setComment(
                comment);

        ReviewDAO dao =
                new ReviewDAOImpl();

        dao.addReview(review);

        response.sendRedirect(
                "orders");
    }
}
package com.food.test;

import com.food.dao.ReviewDAO;
import com.food.daoimpl.ReviewDAOImpl;

public class ReviewDAOTest {

    public static void main(String[] args) {

        ReviewDAO dao =
                new ReviewDAOImpl();

        double rating =
                dao.getAverageRating(1);

        System.out.println(
                "Average Rating = " + rating);
    }
}
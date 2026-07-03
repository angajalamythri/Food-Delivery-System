package com.food.dao;

import java.util.List;
import com.food.model.Review;

public interface ReviewDAO {

    boolean addReview(Review review);

    List<Review> getReviewsByRestaurant(
            int restaurantId);

    double getAverageRating(
            int restaurantId);
}
package com.food.dao;


import java.util.List;

import com.food.model.Restaurant;

public interface RestaurantDAO {

    boolean addRestaurant(
            Restaurant restaurant);

    Restaurant getRestaurantById(
            int restaurantId);

    List<Restaurant> getAllRestaurants();

    boolean updateRestaurant(
            Restaurant restaurant);

    boolean deleteRestaurant(
            int restaurantId);
    List<Restaurant> searchRestaurants(
            String keyword);
}
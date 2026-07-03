package com.food.test;


import com.food.dao.RestaurantDAO;
import com.food.daoimpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

public class RestaurantDAOTest {

    public static void main(String[] args) {

        RestaurantDAO dao =
                new RestaurantDAOImpl();

        Restaurant restaurant =
                new Restaurant();

        restaurant.setName(
                "Pizza Hut");

        restaurant.setCuisineType(
                "Italian");

        restaurant.setDeliveryTime(
                30);

        restaurant.setAddress(
                "Hyderabad");

        restaurant.setRating(
                4.5);

        restaurant.setActive(
                true);

        restaurant.setImagePath(
                "pizzahut.jpg");

        boolean status =
                dao.addRestaurant(
                        restaurant);

        System.out.println(
                "Inserted : " + status);
    }
}
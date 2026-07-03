package com.food.daoimpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection con;

    public RestaurantDAOImpl() {
        con = DBConnection.getConnection();
    }

    // ADD RESTAURANT

    @Override
    public boolean addRestaurant(Restaurant restaurant) {

        String sql =
                "INSERT INTO Restaurant " +
                "(Name, CuisineType, DeliveryTime, Address, Rating, IsActive, ImagePath) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1,
                    restaurant.getName());

            pstmt.setString(2,
                    restaurant.getCuisineType());

            pstmt.setInt(3,
                    restaurant.getDeliveryTime());

            pstmt.setString(4,
                    restaurant.getAddress());

            pstmt.setDouble(5,
                    restaurant.getRating());

            pstmt.setBoolean(6,
                    restaurant.isActive());

            pstmt.setString(7,
                    restaurant.getImagePath());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // GET RESTAURANT BY ID

    @Override
    public Restaurant getRestaurantById(int restaurantId) {

        Restaurant restaurant = null;

        String sql =
                "SELECT * FROM Restaurant " +
                "WHERE RestaurantID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    restaurantId);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                restaurant =
                        extractRestaurant(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    // GET ALL RESTAURANTS
    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurants =
                new ArrayList<>();

        String sql =
                "SELECT * FROM Restaurant";

        try {

            Statement stmt =
                    con.createStatement();

            ResultSet rs =
                    stmt.executeQuery(sql);

            while (rs.next()) {

                System.out.println(
                    "Restaurant Found = "
                    + rs.getString("Name"));

                restaurants.add(
                        extractRestaurant(rs));
            }

            System.out.println(
                "Restaurant Count = "
                + restaurants.size());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurants;
    }
   
    // UPDATE RESTAURANT

    @Override
    public boolean updateRestaurant(
            Restaurant restaurant) {

        String sql =
                "UPDATE Restaurant SET " +
                "Name=?, CuisineType=?, DeliveryTime=?, " +
                "Address=?, Rating=?, IsActive=?, ImagePath=? " +
                "WHERE RestaurantID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1,
                    restaurant.getName());

            pstmt.setString(2,
                    restaurant.getCuisineType());

            pstmt.setInt(3,
                    restaurant.getDeliveryTime());

            pstmt.setString(4,
                    restaurant.getAddress());

            pstmt.setDouble(5,
                    restaurant.getRating());

            pstmt.setBoolean(6,
                    restaurant.isActive());

            pstmt.setString(7,
                    restaurant.getImagePath());

            pstmt.setInt(8,
                    restaurant.getRestaurantId());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // DELETE RESTAURANT

    @Override
    public boolean deleteRestaurant(
            int restaurantId) {

        String sql =
                "DELETE FROM Restaurant " +
                "WHERE RestaurantID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    restaurantId);

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // COMMON METHOD

    private Restaurant extractRestaurant(
            ResultSet rs)
            throws SQLException {

        Restaurant restaurant =
                new Restaurant();

        restaurant.setRestaurantId(
                rs.getInt("RestaurantID"));

        restaurant.setName(
                rs.getString("Name"));

        restaurant.setCuisineType(
                rs.getString("CuisineType"));

        restaurant.setDeliveryTime(
                rs.getInt("DeliveryTime"));

        restaurant.setAddress(
                rs.getString("Address"));

        restaurant.setRating(
                rs.getDouble("Rating"));

        restaurant.setActive(
                rs.getBoolean("IsActive"));

        restaurant.setImagePath(
                rs.getString("ImagePath"));

        return restaurant;
    }
    
    @Override
    public List<Restaurant> searchRestaurants(
            String keyword) {

        List<Restaurant> restaurants =
                new ArrayList<>();

        String sql =
                "SELECT * FROM Restaurant " +
                "WHERE Name LIKE ?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(
                    1,
                    "%" + keyword + "%");

            ResultSet rs =
                    pstmt.executeQuery();

            while(rs.next()) {

                restaurants.add(
                        extractRestaurant(rs));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return restaurants;
    }
    
}

package com.food.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.ReviewDAO;
import com.food.model.Review;
import com.food.util.DBConnection;

public class ReviewDAOImpl implements ReviewDAO {

    private Connection con;

    public ReviewDAOImpl() {

        con = DBConnection.getConnection();
    }

    @Override
    public boolean addReview(Review review) {

        String sql =
                "INSERT INTO Review " +
                "(UserID, RestaurantID, Rating, Comment) " +
                "VALUES (?, ?, ?, ?)";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    review.getUserId());

            pstmt.setInt(2,
                    review.getRestaurantId());

            pstmt.setInt(3,
                    review.getRating());

            pstmt.setString(4,
                    review.getComment());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Review> getReviewsByRestaurant(
            int restaurantId) {

        List<Review> reviews =
                new ArrayList<>();

        String sql =
                "SELECT * FROM Review " +
                "WHERE RestaurantID=? " +
                "ORDER BY ReviewDate DESC";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    restaurantId);

            ResultSet rs =
                    pstmt.executeQuery();

            while(rs.next()) {

                Review review =
                        new Review();

                review.setReviewId(
                        rs.getInt("ReviewID"));

                review.setUserId(
                        rs.getInt("UserID"));

                review.setRestaurantId(
                        rs.getInt("RestaurantID"));

                review.setRating(
                        rs.getInt("Rating"));

                review.setComment(
                        rs.getString("Comment"));

                reviews.add(review);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return reviews;
    }

    @Override
    public double getAverageRating(
            int restaurantId) {

        String sql =
                "SELECT AVG(Rating) AS AvgRating " +
                "FROM Review " +
                "WHERE RestaurantID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    restaurantId);

            ResultSet rs =
                    pstmt.executeQuery();

            if(rs.next()) {

                return rs.getDouble(
                        "AvgRating");
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
}
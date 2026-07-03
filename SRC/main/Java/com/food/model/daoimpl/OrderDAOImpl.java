package com.food.daoimpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.model.OrderTable;
import com.food.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection con;

    public OrderDAOImpl() {
        con = DBConnection.getConnection();
    }

    // ADD ORDER

    @Override
    public int addOrder(OrderTable order) {

    	String sql =
    	        "INSERT INTO OrderTable " +
    	        "(UserID, RestaurantID, TotalAmount, Status, PaymentMethod, DeliveryAddress) " +
    	        "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(
                            sql,
                            PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1,
                    order.getUserId());

            pstmt.setInt(2,
                    order.getRestaurantId());

            pstmt.setDouble(3,
                    order.getTotalAmount());

            pstmt.setString(4,
                    order.getStatus());

            pstmt.setString(5,
                    order.getPaymentMethod());

            pstmt.setString(6,
                    order.getDeliveryAddress());

            pstmt.executeUpdate();

            ResultSet rs =
                    pstmt.getGeneratedKeys();

            if(rs.next()) {

                return rs.getInt(1);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return 0;
    }

    // GET ORDER BY ID

    @Override
    public OrderTable getOrderById(
            int orderId) {

        OrderTable order = null;

        String sql =
                "SELECT * FROM OrderTable " +
                "WHERE OrderID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderId);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                order =
                        extractOrder(rs);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return order;
    }

    // GET ORDERS BY USER

    @Override
    public List<OrderTable> getOrdersByUser(
            int userId) {

        List<OrderTable> orders =
                new ArrayList<>();

        String sql =
                "SELECT * FROM OrderTable " +
                "WHERE UserID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    userId);

            ResultSet rs =
                    pstmt.executeQuery();

            while (rs.next()) {

                orders.add(
                        extractOrder(rs));
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return orders;
    }

    // GET ALL ORDERS

    @Override
    public List<OrderTable> getAllOrders() {

        List<OrderTable> orders =
                new ArrayList<>();

        String sql =
                "SELECT * FROM OrderTable";

        try {

            Statement stmt =
                    con.createStatement();

            ResultSet rs =
                    stmt.executeQuery(sql);

            while (rs.next()) {

                orders.add(
                        extractOrder(rs));
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return orders;
    }

    // UPDATE ORDER STATUS

    @Override
    public boolean updateOrderStatus(
            int orderId,
            String status) {

        String sql =
                "UPDATE OrderTable " +
                "SET Status=? " +
                "WHERE OrderID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1,
                    status);

            pstmt.setInt(2,
                    orderId);

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    // DELETE ORDER

    @Override
    public boolean deleteOrder(
            int orderId) {

        String sql =
                "DELETE FROM OrderTable " +
                "WHERE OrderID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderId);

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    // COMMON METHOD

    private OrderTable extractOrder(
            ResultSet rs)
            throws SQLException {

        OrderTable order =
                new OrderTable();

        order.setOrderId(
                rs.getInt("OrderID"));

        order.setUserId(
                rs.getInt("UserID"));

        order.setRestaurantId(
                rs.getInt("RestaurantID"));

        Timestamp ts =
                rs.getTimestamp("OrderDate");

        if (ts != null) {

            order.setOrderDate(
                    ts.toLocalDateTime());
        }

        order.setTotalAmount(
                rs.getDouble("TotalAmount"));

        order.setStatus(
                rs.getString("Status"));

        order.setPaymentMethod(
                rs.getString("PaymentMethod"));
        order.setDeliveryAddress(
                rs.getString(
                        "DeliveryAddress"));

        return order;
    }
}
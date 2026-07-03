package com.food.daoimpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.dao.OrderItemDAO;
import com.food.model.OrderItem;
import com.food.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    private Connection con;

    public OrderItemDAOImpl() {
        con = DBConnection.getConnection();
    }

    // ADD ORDER ITEM

    @Override
    public boolean addOrderItem(OrderItem orderItem) {

        String sql =
                "INSERT INTO OrderItem " +
                "(OrderID, MenuID, Quantity, ItemTotal) " +
                "VALUES (?, ?, ?, ?)";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderItem.getOrderId());

            pstmt.setInt(2,
                    orderItem.getMenuId());

            pstmt.setInt(3,
                    orderItem.getQuantity());

            pstmt.setDouble(4,
                    orderItem.getItemTotal());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    // GET ORDER ITEM BY ID

    @Override
    public OrderItem getOrderItemById(
            int orderItemId) {

        OrderItem orderItem = null;

        String sql =
                "SELECT * FROM OrderItem " +
                "WHERE OrderItemID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderItemId);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                orderItem =
                        extractOrderItem(rs);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return orderItem;
    }

    // GET ORDER ITEMS BY ORDER

    @Override
    public List<OrderItem> getOrderItemsByOrder(
            int orderId) {

        List<OrderItem> orderItems =
                new ArrayList<>();

        String sql =
                "SELECT oi.*, m.ItemName " +
                "FROM OrderItem oi " +
                "JOIN Menu m " +
                "ON oi.MenuID = m.MenuID " +
                "WHERE oi.OrderID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderId);

            ResultSet rs =
                    pstmt.executeQuery();

            while (rs.next()) {

                orderItems.add(
                        extractOrderItem(rs));
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return orderItems;
    }

    // UPDATE ORDER ITEM

    @Override
    public boolean updateOrderItem(
            OrderItem orderItem) {

        String sql =
                "UPDATE OrderItem SET " +
                "OrderID=?, " +
                "MenuID=?, " +
                "Quantity=?, " +
                "ItemTotal=? " +
                "WHERE OrderItemID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderItem.getOrderId());

            pstmt.setInt(2,
                    orderItem.getMenuId());

            pstmt.setInt(3,
                    orderItem.getQuantity());

            pstmt.setDouble(4,
                    orderItem.getItemTotal());

            pstmt.setInt(5,
                    orderItem.getOrderItemId());

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    // DELETE ORDER ITEM

    @Override
    public boolean deleteOrderItem(
            int orderItemId) {

        String sql =
                "DELETE FROM OrderItem " +
                "WHERE OrderItemID=?";

        try {

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1,
                    orderItemId);

            int rows =
                    pstmt.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return false;
    }

    // COMMON METHOD

    private OrderItem extractOrderItem(
            ResultSet rs)
            throws SQLException {

        OrderItem orderItem =
                new OrderItem();

        orderItem.setOrderItemId(
                rs.getInt("OrderItemID"));

        orderItem.setOrderId(
                rs.getInt("OrderID"));

        orderItem.setMenuId(
                rs.getInt("MenuID"));

        orderItem.setQuantity(
                rs.getInt("Quantity"));

        orderItem.setItemTotal(
                rs.getDouble("ItemTotal"));

        try {

            orderItem.setItemName(
                    rs.getString("ItemName"));

        }
        catch(Exception e) {

            // Ignore when ItemName column is not present
        }

        return orderItem;
    
    }
}
package com.food.dao;


import java.util.List;

import com.food.model.OrderTable;

public interface OrderDAO {

	int addOrder(OrderTable order);

    OrderTable getOrderById(
            int orderId);

    List<OrderTable> getOrdersByUser(
            int userId);

    List<OrderTable> getAllOrders();

    boolean updateOrderStatus(
            int orderId,
            String status);

    boolean deleteOrder(
            int orderId);
}
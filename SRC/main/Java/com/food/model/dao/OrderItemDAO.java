package com.food.dao;


import java.util.List;

import com.food.model.OrderItem;

public interface OrderItemDAO {

    boolean addOrderItem(
            OrderItem orderItem);

    OrderItem getOrderItemById(
            int orderItemId);

    List<OrderItem> getOrderItemsByOrder(
            int orderId);

    boolean updateOrderItem(
            OrderItem orderItem);

    boolean deleteOrderItem(
            int orderItemId);
}
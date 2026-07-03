package com.food.test;


import com.food.dao.OrderDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.model.OrderTable;

public class OrderDAOTest {

    public static void main(String[] args) {

        OrderDAO dao =
                new OrderDAOImpl();

        OrderTable order =
                new OrderTable();

        order.setUserId(1);

        order.setRestaurantId(1);

        order.setTotalAmount(
                899.00);

        order.setStatus(
                "PENDING");

        order.setPaymentMethod(
                "COD");

        int status =
                dao.addOrder(order);

        System.out.println(
                "Inserted : " + status);
        OrderTable order1 =
        		dao.getOrderById(1);

        		System.out.println(
        		        order.getStatus());
    }
}
package com.food.test;


import java.util.List;

import com.food.dao.OrderItemDAO;
import com.food.daoimpl.OrderItemDAOImpl;
import com.food.model.OrderItem;

public class OrderItemDAOTest {

    public static void main(String[] args) {

        OrderItemDAO dao =
                new OrderItemDAOImpl();

        OrderItem item =
                new OrderItem();

        item.setOrderId(1);

        item.setMenuId(1);

        item.setQuantity(2);

        item.setItemTotal(598.00);

        boolean status =
                dao.addOrderItem(item);

        System.out.println(
                "Inserted : " + status);
        OrderItem item1 =
        		dao.getOrderItemById(1);

        		System.out.println(
        		        item.getQuantity());
        		List<OrderItem> items =
        				dao.getOrderItemsByOrder(1);

        				for(OrderItem ite : items)
        				{
        				    System.out.println(
        				            ite.getMenuId());
        				}
    }
}
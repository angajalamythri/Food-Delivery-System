package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderItemDAO;
import com.food.daoimpl.OrderItemDAOImpl;
import com.food.model.OrderItem;
import com.food.dao.OrderDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(
                        request.getParameter("orderId"));

        OrderItemDAO dao =
                new OrderItemDAOImpl();

        List<OrderItem> orderItems =
                dao.getOrderItemsByOrder(orderId);
        OrderDAO orderDAO =
                new OrderDAOImpl();

        OrderTable order =
                orderDAO.getOrderById(orderId);
        
        request.setAttribute(
                "order",
                order);

        request.setAttribute(
                "orderItems",
                orderItems);

        request.setAttribute(
                "orderId",
                orderId);

        request.getRequestDispatcher(
                "orderDetails.jsp")
                .forward(request, response);
    }
}
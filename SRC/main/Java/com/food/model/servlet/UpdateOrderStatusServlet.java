package com.food.servlet;

import java.io.IOException;

import com.food.dao.OrderDAO;
import com.food.daoimpl.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateStatus")
public class UpdateOrderStatusServlet
extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(
                        request.getParameter(
                                "orderId"));

        String status =
                request.getParameter(
                        "status");

        OrderDAO dao =
                new OrderDAOImpl();

        dao.updateOrderStatus(
                orderId,
                status);

        response.sendRedirect(
                "adminOrders");
    }
}
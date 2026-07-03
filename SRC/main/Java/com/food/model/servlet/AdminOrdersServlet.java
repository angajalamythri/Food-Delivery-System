package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminOrders")
public class AdminOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        OrderDAO dao =
                new OrderDAOImpl();

        List<OrderTable> orders =
                dao.getAllOrders();

        request.setAttribute(
                "orders",
                orders);

        request.getRequestDispatcher(
                "adminOrders.jsp")
                .forward(request, response);
    }
}
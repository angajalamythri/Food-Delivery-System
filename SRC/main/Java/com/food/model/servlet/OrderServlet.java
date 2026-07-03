package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.dao.OrderDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.model.OrderTable;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();
        

        User user =
                (User) session.getAttribute(
                        "loggedUser");

        OrderDAO dao =
                new OrderDAOImpl();

        List<OrderTable> orders =
                dao.getOrdersByUser(
                        user.getUserId());

        request.setAttribute(
                "orders",
                orders);

        request.getRequestDispatcher(
                "orders.jsp")
                .forward(request,
                        response);
        System.out.println("Logged User ID = " + user.getUserId());

        List<OrderTable> orderss =
                dao.getOrdersByUser(user.getUserId());

        System.out.println("Orders Found = " + orderss.size());
    }
}
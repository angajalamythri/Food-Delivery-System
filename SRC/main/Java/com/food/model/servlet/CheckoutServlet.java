package com.food.servlet;

import java.io.IOException;

import com.food.dao.OrderDAO;
import com.food.dao.OrderItemDAO;
import com.food.daoimpl.OrderDAOImpl;
import com.food.daoimpl.OrderItemDAOImpl;
import com.food.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        User user =
                (User) session.getAttribute(
                        "loggedUser");

        Cart cart =
                (Cart) session.getAttribute(
                        "cart");

        String paymentMethod =
                request.getParameter(
                        "paymentMethod");
        String deliveryAddress =
                request.getParameter(
                        "deliveryAddress");

        if(user == null || cart == null) {

            response.sendRedirect(
                    "login.jsp");

            return;
        }

        OrderTable order =
                new OrderTable();

        order.setUserId(
                user.getUserId());

        order.setRestaurantId(1);

        order.setTotalAmount(
                cart.getTotalAmount());

        order.setStatus(
                "PENDING");
        

        order.setPaymentMethod(
                paymentMethod);

        order.setDeliveryAddress(
                deliveryAddress);
        OrderDAO orderDAO =
                new OrderDAOImpl();

        int orderId =
                orderDAO.addOrder(order);
        System.out.println("Generated Order ID = " + orderId);

        OrderItemDAO itemDAO =
                new OrderItemDAOImpl();

        for(CartItem item :
                cart.getItems()) {

            OrderItem orderItem =
                    new OrderItem();

            orderItem.setOrderId(
                    orderId);

            orderItem.setMenuId(
                    item.getMenuId());

            orderItem.setQuantity(
                    item.getQuantity());

            orderItem.setItemTotal(
                    item.getTotalPrice());

            itemDAO.addOrderItem(
                    orderItem);
        }

        cart.clearCart();

        response.sendRedirect(
                "orders");
    }
}
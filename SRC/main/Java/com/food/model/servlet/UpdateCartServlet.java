package com.food.servlet;

import java.io.IOException;

import com.food.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateCart")
public class UpdateCartServlet
extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId =
                Integer.parseInt(
                        request.getParameter(
                                "menuId"));

        int quantity =
                Integer.parseInt(
                        request.getParameter(
                                "quantity"));

        HttpSession session =
                request.getSession();

        Cart cart =
                (Cart) session.getAttribute(
                        "cart");

        if(cart != null) {

            cart.updateQuantity(
                    menuId,
                    quantity);
        }

        response.sendRedirect(
                "cart.jsp");
    }
}
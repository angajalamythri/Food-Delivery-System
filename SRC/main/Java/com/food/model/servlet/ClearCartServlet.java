package com.food.servlet;

import java.io.IOException;

import com.food.model.Cart;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/clearCart")
public class ClearCartServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
                request.getSession();

        Cart cart =
                (Cart) session.getAttribute(
                        "cart");

        if(cart != null) {

            cart.clearCart();

            session.setAttribute(
                    "cart",
                    cart);
        }

        response.sendRedirect(
                "cart.jsp");
    }
}
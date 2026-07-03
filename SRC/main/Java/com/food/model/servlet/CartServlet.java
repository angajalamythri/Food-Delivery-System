package com.food.servlet;


import java.io.IOException;

import com.food.dao.MenuDAO;
import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(
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

        MenuDAO dao =
                new MenuDAOImpl();

        Menu menu =
                dao.getMenuById(menuId);

        HttpSession session =
                request.getSession();

        Cart cart =
                (Cart) session.getAttribute(
                        "cart");

        if(cart == null) {

            cart = new Cart();

            session.setAttribute(
                    "cart",
                    cart);
        }

        CartItem item =
                new CartItem(
                        menu.getMenuId(),
                        menu.getItemName(),
                        menu.getPrice(),
                        quantity);

        cart.addItem(item);

        response.sendRedirect(
                "cart.jsp");
    }
}
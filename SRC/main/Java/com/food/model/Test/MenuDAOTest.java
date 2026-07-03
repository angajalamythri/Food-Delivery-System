package com.food.test;


import com.food.dao.MenuDAO;
import com.food.daoimpl.MenuDAOImpl;
import com.food.model.Menu;

public class MenuDAOTest {

    public static void main(String[] args) {

        MenuDAO dao =
                new MenuDAOImpl();

       
        Menu menu =
        		dao.getMenuById(1);

        		System.out.println(
        		        menu.getItemName());
    }
}
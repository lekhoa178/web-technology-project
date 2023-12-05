package com.cnw.shoppingweb.dao.impl;

import com.cnw.shoppingweb.beans.CartBean;
import com.cnw.shoppingweb.dao.CartDAO;
import com.cnw.shoppingweb.utility.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CartDAOImpl implements CartDAO {
    private CartDAO cartDAO = new CartDAOImpl();
    @Override
    public String addProductToCart(String userId, String prodId, int prodQty) {
       return cartDAO.addProductToCart(userId,prodId,prodQty);
    }

    @Override
    public List<CartBean> getAllCartItems(String userId) {
        return cartDAO.getAllCartItems(userId);
    }

    @Override
    public int getCartCount(String userId) {
        return cartDAO.getCartCount(userId);
    }

    @Override
    public String removeProductFromCart(String userId, String prodId) {
        return cartDAO.removeProductFromCart(userId,prodId);
    }

    @Override
    public boolean removeAProduct(String userId, String prodId) {
        return cartDAO.removeAProduct(userId,prodId);
    }

    @Override
    public String updateProductToCart(String userId, String prodId, int prodQty) {
        return cartDAO.updateProductToCart(userId, prodId, prodQty);
    }

    public int getProductCount(String userId, String prodId) {
        int count = 0;

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select sum(quantity) from usercart where username=? and prodid=?");
            ps.setString(1, userId);
            ps.setString(2, prodId);
            rs = ps.executeQuery();

            if (rs.next() && !rs.wasNull())
                count = rs.getInt(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public int getCartItemCount(String userId, String itemId) {
        return cartDAO.getCartItemCount(userId, itemId);
    }
}

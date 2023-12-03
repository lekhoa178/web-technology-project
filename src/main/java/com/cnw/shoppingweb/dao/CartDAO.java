package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.CartBean;

import java.util.List;

public interface CartDAO {
    String addProductToCart(String userId, String prodId, int prodQty);

    String updateProductToCart(String userId, String prodId, int prodQty);

    List<CartBean> getAllCartItems(String userId);

    int getCartCount(String userId);

    int getCartItemCount(String userId, String itemId);

    String removeProductFromCart(String userId, String prodId);

    boolean removeAProduct(String userId, String prodId);
}

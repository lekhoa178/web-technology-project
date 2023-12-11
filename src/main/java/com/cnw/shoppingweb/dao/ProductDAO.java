package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.Product;

import java.io.InputStream;
import java.util.List;

public interface ProductDAO {
    String addProduct(String prodName, String prodType, String prodInfo, double prodPrice, int prodQuantity,
                             InputStream prodImage);

    String addProduct(Product product);

    String removeProduct(String prodId);

    String updateProduct(Product prevProduct, Product updatedProduct);

    String updateProductPrice(String prodId, double updatedPrice);

    List<Product> getAllProducts();

    List<Product> getAllProductsByType(String type);

    List<Product> searchAllProducts(String search);

    byte[] getImage(String prodId);

    Product getProductDetails(String prodId);

    String updateProductWithoutImage(String prevProductId, Product updatedProduct);

    double getProductPrice(String prodId);

    boolean sellNProduct(String prodId, int n);

    int getProductQuantity(String prodId);
}

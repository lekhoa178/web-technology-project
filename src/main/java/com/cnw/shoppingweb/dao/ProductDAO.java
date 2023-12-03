package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.ProductBean;

import java.io.InputStream;
import java.util.List;

public interface ProductDAO {
    String addProduct(String prodName, String prodType, String prodInfo, double prodPrice, int prodQuantity,
                             InputStream prodImage);

    String addProduct(ProductBean product);

    String removeProduct(String prodId);

    String updateProduct(ProductBean prevProduct, ProductBean updatedProduct);

    String updateProductPrice(String prodId, double updatedPrice);

    List<ProductBean> getAllProducts();

    List<ProductBean> getAllProductsByType(String type);

    List<ProductBean> searchAllProducts(String search);

    byte[] getImage(String prodId);

    ProductBean getProductDetails(String prodId);

    String updateProductWithoutImage(String prevProductId, ProductBean updatedProduct);

    double getProductPrice(String prodId);

    boolean sellNProduct(String prodId, int n);

    int getProductQuantity(String prodId);
}

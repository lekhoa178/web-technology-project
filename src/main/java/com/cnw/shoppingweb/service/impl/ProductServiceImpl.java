package com.cnw.shoppingweb.service.impl;

import java.io.InputStream;
import java.util.List;

import com.cnw.shoppingweb.beans.Product;
import com.cnw.shoppingweb.dao.ProductDAO;
import com.cnw.shoppingweb.dao.impl.ProductDAOImpl;
import com.cnw.shoppingweb.service.ProductService;

public class ProductServiceImpl implements ProductService {
	private final ProductDAO productDAO = new ProductDAOImpl();

	@Override
	public String addProduct(String prodName, String prodType, String prodInfo, double prodPrice, int prodQuantity,
			InputStream prodImage) {
		return productDAO.addProduct(prodName, prodType, prodInfo, prodPrice, prodQuantity, prodImage);
	}

	@Override
	public String addProduct(Product product) {
		return productDAO.addProduct(product);
	}

	@Override
	public String removeProduct(String prodId) {
		return productDAO.removeProduct(prodId);
	}

	@Override
	public String updateProduct(Product prevProduct, Product updatedProduct) {
		return productDAO.updateProduct(prevProduct, updatedProduct);
	}

	@Override
	public String updateProductPrice(String prodId, double updatedPrice) {
		return productDAO.updateProductPrice(prodId, updatedPrice);
	}

	@Override
	public List<Product> getAllProducts() {
		return productDAO.getAllProducts();
	}

	@Override
	public List<Product> getAllProductsByType(String type) {
		return productDAO.getAllProductsByType(type);
	}

	@Override
	public List<Product> searchAllProducts(String search) {
		return productDAO.searchAllProducts(search);
	}

	@Override
	public byte[] getImage(String prodId) {
		return productDAO.getImage(prodId);
	}

	@Override
	public Product getProductDetails(String prodId) {
		return productDAO.getProductDetails(prodId);
	}

	@Override
	public String updateProductWithoutImage(String prevProductId, Product updatedProduct) {
		return productDAO.updateProductWithoutImage(prevProductId, updatedProduct);
	}

	@Override
	public double getProductPrice(String prodId) {
		return productDAO.getProductPrice(prodId);
	}

	@Override
	public boolean sellNProduct(String prodId, int n) {
		return productDAO.sellNProduct(prodId, n);
	}

	@Override
	public int getProductQuantity(String prodId) {
		return productDAO.getProductQuantity(prodId);
	}

}

package com.cnw.shoppingweb.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cnw.shoppingweb.beans.Cart;
import com.cnw.shoppingweb.beans.Demand;
import com.cnw.shoppingweb.beans.Product;
import com.cnw.shoppingweb.service.CartService;
import com.cnw.shoppingweb.utility.DatabaseConnector;

public class CartServiceImpl implements CartService {

	@Override
	public String addProductToCart(String userId, String prodId, int prodQty) {
		String status = "Failed to Add into Cart";

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from cart where username=? and prodid=?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				int cartQuantity = rs.getInt("quantity");

				Product product = new ProductServiceImpl().getProductDetails(prodId);

				int availableQty = product.getProdQuantity();

				prodQty += cartQuantity;
				//
				if (availableQty < prodQty) {

					status = updateProductToCart(userId, prodId, availableQty);

					status = "Only " + availableQty + " no of " + product.getProdName()
							+ " are available in the shop! So we are adding only " + availableQty
							+ " no of that item into Your Cart" + "";

					Demand demandBean = new Demand(userId, product.getProdId(), prodQty - availableQty);

					DemandServiceImpl demand = new DemandServiceImpl();

					boolean flag = demand.addProduct(demandBean);

					if (flag)
						status += "<br/>Later, We Will Mail You when " + product.getProdName()
								+ " will be available into the Store!";

				} else {
					status = updateProductToCart(userId, prodId, prodQty);

				}
			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);
		DatabaseConnector.closeConnection(ps2);

		return status;
	}

	@Override
	public List<Cart> getAllCartItems(String userId) {
		List<Cart> items = new ArrayList<Cart>();

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from cart where username=?");

			ps.setString(1, userId);

			rs = ps.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();

				cart.setUserId(rs.getString("username"));
				cart.setProdId(rs.getString("prodid"));
				cart.setQuantity(Integer.parseInt(rs.getString("quantity")));

				items.add(cart);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);

		return items;
	}

	@Override
	public int getCartCount(String userId) {
		int count = 0;

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;

		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select sum(quantity) from cart where username=?");

			ps.setString(1, userId);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull())
				count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);

		return count;
	}

	@Override
	public String removeProductFromCart(String userId, String prodId) {
		String status = "Product Removal Failed";

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("select * from cart where username=? and prodid=?");

			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				int prodQuantity = rs.getInt("quantity");

				prodQuantity -= 1;

				if (prodQuantity > 0) {
					ps2 = con.prepareStatement("update cart set quantity=? where username=? and prodid=?");

					ps2.setInt(1, prodQuantity);

					ps2.setString(2, userId);

					ps2.setString(3, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully removed from the Cart!";
				} else if (prodQuantity <= 0) {

					ps2 = con.prepareStatement("delete from cart where username=? and prodid=?");

					ps2.setString(1, userId);

					ps2.setString(2, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully removed from the Cart!";
				}

			} else {

				status = "Product Not Available in the cart!";

			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);
		DatabaseConnector.closeConnection(ps2);

		return status;
	}

	@Override
	public boolean removeAProduct(String userId, String prodId) {
		boolean flag = false;

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			ps = con.prepareStatement("delete from cart where username=? and prodid=?");
			ps.setString(1, userId);
			ps.setString(2, prodId);

			int k = ps.executeUpdate();

			if (k > 0)
				flag = true;

		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);

		return flag;
	}

	@Override
	public String updateProductToCart(String userId, String prodId, int prodQty) {

		String status = "Failed to Add into Cart";

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from cart where username=? and prodid=?");
			ps.setString(1, userId);
			ps.setString(2, prodId);

			rs = ps.executeQuery();

			if (rs.next()) {

				if (prodQty > 0) {
					ps2 = con.prepareStatement("update cart set quantity=? where username=? and prodid=?");

					ps2.setInt(1, prodQty);

					ps2.setString(2, userId);

					ps2.setString(3, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully Updated to Cart!";
				} else if (prodQty == 0) {
					ps2 = con.prepareStatement("delete from cart where username=? and prodid=?");

					ps2.setString(1, userId);

					ps2.setString(2, prodId);

					int k = ps2.executeUpdate();

					if (k > 0)
						status = "Product Successfully Updated in Cart!";
				}
			} else {

				ps2 = con.prepareStatement("insert into cart values(?,?,?)");

				ps2.setString(1, userId);

				ps2.setString(2, prodId);

				ps2.setInt(3, prodQty);

				int k = ps2.executeUpdate();

				if (k > 0)
					status = "Product Successfully Updated to Cart!";

			}

		} catch (SQLException e) {
			status = "Error: " + e.getMessage();
			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);
		DatabaseConnector.closeConnection(ps2);

		return status;
	}

	public int getProductCount(String userId, String prodId) {
		int count = 0;

		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select sum(quantity) from cart where username=? and prodid=?");
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
		int count = 0;
		if (userId == null || itemId == null)
			return 0;
		Connection con = DatabaseConnector.provideConnection();

		PreparedStatement ps = null;

		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select quantity from cart where username=? and prodid=?");

			ps.setString(1, userId);
			ps.setString(2, itemId);

			rs = ps.executeQuery();

			if (rs.next() && !rs.wasNull())
				count = rs.getInt(1);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		DatabaseConnector.closeConnection(con);
		DatabaseConnector.closeConnection(ps);
		DatabaseConnector.closeConnection(rs);

		return count;
	}
}

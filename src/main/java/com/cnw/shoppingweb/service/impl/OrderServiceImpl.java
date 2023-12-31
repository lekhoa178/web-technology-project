package com.cnw.shoppingweb.service.impl;

import java.util.List;

import com.cnw.shoppingweb.beans.Order;
import com.cnw.shoppingweb.beans.OrderDetails;
import com.cnw.shoppingweb.beans.Transaction;
import com.cnw.shoppingweb.dao.OrderDAO;
import com.cnw.shoppingweb.dao.impl.OrderDAOImpl;
import com.cnw.shoppingweb.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private final OrderDAO orderDAO = new OrderDAOImpl();

	@Override
	public String paymentSuccess(String userName, double paidAmount) {
		return orderDAO.paymentSuccess(userName, paidAmount);
	}

	@Override
	public boolean addOrder(Order order) {
		return orderDAO.addOrder(order);
	}

	@Override
	public boolean addTransaction(Transaction transaction) {
		return orderDAO.addTransaction(transaction);
	}

	@Override
	public int countSoldItem(String prodId) {
		return orderDAO.countSoldItem(prodId);
	}

	@Override
	public List<Order> getAllOrders() {
		return orderDAO.getAllOrders();
	}

	@Override
	public List<Order> getOrdersByUserId(String emailId) {
		return orderDAO.getOrdersByUserId(emailId);
	}

	@Override
	public List<OrderDetails> getAllOrderDetails(String userEmailId) {
		return orderDAO.getAllOrderDetails(userEmailId);
	}

	@Override
	public String shipNow(String orderId, String prodId) {
		return orderDAO.shipNow(orderId, prodId);
	}

}

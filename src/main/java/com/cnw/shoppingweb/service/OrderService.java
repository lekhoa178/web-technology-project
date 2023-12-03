package com.cnw.shoppingweb.service;

import java.util.List;

import com.cnw.shoppingweb.beans.OrderBean;
import com.cnw.shoppingweb.beans.OrderDetails;
import com.cnw.shoppingweb.beans.TransactionBean;

public interface OrderService {

	public String paymentSuccess(String userName, double paidAmount);

	public boolean addOrder(OrderBean order);

	public boolean addTransaction(TransactionBean transaction);

	public int countSoldItem(String prodId);

	public List<OrderBean> getAllOrders();

	public List<OrderBean> getOrdersByUserId(String emailId);

	public List<OrderDetails> getAllOrderDetails(String userEmailId);

	public String shipNow(String orderId, String prodId);
}

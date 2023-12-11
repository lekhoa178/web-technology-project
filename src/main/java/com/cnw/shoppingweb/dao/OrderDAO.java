package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.Order;
import com.cnw.shoppingweb.beans.OrderDetails;
import com.cnw.shoppingweb.beans.Transaction;

import java.util.List;

public interface OrderDAO {
    public String paymentSuccess(String userName, double paidAmount);

    public boolean addOrder(Order order);

    public boolean addTransaction(Transaction transaction);

    public int countSoldItem(String prodId);

    public List<Order> getAllOrders();

    public List<Order> getOrdersByUserId(String emailId);

    public List<OrderDetails> getAllOrderDetails(String userEmailId);

    public String shipNow(String orderId, String prodId);
}

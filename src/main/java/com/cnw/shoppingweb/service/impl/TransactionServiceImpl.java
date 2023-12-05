package com.cnw.shoppingweb.service.impl;

import com.cnw.shoppingweb.dao.TransactionDAO;
import com.cnw.shoppingweb.dao.impl.TransactionDAOImpl;
import com.cnw.shoppingweb.service.TransactionService;

public class TransactionServiceImpl implements TransactionService {
	private final TransactionDAO transactionDAO = new TransactionDAOImpl();

	@Override
	public String getUserId(String transId) {
		return transactionDAO.getUserId(transId);
	}

}

package com.cnw.shoppingweb.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cnw.shoppingweb.dao.TransDAO;
import com.cnw.shoppingweb.dao.impl.TransDAOImpl;
import com.cnw.shoppingweb.service.TransService;
import com.cnw.shoppingweb.utility.DBUtil;

public class TransServiceImpl implements TransService {
	private final TransDAO transDAO = new TransDAOImpl();

	@Override
	public String getUserId(String transId) {
		return transDAO.getUserId(transId);
	}

}

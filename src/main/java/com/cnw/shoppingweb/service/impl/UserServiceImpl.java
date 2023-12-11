package com.cnw.shoppingweb.service.impl;


import com.cnw.shoppingweb.beans.User;
import com.cnw.shoppingweb.dao.UserDAO;
import com.cnw.shoppingweb.dao.impl.UserDAOImpl;
import com.cnw.shoppingweb.service.UserService;

public class UserServiceImpl implements UserService {

	private final UserDAO userDAO = new UserDAOImpl();

	@Override
	public String registerUser(String userName, Long mobileNo, String emailId, String address, int pinCode,
			String password) {

		User user = new User(userName, mobileNo, emailId, address, pinCode, password, "USER");
        return registerUser(user);
	}

	@Override
	public String registerUser(User user) {
		return userDAO.registerUser(user);
	}

	@Override
	public boolean isRegistered(String emailId) {
		return (userDAO.getUserDetails(emailId) != null);
	}

	@Override
	public String isValidCredential(String emailId, String password) {
		String status = "Login Denied! Incorrect Username or Password";

		if (userDAO.getUserDetails(emailId, password) != null) {
			status = "valid";
		}

		return status;
	}

	@Override
	public User getUserDetails(String emailId, String password) {
		return userDAO.getUserDetails(emailId, password);
	}

	@Override
	public String getFName(String emailId) {
		return userDAO.getFName(emailId);
	}

	@Override
	public String getUserAddr(String userId) {
		return userDAO.getUserAddr(userId);
	}

	@Override
	public String getUserType(String userId) {
		return userDAO.getUserType(userId);
	}

}

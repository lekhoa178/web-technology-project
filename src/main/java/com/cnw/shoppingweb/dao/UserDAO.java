package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.UserBean;

public interface UserDAO {

    String registerUser(UserBean user);

    UserBean getUserDetails(String emailId);

    UserBean getUserDetails(String emailId, String password);

    String getFName(String emailId);

    String getUserAddr(String userId);
    String getUserType(String userId);
}

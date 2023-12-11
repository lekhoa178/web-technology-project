package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.User;

public interface UserDAO {

    String registerUser(User user);

    User getUserDetails(String emailId);

    User getUserDetails(String emailId, String password);

    String getFName(String emailId);

    String getUserAddr(String userId);
    String getUserType(String userId);
}

package com.cnw.shoppingweb.dao.impl;

import com.cnw.shoppingweb.beans.User;
import com.cnw.shoppingweb.constants.IUserConfigs;
import com.cnw.shoppingweb.dao.UserDAO;
import com.cnw.shoppingweb.utility.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class  UserDAOImpl implements UserDAO {

    @Override
    public String registerUser(User user) {

        String status = "User Registration Failed!";

        boolean isRegtd = isRegistered(user.getEmail());

        if (isRegtd) {
            status = "Email Id Already Registered!";
            return status;
        }
        Connection conn = DatabaseConnector.provideConnection();
        PreparedStatement ps = null;
        if (conn != null) {
            System.out.println("Connected Successfully!");
        }

        try {

            ps = conn.prepareStatement("insert into " + IUserConfigs.TABLE_USER + " values(?,?,?,?,?,?)");

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getName());
            ps.setLong(3, user.getMobile());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getPinCode());
            ps.setString(6, user.getPassword());

            int k = ps.executeUpdate();

            if (k > 0) {
                status = "User Registered Successfully!";
            }

        } catch (SQLException e) {
            status = "Error: " + e.getMessage();
            e.printStackTrace();
        }

        DatabaseConnector.closeConnection(ps);
        DatabaseConnector.closeConnection(ps);

        return status;
    }

    private boolean isRegistered(String emailId) {
        boolean flag = false;

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select * from user where email=?");

            ps.setString(1, emailId);

            rs = ps.executeQuery();

            if (rs.next())
                flag = true;

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        DatabaseConnector.closeConnection(con);
        DatabaseConnector.closeConnection(ps);
        DatabaseConnector.closeConnection(rs);

        return flag;
    }

    @Override
    public User getUserDetails(String emailId) {
        User user = null;

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select * from user where email=?");
            ps.setString(1, emailId);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setMobile(rs.getLong("mobile"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setPinCode(rs.getInt("pincode"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));

                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        DatabaseConnector.closeConnection(con);
        DatabaseConnector.closeConnection(ps);
        DatabaseConnector.closeConnection(rs);

        return user;    }

    @Override
    public User getUserDetails(String emailId, String password) {

        User user = null;

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select * from user where email=? and password=?");
            ps.setString(1, emailId);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setName(rs.getString("name"));
                user.setMobile(rs.getLong("mobile"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setPinCode(rs.getInt("pincode"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));

                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        DatabaseConnector.closeConnection(con);
        DatabaseConnector.closeConnection(ps);
        DatabaseConnector.closeConnection(rs);

        return user;
    }

    @Override
    public String getFName(String emailId) {
        String fname = "";

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select name from user where email=?");
            ps.setString(1, emailId);

            rs = ps.executeQuery();

            if (rs.next()) {
                fname = rs.getString(1);

                fname = fname.split(" ")[0];

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fname;
    }

    @Override
    public String getUserAddr(String userId) {
        String userAddr = "";

        Connection con = DatabaseConnector.provideConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select address from user where email=?");
            ps.setString(1, userId);
            rs = ps.executeQuery();
            if (rs.next())
                userAddr = rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userAddr;
    }

    @Override
    public String getUserType(String userId) {
        String userType = "";

        Connection con = DatabaseConnector.provideConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select role from user where email=?");
            ps.setString(1, userId);
            rs = ps.executeQuery();
            if (rs.next())
                userType = rs.getString(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userType;
    }
}

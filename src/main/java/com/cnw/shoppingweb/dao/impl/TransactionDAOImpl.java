package com.cnw.shoppingweb.dao.impl;

import com.cnw.shoppingweb.dao.TransactionDAO;
import com.cnw.shoppingweb.utility.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TransactionDAOImpl implements TransactionDAO {
    @Override
    public String getUserId(String transId) {
        String userId = "";

        Connection con = DatabaseConnector.provideConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            ps = con.prepareStatement("select username from transactions where transid=?");

            ps.setString(1, transId);

            rs = ps.executeQuery();

            if (rs.next())
                userId = rs.getString(1);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userId;
    }
}

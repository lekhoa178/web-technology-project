package com.cnw.shoppingweb.dao.impl;

import com.cnw.shoppingweb.beans.DemandBean;
import com.cnw.shoppingweb.dao.DemandDAO;
import com.cnw.shoppingweb.utility.DatabaseConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DemandDAOImpl implements DemandDAO {
    @Override
    public boolean addProduct(String userId, String prodId, int demandQty) {
        boolean flag = false;

        //get the database connection
        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;

        try {
            //create the prepared statement with the query
            ps = con.prepareStatement("select * from user_demand where username=? and prodid=?");

            ps.setString(1, userId);
            ps.setString(2, prodId);

            rs = ps.executeQuery();

            if (rs.next()) {

                flag = true;
            } else {
                ps2 = con.prepareStatement("insert into  user_demand values(?,?,?)");

                ps2.setString(1, userId);

                ps2.setString(2, prodId);

                ps2.setInt(3, demandQty);

                int k = ps2.executeUpdate();

                if (k > 0)
                    flag = true;
            }

        } catch (SQLException e) {
            flag = false;
            e.printStackTrace();
        }

        DatabaseConnector.closeConnection(con);
        DatabaseConnector.closeConnection(ps);
        DatabaseConnector.closeConnection(ps2);
        DatabaseConnector.closeConnection(rs);
        //return true if the product is added into the db
        return flag;
    }

    @Override
    public boolean removeProduct(String userId, String prodId) {
        boolean flag = false;

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select * from user_demand where username=? and prodid=?");

            ps.setString(1, userId);
            ps.setString(2, prodId);

            rs = ps.executeQuery();

            // System.out.println("userId "+userId+"\nprodId: "+prodId);

            if (rs.next()) {

                // System.out.println("userId "+userId+"\nprodId: "+prodId);
                ps2 = con.prepareStatement("delete from  user_demand where username=? and prodid=?");

                ps2.setString(1, userId);

                ps2.setString(2, prodId);

                int k = ps2.executeUpdate();

                if (k > 0)
                    flag = true;

            } else {
                flag = true;
            }

        } catch (SQLException e) {
            flag = false;
            e.printStackTrace();
        }

        DatabaseConnector.closeConnection(con);
        DatabaseConnector.closeConnection(ps);
        DatabaseConnector.closeConnection(ps2);
        DatabaseConnector.closeConnection(rs);

        return flag;
    }

    @Override
    public boolean addProduct(DemandBean userDemandBean) {

        return addProduct(userDemandBean.getUserName(), userDemandBean.getProdId(), userDemandBean.getDemandQty());
    }

    @Override
    public List<DemandBean> haveDemanded(String prodId) {
        List<DemandBean> demandList = new ArrayList<DemandBean>();

        Connection con = DatabaseConnector.provideConnection();

        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = con.prepareStatement("select * from user_demand where prodid=?");
            ps.setString(1, prodId);
            rs = ps.executeQuery();

            while (rs.next()) {

                DemandBean demand = new DemandBean(rs.getString("username"), rs.getString("prodid"),
                        rs.getInt("quantity"));

                demandList.add(demand);

            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return demandList;
    }
}

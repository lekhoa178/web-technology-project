package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.Demand;

import java.util.List;

public interface DemandDAO {
    boolean addProduct(String userId, String prodId, int demandQty);

    boolean addProduct(Demand userDemand);

    boolean removeProduct(String userId, String prodId);

    List<Demand> haveDemanded(String prodId);
}

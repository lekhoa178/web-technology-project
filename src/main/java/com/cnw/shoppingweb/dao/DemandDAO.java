package com.cnw.shoppingweb.dao;

import com.cnw.shoppingweb.beans.DemandBean;

import java.util.List;

public interface DemandDAO {
    boolean addProduct(String userId, String prodId, int demandQty);

    boolean addProduct(DemandBean userDemandBean);

    boolean removeProduct(String userId, String prodId);

    List<DemandBean> haveDemanded(String prodId);
}

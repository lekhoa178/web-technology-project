package com.cnw.shoppingweb.service;

import java.util.List;

import com.cnw.shoppingweb.beans.Demand;

public interface DemandService {

	public boolean addProduct(String userId, String prodId, int demandQty);

	public boolean addProduct(Demand userDemand);

	public boolean removeProduct(String userId, String prodId);

	public List<Demand> haveDemanded(String prodId);

}

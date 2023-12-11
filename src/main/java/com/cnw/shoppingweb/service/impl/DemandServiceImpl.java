package com.cnw.shoppingweb.service.impl;

import java.util.List;

import com.cnw.shoppingweb.beans.Demand;
import com.cnw.shoppingweb.dao.DemandDAO;
import com.cnw.shoppingweb.dao.impl.DemandDAOImpl;
import com.cnw.shoppingweb.service.DemandService;

//This class is to process the demand items which are
//not available at the time of purchase by any customer
//the customer will receive mail once the product is avaible
//back into the store
public class DemandServiceImpl implements DemandService {
	private DemandDAO demandDAO = new DemandDAOImpl();

	@Override
	public boolean addProduct(String userId, String prodId, int demandQty) {
		return demandDAO.addProduct(userId, prodId, demandQty);
	}

	@Override
	public boolean removeProduct(String userId, String prodId) {
		return demandDAO.removeProduct(userId, prodId);
	}

	@Override
	public boolean addProduct(Demand userDemand) {

		return addProduct(userDemand.getUserName(), userDemand.getProdId(), userDemand.getDemandQty());
	}

	@Override
	public List<Demand> haveDemanded(String prodId) {
		return demandDAO.haveDemanded(prodId);
	}

}

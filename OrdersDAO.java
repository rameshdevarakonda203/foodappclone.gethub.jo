package com.foodAppClone.daointerface;

import java.util.ArrayList;

import com.foodAppClone.model.Orders;

public interface OrdersDAO {
	
int insert (Orders u);
	
	ArrayList<Orders> fetchAll();
	
	Orders fetch(int Orderid);
	
	int update (int Orderid,String Status);
	
	int delete (int Orderid);
	
	

}

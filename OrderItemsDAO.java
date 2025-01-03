package com.foodAppClone.daointerface;

import java.util.ArrayList;

import com.foodAppClone.model.OrderItems;

public interface OrderItemsDAO {
	
	
	int insert (OrderItems oi);

	ArrayList<OrderItems> fetchAll();

	OrderItems fetch(int userid);

	int update (int Orderitemid,int Quantity);

	int delete (int Orderitemid);

}

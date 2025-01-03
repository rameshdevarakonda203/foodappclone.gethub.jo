package com.foodAppClone.model;

public class OrderItems {
	
	private int Orderitemid;
	private int Orderid;
	private int Menuid;
	private int Quantity;
	private int Totalitems;
	public int getOrderitemid() {
		return Orderitemid;
	}
	public void setOrderitemid(int orderitemid) {
		Orderitemid = orderitemid;
	}
	public int getOrderid() {
		return Orderid;
	}
	public void setOrderid(int orderid) {
		Orderid = orderid;
	}
	public int getMenuid() {
		return Menuid;
	}
	public void setMenuid(int menuid) {
		Menuid = menuid;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public int getTotalitems() {
		return Totalitems;
	}
	public void setTotalitems(int totalitems) {
		Totalitems = totalitems;
	}
	public OrderItems() {
		super();
	}
	public OrderItems(int orderitemid, int orderid, int menuid, int quantity, int totalitems) {
		super();
		Orderitemid = orderitemid;
		Orderid = orderid;
		Menuid = menuid;
		Quantity = quantity;
		Totalitems = totalitems;
	}
	
	
	public OrderItems(int orderid, int menuid, int quantity, int itemTotalAmount) {
		super();
		Orderid = orderid;
		Menuid = menuid;
		Quantity = quantity;
		Totalitems = itemTotalAmount;
	}
	@Override
	public String toString() {
		return   Orderitemid + "  " + Orderid + "  " + Menuid + "  "
				+ Quantity + "  " + Totalitems ;
	}
	


}

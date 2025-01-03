package com.foodAppClone.model;

public class Orders {
		private int Orderid;
		private int Userid;
		private int Restaurant_id;
		private float TotalAmount;
		private String Status;
		private String PaymentMode;
		public int getOrderid() {
			return Orderid;
		}
		public void setOrders(int orderid) {
			Orderid = orderid;
		}
		public int getUserid() {
			return Userid;
		}
		public void setUserid(int userid) {
			Userid = userid;
		}
		public int getRestaurant_id() {
			return Restaurant_id;
		}
		public void setRestaurant_id(int restaurant_id) {
			Restaurant_id = restaurant_id;
		}
		public float getTotalAmount() {
			return TotalAmount;
		}
		public void setTotalAmount(float totalAmount) {
			TotalAmount = totalAmount;
		}
		public String getStatus() {
			return Status;
		}
		public void setStatus(String status) {
			Status = status;
		}
		public String getPaymentMode() {
			return PaymentMode;
		}
		public void setPaymentMode(String paymentMode) {
			PaymentMode = paymentMode;
		}
		public Orders() {
			super();
		}
		public Orders(int orderid, int userid, int restaurant_id, float totalAmount, String status, String paymentMode) {
			super();
			Orderid = orderid;
			Userid = userid;
			Restaurant_id = restaurant_id;
			TotalAmount = totalAmount;
			Status = status;
			PaymentMode = paymentMode;
		}
		
		
	
		@Override
		public String toString() {
			return   Orderid + " " + Userid + "  " + Restaurant_id + "  "
					+ TotalAmount + "  " + Status + "   " + PaymentMode;
		}
		
		

}

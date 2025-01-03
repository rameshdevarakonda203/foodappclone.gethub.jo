package com.foodAppClone.model;

public class CartItem {
	
	
	private int Menu_id;
	private int Restaurant_id;
	private String Name;
	private int Quantity ;
	private float Price;
	
	
	public CartItem() {
		super();
	}

	
	public CartItem( int menu_id, int restaurant_id, String name, int quantity, float price) {
		super();
		
		Menu_id = menu_id;
		Restaurant_id = restaurant_id;
		Name = name;
		Quantity = quantity;
		Price = price;
	}

	
	public int getMenu_id() {
		return Menu_id;
	}

	public void setMenu_id(int menu_id) {
		Menu_id = menu_id;
	}

	public int getRestaurant_id() {
		return Restaurant_id;
	}

	public void setRestaurant_id(int restaurant_id) {
		Restaurant_id = restaurant_id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

	public float getPrice() {
		return Price;
	}

	public void setPrice(float price) {
		Price = price;
	}

	@Override
	public String toString() {
		return   Menu_id + "  " + Restaurant_id + "   "
				+ Name + "  " + Quantity + "   " + Price ;
	}
	
	
	
	
	
	

}

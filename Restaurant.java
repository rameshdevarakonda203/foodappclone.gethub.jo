package com.foodAppClone.model;

public class Restaurant {
	private int restaurant_id;
	private String name;
	private String cuisine_type;
	private int delivery_time;
	private String address;
	private float rattings;
	private boolean is_active;
	private String image_path;
	
	
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCuisine_type() {
		return cuisine_type;
	}
	public void setCuisine_type(String cuisine_type) {
		this.cuisine_type = cuisine_type;
	}
	public int getDelivery_time() {
		return delivery_time;
	}
	public void setDelivery_time(int delivery_time) {
		this.delivery_time = delivery_time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getRattings() {
		return rattings;
	}
	public void setRattings(float rattings) {
		this.rattings = rattings;
	}
	public boolean isIs_active() {
		return is_active;
	}
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public Restaurant() {
		super();
	}
	public Restaurant(int restaurant_id, String name, String cuisine_type, int delivery_time, String address,
			float rattings, boolean is_active, String image_path) {
		super();
		this.restaurant_id = restaurant_id;
		this.name = name;
		this.cuisine_type = cuisine_type;
		this.delivery_time = delivery_time;
		this.address = address;
		this.rattings = rattings;
		this.is_active = is_active;
		this.image_path = image_path;
	}
	@Override
	public String toString() {
		return  restaurant_id + "	" + name + "	" + cuisine_type
				+ "	" + delivery_time + "	" + address + "	" + rattings
				+ "	" + is_active + "	" + image_path ;
	}


}

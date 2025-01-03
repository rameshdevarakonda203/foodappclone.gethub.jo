package com.foodAppClone.model;

public class Menu {
	
	private int Menu_id;
	private int Restaurant_id;
	private String Name;
	private String Description;
	private int Price;
	private boolean Is_Available;
	private String Image_path;
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
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public boolean isIs_Available() {
		return Is_Available;
	}
	public void setIs_Available(boolean is_Available) {
		Is_Available = is_Available;
	}
	public String getImage_path() {
		return Image_path;
	}
	public void setImage_path(String image_path) {
		Image_path = image_path;
	}
	public Menu() {
		super();
	}
	public Menu(int menu_id, int restaurant_id, String name, String description, int price, boolean is_Available,
			String image_path) {
		super();
		Menu_id = menu_id;
		Restaurant_id = restaurant_id;
		Name = name;
		Description = description;
		Price = price;
		Is_Available = is_Available;
		Image_path = image_path;
	}
	@Override
	public String toString() {
		return Menu_id + " " + Restaurant_id + "	" + Name + "	"
				+ Description + "	" + Price + "	" + Is_Available + "	" + Image_path;
	}
	
	



}

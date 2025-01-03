package com.foodAppClone.daointerface;

import java.util.ArrayList;

import com.foodAppClone.model.Restaurant;

public interface RestaurantDAO {

int insert(Restaurant r);
	
	ArrayList<Restaurant>fetchAll();
	
	Restaurant fetch(int restaurant_id);
	
	int update (int restaurant_id, String Cuisine_type);
	
	int delete (int restaurant_id);


}

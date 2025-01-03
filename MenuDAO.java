package com.foodAppClone.daointerface;


import java.util.ArrayList;
import com.foodAppClone.model.Menu;

public interface MenuDAO {
	
int insert (Menu m);
	
	ArrayList<Menu> fetchAll();
	
	Menu fetch(int menu_id);
	
	int update (int Menu_id,String Description);
	
	int delete (int Menu_id);
	
	ArrayList<Menu> fetchMenuByRestaurantId(int resid);

	




}

package com.foodAppClone.daointerface;

import java.util.ArrayList;

import com.foodAppClone.model.User;

public interface UserDAO {
	
	int insert (User u);
	
	ArrayList<User> fetchAll();
	
	User fetch(int userid);
	
	int update (int userid,String email);
	
	int delete (int userid);
	
	User fetch(String email);

}

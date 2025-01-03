package com.foodAppClone.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodAppClone.daointerface.RestaurantDAO;
import com.foodAppClone.db.util.DBConnection;
import com.foodAppClone.model.Restaurant;

public class RestaurantDAOImpl implements RestaurantDAO {
	static ArrayList<Restaurant> RestaurantList = new ArrayList<Restaurant>();

	private static final String INSERTQUERY = "insert into restaurant(restaurant_id,name,cuisine_type,delivery_time,address,rattings,is_active,image_path) values(?,?,?,?,?,?,?,?)";
	private static final String FETCHALL = "select * from restaurant";
	private static final String FETCHONE = "select *from restaurant where restaurant_id=?";
	private static final String UPDATE = "Update Restaurant set cuisine_type =? where restaurant_id=?";
	private static final String DELETE = "Delete from Restaurant where restaurant_id=?";
	static Connection con;

	static {
		con = DBConnection.connect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;

	private Restaurant r;

	@Override
	public int insert(Restaurant r) {
		try {
			pstmt = con.prepareStatement(INSERTQUERY);
			pstmt.setInt(1, r.getRestaurant_id());
			pstmt.setString(2, r.getName());
			pstmt.setString(3, r.getCuisine_type());
			pstmt.setInt(4, r.getDelivery_time());
			pstmt.setString(5, r.getAddress());
			pstmt.setFloat(6, r.getRattings());
			pstmt.setBoolean(7, r.isIs_active());
			pstmt.setString(8, r.getImage_path());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList fetchAll() {
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
			RestaurantList = extractRestaurantListFromResultSet(resultSet);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return RestaurantList;

	}

	@Override
	public Restaurant fetch(int restaurant_id) {

		try {
			pstmt = con.prepareStatement(FETCHONE);
			pstmt.setInt(1, restaurant_id);
			resultSet = pstmt.executeQuery();
			r = extractRestaurantListFromResultSet(resultSet).get(0);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return r;
	}

	ArrayList<Restaurant> extractRestaurantListFromResultSet(ResultSet resultSet) {
		try {

			while (resultSet.next()) {
				RestaurantList.add(new Restaurant(resultSet.getInt("restaurant_id"), resultSet.getString("name"),
						resultSet.getString("cuisine_type"), resultSet.getInt("delivery_time"),
						resultSet.getString("address"), resultSet.getFloat("rattings"),
						resultSet.getBoolean("is_active"), resultSet.getString("image_path")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RestaurantList;
	}

	@Override
	public int update(int restaurant_id, String Cuisine_type) {
		try {
			pstmt = con.prepareStatement(UPDATE);
			pstmt.setString(1, Cuisine_type);
			pstmt.setInt(2, restaurant_id);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	@Override
	public int delete(int restaurant_id) {
		try {
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, restaurant_id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}


}

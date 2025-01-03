package com.foodAppClone.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodAppClone.daointerface.MenuDAO;
import com.foodAppClone.db.util.DBConnection;
import com.foodAppClone	.model.Menu;

public class MenuDAOImpl implements MenuDAO {
	
	 ArrayList<Menu> MenuList = new ArrayList <Menu>();
	private static  final String  INSERTQUERY="insert into Menu (Menu_id,Restaurant_id,Name,Description,Price,Is_Available,Image_Path) values (?,?,?,?,?,?,?)";

	private static final String FETCHALL="Select * from Menu";
	private static final String FETCHONE="Select *from Menu where Menu_id=?";
	private static final String UPDATE ="Update Menu set Description=? where Menu_id =?";
	private static final String DELETE ="Delete  from Menu where Menu_id =?";
	private static final String FETCHMENUBYRESTAURANTID="Select * from Menu Where Restaurant_id=?";

	
	static Connection con;

	static {
		con = DBConnection.connect();
	}

	private PreparedStatement pstmt;

	private ResultSet resultSet;
	private Statement stmt;
	private Menu m;

	@Override
	public int insert(Menu m) {
		try {
			pstmt=con.prepareStatement(INSERTQUERY);
			pstmt.setInt(1,m.getMenu_id());
			pstmt.setInt(2, m.getRestaurant_id());
			pstmt.setString(3,m.getName());
			pstmt.setString(4,m.getDescription());
			pstmt.setInt(5,m.getPrice());
			pstmt.setBoolean(6,m.isIs_Available());
			pstmt.setString(7, m.getImage_path());
			
			return pstmt.executeUpdate();			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;

	}

	@Override
	public ArrayList<Menu> fetchAll() {
		try {
			stmt= con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
		
			MenuList=extractMenuListFromResultSet(resultSet);
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return MenuList;
	}

	@Override
	public Menu fetch(int menu_id) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, menu_id);
			
			resultSet= pstmt.executeQuery();
			m=extractMenuListFromResultSet(resultSet).get(0);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	ArrayList<Menu> extractMenuListFromResultSet(ResultSet resultSet){
		
		try {
			
			while(resultSet.next()) {
				MenuList.add(new Menu(resultSet.getInt("Menu_id"),
						resultSet.getInt("Restaurant_id"),
						resultSet.getString("Name"),
						resultSet.getString("Description"),
						resultSet.getInt("Price"),
						resultSet.getBoolean("Is_Available"),
						resultSet.getString("Image_Path")
						));
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			
		}
		return MenuList;
	}

	@Override
	public int update(int Menu_id, String Description) {

		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1,Description);
			pstmt.setInt(2, Menu_id);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
			
		}
	}
	@Override
	public int delete(int Menu_id) {

		try {
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, Menu_id);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public ArrayList<Menu> fetchMenuByRestaurantId(int Restaurant_id) {
		
		try {
			pstmt= con.prepareStatement(FETCHMENUBYRESTAURANTID);
			pstmt.setInt(1, Restaurant_id);
			resultSet=pstmt.executeQuery();
		
			MenuList=extractMenuListFromResultSet(resultSet);
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return MenuList;
	}
	
}
	

	


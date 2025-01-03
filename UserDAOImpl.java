package com.foodAppClone.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodAppClone.daointerface.UserDAO;
import com.foodAppClone.db.util.DBConnection;
import com.foodAppClone.model.User;

public class UserDAOImpl implements UserDAO {
	static ArrayList<User> UserList = new ArrayList <User>();
	private static  final String  INSERTQUERY="insert into user (username,password,email,address) values (?,?,?,?)";
	private static final String FETCHALL="Select * from User";
	private static final String FETCHONE="Select *from User where userid=?";
	private static final String UPDATE ="Update User set email=? where userid =?";
	private static final String DELETE ="Delete  from User where userid=?";
	private static final String FETCH = "Select * from User where email=?";
	
	static Connection con;
	
	static {
		con=DBConnection.connect();
	}
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private User u;
	//To Insert the Data
	@Override
	public  int insert(User u) {
		
		try {
			pstmt = con.prepareStatement(INSERTQUERY);
			//pstmt.setInt(1, u.getUserid());
			pstmt.setString(1,u.getUsername());
			pstmt.setString(2,u.getPassword());
			pstmt.setString(3,u.getEmail());
			pstmt.setString(4,u.getAddress());
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	//To FetchAll the Data
	@Override
	public ArrayList<User> fetchAll() {
		try {
			stmt= con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			UserList=extractUserListFromResultSet(resultSet);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return UserList;
		
	}
	// To FetchOne Data
	@Override
	public User fetch(int userid) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, userid);
			
			resultSet= pstmt.executeQuery();
			u=extractUserListFromResultSet( resultSet).get(0);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	ArrayList<User>extractUserListFromResultSet(ResultSet resultSet){
	
		try {
			
			while(resultSet.next()) {
				UserList.add(new User(resultSet.getInt("userid"),
						resultSet.getString("UserName"),
						resultSet.getString("password"),
						resultSet.getString("Email"),
						resultSet.getString("Address")));
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			
		}
		return UserList;
	}
	// To Update the Date
	@Override
	public int update(int userid, String email) {

		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1,email);
			pstmt.setInt(2, userid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
			
		}
		
		
	}
	//To delete the Data
	@Override
	public int delete(int userid) {

		try {
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, userid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}
	@Override
	public User fetch(String email) {
		
		try {
			pstmt=con.prepareStatement(FETCH);
			pstmt.setString(1,email);
		
			resultSet = pstmt.executeQuery();
			UserList=extractUserListFromResultSet(resultSet);
			u=UserList.get(0);
		}
		catch(Exception e) {
			e.printStackTrace();		}
		return u;
	}
	
	
}

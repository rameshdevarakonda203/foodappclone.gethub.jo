package com.foodAppClone.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodAppClone.daointerface.OrderItemsDAO;
import com.foodAppClone.db.util.DBConnection;
import com.foodAppClone.model.OrderItems;


public class OrderItemsDAOImpl implements OrderItemsDAO {

	static ArrayList<OrderItems> OrderItemsList = new ArrayList <OrderItems>();
	private static  final String  INSERTQUERY="insert into orderitems (Orderitemid,Orderid,Menuid,Quantity,Totalitems) values (?,?,?,?,?)";
	private static final String FETCHALL="Select * from orderitems";
	private static final String FETCHONE="Select *from orderitems where Orderitemid=?";
	private static final String UPDATE ="Update orderitems set Quantity=? where Orderitemid =?";
	private static final String DELETE ="Delete  from orderitems where Orderitemid =?";

	static Connection con;
	
	static {
		con=DBConnection.connect();
	}


	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	private OrderItems oi;


	@Override
	public int insert(OrderItems oi) {
		try {
			pstmt = con.prepareStatement(INSERTQUERY);
			pstmt.setInt(1, oi.getOrderitemid());
			pstmt.setInt(2,oi.getOrderid());
			pstmt.setInt(3,oi.getMenuid());
			pstmt.setInt(4,oi.getQuantity());
			pstmt.setInt(5,oi.getTotalitems());
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	@Override
	public ArrayList<OrderItems> fetchAll() {
		try {
			stmt= con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			OrderItemsList=extractUserListFromResultSet(resultSet);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return OrderItemsList;
		
	}


	@Override
	public OrderItems fetch(int Orderitemid) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, Orderitemid);
			
			resultSet= pstmt.executeQuery();
			oi=extractUserListFromResultSet( resultSet).get(0);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return oi;
	}
	
	ArrayList<OrderItems>extractUserListFromResultSet(ResultSet resultSet){
	
		try {
			
			while(resultSet.next()) {
				OrderItemsList.add(new OrderItems(resultSet.getInt("Orderitemid"),
						resultSet.getInt("Orderid"),
						resultSet.getInt("Menuid"),
						resultSet.getInt("Quantity"),
						resultSet.getInt("Totalitems")));
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			
		}
		return OrderItemsList;
	}
	
	@Override
	public int update(int Orderitemid, int Quantity) {

		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setInt(1,Quantity);
			pstmt.setInt(2, Orderitemid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
			
		}
		
		
	}
	@Override
	public int delete(int Orderitemid) {

		try {
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1,Orderitemid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	
	
	

	
}

package com.foodAppClone.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodAppClone.daointerface.OrdersDAO;
import com.foodAppClone.db.util.DBConnection;
import com.foodAppClone.model.Orders;

public class OrdersDAOImpl implements OrdersDAO {

	static ArrayList<Orders> OrdersList = new ArrayList <Orders>();
	private static  final String  INSERTQUERY="insert into orders (Userid,Restaurant_id,TotalAmount,Status,PaymentMode) values (?,?,?,?,?)";
	private static final String FETCHALL="Select * from orders";
	private static final String FETCHONE="Select *from orders where orderid=?";
	private static final String UPDATE ="Update orders set Status=? where Orderid =?";
	private static final String DELETE ="Delete  from orders where Orderid =?";


	static Connection con;
	
	static {
		con=DBConnection.connect();
	}

	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet resultSet;
	
	private Orders o;

	@Override
	public int insert(Orders o) {
		int generatedOrderId=-1;
		
		try {
			pstmt = con.prepareStatement(INSERTQUERY,stmt.RETURN_GENERATED_KEYS);
			//pstmt.setInt(1, o.getOrderid());
			pstmt.setInt(1,o.getUserid());
			pstmt.setInt(2,o.getRestaurant_id());
			pstmt.setFloat(3,o.getTotalAmount());
			pstmt.setString(4,o.getStatus());
			pstmt.setString(5,o.getPaymentMode());
			 int res=pstmt.executeUpdate();
			 
			 if(res>0) {
				 try ( ResultSet generatedKeys =pstmt.getGeneratedKeys()) {
					 
					 if(generatedKeys.next()) {
						 
						 generatedOrderId =generatedKeys.getInt(1);
						 
					 }
					 
				 }
				 catch(Exception e) {
					 e.printStackTrace();
				 }
				
			 }
			 return generatedOrderId;
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public ArrayList<Orders> fetchAll() {
		try {
			stmt= con.createStatement();
			resultSet=stmt.executeQuery(FETCHALL);
			OrdersList=extractOrdersListFromResultSet(resultSet);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return OrdersList;
		
	}
	@Override
	public Orders fetch(int Orderid) {
		try {
			pstmt=con.prepareStatement(FETCHONE);
			pstmt.setInt(1, Orderid);
			
			resultSet= pstmt.executeQuery();
			o=extractOrdersListFromResultSet( resultSet).get(0);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return o;
	}
	
	ArrayList<Orders>extractOrdersListFromResultSet(ResultSet resultSet){
	
		try {
			
			while(resultSet.next()) {
				OrdersList.add(new Orders(
						resultSet.getInt("orderid"),
						resultSet.getInt("Userid"),
						resultSet.getInt("Restaurant_id"),
						resultSet.getFloat("TotalAmount"),
						resultSet.getString("Status"),
						resultSet.getString("PaymentMode")
						));
				}
		}
			catch(Exception e) {
				e.printStackTrace();
			}
		return OrdersList;
	}
	
	@Override
	public int update(int Orderid, String Status) {

		try {
			pstmt=con.prepareStatement(UPDATE);
			pstmt.setString(1,Status);
			pstmt.setInt(2, Orderid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
			
		}
		
	}
	@Override
	public int delete(int Orderid) {

		try {
			pstmt = con.prepareStatement(DELETE);
			pstmt.setInt(1, Orderid);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	


}

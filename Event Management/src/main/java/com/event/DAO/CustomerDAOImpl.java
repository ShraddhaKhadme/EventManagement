package com.event.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.event.DTO.Customer;
import com.event.database.DBConnection;


public class CustomerDAOImpl implements CustomerDAO {
	
	private Connection con;
	
	public CustomerDAOImpl() {
		this.con=DBConnection.getConnection();
	}

	@Override
	public boolean insertCustomer(Customer c) {

		String query = "INSERT INTO CUSTOMER(NAME,MAIL,PHONE,GENDER,PASSWORD)VALUES(?,?,?,?,?)";
		PreparedStatement ps = null;
		int res = 0;

		try {

			con.setAutoCommit(false);

			ps = con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(3, c.getPhone());
			ps.setString(2, c.getMail());
			ps.setString(4, c.getGender());
			ps.setString(5, c.getPassword());

			res = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (res > 0) {
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		} else {
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public boolean updateCustomer(Customer c) {
		
		String query="UPDATE CUSTOMER SET NAME=?,MAIL=?,PHONE=?,GENDER=?,PASSWORD=? WHERE ID=?";
		PreparedStatement ps=null;
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setString(2, c.getMail());
			ps.setLong(3, c.getPhone());
			ps.setString(4, c.getGender());
			ps.setString(5, c.getPassword());
			ps.setInt(6, c.getCustomer_id());
			
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		else {
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
		}
	}

	@Override
	public boolean deleteCustomer(Customer c) {
		String query="DELETE FROM CUSTOMER WHERE ID=?";
		PreparedStatement ps=null;
		int res=0;
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, c.getCustomer_id());
			
			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			return true;
		}
		else {
		
		return false;
		}
	}

	@Override
	public Customer getCustomer(int id) {
		String query="SELECT * FROM CUSTOMER WHERE ID=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setMail(rs.getString(3));
				c.setPhone(rs.getLong(4));
				c.setGender(rs.getString(5));
				c.setPassword(rs.getString(6));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}

	@Override
	public Customer getCustomer(String mail, String password) {
		String query="SELECT * FROM CUSTOMER WHERE MAIL=? AND PASSWORD=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			ps.setString(2, password);
			rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setMail(rs.getString(3));
				c.setPhone(rs.getLong(4));
				c.setGender(rs.getString(5));
				c.setPassword(rs.getString(6));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}

	@Override
	public Customer getCustomer(String mail) {
		String query="SELECT * FROM CUSTOMER WHERE MAIL=?";
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setMail(rs.getString(3));
				c.setPhone(rs.getLong(4));
				c.setGender(rs.getString(5));
				c.setPassword(rs.getString(6));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}

	@Override
	public List getCustomer() {
		String query="SELECT * FROM CUSTOMER";
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Customer> customer=new ArrayList<Customer>();
		Customer c=null;
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				c=new Customer();
				c.setCustomer_id(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setMail(rs.getString(3));
				c.setPhone(rs.getLong(4));
				c.setGender(rs.getString(5));
				c.setPassword(rs.getString(6));
				customer.add(c);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return customer;
	}

}

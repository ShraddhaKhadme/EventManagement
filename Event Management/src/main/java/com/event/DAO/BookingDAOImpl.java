package com.event.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.event.DTO.Booking;
import com.event.database.DBConnection;

public class BookingDAOImpl implements BookingDAO{

	private Connection con=null;
	
	public BookingDAOImpl() {
		this.con=DBConnection.getConnection();
	}
	@Override
	public boolean addBooing(Booking b) {
		String query="INSERT INTO EVENT_ORDER(NAME,PHONE,LOCATION,EVENT_DATE,CATEGORY,DESCRIPTION) VALUES(?,?,?,?,?,?)";
		PreparedStatement ps=null;
		int res=0;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, b.getName());
			ps.setLong(2, b.getPhone());
			ps.setString(3, b.getLocation());
			ps.setString(4, b.getCategory_name());
			ps.setString(5, b.getDate());
			ps.setString(6, b.getDesc());
			
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
			return false;
		}
		
		
	}

	@Override
	public boolean deleteBooking(Booking b) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List getBookings() {
		// TODO Auto-generated method stub
		return null;
	}

}

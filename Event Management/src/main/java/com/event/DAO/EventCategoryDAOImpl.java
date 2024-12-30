package com.event.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.event.DTO.EventCategory;
import com.event.database.DBConnection;

public class EventCategoryDAOImpl implements EventCategoryDAO{

	private Connection con=null;
	
	public EventCategoryDAOImpl() {
		this.con=DBConnection.getConnection();
	}
	
	@Override
	public List getEventCategory() {
		String query = "SELECT * FROM EVENT_CATEGORY ORDER BY ID DESC";
		List<EventCategory> event = new ArrayList<EventCategory>();
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()){
				EventCategory e = new EventCategory();
				e.setCategory_id(1);
				e.setName(rs.getString(2));
				e.setImage(rs.getString(3));
				event.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return event;
	}

	@Override
	public EventCategory getById(int id) {
		String query = "SELECT * FROM EVENT_CATEGORY WHERE ID=?";
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				EventCategory e = new EventCategory();
				e.setCategory_id(1);
				e.setName(rs.getString(2));
				e.setImage(rs.getString(3));
				
				return e;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List getEventCategoryById(int categoryId) {
		String query = "SELECT * FROM EVENT_CATEGORY WHERE ID=?";
		List<EventCategory> event = new ArrayList<EventCategory>();
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, categoryId);

			rs = ps.executeQuery();
			while(rs.next()){
				EventCategory e = new EventCategory();
				e.setCategory_id(1);
				e.setName(rs.getString(2));
				e.setImage(rs.getString(3));
				event.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return event;
	}

	
	@Override
	public boolean AddCategory(EventCategory e) {
		PreparedStatement ps=null;
		int res=0;

		String query="INSERT INTO event_category (NAME,IMAGE) VALUES(?,?)";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, e.getName());
			ps.setString(2, e.getImage());
			res=ps.executeUpdate();
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return true;
		}
		else
		{
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}
	}
	@Override
	public boolean deleteCategory(String name) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		int res=0;
		String query="DELETE FROM EVENT_CATEGORY WHERE NAME=?";
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, name);
			
			rs=ps.executeQuery();
			
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

}

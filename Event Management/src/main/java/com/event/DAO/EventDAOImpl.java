package com.event.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.emp.DTO.Product;
import com.event.DTO.Events;
import com.event.database.DBConnection;

public class EventDAOImpl implements EventsDAO {

	private Connection con;
	
	public EventDAOImpl() {
		this.con=DBConnection.getConnection();
	}
	
	@Override
	public boolean addEvents(Events e1) {
		PreparedStatement ps=null;
		int res=0;

		String query="INSERT INTO EVENT(NAME,DESCRIPTION,LOCATION,DATE,IMAGE,CATEGORY_ID) VALUES(?,?,?,?,?,?)";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, e1.getEvent_name());
			ps.setString(2, e1.getDescription());
			ps.setString(3, e1.getLocation());
			ps.setString(4, e1.getDate());
			ps.setString(5, e1.getImage());
			ps.setInt(6, e1.getCategory_id());
			
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else
		{
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public boolean deleteEvents(Events e1) {
		PreparedStatement ps=null;
		int res=0;
		String query="DELETE FROM EVENT WHERE ID=?";
		try 
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setInt(1, e1.getEvent_id());
			res=ps.executeUpdate();
		} catch (SQLException e)
		{
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
		else
		{
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
	public Events getEventst(int id) {
		PreparedStatement ps=null;
		Events e1=null;
		ResultSet rs=null;
		String query="SELECT * FROM EVENT WHERE ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				e1=new Events();
				e1.setEvent_id(rs.getInt(1));
				e1.setEvent_name(rs.getString(2));
				e1.setDescription(rs.getString(3));
				e1.setLocation(rs.getString(4));
				e1.setDate(rs.getString(5));
				e1.setImage(rs.getString(6));
				e1.setCategory_id(rs.getInt(7));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return e1;
	}
	

	@Override
	public List getEvents() {
		ArrayList<Events>events=new ArrayList<Events>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Events e1=null;
		String query="SELECT * FROM EVENT ORDER BY ID DESC";
		try 
		{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				e1=new Events();
				e1.setEvent_id(rs.getInt(1));
				e1.setEvent_name(rs.getString(2));
				e1.setDescription(rs.getString(3));
				e1.setLocation(rs.getString(4));
				e1.setDate(rs.getString(5));
				e1.setImage(rs.getString(6));
				e1.setCategory_id(rs.getInt(7));
				events.add(e1);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return events;
	}

	@Override
	public List getAllEvents(int categoryId, int page, int limit) {
		List<Events> events=new ArrayList<Events>();
		ResultSet rs=null;
		Events e1=null;
		String query=null;
		int skip =  (page -1 ) * limit;
		if(categoryId !=-1)
		{
			query = "select * from event where category_ID = ? order by ID desc limit ? offset ?";
		}else {
			query = "select * from event  order by ID desc limit ? offset ?";
		}
		try 
		{
			PreparedStatement ps=con.prepareStatement(query);
			
			if(categoryId==-1)
			{
				ps.setInt(1, limit);
				ps.setInt(2, skip);
			}else {
				ps.setInt(1, categoryId);
				ps.setInt(2, limit);
				ps.setInt(3, skip);
			}
			
			rs=ps.executeQuery();
			while(rs.next())
			{
				e1=new Events();
				e1.setEvent_id(rs.getInt(1));
				e1.setEvent_name(rs.getString(2));
				e1.setDescription(rs.getString(3));
				e1.setLocation(rs.getString(4));
				e1.setDate(rs.getString(5));
				e1.setImage(rs.getString(6));
				e1.setCategory_id(rs.getInt(7));
				events.add(e1);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return events;
	}

	@Override
	public int getAllEventCount(int categoryId) {
		ResultSet rs=null;
		Events p=null;
		String query=null;
		if(categoryId !=-1)
		{
			query = "select COUNT(*) from event where category_ID = ? ";
		}else {
			query = "select COUNT(*) from event  ";
		}
		try 
		{
			PreparedStatement ps=con.prepareStatement(query);
			
			if(categoryId!=-1)
			{
				ps.setInt(1, categoryId);
			}
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Events> getSimilarEvents(Events p) {
		String query = "SELECT * FROM PRODUCT WHERE CATEGORY_ID=? AND ID!=? ORDER BY ID DESC LIMIT 10";
		List<Events> similarEvents = new ArrayList<Events>();
		
		try {
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, p.getCategory_id());
			preparedStatement.setInt(2, p.getEvent_id());
			ResultSet resultSet =  preparedStatement.executeQuery();
			while(resultSet.next())
			{
				Events newEvents = getEventst(resultSet.getInt(1));
				similarEvents.add(newEvents);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return similarEvents;
	}

	@Override
	public List<Events> getEventsAndCategorys() {
		 ArrayList<Events> events = new ArrayList<Events>();
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    Events e1 = null;
		    // Modify the query to join PRODUCT table with product_category table
		    String query = "SELECT e.ID, e.NAME, e.DISCRIPTION, e.LOCATION,e.DATE,e.IMAGE, e.CATEGORY_ ID,c.name AS category_name FROM Event e JOIN event_category c ON e.CATEGORY_ ID = c.CATEGORY_ ID";;
		    try {
		        ps = con.prepareStatement(query);
		        rs = ps.executeQuery();
		        while (rs.next()) {
		            e1 = new Events();
		            e1.setEvent_id(rs.getInt(1));
					e1.setEvent_name(rs.getString(2));
					e1.setDescription(rs.getString(3));
					e1.setLocation(rs.getString(4));
					e1.setDate(rs.getString(5));
					e1.setImage(rs.getString(6));
					e1.setCategory_id(rs.getInt(7));
					events.add(e1);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return events;
	}

}

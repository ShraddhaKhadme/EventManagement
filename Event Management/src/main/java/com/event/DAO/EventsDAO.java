package com.event.DAO;

import java.util.List;

import com.event.DTO.Events;

public interface EventsDAO {

	public boolean addEvents(Events e);
	public boolean deleteEvents(Events p);
	public Events getEventst(int id);
	public List getEvents();
	public int getAllEventCount(int categoryId);
	public List getAllEvents(int categoryId,int page,int limit);
	
	
	
	//To get Similar products 
	
	public List<Events> getSimilarEvents(Events p);
	List<Events> getEventsAndCategorys();
}

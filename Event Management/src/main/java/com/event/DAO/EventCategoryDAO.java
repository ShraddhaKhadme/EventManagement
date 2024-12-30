package com.event.DAO;

import java.util.List;

import com.event.DTO.EventCategory;

public interface EventCategoryDAO {

	 public List getEventCategory();
	 public EventCategory getById(int id);
	 public List getEventCategoryById(int categoryId);
	public boolean AddCategory(EventCategory p);
	public boolean deleteCategory(String name);
}

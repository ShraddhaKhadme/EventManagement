package com.event.DTO;

import java.sql.Date;

public class Events {

	int event_id;
	String event_name;
	String location;
	String date;
	String description;
	String image;
	
	
	int category_id;
	String category_name;
	
	
	public Events(int event_id, String event_name, String location, String date, String description, int category_id,
			String category_name) {
		super();
		this.event_id = event_id;
		this.event_name = event_name;
		this.location = location;
		this.date = date;
		this.description = description;
		this.category_id = category_id;
		this.category_name = category_name;
	}
	public Events() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Events [event_id=" + event_id + ", event_name=" + event_name + ", location=" + location + ", date="
				+ date + ", description=" + description + ", category_id=" + category_id + ", category_name="
				+ category_name + "]";
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}

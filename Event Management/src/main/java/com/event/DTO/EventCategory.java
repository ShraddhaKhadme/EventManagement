package com.event.DTO;

public class EventCategory {
	
	int category_id;
	String category_name;
	String image;
	
	public EventCategory(int category_id, String category_name, String image) {
		super();
		this.category_id = category_id;
		this.category_name = category_name;
		this.image = image;
	}
	
	public EventCategory() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "EventCategory [category_id=" + category_id + ", category_name=" + category_name + ", image=" + image
				+ "]";
	}

	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getName() {
		return category_name;
	}
	public void setName(String category_name) {
		this.category_name = category_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}

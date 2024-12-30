package com.event.DTO;

public class Booking {

	int booking_id;
	String name;
	long phone;
	String location;
	String date;
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	String Category_name;
	String desc;
	
	public Booking() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", name=" + name + ", phone=" + phone + ", location=" + location
				+ ", Category_name=" + Category_name + ", desc=" + desc + "]";
	}
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCategory_name() {
		return Category_name;
	}
	public void setCategory_name(String category_name) {
		Category_name = category_name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}

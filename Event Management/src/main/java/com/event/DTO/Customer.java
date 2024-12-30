package com.event.DTO;

import java.sql.Date;

public class Customer {

	int Customer_id;
	String name;
	long phone;
	String mail;
	String gender;
	String password;
	
	public Customer() {
		// TODO Auto-generated constructor stub
	}
	
	public Customer(int customer_id, String name, long phone, String mail, String gender, String password) {
		super();
		Customer_id = customer_id;
		this.name = name;
		this.phone = phone;
		this.mail = mail;
		this.gender = gender;
		this.password = password;
	}
	@Override
	public String toString() {
		return "Customer [Customer_id=" + Customer_id + ", name=" + name + ", phone=" + phone + ", mail=" + mail
				+ ", gender=" + gender + "]";
	}
	public int getCustomer_id() {
		return Customer_id;
	}
	public void setCustomer_id(int customer_id) {
		Customer_id = customer_id;
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
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}

package com.event.DAO;

import java.util.List;

import com.event.DTO.Customer;

public interface CustomerDAO {

	public boolean insertCustomer(Customer c);
	public boolean updateCustomer(Customer c);
	public boolean deleteCustomer(Customer c);
	
	public Customer getCustomer(int id);
	public Customer getCustomer(String mail, String password);
	public Customer getCustomer(String mail);
	public List getCustomer();
	
}

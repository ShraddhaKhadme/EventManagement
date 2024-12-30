package com.event.DAO;

import java.util.List;

import com.event.DTO.Booking;

public interface BookingDAO {

	public boolean addBooing(Booking b);
	public boolean deleteBooking(Booking b);
	public List getBookings();
}

package com.event.Servlet;

import java.io.IOException;

import com.event.DAO.BookingDAO;
import com.event.DAO.BookingDAOImpl;
import com.event.DTO.Booking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bookEvent")
public class BookEvent extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name	=req.getParameter("name");
		String phonee=req.getParameter("phone");
		String eventLocation = req.getParameter("eventLocation");
        String eventDate = req.getParameter("eventdate");
        String eventDesc = req.getParameter("eventDesc");
        String eventCategory = req.getParameter("eventCategory");
        
        
        HttpSession session=req.getSession(false);
        BookingDAO bdao=new BookingDAOImpl();
        Booking b=new Booking();
        
        if(b!=null) {
        	boolean res=bdao.addBooing(b);
        	if(res)
        	{
        		req.setAttribute("success", "Event Booked");
        		RequestDispatcher rd=req.getRequestDispatcher("book.jsp");
        		rd.forward(req, resp);
        	}
        	else {
        		req.setAttribute("failure", "Failed to  Book event");
        		RequestDispatcher rd=req.getRequestDispatcher("book.jsp");
        		rd.forward(req, resp);
        	}
        }
        else {
        	req.setAttribute("failure", "Failed to  Book event");
    		RequestDispatcher rd=req.getRequestDispatcher("book.jsp");
    		rd.forward(req, resp);
        }
        
        
        
		
	}
}

package com.event.Servlet;

import java.io.IOException;

import com.event.DAO.CustomerDAO;
import com.event.DAO.CustomerDAOImpl;
import com.event.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mail=req.getParameter("username");
		String password=req.getParameter("password");
		
		HttpSession session=req.getSession();
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(mail, password);
		
		if(c!=null)
		{
			if(c.getMail().equals(mail)&&c.getPassword().equals(password)) {
				
				if(c.getCustomer_id()==101)
				{
					session.setAttribute("customer", c);
					RequestDispatcher rd=req.getRequestDispatcher("admindashboard.jsp");
					rd.forward(req, resp);
				}
				else {
				session.setAttribute("customer", c);
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);
			}
			}
			else {
				req.setAttribute("failure", "invalid Credentials...");
				RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);
			}
			
		}
		else {
			req.setAttribute("failure", "invalid Credentials...");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}

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

@WebServlet("/register")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String mail=req.getParameter("email");
		String phoneno=req.getParameter("phone");
		long phone=Long.parseLong(phoneno);
		String gender=req.getParameter("gender");
		String pass=req.getParameter("password");
		String confirm=req.getParameter("confirm");
		
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer findCustomer=cdao.getCustomer(mail);
		
		if(findCustomer ==null && pass.equals(confirm))
		{
			Customer c=new Customer();
			c.setName(name);
			c.setMail(mail);
			c.setPhone(phone);
			c.setGender(gender);
			c.setPassword(pass);
			
			boolean res=cdao.insertCustomer(c);
			if(res)
			{
				req.setAttribute("success", "Registred Successfully..");
				RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
				rd.forward(req, resp);
				
			}else {
				req.setAttribute("failure", "Signup failed due to credential not valid");
				RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
				rd.forward(req, resp);
			}
		}else {
			req.setAttribute("failure", "Mail id Already exist");
			RequestDispatcher rd=req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);
			
		}
		
	}
}

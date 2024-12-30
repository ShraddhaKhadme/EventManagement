<%@page import="com.event.DAO.EventCategoryDAOImpl"%>
<%@page import="com.event.DTO.EventCategory"%>
<%@page import="com.event.DAO.EventCategoryDAO"%>
<%@page import="com.event.DTO.Events"%>
<%@page import="com.event.DAO.EventDAOImpl"%>
<%@page import="com.event.DAO.EventsDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.event.DAO.CustomerDAOImpl"%>
<%@page import="com.event.DAO.CustomerDAO"%>
<%@page import="com.event.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%CustomerDAO cdao=new CustomerDAOImpl();
    List<Customer> list=cdao.getCustomer();
    EventsDAO edao= new EventDAOImpl();
    List<Events> lst=edao.getEvents();
    EventCategoryDAO edao1= new EventCategoryDAOImpl();
    List<EventCategory> category=edao1.getEventCategory();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
	
	 .content {
            padding: 20px;
            margin-left:260px;
            margin-top:100px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .content h1{
        	text-align:center;
        }
        .content a{
            text-decoration: none;
        }
        .content a:hover{
            opacity: 0.8;
            
        }
        .content .row{
        	margin:30px;
        	margin-left:150px;
        	
        	
        }
       .card-body{
       		box-shadow: 0 -8px 4px 0 rgba(10, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 10, 0, 0.19);
       	
       }
       .card-body:hover{
        	box-shadow: 0 8px 12px 0 rgba(0, 0, 0, 0.2), 0 12px 30px 0 rgba(0, 0, 0, 0.19);
        	
       }
       
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%@include file="slidebar.jsp" %>


    <div class="content flex-grow-1" >
    <h1>Welcome to admin dashboard</h1>
            <div class="row mb-4 me-2" >
               <div class="col-md-3" >
               <a href="addAccounts.jsp">
                <div class="card text-center" >
                    <div class="card-body" style="background-color:white; color: black;border-radius: 10px ">
                        <h5 class="card-title">Total Accounts</h5><hr>
                        <p class="card-text fs-4"><%=list.size() %></p>
                    </div>
                </div></a>	
            </div>
                <div class="col-md-3">
                    <a href="viewAccounts.jsp">
                        <div class="card text-center">
                            <div class="card-body" style="background-color:white; color: black; border-radius: 10px">
                                <h5 class="card-title">Total Events</h5><hr>
                                <p class="card-text fs-4"><%=lst.size() %></p>
                            </div>
                        </div></a>
                </div>
                <div class="col-md-3">
                    <a href="viewTransaction.jsp"><div class="card text-center">
                        <div class="card-body" style="background-color:white; color: black;border-radius: 10px ">
                            <h5 class="card-title">Total Category</h5><hr>
                            <p class="card-text fs-4"><%=category.size() %></p>
                        </div>
                    </div></a>
                </div> 
            </div>
            </div>

    
</body>
</html>
    
<%@page import="java.util.Collections"%>
<%@page import="com.event.DTO.Events"%>
<%@page import="com.event.DAO.EventDAOImpl"%>
<%@page import="com.event.DAO.EventsDAO"%>
<%@page import="com.event.DTO.EventCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.event.DAO.EventCategoryDAOImpl"%>
<%@page import="com.event.DAO.EventCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Events</title>
<style>
.category{
	margin-top:80px;
	margin-left:280px;
}
.category-wrapper {
width: 100%;
margin: 10px auto;
padding: 20px;
}

.category-wrapper h2 {
margin-bottom: 10px;
font-weight: 400;
font-size: 1.5rem;
}

.category-items {
display: flex;
justify-content: flex-start;
align-items: flex-start;
flex-wrap: wrap;
margin-bottom:30px;
}

.category-card {
width: 300px;
height: 350px;
display: flex;
justify-content: center;
align-items: center;
text-decoration:none;
flex-direction: column;
margin: 20px;
flex-shrink: 0;
flex-grow: 0;
padding: 10px;
color:black;
border-radius: 5px;
box-shadow: 0px 1px 5px #efefef !important;
transition: 0.75s all;
}

.category-card:hover {
box-shadow: 0px 1px 5px gray !important;
cursor: pointer;
text-decoration:none;
color:black;
transform: scale(1.1);
}

.category-card img {
width: 100%;
height: 150px;
border-radius: 10px;
}

.category-card .category-title {
font-size: 1.2rem;
font-weight: 300;
margin-bottom: 0;

}
span{
	font-weight: bold;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%@include file="slidebar.jsp" %>

<div class="category">
        <h3>All Events</h3>
        <article class="category-items">
        
        <%EventsDAO edao=new EventDAOImpl();
        List<Events> events=edao.getEvents();
        Collections.reverse(events);%>
				<%
				for (Events es : events) {
				%>
				
				<a class="category-card" href="#">
					<img
					src="<%=es.getImage() %>"
					alt="">
					<h3 class="category-title mt-2"><span>Event Id: </span><%=es.getEvent_id() %></h3>
					<h2 class="category-title mt-3"><span>Event Name:</span> <%=es.getEvent_name()%></h2>
					<h2 class="category-title mt-3"><span>Event Location: </span><%=es.getLocation()%></h2>

				</a>

				<%}%>


			</article>
    </div>
</body>
</html>
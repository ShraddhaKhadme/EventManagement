<%@page import="com.event.DTO.EventCategory"%>
<%@page import="com.event.DTO.Events"%>
<%@page import="java.util.List"%>
<%@page import="com.event.DAO.EventCategoryDAOImpl"%>
<%@page import="com.event.DAO.EventCategoryDAO"%>
<%@page import="com.event.DAO.EventDAOImpl"%>
<%@page import="com.event.DAO.EventsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%request.setAttribute("menu","events");%>
    <% int selectedCategory = request.getParameter("category")!=null ? Integer.parseInt(request.getParameter("category"))  : -1;
	int currentPage = request.getParameter("page")!=null ? Integer.parseInt(request.getParameter("page"))  : 1;
	int limit = request.getParameter("limit")!=null ? Integer.parseInt(request.getParameter("limit"))  : 10;
	EventsDAO edao = new EventDAOImpl();
	EventCategoryDAO ecdao=new EventCategoryDAOImpl();
	
	List<Events> list=edao.getAllEvents(selectedCategory, currentPage, limit);
	List<EventCategory> clist=ecdao.getEventCategory();
	int totalEvents =edao.getAllEventCount(selectedCategory);
			
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<%@include file="/utils/CommonUtils.jsp" %>
<style type="text/css">

 .product-wrapper{
    margin-top: 10px;
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 10px;
	padding: 20px 5px;
	max-width: 1800px;
	margin: 0 auto;
 }
 .product-card {
  padding: 15px;
  background: #efefef6e;
  border-radius: 10px;
  cursor: pointer;
 }
 
 .product-card img{
   width: 100%;
   height: 250px;
   border-radius: 10px;
 }
 
 .category-section
 {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding: 5px 10px;
  gap:15px;
  width: 100%;
  overflow-x: auto;
  max-width: 1800px;
	margin: 10px auto;
 }
 
 .category-section::placeholder
 {
    width: 2px;
  }
 
 .category-tag{
  padding: 8px 8px;
  border-radius: 30px;
  border:1px solid #efefef !important;
  background: white;
  font-size: 0.8rem;
  cursor: pointer;
  color: black !important;
  white-space: nowrap;
  box-shadow: 0px 1px 4px gray !important;
  text-decoration:none;
 }
 
 .category-tag-acive{
  background: black;
  color: white !important;
 }
 
 .not-found{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 70vh;
 }
 .not-found  img{
  width: 200px;
  height: 200px;
 }
 
 .product-card .product-title{
  font-size: 1.2rem;
  font-weight: 400;
  margin-top: 10px;
 }
 
 .product-price{
  display: flex;
  justify-content: flex-start;
  align-items: center;
  gap:2px;
  font-size: 1.2rem;
  
 }
 .product-category{
  font-size: 0.9rem;
  font-weight: 400;
 }
 
  .view-btn{
   background: black;
   padding:5px;
   color: white !important;
  border-radius: 10px;
  border: none;
  }
  .cart-btn{
   color: black !important;
  }
  .card-footer{
   width: 100%;
   display: flex;
   justify-content: flex-end;
   gap:5px;
   align-items: center;
  }


</style>

</head>
<body>
<%@include file="header.jsp" %>
	 <article class="category-section">
     
      <a class="category-tag <%=selectedCategory == -1 ? "category-tag-acive" :"" %>" href="<%= request.getContextPath()+"/events.jsp?category=-1&page=1&limit=10"%>">All Events</a>
      
         
         
  </article>
  
  <%
    if(totalEvents ==0)
    {
     %>
        <div class="not-found">
           <img alt="not-found" src="https://img.freepik.com/free-photo/cute-puppy-cartoon-ai-generated-image_268835-6476.jpg">
          <p>No product Found</p>
        </div>
     <% } else{%> 
    
    	  <section class="product-wrapper">
    	      
    	      <%for(Events p:list){
    	    	  EventCategory pc = ecdao.getById(p.getCategory_id());%>
    	    		 
    	      	       
    	      	       <article class="product-card" onclick="handleProductCardClick('<%= request.getContextPath()+"/eventsItem.jsp?productId="+p.getEvent_id() %>')" >
    	      	          
    	      	          <img alt="" src="<%= p.getImage()%>">
    	      	          <h3 class="product-title"><%=p.getEvent_name() %></h3>
    	      	        <!--  <h3 class="product-price"><%=p.getLocation() %></h3>--> 
    	      	          <h4 class="product-category mb-3">Category : <%=pc.getName() %></h4>
    	      	       <!--   <h4 class="product-category">Event Date : <%=p.getDate() %></h4>--> 
    	      	           <a class="view-btn" href="<%= request.getContextPath()+"/eventsItem.jsp?productId="+p.getEvent_id()%>">View Details</a>
    	      	          
    	      	           
    	      	       </article>
    	      	       <%}%>
    	      </section>
    	       <%}%>    	 
</body>
</html>
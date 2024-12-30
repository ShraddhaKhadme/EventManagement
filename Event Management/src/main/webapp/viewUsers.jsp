<%@page import="java.util.Iterator"%>
<%@page import="com.event.DTO.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.DAO.CustomerDAOImpl"%>
<%@page import="com.event.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style type="text/css">

.users{
	margin-top:100px;
	margin-left:270px;
	margin-right:20px;
	
}
.users a{
	font-size:16px;
}
.table thead th{
	text-align:center;
}
.table tbody td{
	background-color:snow;
}
        
        
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<%@include file="slidebar.jsp" %>
<div class="users">

		<h3>Transaction Details</h3>
		<table class="table table-bordered table-primary">
			<thead>
				<th>#<%int count=1; %></th>
				<th>Customer Id</th>
				<th>Customer Name</th>
				<th>Phone Number</th>
				<th>Mail Id</th>
				<th>Gender</th>
				<th colspan="2">Action</th>
				
			</thead>
			<tbody>
			<%CustomerDAO cdao=new CustomerDAOImpl();
			ArrayList<Customer> list=(ArrayList<Customer>)cdao.getCustomer();
			Iterator<Customer> it=list.iterator();%>
			<% while(it.hasNext()) {
			Customer c1=it.next();%>
				<tr>
					<td><%=count++ %></td>
					<td><%=c1.getCustomer_id() %></td>
					<td><%=c1.getName() %></td>
					<td><%=c1.getPhone() %></td>
					<td><%=c1.getMail()%></td>
					<td><%=c1.getGender()%></td>
					<td>
					
					<form action="delete" method="post" class="delete">
           			 <input type="hidden" name="id" value="<%= c1.getCustomer_id()%>">
            		<input type="submit" name="delete" value="Delete" class="btn btn-danger btn-lg">
       			 </form>
					</td>
					
				</tr>
				<% }%>
				
			</tbody>
		</table>
	</div>
	
	<script>
    <% if (request.getAttribute("success") != null) { 
        String message = (String) request.getAttribute("success");
        request.removeAttribute("success");
    %>
    Swal.fire({
        icon: "success",
        title: "success...!",
        text: "<%= message %>"
    });
    <% } %>
    
    <% if (request.getAttribute("failure") != null) { 
        String message = (String) request.getAttribute("failure");
        request.removeAttribute("failure");
    %>
    Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "<%= message %>"
    });
    <% } %>
    </script>

</body>
</html>
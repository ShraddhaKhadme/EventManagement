<%@page import="java.util.Collections"%>
<%@page import="com.event.DTO.EventCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.event.DAO.EventCategoryDAOImpl"%>
<%@page import="com.event.DAO.EventCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
  EventCategoryDAO eventCategoryDAO= new EventCategoryDAOImpl();
  List<EventCategory> pc = eventCategoryDAO.getEventCategory();
  Collections.reverse(pc);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .content {
            padding: 20px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="content flex-grow-1">
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Add New Event</div>
                        <div class="card-body">
                            <form method="post" action="<%= request.getContextPath()+"/event"%>" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="productName" class="form-label">Event Name</label>
                                    <input type="text" class="form-control" name="eventName" id="name" placeholder="Enter Event Name">
                                </div>
                                <div class="mb-3">
                                    <label for="productPrice" class="form-label">Event Location</label>
                                    <input type="text" class="form-control" name="eventLocation" placeholder="Enter Event Location">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="productPrice" class="form-label">Event Date</label>
                                    <input type="datetime-local" class="form-control" name="eventdate"  placeholder="Enter Event Date">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="productCategory" class="form-label">Category</label>
                                    <select class="form-select" name="eventCategory" id="eventCategory">
                                        <option value="">Select Category</option>
                                        <%
                                         for(EventCategory eventCategory :pc)
                                         {
                                        	 %>
                                        	  <option value="<%=eventCategory.getCategory_id()%>"><%=eventCategory.getName() %></option>
                                        	 <% }%>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="productDesc" class="form-label">Event Description</label>
                                    <input type="text" class="form-control" placeholder="Enter Event Description" name="eventDesc" id="eventDesc">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="productImage" class="form-label">Event Image</label>
                                    <input type="file" class="form-control" name="eventImg" id="eventImage">
                                </div>
                               
                                <div class="form-actions">
                                    <button type="submit" class="btn btn-success">Add Event</button>
                                    <a href="admindashboard.jsp" class="btn btn-secondary" style="margin-top: 10px">Back to Dashboard</a>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
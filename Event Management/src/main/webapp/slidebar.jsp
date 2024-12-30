<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
            display: flex;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: #fff;
            display: flex;
            flex-direction: column;
            position: fixed;
            top:62px;
            height: 100%;
            overflow-y: auto;
            z-index: 1000;
        }

        .sidebar a {
            color: #ddd;
            padding: 10px 20px;
            text-decoration: none;
            display: block;
            font-size:20px;
        }

        .sidebar a:hover {
            background-color: #495057;
            color: white;
        }

        .sidebar .dropdown-menu {
            background-color: #343a40;
            padding-left: 20px;
        }

        .sidebar .dropdown-menu a {
            color: #ddd;
        }

        .sidebar .dropdown-menu a:hover {
            background-color: #495057;
        }

       

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: static;
            }

            .content {
                margin-left: 0;
            }
        }
</style>
</head>
<body>
<!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center mt-3">Admin Panel</h4>
        <a href="admindashboard.jsp">Dashboard</a>
        <div class="dropdown">
            <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">Events</a>
            <ul class="dropdown-menu ms-4">
            
            <li><a class="dropdown-item" href="addEvents.jsp">Add Events</a></li>
                <li><a class="dropdown-item" href="deleteEvent.jsp">Delete Events</a></li>
                <li><a class="dropdown-item" href="viewEvents.jsp">View Events</a></li>
                <li><a class="dropdown-item" href="#">View Booked Event</a></li>
                
            </ul>
        </div>
        <div class="dropdown">
            <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">Event Category</a>
            <ul class="dropdown-menu ms-4">
                <li><a class="dropdown-item" href="addCategory.jsp">Add Category</a></li>
                <li><a class="dropdown-item" href="ViewCategories.jsp">View All Categories</a></li>
            </ul>
        </div>
        <a href="viewUsers.jsp">View Users</a>
    </div>
</body>
</html>
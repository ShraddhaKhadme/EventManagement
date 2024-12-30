<%@page import="com.event.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
/* Navbar Styles */
        .navbar {
            z-index: 1000;
            position: fixed;
            width: 100%;
            top: 0;
        }
        .navbar a{
        	 font-size:20px;
        }
</style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Event Management</a>
            <div class="ms-auto">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="adminMenu" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Welcome, <%=c.getName() %>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="adminMenu">
                            <li><a class="dropdown-item" href="viewProfile.jsp">View Profile</a></li>
                            <li class="dropdown-item">
                        	<form action="logout" method="post">
                        	<input type="submit" name="logout" id="logout" value="Logout" class="btn btn-outline-danger logout-btn">
                        </form>
                    </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Logout Functionality -->
    <script>
    
    $(document).ready(function () {
        $('#logout').click(function (e) {
            e.preventDefault();
            Swal.fire({
                title: 'Are you sure?',
                text: 'You will be logged out!',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Logout',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "login.jsp";
                    
                }
            });
        });
    });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
</body>
</html>
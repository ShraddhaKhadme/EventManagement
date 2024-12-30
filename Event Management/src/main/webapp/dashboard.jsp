<%@page import="com.event.DTO.EventCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.event.DAO.EventCategoryDAOImpl"%>
<%@page import="com.event.DAO.EventCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management</title>
    <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-custom {
            background-color: #343a40;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: #ffffff;
            font-size: 20px;;
            margin-right: 10px;
        }

        .navbar-nav .logout-btn {
            cursor: pointer;
            margin: 5px;
        }

        .carousel-inner img {
            width: 100%;
            height: 400px;
            border-radius: 5px;
           
        }
        .dashboard-container {
            padding: 20px;
        }
        .category{
        	margin:20px;
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
	width: 180px;
	height: 180px;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration:none;
	flex-direction: column;
	margin: 10px;
	flex-shrink: 0;
	flex-grow: 0;
	padding: 5px;
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
	height: 100px;
	border-radius: 10px;
}

.category-card .category-title {
	font-size: 1.2rem;
	font-weight: 300;
	margin-bottom: 0;
	
}
.offer{
	width: 100%;	
	background-size:cover;
}
.offer1{
	width: 100%;	
	height:70vh;
	background-size:cover;
}

@media ( max-width :600px) {
	.info-wrapper {
		width: 95%;
		height: 400px;
	}
	.card {
		height: 400px;
	}
}
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="header.jsp" %>


    <div class="dashboard-container">
        
        <div id="imageCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
            
            <ul class="carousel-indicators">
                <li data-target="#imageCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#imageCarousel" data-slide-to="1"></li>
                <li data-target="#imageCarousel" data-slide-to="2"></li>
                <li data-target="#imageCarousel" data-slide-to="3"></li>
            </ul>

            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="assets/image1.jpeg" alt="Image 1">
                
                </div>
                <div class="carousel-item">
                    <img src="assets/image2.jpeg" alt="Image 2">
                   
                </div>
                <div class="carousel-item">
                    <img src="assets/image3.jpg" alt="Image 3">
                    
                </div>
                <div class="carousel-item">
                    <img src="assets/image4.jpg" alt="Image 4">
                    
                </div>
            </div>

            <a class="carousel-control-prev" href="#imageCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#imageCarousel" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>


    <div class="category">
        <h3>Featured Categories</h3>
        <article class="category-items">
        
        <%EventCategoryDAO edao=new EventCategoryDAOImpl();
        List<EventCategory> categories=edao.getEventCategory();%>
				<%
				for (EventCategory pc : categories) {
				%>
				<a class="category-card" href="<%=request.getContextPath() + "/events.jsp?category=" + pc.getCategory_id()%>">

					<img
					src="<%=pc.getImage() %>"
					alt="">
					<h2 class="category-title mt-1"><%=pc.getName()%></h2>

				</a>

				<%}%>


			</article>
    </div>
    
</body>
</html>

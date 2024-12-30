<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>

.content {
            padding: 20px;
            background-color: #f8f9fa;
            margin-top: 65px;
			margin-left: 260px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="slidebar.jsp"%>

	<div class="content flex-grow-1">
		<div class="row mb-4">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-primary text-white">Delete Event</div>
				

					<div class="card-body">
						<form action="deleteEvent" method="post" class="delete">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Event
									Id</label> 
								<input type="text" class="form-control" name="id"
									id="id" aria-describedby="emailHelp"
									placeholder="Enter Event Id to Delete">
							</div>

							<button type="submit" class="btn btn-danger">Delete Event</button>
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
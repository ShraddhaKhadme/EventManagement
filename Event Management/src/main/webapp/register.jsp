<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register User</title>
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
    
    <style>
        body {
            background-color: #4DA1A9;
            
        }

        .register-container {
            max-width: 40%;
            margin: 10px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .error {
            color: red;
            font-size: 0.85em;
        }

        @media (max-width: 576px) {
            .register-container {
                margin-top: 20px;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h3 class="text-center mb-3">Register Here</h3>
        
        <form id="signupForm" action="register" method="post">
            <div class="mb-2">
                <label for="username" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="mb-2">
                <label for="username" class="form-label">Email Id:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email ID" required>
                <span id="emailError" class="error"></span>
            </div>
            <div class="mb-2">
                <label for="username" class="form-label">Phone Number:</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                <span id="phoneError" class="error"></span>
            </div>
            <div class="mb-2">
                <label for="username" class="form-label">Gender:</label>
                <input type="text" class="form-control" id="username" name="gender" placeholder="Enter your gender" required>
                
            </div>

            <div class="mb-2">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                <span id="passwordError" class="error"></span>
            </div>
            <div class="mb-2">
                <label for="password" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirm" placeholder="Re-Enter your password" required>
                <span id="confirmPasswordError" class="error"></span>
            </div>
            <center><button type="submit" class="btn btn-primary">Register</button></center>
            <p class="text-center mt-2">Already have an Account? <a href="login.jsp"> Login Here</a></p>
        </form>
    </div>
    
    
    <!-- Form Validation Script -->
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
    
        $(document).ready(function () {
            $("#signupForm").on("submit", function (e) {
                let isValid = true;

                // Validate Email
                const email = $("#email").val();
                const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                if (!emailPattern.test(email)) {
                    $("#emailError").text("Please enter a valid email address.");
                    isValid = false;
                } else {
                    $("#emailError").text("");
                }

                // Validate Phone
                const phone = $("#phone").val();
                const phonePattern = /^[0-9]{10}$/;
                if (!phonePattern.test(phone)) {
                    $("#phoneError").text("Please enter a valid 10-digit phone number.");
                    isValid = false;
                } else {
                    $("#phoneError").text("");
                }

                // Validate Password
                const password = $("#password").val();
                const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                if (!passwordPattern.test(password)) {
                    $("#passwordError").text("Password must be at least 8 characters and include letters, digits, and a special character.");
                    isValid = false;
                } else {
                    $("#passwordError").text("");
                }

                // Validate Confirm Password
                const confirmPassword = $("#confirmPassword").val();
                if (password !== confirmPassword) {
                    $("#confirmPasswordError").text("Passwords do not match.");
                    isValid = false;
                } else {
                    $("#confirmPasswordError").text("");
                }

                if (!isValid) {
                    e.preventDefault(); // Prevent form submission
                }
            });
        });
    </script>
</body>
</html>

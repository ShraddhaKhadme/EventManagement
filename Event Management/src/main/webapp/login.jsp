<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
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
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #4DA1A9;
            
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .error {
            color: red;
            font-size: 0.85em;
        }

        @media (max-width: 576px) {
            .login-container {
                margin-top: 20px;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center mb-4">Login</h2>
        <form id="loginForm" action="login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Email/User ID</label>
                <input type="email" class="form-control" id="username" name="username" placeholder="Enter your email or user ID" required>
                <span id="usernameError" class="error"></span>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                <span id="passwordError" class="error"></span>
            </div>
            <p class="text-end"><a href="fogotPassword.jsp">ForgotPassword?</a></p>
        <center><button type="submit" class="btn btn-primary w-50">Login</button></center>
        </form>
        <p class="text-center mt-2">Don't have an Account? <a href="register.jsp"> Register Now</a></p>
    </div>

    <!-- Form Validation Script -->
    <script>
    
    
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
            $("#loginForm").on("submit", function (e) {
                let isValid = true;

                // Validate Username
                const username = $("#username").val();
                if (!username) {
                    $("#usernameError").text("Username is required.");
                    isValid = false;
                } else {
                    $("#usernameError").text("");
                }

                // Validate Password
                const password = $("#password").val();
                if (!password) {
                    $("#passwordError").text("Password is required.");
                    isValid = false;
                } else {
                    $("#passwordError").text("");
                }

                if (!isValid) {
                    e.preventDefault(); // Prevent form submission
                }
            });
        });
    </script>
</body>
</html>

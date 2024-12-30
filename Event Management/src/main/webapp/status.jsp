<%@page import="com.event.DTO.Events"%>
<%@page import="com.event.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .task-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .progress-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<%Customer c=(Customer)session.getAttribute("customer"); 
Events e=new Events();%>
    <div class="container my-5">
        <h1 class="text-center">Task Tracker</h1>
        <div id="taskList">
            <div class="task-row">
                <div>
                    <strong>Birthday Party</strong><br>
                    <span>Deadline: 2024-12-31</span>
                </div>
                <span class="badge bg-warning">Pending</span>
            </div>
            <div class="task-row">
                <div>
                    <strong>Destination Wedding</strong> <br>
                    <span>Deadline: 2025-01-03</span>
                </div>
                <span class="badge bg-success">Completed</span>
            </div>
            
        </div>

        <div class="progress-container">
            <label for="progressBar" class="form-label">Task Completion</label>
            <div class="progress">
                <div class="progress-bar" id="progressBar" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
            </div>
        </div>
    </div>

    <script>
        // Calculate task completion percentage dynamically
        const taskRows = document.querySelectorAll('.task-row');
        const completedTasks = document.querySelectorAll('.badge.bg-success');
        const progressBar = document.getElementById('progressBar');

        const totalTasks = taskRows.length;
        const completedCount = completedTasks.length;
        const completionPercentage = Math.round((completedCount / totalTasks) * 100);

        progressBar.style.width = ${completionPercentage}%;
        progressBar.setAttribute('aria-valuenow', completionPercentage);
        progressBar.textContent = ${completionPercentage}%;
    </script>
</body>
</html>
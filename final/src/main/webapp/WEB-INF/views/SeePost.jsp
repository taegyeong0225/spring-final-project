<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Post</title>
    <!-- Include Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Arial', sans-serif;
        }
        .table {
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table td {
            vertical-align: middle;
        }
        .btn-custom {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .comment-section {
            margin-top: 30px;
        }
        .comment {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #e9ecef;
            border-radius: 5px;
        }
        .comment p {
            margin: 0;
        }
    </style>
</head>
<body>
<!-- Include the navigation bar -->
<%@ include file="nav.jsp"%>

<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <!-- Table to display the post details -->
            <table class="table table-striped text-center">
                <thead>
                    <tr>
                        <!-- Table header for the post view -->
                        <th colspan="3">Post Details</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 20%">Title</td>
                        <!-- Display the title of the post -->
                        <td colspan="2">${boardDataBean.title}</td>
                    </tr>
                    <tr>
                        <td>Author</td>
                        <!-- Display the userId of the post author -->
                        <td colspan="2">${boardDataBean.userId}</td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <!-- Display the content of the post -->
                        <td colspan="2" class="text-left" style="min-height: 200px;">${boardDataBean.content}</td>
                    </tr>
                </tbody>
            </table>
            
            <!-- Buttons for additional actions (back to list, edit, delete) -->
            <div class="d-flex justify-content-end mt-3">
                <!-- Button to go back to the list of posts -->
                <a href="${pageContext.request.contextPath}/${boardDataBean.category}" class="btn btn-secondary btn-sm me-2">Back to Posts</a>
                <!-- Button to edit the current post -->
                <a href="${pageContext.request.contextPath}/editPost?boardId=${boardDataBean.boardId}&category=${boardDataBean.category}" class="btn btn-primary btn-sm me-2">Edit</a>
                <!-- Button to delete the current post -->
                <a href="${pageContext.request.contextPath}/deletePost?boardId=${boardDataBean.boardId}&category=${boardDataBean.category}" class="btn btn-danger btn-sm">Delete</a>
            </div>
    
                
             
            </div>
        </div>
    </div>
<!-- Include Bootstrap JS for interactive components -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>




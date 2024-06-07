<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 50px;
        }
        h2 {
            color: #343a40;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
<%@ include file="nav.jsp"%>

<!-- Container for the edit post form -->
<div class="container">
    <h2>Edit Post</h2>
    
    <!-- Form for updating the post -->
    <form action="${pageContext.request.contextPath}/${boardDataBean.category}/updatePost" method="post">
        <!-- Hidden fields to store boardId and category -->
        <input type="hidden" name="boardId" value="${boardDataBean.boardId}">
        <input type="hidden" name="category" value="${boardDataBean.category}">
        
        <!-- Input field for the post title -->
        <div class="mb-3">
            <label for="postTitle" class="form-label">Title</label>
            <input type="text" class="form-control" id="postTitle" name="title" value="${boardDataBean.title}" required>
        </div>
        
        <!-- Textarea for the post content -->
        <div class="mb-3">
            <label for="postContent" class="form-label">Content</label>
            <textarea class="form-control" id="postContent" name="content" rows="5" required>${boardDataBean.content}</textarea>
        </div>
        
        <!-- Buttons for updating or deleting the post -->
        <c:if test="${sessionScope.userID eq boardDataBean.userId}">
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Update</button>
                <!-- Delete Button with confirmation dialog -->
                <a href="${pageContext.request.contextPath}/deletePost?boardId=${boardDataBean.boardId}&category=${boardDataBean.category}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this post?');">Delete</a>
            </div>
        </c:if>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

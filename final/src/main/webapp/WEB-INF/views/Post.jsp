<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="nav.jsp"%>

<div class="container mt-5">
    <h1>Create a new post in <c:out value="${category}"/></h1>
    <form action="${pageContext.request.contextPath}/submitPost" method="post">
        <input type="hidden" name="category" value="${category}" />
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Content</label>
            <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
        </div>
        <div class="mb-3">
            <label for="userID" class="form-label">User ID</label>
            <input type="text" class="form-control" id="userID" value="${sessionScope.userID}" disabled>
            <input type="hidden" name="userID" value="${sessionScope.userID}">
        </div>
        <button type="submit" class="btn btn-danger">Save</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

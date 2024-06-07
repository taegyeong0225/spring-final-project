<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>
</head>
<%@ include file="../nav.jsp" %>
<body>
<div class="container mt-5">
  <div class="card">
    <div class="card-header">
      <h3>My Profile</h3>
    </div>
    <div class="card-body">
      <p><strong>User ID:</strong> ${sessionScope.userID}</p>
      <p><strong>Nickname:</strong> ${sessionScope.nickname}</p>
      <p><strong>Is Manager:</strong> 
	    <c:choose>
	        <c:when test="${sessionScope.isManager eq 'Y'}">Yes</c:when>
	        <c:otherwise>No</c:otherwise>
	    </c:choose>
	  </p>
      <hr>
      <h4>My Posts</h4>
      <c:forEach var="post" items="${userPosts}">
        <div class="card mb-3">
          <div class="card-body">
            <h5 class="card-title">${post.title}</h5>
            <p class="card-text">${post.content}</p>
          </div>
        </div>
      </c:forEach>
    </div>
    <div class="card-footer">
      <a href="editProfile" class="btn btn-primary">Edit Profile</a>
    </div>
  </div>
</div>
</body>
</html>

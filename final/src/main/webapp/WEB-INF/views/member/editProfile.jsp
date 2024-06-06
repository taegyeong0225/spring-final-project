<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>
</head>
<%@ include file="../nav.jsp"%>
<body>
<div class="container mt-5">
  <div class="card">
    <div class="card-header">
      <h3>Edit Profile</h3>
    </div>
    <div class="card-body">
      <form action="editProfile" method="post">
        <div class="mb-3">
          <label for="userID" class="form-label">User ID</label>
          <input type="text" class="form-control" id="userID" name="userID" value="${member.userID}" disabled>
          <input type="hidden" name="userID" value="${sessionScope.userID}">
        </div>
        <div class="mb-3">
          <label for="password" class="form-label">Password</label>
          <input type="password" class="form-control" id="password" name="password" value="${member.password}" required>
        </div>
        <div class="mb-3">
          <label for="nickname" class="form-label">Nickname</label>
          <input type="text" class="form-control" id="nickname" name="nickname" value="${member.nickname}" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Changes</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
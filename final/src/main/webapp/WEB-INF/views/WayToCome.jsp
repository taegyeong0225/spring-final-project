<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Way to Come</title>
    <style>
        /* Title styling */
        h3 {
            font-family: 'Raleway', sans-serif;
            font-size: 3rem;
            color:orange;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1), 
                         4px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            
        }

        /* Container styling */
        .container {
            text-align: center;
            margin-top: 30px;
        }

        /* Image styling */
        .map-image {
            width: 80%;
            height: auto;
            border: 5px solid #ddd;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
           
        }

        /* Link styling */
        .link-container {
            margin-top: 20px;
        }

        .cool-link {
            font-family: 'Raleway', sans-serif;
            font-size: 1.5rem;
            color: #20b2aa;
            text-decoration: none;
            border: 2px solid #20b2aa;
            padding: 10px 20px;
            transition: all 0.3s;
        }

        .cool-link:hover {
            background-color: #20b2aa;
            color: white;
        }
    </style>
</head>
<body>
<%@ include file="nav.jsp" %>
<div class="h3">
<h3>인하공업전문대학교 맵입니다 </h3>
 </div>
<div class="container">
    <img src="https://i.namu.wiki/i/-SVYXi5Dx0yP1DisaVWbfoGUJVTpIPAPDFFLVdlqwtH2vMJuT5FYpvei0LYAvyjtCCM24d2RfBo8iwc2xoyz_Q.webp" alt="3D Map" class="map-image">
    <div class="link-container">
        <a href="https://map.naver.com/p/entry/place/11591448?c=15.00,0,0,0,dh" class="cool-link">naver map search</a>
    </div>
</div>
<div class="container mt-5">
    <!-- Post list in card format -->
    <div class="mt-4">
        <c:choose>
            <c:when test="${not empty boardList}">
            	<a href="${pageContext.request.contextPath}/Post?category=${category}" class="btn btn-success mt-3">Create your post</a>
                <div class="row">
                    <c:forEach var="board" items="${boardList}">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">${board.title}</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">Posted by ${board.userId}</h6>
                                    <p class="card-text">${board.content}</p>
                                    <!-- "See More" button -->
                                    <a href="${pageContext.request.contextPath}/editPost?boardId=${board.boardId}&category=${category}" class="btn btn-outline-secondary">See More</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info text-center" role="alert">
                    <h4>No posts available.</h4>
                    <p>Be the first to share something amazing!</p>
                    <a href="${pageContext.request.contextPath}/Post?category=${category}" class="btn btn-success mt-3">Create your first post</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><c:out value="${category}" /></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f8f9fa, #e0e0e0);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        h1 {
            color: #343a40;
            animation: fadeInDown 1s;
        }
        .card {
            margin-bottom: 20px;
            animation: fadeInUp 1s;
        }
        .btn-outline-secondary {
            animation: bounceIn 1.5s;
        }
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes bounceIn {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-30px);
            }
            60% {
                transform: translateY(-15px);
            }
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<%@ include file="nav.jsp"%>

<div class="container mt-5">
    <h1 class="text-center mb-4"><c:out value="${category}" /></h1>

    <!-- Post list in card format -->
    <div class="mt-4">
        <c:choose>
            <c:when test="${not empty boardList}">
                <!-- 관리자일 경우에만 작성 버튼을 표시 -->
    			<c:if test="${sessionScope.isManager eq 'Y'}">
        			<a href="${pageContext.request.contextPath}/Post?category=${category}" class="btn btn-success mt-3">Create your post</a>
    			</c:if>
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
                    <c:if test="${isManager == 'Y'}">
                    	<a href="${pageContext.request.contextPath}/Post?category=${category}" class="btn btn-success mt-3">Create your first post</a>
    				</c:if>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

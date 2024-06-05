<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>
<style>
/* Include Google Font for a modern appearance */
@import url('https://fonts.googleapis.com/css2?family=Raleway:wght@900&display=swap');

/* Set a light background color for the entire page */
body {
  background-color: #f8f9fa;
  margin: 0;
  padding: 0;
  height: 100vh;
  overflow: hidden;
  position: relative;
}

/* Animation for welcome text */
@keyframes fadeInText {
  0% {
    opacity: 0;
    transform: translate(-50%, -50%) translateY(20px);
  }
  100% {
    opacity: 1;
    transform: translate(-50%, -50%) translateY(0);
  }
}

.welcome-text {
  font-family: 'Raleway', sans-serif;
  font-size: 9rem;
  color: #ff8c00;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1),
               4px 4px 8px rgba(0, 0, 0, 0.1);
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  animation: fadeInText 1s ease-in-out;
  z-index: -1;
  text-align: center;
  width: 100%;
  user-select: none;
  pointer-events: none;
}

/* Navbar Brand Animation */
@keyframes bounce {
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

.navbar-brand {
  animation: bounce 2s infinite;
  color: orange;
  font-weight: bold;
  transition: color 0.3s;
}

.navbar-brand:hover {
  color: #20b2aa;
}

/* Dropdown Menu Animation */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.dropdown-menu {
  animation: fadeIn 0.5s;
  display: none; /* Initially hide the dropdown */
}

.nav-item:hover .dropdown-menu {
  display: block; /* Show the dropdown on hover */
}

/* Button Animation */
@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
  }
}

.nav-link {
  position: relative;
  overflow: hidden;
}

.nav-link::before {
  content: "";
  position: absolute;
  background-color: rgba(255, 99, 71, 0.5);
  width: 100%;
  height: 100%;
  top: 0;
  left: -100%;
  transition: left 0.3s;
}

.nav-link:hover::before {
  left: 0;
}

.nav-link:hover {
  animation: pulse 1s infinite;
  color: #20b2aa;
}
</style>
</head>
<body>
<!------------ Navigation bar start ---------->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/ServerProgramming/">CampusBuzz</a> 
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	      <ul class="navbar-nav">
	      
	      	<!------------ Department Information Dropdown ---------->
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            학과안내
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="departmentIntrodunction">학과소개</a></li>
	            <li><a class="dropdown-item" href="departmentHistory">학과연혁</a></li>
	          </ul>
	        </li>
	        
	        <!------------ Curriculum Dropdown ---------->
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            교과과정
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="firstYear">1학년</a></li>
	            <li><a class="dropdown-item" href="secondYear">2학년</a></li>
	            <li><a class="dropdown-item" href="thirdYear">3학년</a></li>
	            <li><a class="dropdown-item" href="advancedMajor">전공심화</a></li>
	          </ul>
	        </li>
	        
	        <!------------ Community Dropdown ---------->
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            커뮤니티
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="notification">공지사항</a></li>
	            <li><a class="dropdown-item" href="FrequentlyAskedQuestions">FAQ</a></li>
	            <li><a class="dropdown-item" href="FreeBoard">자유게시판</a></li>
	          </ul>
	        </li>
	        
	        <!------------ Directions Link ---------->
	        <li class="nav-item">
          		<a class="nav-link active" aria-current="page" href="WayToCome">오시는 길</a>
        	</li>
        	
        	<!------------ login button ------------>

        	<li class="nav-item">
        		<a class="btn btn-outline-darky" href="login" role="button">LOGIN</a>
			</li>
	      </ul>
	    </div>
	  </div>
	</nav>



</body>
</html>

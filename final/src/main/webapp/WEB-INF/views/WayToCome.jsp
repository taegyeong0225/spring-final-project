<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 1. CSS    webapp/resources/css 가 CSS의 디폴트 경로.  -->
<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />  

<!-- 2. Jquery    jquery 라이브러리 불러들이기 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 3. 번들 -->
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="container">
<a href="${pageContext.request.contextPath}/AddPet/AddPet">온라인 입소 신청하러 가기</a>
<br>
<a href="${pageContext.request.contextPath}/home">페이지</a>
</div>
</body>
</html>
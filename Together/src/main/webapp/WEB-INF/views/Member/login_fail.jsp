<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

if (${result}){
	alert("로그인 성공하였습니다!");
	location.href="/index";
	
} else {
	alert("아이디 혹은 비밀번호를 확인하세요");
	location.href="/Member/loginForm";
}
	
</script>
</body>
</html>
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
<script type="text/javascript">
	var flag=confirm("아이디 혹은 비밀번호를 확인하세요");
	
	if(flag){
		location.href="${pageContext.request.contextPath}/Member/loginForm"
	}
	location.href="${pageContext.request.contextPath}/Member/loginForm"
</script>
</body>
</html>
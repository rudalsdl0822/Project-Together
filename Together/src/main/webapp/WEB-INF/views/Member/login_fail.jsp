<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var flag=confirm("���̵� Ȥ�� ��й�ȣ�� Ȯ���ϼ���");
	
	if(flag){
		location.href="${pageContext.request.contextPath}/Member/loginForm"
	}
	location.href="${pageContext.request.contextPath}/Member/loginForm"
</script>
</body>
</html>
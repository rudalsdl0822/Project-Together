<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>  
	<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 


	<title>Together | 로그인</title>

		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">



<section id="nino-happyClient">
    	<!-- <div class="container">
    	
			
				
			
	<!-- Footer ================================================== -->
	<footer id="footer" style="background: none;">
        <div class="container">
        	<div class="row">  
        		<div class="col-md-12" style="display: inline-block; text-align: center;">
        			<div class="colInfo">
        				<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				로그인
			</h2>
	        			<form action="${pageContext.request.contextPath}/Member/login" class="nino-subscribeForm" method="post">
	        				
	        				
	        					<input type="text" class="form-control" name="id" placeholder="아이디" style="display:inline-block; width: 50%; height: 45px; margin-bottom: 5px; "><br>
	        					
	        					<input type="password" class="form-control" name="pwd" placeholder="비밀번호" style="display:inline-block; width: 50%; height: 45px; margin-bottom: 5px;"><br>
	        					
								<button id="btn_adoptWish" class="nino-btn" type="submit" style=" width: 50%;  background: #95e1d3; border: none;">로그인</button>
								
	        			</form>
	        			<br>
	        			<a href="${pageContext.request.contextPath}/Member/agreeForm"> 회원가입하기</a>
        			</div>
        		</div>
        	</div>
		</div>
    </footer>
    <!--/#footer-->
			
    
    </section>
    <!--/#nino-happyClient-->

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
		
</body>
</html>
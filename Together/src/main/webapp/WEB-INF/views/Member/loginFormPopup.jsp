<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 


	<title>Together | 로그인</title>

	<!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/template.css" />
	
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		
		
	<!-- 함수 시작 -->
	<script>
		$(document).ready(function(){
			
			// 회원가입 버튼 클릭시 : 새 팝업 띄우고, 로그인 팝업은 닫는다.
			$("#btn_go_agreeForm").click(function(){
				var popup=window.open("/Member/agreeForm","Together | 회원가입",
					"width=1000px, height=800px, scrollbars=yes, top=100px, left=300px, location=no");
				self.close();
				return false;
			});
			
			// 로그인 버튼 클릭시 : 비동기로 로그인 확인하고 부모 창으로 돌아간다.
			$("#btn_login").click(function(){
				var id=$("#id").val();
				var pwd=$("#pwd").val();
				
				$.post("/Member/loginByPopup", {id:id, pwd:pwd})
				.done(function(json){
					var object=JSON.parse(json);
					var loginResult=object.loginResult;
					
					// 로그인이 되었으면 부모 창을 새로고침하고 로그인 팝업을 닫는다.
					if(loginResult==true){
						opener.location.reload();
						alert("로그인 되었습니다.");
						self.close();
					}else{  // 로그인이 되지 않았으면 로그인이 되지 않았다고 알려준다.
						$("#p_loginResult").text("");
						setTimeout(function(){
							$("#p_loginResult").text("로그인 실패 : 아이디가 존재하지 않거나 비밀번호가 맞지 않습니다.");
						}, 100);
					}
				})
				.fail(function(){
					alert("error");
				});
			});
			
		});
	</script>
	<!-- 함수 끝 -->
	
</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">


<section id="nino-happyClient">
    	<!-- <div class="container">			
			
	<!-- Footer ================================================== -->
    <footer id="footer" style="background: none;">
        <div class="container">
        	<div class="row">  
        		<div class="col-md-12" style="text-align: center;">
        			<div class="colInfo" style="text-align: center;">
        				<h2 class="nino-sectionHeading">
							<span class="nino-subHeading">Together</span>
								로그인
						</h2>
	        			<form class="nino-subscribeForm" method="post">
	        				<div class="input-group input-group-lg" style="text-align: center;">
	        				
	        					<input type="text" class="form-control" id="id" placeholder="아이디" style="width: 400px; height: 45px; margin-bottom: 5px; "><br>
	        					
	        					<input type="password" class="form-control" id="pwd" placeholder="비밀번호" style="width: 400px; height:45px; margin-bottom: 5px; "><br>
	        					
								
								<button id="btn_login" class="nino-btn" type="button" style="font-size: 25px; width: 400px; background: #95e1d3; border: none;">로그인</button>
								
							</div>
	        			</form>
	        			<button id="btn_go_agreeForm" style="margin: 10px; color: green; border: none; font-size: 16px; background: none; font-weight:normal;">회원가입</button>
						<p id="p_loginResult"></p>
        			</div>
        		</div>
        	</div>
		</div>
    </footer>
    <!--/#footer-->
			
    
    </section>
    <!--/#nino-happyClient-->






    <!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
   
    <!-- Scroll to top
    ================================================== -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	<!-- javascript -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/template.js"></script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
	    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
	
	
		
</body>
</html>
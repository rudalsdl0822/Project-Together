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
	
</head>
<body data-target="#nino-navbar" data-spy="scroll">

	<!-- Header
    ================================================== -->
	<header id="nino-header">
		<div id="nino-headerInner">					
			<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
				<div class="container">

					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nino-navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${pageContext.request.contextPath}/index">Together</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="nino-menuItem pull-right">
						<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<li class="active"><a href="${pageContext.request.contextPath}/index">홈<span class="sr-only">(current)</span></a></li>
								<li><a href="${pageContext.request.contextPath}/views/">입양공고</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후기게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/AddPet/AddPet">입소신청</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후원하기</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">회원가입 / 로그인</a></li>
							</ul>
						</div><!-- /.navbar-collapse -->
					
					</div>
				</div><!-- /.container-fluid -->
			</nav>

			<section id="nino-slider" class="carousel slide container" data-ride="carousel">
				
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
							<h2 class="nino-sectionHeading">
								<span class="nino-subHeading">안락사 없는 보호센터</span>
								Together
							</h2>
							<h3 class="nino-sub">새로운 주인을 만날 수 있도록 돕고 따뜻한 보금자리 역할을 하고 있습니다.</h3>
							<br>
							<a href="#nino-story" class="nino-btn">Together 소개</a>
					</div>
					<div class="item">
						<h2 class="nino-sectionHeading">
							<span class="nino-subHeading">입양하기</span>
							
						</h2>
						<h3 class="nino-sub">사지말고 입양하세요.</h3>
						<br>
						<p>펫숍 쇼윈도에 진열된 동물의 이면에는 또 다른 생명의 고통이 있을 수 있습니다.<br>
						입양은 가장 신천적인 동물구호 활동입니다. 가족을 기다리는 동물들, 사지말고 입양하세요.</p>
							<br>
						<a href="${pageContext.request.contextPath}/views/" class="nino-btn">입양 공고 리스트</a>
					</div>
					<div class="item">
						<h2 class="nino-sectionHeading">
							<span class="nino-subHeading">입양 후기</span>
						</h2>
						<h3 class="nino-sub">입양 후기를 보실 수 있습니다.</h3>
						<br>
						<p>
						Together를 통해 입양하신 분들은 누구나! 입양 후기를 올려주세요.
						<br>가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등을 
						<br>작성해주시면 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.</p>
							<br>
						<a href="${pageContext.request.contextPath}/views/" class="nino-btn">입양 후기 게시판</a>
					</div>
					<div class="item">
						<h2 class="nino-sectionHeading">
							<span class="nino-subHeading">무료 온라인 입소신청</span>
						</h2>
						<h3 class="nino-sub">무료 입소</h3>
						<br>
						<p>Together는 사회적 공헌에 이바지함을 목적하여 무료 입소 제도를 도입 운영하게 되었습니다.
						<br>간편하게 온라인으로 입소 신청을 해보세요!</p>
						<br>
						<a href="${pageContext.request.contextPath}/AddPet/AddPet" class="nino-btn">온라인 입소 신청</a>
					</div>
				</div>

				<!-- Indicators -->
				<ol class="carousel-indicators clearfix">
					<li data-target="#nino-slider" data-slide-to="0" class="active">
						<div class="inner">
							<span class="number">01</span> Together 소개	
						</div>
					</li>
					<li data-target="#nino-slider" data-slide-to="1">
						<div class="inner">
							<span class="number">02</span> 입양 공고
						</div>
					</li>
					<li data-target="#nino-slider" data-slide-to="2">
						<div class="inner">
							<span class="number">03</span> 입양 후기
						</div>
					</li>
					<li data-target="#nino-slider" data-slide-to="3">
						<div class="inner">
							<span class="number">04</span> 입소 신청
						</div>
					</li>
				</ol>
			</section>
		</div>
	</header><!--/#header-->



<section id="nino-happyClient">
    	<!-- <div class="container">
    	
			
				
			
	<!-- Footer ================================================== -->
    <footer id="footer" style="background: none;">
        <div class="container">
        	<div class="row">  
        		<div class="col-md-12" style="text-align: center;">
        			<div class="colInfo">
        			
	        			<form action="${pageContext.request.contextPath}/Member/login" class="nino-subscribeForm" method="post">
	        				<div class="input-group input-group-lg">
	        				
	        					<input type="text" class="form-control" name="id" placeholder="아이디" style="width: 400px; height: 45px; margin-bottom: 5px; margin-left: 370px;"><br>
	        					
	        					<input type="password" class="form-control" name="pwd" placeholder="비밀번호" style="width: 400px; height:45px; margin-bottom: 5px; margin-left: 370px;"><br>
	        					
								
								<button id="btn_adoptWish" class="btn btn-primary" type="submit" style="font-size: 25px; width: 400px; margin-left: 370px;">로그인</button>
								
							</div>
	        			</form>
	        			<a href="${pageContext.request.contextPath}/Member/agreeForm" style="font-size: 16px; font-weight:normal;"> 회원가입</a>
        			</div>
        		</div>
        	</div>
		</div>
    </footer>
    <!--/#footer-->
			
    
    </section>
    <!--/#nino-happyClient-->













    
    <!-- Footer
    ================================================== -->
    <footer id="footer">
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			<div class="colInfo">
	        			<div class="footerLogo">
	        				<a href="${pageContext.request.contextPath}/index" >Together</a>	
	        			</div>
	        			<p>강남점 : 서울특별시 강남구 강남대로 396, TEL: 010-0000-0000 
	        			<br>안양점 : 경기 안양시 만안구 만안로 232, TEL: 010-0000-0000
	        			<br>해운대점 : 부산광역시 해운대구 해운대로 626, TEL: 010-0000-0000</p>
        			</div>
        		</div>
        		
        		
        	</div>
			<div class="nino-copyright">Copyright &copy; 2021. All Rights Reserved. <br/> MoGo free PSD template by <a href="https://www.behance.net/laaqiq">Laaqiq</a></div>
        </div>
    </footer><!--/#footer-->

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
	
	

<!-- ================================juDayoung 추가중================================ -->
<br>
<a href="/AddPet/WaitingPet?id=22&state=2">입양공고 상세보기</a>
<br>
<a href="/AddPet/AdoptForm?id=22">입양신청 폼</a>
<br>
<a href="/AddPet/AdoptWishList">입양신청 리스트</a>
<br>
<a href="/AddPet/WaitingPerson?num=4">입양신청1개클릭시</a>
<!-- ================================juDayoung 추가중================================ -->
	
	
	
		
</body>
</html>
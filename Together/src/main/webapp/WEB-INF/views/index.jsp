<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	
	
	<title>Together</title>
	
	
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
	
	<script>
	$(document).ready(function(){
		$('#a_logout').click(function(){
			var flag = confirm("로그아웃 하시겠습니까?");
			if (flag){
				alert("로그아웃 되었습니다.");
				location.href="/Member/logout";
			} else {
				return;
			}
		});
	});
	</script>
	
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
								<li><a href="${pageContext.request.contextPath}/AddPet/AdoptNoticeList">입양공고</a></li>
								<li><a href="${pageContext.request.contextPath}/Review/reviewList">후기게시판</a></li>
								<li><a href="/AddPet/AddPet">입소신청</a></li>
								<li><a href="#">후원하기</a></li>
								
								<!--  로그인 이전 -->
								<c:if test="${empty sessionScope.id}">
								<li><a href="${pageContext.request.contextPath}/Member/loginForm">로그인/회원가입</a></li>
								</c:if>
								
								<!-- 로그인 한 경우 -->
								<c:if test="${not empty sessionScope.id}">
								
								<!-- 관리자의 경우 -->
								<c:if test="${sessionScope.type==2}">
								<li class="nav-item dropdown">
								        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent;">관리자페이지<span class="caret"></span></a>
									        <ul class="dropdown-menu">
									        
									          <li><a class="dropdown-item" href="/Member/AdminPage">관리자페이지 - 홈</a></li>
									        
									          <li class="dropdown-header">회원 정보</li>
									          <li><a id="a_logout" class="dropdown-item" href="#">로그아웃</a></li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath }/Member/editForm">내 정보수정</a></li>
									       
									          <li class="dropdown-header">신청 리스트</li>
									          <li><a class="dropdown-item" href="/Adopt/AdoptWishList">입양 신청 리스트</a></li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/AddPet/PetAllList">입소 신청 리스트</a></li>
									          
									           <li class="dropdown-header">고객 센터</li>
									           <li><a class="dropdown-item" href="#">전체 회원 관리</a></li>
									          <li><a class="dropdown-item" href="/Ask/AskList">1:1 문의 답변</a></li>
									        </ul>
								    </li>
								    </c:if>
								    
								    <!-- 고객의 경우 -->
								    <c:if test="${sessionScope.type==1}">
									<li class="nav-item dropdown">
								        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent;">마이페이지<span class="caret"></span></a>
									        <ul class="dropdown-menu">
									          <li><a class="dropdown-item" href="/Member/MyPage">마이페이지 - 홈</a></li>
									          
									          <li class="dropdown-header">내 정보</li>
									          <li><a id="a_logout" class="dropdown-item" href="#">로그아웃</a></li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath }/Member/editForm">내 정보수정</a></li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath }/like/likeList">관심등록 목록</a></li>
									          
									          <li class="dropdown-header">신청 내역</li>
									          <li><a class="dropdown-item" href="/Adopt/MemberAdoptWishList">입양 신청 내역</a></li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/AddPet/PetAllList">입소 신청 내역</a></li>
									          
									          <li class="dropdown-header">고객 센터</li>
									          <li><a class="dropdown-item" href="/Ask/AskForm">1:1 문의하기</a></li>
									          <li><a class="dropdown-item" href="/Ask/AskList">문의내역보기</a></li>
									        </ul>
								    </li>
								    </c:if>
								</c:if>
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

	<!-- Story About Us
    ================================================== -->
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Who we are</span>
				Together란?
			</h2>
			<p class="nino-sectionDesc">Together는 개인이 운영하는 보호시설입니다.<br>매년 실종,유기되는 아이들의 수는 증가하지만, 구조된 아이들의 절반은 보호소에서 생을 마감합니다.<br>
			유기되는 동물들을 보호하며 새로운 주인을 만날 수 있도록 돕고 따뜻한 보금자리 역할을 하고 있습니다.</p>
			
			<div class="sectionContent">
				<div class="row nino-hoverEffect">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-account-multiple nino-icon"></i>
									Together 후기 보러 가기
								</span>
								<img src="${pageContext.request.contextPath}/resources/images/story/img-1.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									입양공고 보러가기
								</span>
								<img src="${pageContext.request.contextPath}/resources/images/story/img-2.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="${pageContext.request.contextPath}/AddPet/AddPet">
								<span class="content">
									<i class="mdi mdi-airplay nino-icon"></i>
									입소신청 하러가기
								</span>
								<img src="${pageContext.request.contextPath}/resources/images/story/img-3.png" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</section><!--/#nino-story-->
	
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading"></span>
				입양 관련 정보
			</h2>
			<p class="nino-sectionDesc">
			<img src="${pageContext.request.contextPath}/resources/images/story/img-4.png" alt="">
			</p>
		</div>		
	</section><!--/#nino-story-->

	<!-- Counting
    ================================================== -->
    <section id="nino-counting">
    	<div class="container">
    		<div layout="row" class="verticalStretch">
    			<div class="item">
    				<div class="number">42</div>
    				<div class="text">입양을 기다리는 친구</div>
    			</div>
    			<div class="item">
    				<div class="number">123</div>
    				<div class="text">다녀간 친구</div>
    			</div>
    			<div class="item">
    				<div class="number">15</div>
    				<div class="text">입양 후기</div>
    			</div>
    			<div class="item">
    				<div class="number">99</div>
    				<div class="text">회원 수</div>
    			</div>
    			<div class="item">
    				<div class="number">24</div>
    				<div class="text">Together 관리자</div>
    			</div>
    		</div>
    	</div>
    </section><!--/#nino-counting-->

    <!-- Services
    ================================================== -->
    <section id="nino-services">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">We work with</span>
				Amazing Services
			</h2>
			<div class="sectionContent">			
				<div class="fw" layout="row">
					<div class="col-md-4 col-sm-6 item ">
						<div layout="row">
							<i class="mdi mdi-apple-keyboard-command nino-icon fsr"></i>
							<div>
								<h4 class="nino-serviceTitle">쾌적한 환경 제공</h4>
								<p>친구들이 스트레스를 받지 않도록 넓은 공간, 청결함 등 가장 쾌적한 환경을 제공하며 생활하고 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 item ">
						<div layout="row">
							<i class="mdi mdi-blender nino-icon fsr"></i>
							<div>
								<h4 class="nino-serviceTitle">정식 허가 업체</h4>
								<p>Together는 농림축산부인증을 받은 정식허가업체이기에 입소 및 입양에 대해서 안심하고 진행할 수 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 item ">
						<div layout="row">
							<i class="mdi mdi-bookmark-plus-outline nino-icon fsr"></i>
							<div>
								<h4 class="nino-serviceTitle">협력 병원을 통한 진료</h4>
								<p>입소하여 지내는 동안 사소한 건강상태를 협력 병원을 통하여 직접 진찰 받으며 건강하게 새로운 주인을 만날 수 있도록 기다리고 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 item ">
						<div layout="row">
							<i class="mdi mdi-buffer nino-icon fsr"></i>
							<div>
								<h4 class="nino-serviceTitle">적절한 생활관리</h4>
								<p>시간에 따른 적절한 식사와 간식, 놀이, 교육, 사회성 향상과 산책 등을 통한 스트레스 해소로 행복한 보호 생활이 가능하도록 
								입소 생활 프로그램이 짜여있어 좋은 컨디션으로 아이들을 만나보실 수 있습니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 item ">
						<div layout="row">
							<i class="mdi mdi-desktop-mac nino-icon fsr"></i>
							<div>
								<h4 class="nino-serviceTitle">간편한 입소/ 입양 신청</h4>
								<p>Together 는 간편하게 온라인으로 입소/ 입양 신청이 가능하도록 되어있습니다. 온라인 신청에 따라 관리자가 신청자와
								연락을 통해 심사를 거쳐 절차가 진행됩니다.</p>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-sm-6 item ">
						<div layout="row">
							<i class="mdi mdi-diamond nino-icon fsr"></i>
							<div>
								<h4 class="nino-serviceTitle">입양 후 관리</h4>
								<p>입양 후, 아이에 대한 소식을 전해받으며 꾸준한 입양 후 관리를 Together가 함께합니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
    	</div>
    </section><!--/#nino-services-->

    <!-- Unique Design
    ================================================== -->
   
    <!-- What We Do
    ================================================== -->
        <!-- Testimonial
    ================================================== -->
  

    <!-- Our Team
    ================================================== -->
	

	<!-- Brand
    ================================================== -->
   
   <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Our location</span>
				Together의 지점
			</h2>
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<a href="#"><img src="${pageContext.request.contextPath }/resources/images/our-blog/img-1.jpg" alt=""></a>
								<div class="date">
									<span class="number">1</span>
									<span class="text">서울</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">강남점</a></h3>
							<p class="articleDesc">
								주소 : 서울특별시 강남구 강남대로 396<br>
								TEL: 010-0000-0000 <br>
								동물판매허가번호 : 3780000-000-0000-0000
							</p>
							
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<a href="#"><img src="${pageContext.request.contextPath }/resources/images/our-blog/img-2.jpg" alt=""></a>
								<div class="date">
									<span class="number">2</span>
									<span class="text">경기</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">안양점</a></h3>
							<p class="articleDesc">
								주소 : 경기 안양시 만안구 만안로 232<br>
								TEL: 010-0000-0000 <br>
								동물판매허가번호 : 3780000-000-0000-0000
							</p>
							
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<div class="articleThumb">
								<a href="#"><img src="${pageContext.request.contextPath }/resources/images/our-blog/img-3.jpg" alt=""></a>
								<div class="date">
									<span class="number">3</span>
									<span class="text">부산</span>
								</div>
							</div>
							<h3 class="articleTitle"><a href="">해운대점</a></h3>
							<p class="articleDesc">
								주소 : 부산광역시 해운대구 해운대로 626<br>
								TEL: 010-0000-0000 <br>
								동물판매허가번호 : 3780000-000-0000-0000
							</p>
							
						</article>
					</div>
				</div>
			</div>
    	</div>
    </section><!--/#nino-latestBlog-->
   
   

	<!-- Portfolio
    ================================================== -->
	<section id="nino-portfolio">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Waiting for</span>
				입양을 기다리는 Together 친구들
			</h2>
			<p class="nino-sectionDesc">
				다양한 친구들이 새로운 주인을 기다리고 있어요.	사지말고 입양하세요.</p>
		</div>
		<div class="sectionContent">
			<ul class="nino-portfolioItems">
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-1.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-2.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-3.jpeg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-4.jpeg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-5.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li>
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-6.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li> 
				<li class="item">
					<a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Together" href="${pageContext.request.contextPath }/">
						<img src="${pageContext.request.contextPath }/resources/images/our-work/img-7.jpg" />
						<div class="overlay">
							<div class="content">
								<i class="mdi mdi-cube-outline nino-icon"></i>
								<h4 class="title">입양 공고 더 보러 가기</h4>
								<span class="desc">더 많은 친구들 보러 오세요 !</span>
							</div>
						</div>
					</a>
				</li> 
			</ul>
		</div>
	</section><!--/#nino-portfolio-->

	<!-- Testimonial
    ================================================== -->
    <section class="nino-testimonial bg-white">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Happy Clients</span>
				입양 및 위탁 후기
			</h2>
    		<div class="nino-testimonialSlider">
				<ul>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath }/resources/images/testimonial/img-1.jpg" alt="">
							</div>
							<div>
								<p class="quote">
								"대전 애니멀호딩 현장에서 구조되었던 제니가 평생 가족을 만났습니다.
고생끝에  엄마, 아빠 그리고 반려묘가 있는 단란한 가정으로 입양을 가게 되었는데요~
제니의 입양 가족은 강아지를 키우기 위해 1년 넘게 입양을 고민하셨다고 해요.
하지만 시간적, 환경적으로 여유로운 환경이 준비되길 기다렸고 덕분에 지금의 제니와 인연을 맺게 되었습니다!
제니를 입양할 수 있어 너무 행복하고 감사하다며 제니 사진도 보내주셨는데요. 사랑 받고 있는 게 느껴져서 덩달아 행복해졌답니다.
제니의 가족이 되어주셔서 감사드리며, 이제는 디케가 된 제니와 온 가족 모두 매일이 행복한 꽃길이길 바랄게요♡"
								</p>
								<span class="name">제니맘</span>
							</div>
						</div>
					</li>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath }/resources/images/testimonial/img-2.jpg" alt="">
							</div>
							<div>
								<p class="quote">"직접 키위를 만나보니까.. 너무좋았어요. 다음 주말이 기다려지고요. 이런 만남을 할 수 있게 도와주신 보호소 직원분들
								모두 감사하고 한 달 마다 올리는 생활 사진 구경 오세요. 키위 존예!!!"</p>
								<span class="name">키위는 사랑</span>
							</div>
						</div>
					</li>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath }/resources/images/testimonial/img-3.jpg" alt="">
							</div>
							<div>
								<p class="quote">"어느덧 누리가 우리 가정에 온 지 9년이네요. 여전히 이쁘고 착하고 사랑스러운 누리가 안부 전해요."</p>
								<span class="name">누리가족</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
    	</div>
    </section><!--/#nino-testimonial-->

    <!-- Happy Client
    ================================================== -->
   

    
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
	
</body>
</html>

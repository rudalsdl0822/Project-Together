<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class=" js csstransitions">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	
	<title>입양신청자 리스트</title>
	
	<!-- favicon -->
    <link rel="shortcut icon" href="/resources/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/template.css" />

	<!-- webapp/resources 가 CSS의 디폴트 경로.  -->
	<!-- <link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath }/resources/memberCss.css" /> -->
  

	<!-- jquery 라이브러리 불러들이기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 함수 -->
	<script>
		$(document).ready(function(){
			
			$("#btn_AdoptAccept1").click(function(){
				alert("id=22인 펫에 대하여 id=67인 신청자의 입양신청을 승인합니다.");
			});
			
		});
	</script>
	<!-- 함수 끝-->

</head>
<body>

<h3>상단 배너</h3>


    <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">List</span>
				입양신청 리스트
			</h2>
			
			<div class="sectionContent">
				<div class="row" style="margin-bottom: 25px;">
					<div class="col-md-4 col-sm-4">
						<article>
							<!-- 입양신청자 리스트 1개-->
							<a href="/AddPet/WaitingPerson?num=4">
							<div class="articleThumb" style="text-align: right;">
							<!-- *********수정할 사항 : 사진 원형이 아님********* -->
								<img class="img-circle" src="/resources/judayoung/waitingPet-1.jpg" alt="" width="43%">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="" width="43%">

								<div class="date">
									<span class="number">11</span>
									<span class="text">Jan 15</span>
								</div>
								<!-- *********수정할 사항 : 사진 아래에 이름/ID적기********* -->
								<div>
									순대
									강아지는내칭구
								</div>
							</div>
							<h3 class="articleTitle">title : 행복하게 해주겠습니다.</h3>
							<!-- *********수정할 사항 : content 길어지면 ...으로 축약하기********* -->
							<p class="articleDesc">
								content 자기 소개 : 초코와 순대의 케미는 최강일거에요!
							</p>
							</a>
							
							<div class="articleMeta">
								<i class="mdi mdi-eye nino-icon"></i> 만난 회수 : 2
								<div style="text-align: right;">
									<form action="/AddPet/AdoptAccept" method="post">
										<span class="input-group-btn">
											<button id="btn_adoptWish" class="btn btn-success" type="button" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">입양 거절</button>			
											<button id="btn_adoptAccept1" class="btn btn-success" type="button" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">입양 승인</button>
										</span>
									</form>
								</div>
							</div>
							<!-- 입양신청자 리스트 1개 끝 -->
							
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<!-- 입양신청자 리스트 1개-->
							<a href="/AddPet/WaitingPerson?num=4">
							<div class="articleThumb" style="text-align: right;">
							<!-- *********수정할 사항 : 사진 원형이 아님********* -->
								<img class="img-circle" src="/resources/judayoung/waitingPet-1.jpg" alt="" width="43%">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="" width="43%">

								<div class="date">
									<span class="number">11</span>
									<span class="text">Jan 15</span>
								</div>
								<!-- *********수정할 사항 : 사진 아래에 이름/ID적기********* -->
								<div>
									순대
									강아지는내칭구
								</div>
							</div>
							<h3 class="articleTitle">title : 행복하게 해주겠습니다.</h3>
							<!-- *********수정할 사항 : content 길어지면 ...으로 축약하기********* -->
							<p class="articleDesc">
								content 자기 소개 : 초코와 순대의 케미는 최강일거에요!
							</p>
							</a>
							
							<div class="articleMeta">
								<i class="mdi mdi-eye nino-icon"></i> 만난 회수 : 2
								<div style="text-align: right;">
									<form action="/AddPet/AdoptAccept" method="post">
										<span class="input-group-btn">
											<button id="btn_adoptWish" class="btn btn-success" type="button" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">입양 거절</button>			
											<button id="btn_adoptAccept1" class="btn btn-success" type="button" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">입양 승인</button>
										</span>
									</form>
								</div>
							</div>
							<!-- 입양신청자 리스트 1개 끝 -->
						</article>
					</div>
					<div class="col-md-4 col-sm-4">
						<article>
							<!-- 입양신청자 리스트 1개-->
							<a href="/AddPet/WaitingPerson?num=4">
							<div class="articleThumb" style="text-align: right;">
							<!-- *********수정할 사항 : 사진 원형이 아님********* -->
								<img class="img-circle" src="/resources/judayoung/waitingPet-1.jpg" alt="" width="43%">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="" width="43%">

								<div class="date">
									<span class="number">11</span>
									<span class="text">Jan 15</span>
								</div>
								<!-- *********수정할 사항 : 사진 아래에 이름/ID적기********* -->
								<div>
									순대
									강아지는내칭구
								</div>
							</div>
							<h3 class="articleTitle">title : 행복하게 해주겠습니다.</h3>
							<!-- *********수정할 사항 : content 길어지면 ...으로 축약하기********* -->
							<p class="articleDesc">
								content 자기 소개 : 초코와 순대의 케미는 최강일거에요!
							</p>
							</a>
							
							<div class="articleMeta">
								<i class="mdi mdi-eye nino-icon"></i> 만난 회수 : 2
								<div style="text-align: right;">
									<form action="/AddPet/AdoptAccept" method="post">
										<span class="input-group-btn">
											<button id="btn_adoptWish" class="btn btn-success" type="button" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">입양 거절</button>			
											<button id="btn_adoptAccept1" class="btn btn-success" type="button" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">입양 승인</button>
										</span>
									</form>
								</div>
							</div>
							<!-- 입양신청자 리스트 1개 끝 -->
						</article>
					</div>					
				</div>
				
				<div class="row" style="margin-bottom: 25px;">
					<div class="col-md-4 col-sm-4">
						<article>
							<!-- 입양신청자 리스트 1개-->
							<a href="/AddPet/WaitingPerson?num=4">
							<div class="articleThumb" style="text-align: right;">
							<!-- *********수정할 사항 : 사진 원형이 아님********* -->
								<img class="img-circle" src="/resources/judayoung/waitingPet-1.jpg" alt="" width="43%">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="" width="43%">

								<div class="date">
									<span class="number">11</span>
									<span class="text">Jan 15</span>
								</div>
								<!-- *********수정할 사항 : 사진 아래에 이름/ID적기********* -->
								<div>
									순대
									강아지는내칭구
								</div>
							</div>
							<h3 class="articleTitle">title : 행복하게 해주겠습니다.</h3>
							<!-- *********수정할 사항 : content 길어지면 ...으로 축약하기********* -->
							<p class="articleDesc">
								content 자기 소개 : 초코와 순대의 케미는 최강일거에요!
							</p>
							</a>
							
							<div class="articleMeta">
								<i class="mdi mdi-eye nino-icon"></i> 만난 회수 : 2
								<div style="text-align: right;">
									<form action="/AddPet/AdoptAccept" method="post">
										<span class="input-group-btn">
											<button id="btn_adoptWish" class="btn btn-success" type="button" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">입양 거절</button>			
											<button id="btn_adoptAccept1" class="btn btn-success" type="button" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">입양 승인</button>
										</span>
									</form>
								</div>
							</div>
							<!-- 입양신청자 리스트 1개 끝 -->
						</article>
					</div>
				</div>
				
				
			</div>
    	</div>
    </section>
    <!--/#nino-latestBlog-->



<h3>하단 뭐넣을까?</h3>

	<!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
    <form action="" id="nino-searchForm">
    	<input type="text" placeholder="Search..." class="form-control nino-searchInput">
    	<i class="mdi mdi-close nino-close"></i>
    </form><!--/#nino-searchForm-->
    
    <!-- Scroll to top
    ================================================== -->
    <a href="#" id="nino-scrollToTop" style="display: inline;">Go to Top</a>
    
    <!-- javascript -->
	<script type="text/javascript" src="/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/template.js"></script>

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
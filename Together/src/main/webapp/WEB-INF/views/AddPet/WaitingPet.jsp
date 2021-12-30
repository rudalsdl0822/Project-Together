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
	
	<title>입양신청 상세보기</title>
	
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

</head>
<body>

<h3>상단 배너</h3>

<!-- Story About Us
    ================================================== -->
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">I'm In GangNam</span>
				발랄한 포메라니안, 순대
			</h2>
			<p class="nino-sectionDesc">순대는 터그 놀이를 제일 좋아해요</p>
				<!-- *********수정할 사항 : 사진 크기 고르지 않음********* -->
				<div class="row nino-hoverEffect">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									동영상 보기
								</span>
								<img src="/resources/judayoung/waitingPet-1.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									동영상 보기
								</span>
								<img src="/resources/judayoung/waitingPet-2.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									동영상 보기
								</span>
								<img src="/resources/judayoung/waitingPet-3.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</section>
	<!--/#nino-story-->
	
	
    <!-- Footer
    ================================================== -->
	<footer id="footer" style="padding: 0;">
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			<div class="colInfo">
	        			<div class="nino-followUs">
	        				<div class="totalFollow"><span>15k</span> views</div>
	        				<div class="socialNetwork">
	        					<span class="text">SNS로 공유하기 : </span>
	        					<a href="" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-google-plus"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-youtube-play"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-dribbble"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-tumblr"></i></a>
	        				</div>
	        			</div>
        			</div>
        		</div>
        	</div>		
        </div>
    </footer>
    <!--/#footer-->
	
	
	<!-- Counting
    ================================================== -->
    <section id="nino-counting">
    	<div class="container">
    		<div layout="row" class="verticalStretch">
    			<div class="item">
    				<div class="number">여자</div>
    				<div class="text">SEX</div>
    			</div>
    			<div class="item">
    				<div class="number">1살</div>
    				<div class="text">AGE</div>
    			</div>
    			<div class="item">
    				<div class="number">3.5</div>
    				<div class="text">WEIGHT</div>
    			</div>
    			<div class="item">
    				<div class="number">강남</div>
    				<div class="text">location</div>
    			</div>
    			<div class="item">
    				<!-- *********수정할 사항 : 패딩 또는 마진 줄이기********* -->
    				<div class="number">
    					<a href="#" class="nino-btn" style="font-size: 20px;">관심등록</a>
    					<a href="/AddPet/AdoptForm?id=22" class="nino-btn" style="font-size: 20px;">입양신청</a>
    				</div>
    				<div class="text"></div>
    			</div>
    			
    					
    		</div>
    	</div>
    </section>
    <!--/#nino-counting-->
    
    
	<!-- Testimonial
    ================================================== -->    
    <section class="nino-testimonial">
    	<div class="container">
    		<div class="unslider"><div class="nino-testimonialSlider unslider-horizontal" style="position: relative; overflow: hidden;">
				<ul class="unslider-wrap unslider-carousel" style="width: 300%; left: -100%;">
					<li class="" style="width: 33.3333%;">
						<div layout="row">
							<div class="nino-symbol fsr">
								<i class="mdi mdi-comment-multiple-outline nino-icon"></i>
							</div>
							<!-- *********수정할 사항 : 화살표 없애거나 움직이게 만들기********* -->
							<div>
								<p class="quote">"세상에서 가장 하얀 포메! 순대랍니다. 신사동 옆골목에서 우는걸 발견했어요. 며칠동안 어미가 안보여서 보호소에 가게됬고...."</p>
								<span class="name">NickName : yuriii</span>
							</div>
						</div>
					</li>
					<li style="width: 33.3333%;" class="unslider-active">
						<div layout="row">
							<div class="nino-symbol fsr">
								<i class="mdi mdi-wechat nino-icon"></i>	
							</div>
							<div>
								<p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
								<span class="name">Jon Doe</span>
							</div>
						</div>
					</li>
					<li style="width: 33.3333%;" class="">
						<div layout="row">
							<div class="nino-symbol fsr">
								<i class="mdi mdi-message-text-outline nino-icon"></i>
							</div>
							<div>
								<p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
								<span class="name">Jon Doe</span>
							</div>
						</div>
					</li>
				</ul>
			</div><a class="unslider-arrow next"><i class="mdi mdi-chevron-right"></i></a><a class="unslider-arrow prev"><i class="mdi mdi-chevron-left"></i></a></div>
    	</div>
    </section>
    <!--/#nino-testimonial-->
    
    
    <!-- Happy Client
    ================================================== -->
    <section id="nino-happyClient">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Say Together</span>
				댓글
			</h2>
			
			<!-- 댓글쓰기란 -->
			<div class="sectionContent" style="border: 5px dotted white; border-radius: 50px; padding: 10px; margin: 30px;">
				<div class="row">
					<div class="col-md-12">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="">
							</div>
							<div class="info">
								<!-- 댓글작성 폼 -->
								<form>
								<h4 class="name">NickName : 새로운댓글작성자</h4>
								<span class="regency">
									title : <input type="text" placeholder="제목을 적어주세요" style="borrder: none; background: none;">
								</span>
								<p class="desc"><textarea cols="20" rows="3"  style="borrder: none; background: none;">content : 머라고 적을까~</textarea></p>
								<input type="button" value="이대로 댓글 작성">
								</form>
								<!-- 댓글작성 폼 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 댓글쓰기란 끝 -->
			
			<!-- 댓글리스트 -->
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-12">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="/resources/images/happy-client/img-1.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">NickName : 키위는사랑</h4>
								<span class="regency">title : 너무너무 귀여워요</span>
								<p class="desc">빨리 입양됐으면 좋겠습니다~</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">NickName : 키위는사랑</h4>
								<span class="regency">title : 너무너무 귀여워요</span>
								<p class="desc">빨리 입양됐으면 좋겠습니다~</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="/resources/images/happy-client/img-3.jpg" alt="">
							</div>
							<div class="info">
								<h4 class="name">NickName : 키위는사랑</h4>
								<span class="regency">title : 너무너무 귀여워요</span>
								<p class="desc">빨리 입양됐으면 좋겠습니다~</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
    	</div>
    </section>
    <!-- 댓글리스트 끝-->
    <!--/#nino-happyClient-->
    

    
<h3>하단 입양공고 리스트</h3>


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
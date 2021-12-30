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
	
	<script>
		$(document).ready(function(){
			$("#btn_adoptAccept").click(function(){
				alert("입양이 승인되었습니다. 입양신청 리스트로 돌아갑니다.");
				$("form").submit();
			});
		});
	</script>

</head>
<body>

<h3>상단 배너</h3>

    <!-- Happy Client
    ================================================== -->
    <section id="nino-happyClient">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">I Want You</span>
				To Be Together
			</h2>
			<div class="sectionContent">
				<div class="row">
					<!-- Pet 정보 -->
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<a href="/AddPet/WaitingPet?id=22&state=2">
									<img class="img-circle" src="/resources/judayoung/waitingPet-1.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<h4 class="name"><a href="/AddPet/WaitingPet?id=22&state=2">순대</a></h4>
								<span class="regency">포메라니안</span>
								<p class="desc">성별 : 여자</p>
								<p class="desc">나이 : 1살</p>
								<p class="desc">무게 : 3.5kg</p>
								<p class="desc">보호소 위치 : (서울)강남점</p>
								<p class="desc">상세 사항 : 세상에서 가장 하얀 포메! 순대랍니다. 신사동 옆골목에서 우는걸 발견했어요. 며칠동안 어미가 안보여서 보호소에 가게됬고....</p>
							</div>
						</div>
					</div>
					<!-- Pet 정보 끝 -->
					
					<!-- Member 정보 -->
					<div class="col-md-6">
						<div layout="row" class="item" style="width:100%;">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="/resources/images/happy-client/img-2.jpg" alt="">
							</div>
							<div class="info" style="width:100%;">
								<h4 class="name">NickName : 강아지는내칭구</h4>
								<span class="regency">title : 행복하게 해주겠습니다.</span>
								<p class="desc">family 가족 구성 : 아빠 엄마 본인 반려견초코</p>
								<p class="desc">job 직업 : 프리랜서</p>
								<p class="desc">walkTime 산책 가능 시간 : 하루 1시간</p>
								<p class="desc">dating 현재까지 순대와의 만남 : 2번</p>
								<p class="desc">content 자기 소개 :</p>
								<p class="desc">순대와 2번 만나보니 더 확신이 생겨요. 저희 초코와도 잘 지내서 꼭 입양승인되었으면 좋겠습니다!</p>
							</div>
						</div>
					</div>
					<!-- Member 정보 끝 -->
				</div>
			</div>
			
	<!-- Footer
    ================================================== -->
    <footer id="footer" style="background: none;">
        <div class="container">
        	<div class="row">  
        		<div class="col-md-12" style="text-align: center;">
        			<div class="colInfo">
        			
	        			<form action="/AddPet/AdoptWishList" class="nino-subscribeForm">
	        				<div class="input-group input-group-lg">
								<span class="input-group-btn">
									<button id="btn_adoptWish" class="btn btn-success" type="button" style="font-size: 25px; background: #f38181;">입양 거절</button>			
									<button id="btn_adoptAccept" class="btn btn-success" type="submit" style="font-size: 25px; background: #4FC9DE;">입양 승인</button>
								</span>
							</div>
	        			</form>
	        			
        			</div>
        		</div>
        	</div>
		</div>
    </footer>
    <!--/#footer-->
			
    	</div>
    </section>
    <!--/#nino-happyClient-->
    




<h3>하단 입양신청 리스트</h3>


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
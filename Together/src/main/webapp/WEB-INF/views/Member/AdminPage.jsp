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
<title>Together | 관리자 페이지</title>


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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
    
   
        <script src="./js/script/js"></script>
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	

</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">


<c:if test="${empty sessionScope.id}">
	<section id="onlineAddPet">
		<div class="container" style="text-align:center;">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				먼저 로그인 해주세요.
			</h2>
			<br>
			<button type="submit" class="nino-btn" style="background: #95e1d3;" onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>
			
		</div>
	</section>
</c:if>

	<section id="onlineAddPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				${sessionScope.id }님의 관리자 페이지
			</h2>
	

  <form action="${pageContext.request.contextPath}/MyPage/MyPage" method="post">

  <div style="text-align: center;">
  
    <ul>
      <a class="card_small" href="/AddPet/AdoptNoticeList">
        <h3 class="softblack">입소신청내역</h3>
        <p class="card_text">입소 신청 내역들을 보실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
    
    <ul>
      <a class="card_small" href="/Adopt/AdoptWishList">
        <h3 class="softblack">입양신청내역</h3>
        <p class="card_text">입양 신청 내역들을 보실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
  
    <ul>
      <a class="card_small" href="/Member/editForm">
        <h3 class="softblack">정보수정</h3>
        <p class="card_text">관리자 정보를 수정하실 수 있습니다.</p>
        <p class="card_textlink">수정하기</p>
      </a>
    </ul>



    <ul>
      <a class="card_small">
        <h3>문의내역</h3>
        <p class="card_text">회원들이 문의한 사항을<br>확인하실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>

    <ul>
      <a class="card_small">
        <h3>후기목록</h3>
        <p class="card_text">입양 후기들을 확인하실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
    
    <ul>
      <a class="card_small" href="/AddPet/AdoptNoticeList">
        <h3 class="softblack">회원관리</h3>
        <p class="card_text">회원관리를 하실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>

  </div>
  </form>
  </div>
  </section>
  <br>
  <a href="${pageContext.request.contextPath }/Member/out">탈퇴하기</a>
  

    
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">


<title>Together | 1:1 문의 내역</title>

<!-- favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/ico/favicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-57-precomposed.png">

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/unslider.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/template.css" />


<style>
.breadcrumb-item>a, .table-primary>a {
	color: #777;
}

.breadcrumb-item>a:hover, .table-primary>a:hover {
	color: #337ab7;
}

.nino-btn > #btn {
 	background: #95e1d3;
}

.nino-btn > #btn:hover {
	background: #00ced1;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function() {
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
<body data-target="#nino-navbar" data-spy="scroll"
	style="padding-top: 50px;" class="nino-fixed-nav">

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
								<li><a href="${pageContext.request.contextPath}/index">홈<span class="sr-only">(current)</span></a></li>
								<li><a href="${pageContext.request.contextPath}/views/">입양공고</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후기게시판</a></li>
								<li><a href="/AddPet/AddPet">입소신청</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후원하기</a></li>
								
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
									        
									          <li><a class="dropdown-item" href="/Member/MyPage">관리자페이지 - 홈</a></li>
									        
									          <li class="dropdown-header">회원 정보</li>
									          <li><a id="a_logout" class="dropdown-item" href="#">로그아웃</a></li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath }/Member/editForm">내 정보수정</a></li>
									       
									          <li class="dropdown-header">신청 리스트</li>
									          <li><a class="dropdown-item" href="#">입양 신청 리스트</a></li>
									          <li><a class="dropdown-item" href="#">입소 신청 리스트</a></li>
									          
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
									          <li><a class="dropdown-item" href="#">관심등록 목록</a></li>
									          
									          <li class="dropdown-header">신청 내역</li>
									          <li><a class="dropdown-item" href="#">입양 신청 내역</a></li>
									          <li><a class="dropdown-item" href="#">입소 신청 내역</a></li>
									          
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
		</div>
	</header>


	<!-- 로그인 하지 않은 경우, 작성 불가하도록! -->

		<c:if test="${empty sessionScope.id}">
			<section id="onlineAddPet">
				<div class="container" style="text-align: center;">
					<h2 class="nino-sectionHeading">
						<span class="nino-subHeading">Together</span> 로그인을 먼저 해야합니다.
					</h2>
					<br>
					<button type="submit" class="nino-btn" id="btn"
						style="background: #95e1d3;"
						onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>
				</div>
			</section>
		</c:if>

		<!-- 로그인 한 경우 -->
	<c:if test="${not empty sessionScope.id}">
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/index">홈</a></li>
				<li class="breadcrumb-item"><a href="/MyPage"> <c:if
							test="${sessionScope.type==1}">마이페이지</c:if> <c:if
							test="${sessionScope.type==2}">관리자페이지</c:if>
				</a></li>
				<li class="breadcrumb-item active">1:1 문의 리스트</li>
			</ol>
		</div>
		<!-- container Form
    ================================================== -->
		<section id="AskList">
			<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Together</span> 1:1 문의 리스트
				</h2>

				<!-- 고객의 경우 -->
				<c:if test="${sessionScope.type == 1}">
					<button type="submit" class="nino-btn" id="btn"
						style="background: #95e1d3;"
						onclick="location.href='/Ask/AskForm'">1:1 문의하기</button>

				</c:if>

				<c:if test="${empty list}">
					<div id="noList" style="text-align: center;">
						등록된 1:1 문의 리스트가 없습니다<br>

					</div>
				</c:if>

				<c:if test="${not empty list}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글 번호</th>
								<th scope="col">유형</th>
								<th scope="col">제목</th>
								<th scope="col">문의 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="a">
								<tr class="table-primary">
									<td>${a.num}</td>
									<td><c:if test="${a.category==1}">[1.회원 정보]</c:if>
										<c:if test="${a.category==2}">[2.입양 관련]</c:if> <c:if
											test="${a.category==3}">[3.입소 관련]</c:if> <c:if
											test="${a.category==4}">[4.사이트 관련 오류]</c:if> <c:if
											test="${a.category==5}">[5.후원 관련]</c:if></td>
									<td><a href="/Ask/OneAsk?num=${a.num}">${a.title}</a></td>
									<td><c:if test="${empty a.answer}">답변대기중</c:if> <c:if
											test='${not empty a.answer}'>답변완료</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>

			</div>
		</section>
	</c:if>





	<!-- Footer
    ================================================== -->
		<footer id="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="colInfo">
							<div class="footerLogo">
								<a href="${pageContext.request.contextPath}/index">Together</a>
							</div>
							<p>
								강남점 : 서울특별시 강남구 강남대로 396, TEL: 010-0000-0000 <br>안양점 : 경기
								안양시 만안구 만안로 232, TEL: 010-0000-0000 <br>해운대점 : 부산광역시 해운대구
								해운대로 626, TEL: 010-0000-0000
							</p>
						</div>
					</div>


				</div>
				<div class="nino-copyright">
					Copyright &copy; 2021. All Rights Reserved. <br /> MoGo free PSD
					template by <a href="https://www.behance.net/laaqiq">Laaqiq</a>
				</div>
			</div>
		</footer>
		<!--/#footer-->

		<!-- Search Form - Display when click magnify icon in menu
    ================================================== -->

		<!-- Scroll to top
    ================================================== -->
		<a href="#" id="nino-scrollToTop">Go to Top</a>

		<!-- javascript -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/js/jquery.hoverdir.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/js/modernizr.custom.97074.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/js/unslider-min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/resources/js/template.js"></script>

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
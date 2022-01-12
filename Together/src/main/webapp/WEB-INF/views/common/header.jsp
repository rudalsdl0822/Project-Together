<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
								<li class=""><a href="${pageContext.request.contextPath}/index">홈<span class="sr-only">(current)</span></a></li>
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
									        
									          <li><a class="dropdown-item" href="/Member/MyPage">관리자페이지 - 홈</a></li>
									        
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
		</div>
	</header>
	
	
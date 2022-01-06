<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>Together | 입소신청 리스트</title>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/template.css" />
	
	<style type="text/css">
		 form {display:inline}
	</style>
	
</head>
<body data-target="#nino-navbar" data-spy="scroll">

	<section class="nino-testimonial bg-white">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				입소/입양 상태 리스트
			</h2>
    		<div class="nino-testimonialSlider">
    		
    		<!-- 임시 뷰 -->
				<ul>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<a href="#">
									<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/cha/AddPetList/dog1.jpg" alt="">
								</a>
							</div>
							<div>
								<p class="quote">이름 : 춘식</p>
								<p class="q2">나이 : 2세</p>
								<p class="q2">품종 : 말티즈</p>
								<p class="q2">성별 : 암컷</p>
								<p class="q2">보호소 지점 : 안양점</p>
								<button type="submit" class="btn btn-primary" name="approval">승인</button>
								<button type="button" class="btn btn-primary" name="rejection">거절</button>
							</div>
						</div>
					</li>
					<hr>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<a href="#">
									<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/cha/AddPetList/dog2.jpg" alt="">
								</a>
							</div>
							<div>
								<span class="name">이름 : 라이언</span>
								<p class="quote">나이 : 3세</p>
								<p class="quote">품종 : ㅇㅇㅇ</p>
								<p class="quote">성별 : 수컷</p>
								<p class="location">보호소 지점 : 강남점</p>
								<button type="submit" class="btn btn-primary" name="approval">승인</button>
								<button type="button" class="btn btn-primary" name="rejection">거절</button>
							</div>
						</div>
					</li>
					<hr>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<a href="#">
									<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/cha/AddPetList/dog3.jpg" alt="">
								</a>
							</div>
							<div>
								<span class="name">이름 : 콘</span>
								<p class="quote">나이 : 4세</p>
								<p class="quote">품종 : ㅁㅁㅁ</p>
								<p class="quote">성별 : 수컷</p>
								<p class="quote">보호소 지점 : 해운대점</p>
								<p class="quote">상태 : 입소신청중</p>
							</div>
						</div>
					</li>
					<hr>
				</ul>
				
				<hr>
				
				<!-- 찐 뷰 -->
				
				<form action="${pageContext.request.contextPath}/AddPet/PetAllList" method="post">
					<button type="submit" class="btn btn-primary" name="petAllList">전체리스트</button>
				</form>
				 
				
				<form name="stateList" method="post">
					<button type="button" class="btn btn-info" onClick="location='${pageContext.request.contextPath}/AddPet/StateList?state=1'">입소신청중</button>
					<button type="button" class="btn btn-info" onClick="location='${pageContext.request.contextPath}/AddPet/StateList?state=2'">입양대기</button>
					<button type="button" class="btn btn-info" onClick="location='${pageContext.request.contextPath}/AddPet/StateList?state=3'">입양문의중</button>
					<button type="button" class="btn btn-info" onClick="location='${pageContext.request.contextPath}/AddPet/StateList?state=4'">입양완료</button>
				</form>
				
				<hr>


				<ul>
					<c:forEach var="p" items="${list}">
						<li>
							<div layout="row" class="verticalCenter">
								<div class="nino-avatar fsr">
									<a href="${pageContext.request.contextPath}/AddPet/petView?id=${p.id}">
										<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" alt=""> 
									</a>
								</div>
								<div>
								<span class="name">이름 : ${p.name}</span>
								<p class="quote">품종 : ${p.breed}</p>
								<p class="quote">나이 : ${p.age}</p>
								<p class="quote">성별 : 
									<c:choose>
										<c:when test="${p.sex==1}">수컷</c:when>
										<c:when test="${p.sex==2}">암컷</c:when>
										<c:otherwise>잘못된 성별정보 입니다</c:otherwise>
									</c:choose>
								</p>
								<p class="quote">지점 : 
									<c:choose>
										<c:when test="${p.location==1}">(서울)강남점</c:when>
										<c:when test="${p.location==2}">(경기)안양점</c:when>
										<c:when test="${p.location==3}">(부산)해운대점</c:when>
										<c:otherwise>잘못된 지점정보 입니다</c:otherwise>
									</c:choose>
								</p>
								<p class="quote">상태 : 
									<c:choose>
										<c:when test="${p.state==1}">입소신청중</c:when>
										<c:when test="${p.state==2}">입양대기</c:when>
										<c:when test="${p.state==3}">입양문의중</c:when>
										<c:when test="${p.state==4}">입양완료</c:when>
										<c:otherwise>잘못된 상태정보 입니다</c:otherwise>
									</c:choose>
								</p>
							</div>
							</div>
						</li>
						<hr>
					</c:forEach>
				</ul>

				<c:if test="${empty list}">
					리스트가 비어있습니다
				</c:if>
			</div>
    	</div>
    </section>
</body>
</html>
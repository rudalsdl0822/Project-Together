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
	<title>Together | 입소/입양 상태 리스트</title>
	
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
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			$("button[type=button][name=deletePet]").click(function(){
				var petId=$(this).attr("num");
				console.log(petId);
				
				if(confirm("정말 삭제하시겠습니까?")){
					alert("삭제가 완료되었습니다");
					location.href="${pageContext.request.contextPath}/Addpet/DeletePet?id="+petId;
				}else{
					alert("삭제가 취소되었습니다");
				}
			});
			
			$("button[type=button][name=petState]").click(function(){
				var stateNum=$(this).attr("num");
				var loca="${pageContext.request.contextPath}/AddPet/StateList?page=PetAllList&state=";
				
				if(stateNum==1){
					location.href=loca+stateNum;
				}else if(stateNum==2){
					location.href=loca+stateNum;
				}else if(stateNum==3){
					location.href=loca+stateNum;
				}else if(stateNum==4){
					location.href=loca+stateNum;
				}else{
					alert="잘못된 경로입니다";
				}
			});
		});
		
	</script>
	
</head>
<body data-target="#nino-navbar" data-spy="scroll">

	<section class="nino-testimonial bg-white">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				입소/입양 상태 리스트
			</h2>
    		<div class="nino-testimonialSlider">
    		
    			<hr>
				<form action="${pageContext.request.contextPath}/AddPet/PetAllList" method="post">
					<button type="submit" class="btn btn-primary" name="petAllList">전체리스트</button>
				</form>
				 
				<form name="stateList" method="post">
					<button type="button" class="btn btn-info" name="petState" num="1">입소신청중</button>
					<button type="button" class="btn btn-info" name="petState" num="2">입양대기</button>
					<button type="button" class="btn btn-info" name="petState" num="3">입양문의중</button>
					<button type="button" class="btn btn-info" name="petState" num="4">입양완료</button>
				</form>
				<hr>

				<ul>
					<c:forEach var="p" items="${list}" varStatus="status">
					
						<c:if test="${sessionScope.id==p.writer_id || sessionScope.type==2}">
						
							<li>
								<div layout="row" class="verticalCenter">
									<div class="nino-avatar fsr">
										<a href="${pageContext.request.contextPath}/AddPet/petView?id=${p.id}">
											<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" alt=""> 
										</a>
									</div>
									<div>
										<span class="name">작성자 : ${p.writer_id}</span>
										<p class="quote">이름 : ${p.name}</p>
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
										
										<c:if test="${p.state==1 || sessionScope.type==2}">
											<button class="btn btn-success" type="button" onClick="location='${pageContext.request.contextPath}/AddPet/petView?id=${p.id}'" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">수정</button>			
											<button class="btn btn-success" type="button" name="deletePet" id="delPet" num="${p.id}" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">삭제</button>
										</c:if>
										
									</div>
								</div>
							</li>
							<hr>
							
							<!--<c:set var="isEmpty" value=""/>-->
						</c:if>
						
						<!-- 수정예정 -->
						<!--<c:if test="${sessionScope.id!=p.writer_id && sessionScope.type!=2}">
							<c:set var="isEmpty" value="리스트가 비어있습니다"/>-->
							<!--<c:if test="${status.count==1}">
							리스트가 비어있습니다
							</c:if>-->
						<!--</c:if>-->
						
					</c:forEach>
					
					<!--<c:if test="${sessionScope.id!=p.writer_id && sessionScope.type!=2}">
						${isEmpty}
					</c:if>-->
					
				</ul>
			</div>
    	</div>
    </section>
</body>
</html>
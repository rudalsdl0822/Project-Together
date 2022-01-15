<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 


	<title>Together | 입양공고123</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		var member_id="${sessionScope.id}";
		var pet_id;
	
		$(document).ready(function(){
			//관심등록 버튼 클릭
			$("button[type=button][name=likePet]").click(function(){
				pet_id=$(this).attr("num");
				if(member_id==""){
					var flag=confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if(flag){
						location.href="${pageContext.request.contextPath}/Member/loginForm";
					}else{
						return; 
					}
				}else{
					console.log(pet_id);
					console.log(member_id);
					fn_like();
				}
			});
			
			$("button[type=button][name=AdoptNotice]").click(function(){
				location.href="${pageContext.request.contextPath}/AddPet/AdoptNoticeList";
			});
		});
		
		function fn_like(){
			$.post("/like/add", {pet_id:pet_id})
			.done(function(){
				alert("관심등록이 완료되었습니다.");			
			})
			.fail(function(){
				alert("error");
			});
		}
		
		function fn_location(num){
			var loca = "${pageContext.request.contextPath}/AddPet/LocationState23List?location=";
			
			if(num==1){
				location.href=loca+num;
			}else if(num==2){
				location.href=loca+num;
			}else if(num==3){
				location.href=loca+num;
			}else{
				alert("error");
			}
		}
		
		function fn_state(num){
			var stateLoca = "${pageContext.request.contextPath}/AddPet/StateList?page=AdoptNotice&state=";
			
			if(num==2){
				location.href=stateLoca+num;
			}else if(num==3){
				location.href=stateLoca+num;
			}else{
				alert("error");
			}
		}
				
	</script>
	
</head>
<body style="padding-top: 50px;" class="nino-fixed-nav">

	<section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				입양공고
			</h2>
			<div class="sectionContent">
				<div class="row">
						<div class="col-md-12 col-sm-12" style="text-align: right;">
						  <div class="btn-group">
						    <button type="button" class="btn btn-default" name="AdoptNotice">입양공고 전체</button>
						    <div class="btn-group">
						      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						      보호소 지점 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
							   <li><a href="#" onClick="fn_location(1);">강남점</a></li>
						       <li><a href="#" onClick="fn_location(2);">안양점</a></li>						       
						       <li><a href="#" onClick="fn_location(3);">해운대점</a></li>
						      </ul>
						    </div>
						    <div class="btn-group">
						      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						      입양상태 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
						        <li><a href="#" onClick="fn_state(2);">입양대기</a></li>
						        <li><a href="#" onClick="fn_state(3);">입양문의중</a></li>
						       </ul>
						    </div>
						  </div>
						</div>
					</div>
					
					<br>
					<div class="row">
						<div class="col-md-12 col-sm-12" style="text-align: right;">
							<form action="${pageContext.request.contextPath}/AddPet/SearchPet" method="get">
							    <div class="form-group">
								    <div class="input-group">
								    	<div class="input-group-btn">
								    		<input type="hidden" name="page" value="AdoptNotice">
								    		<button class="btn btn-default" type="submit" style="float: right;height:34px;"><i class="glyphicon glyphicon-search"></i></button>
								    		<input type="text" name="value" value="${value}" style="float: right;width:250px;height:34px;" size="2" class="form-control">
								      		<select class="form-control" name="search" id="search" style="float: right; width:130px; height:34px;">
												<option value="" selected disabled>검색 항목</option>
												<option ${search=='breed'?'selected':''} value="breed">품종</option>
												<option ${search=='age'?'selected':''} value="age">나이</option>
												<option ${search=='name'?'selected':''} value="name">펫 이름</option>
											</select>
								      </div>
								    </div>
							    </div>
							  </form>
						</div>
					</div>
					<br><br>
					
					<c:if test="${empty list}">
						<br>
						등록된 입양공고가 없습니다
						<br>
					</c:if>
					
					<c:forEach var="p" items="${list}" varStatus="status">
						
							
						<c:if test="${status.first || status.count%3==1}">
							<div class="row">
						</c:if>
					
						<div class="col-md-4 col-sm-4">
							<article>
								<div class="articleThumb">
								
								<!-- count, current, index 확인용 / 추후 삭제 예정 -->
								count : ${status.count}<br>
								current : ${status.current}<br>
								index : ${status.index}<br>
								
								
									<a href="${pageContext.request.contextPath}/Adopt/WaitingPet?id=${p.id}">
										<img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" alt="">
									</a>
									<div class="date">
										<!-- <span class="number">ㅇㅇㅇ</span> -->
										<span class="text">
											<c:choose>
												<c:when test="${p.location==1}">강남점</c:when>
												<c:when test="${p.location==2}">안양점</c:when>
												<c:when test="${p.location==3}">해운대점</c:when>
												<c:otherwise> - </c:otherwise>
											</c:choose>
										</span>
									</div>
								</div>
								<h3 class="articleTitle">
									<div style="float: left; width: 60%;">
										<a href="${pageContext.request.contextPath}/Adopt/WaitingPet?id=${p.id}">${p.name}</a>
										<c:if test="${p.state==2}">
											<span class="label label-warning">입양대기</span>
										</c:if>
										<c:if test="${p.state==3}">
											<span class="label label-success">입양문의중</span>
										</c:if>
										<c:if test="${p.state==4}">
											<span class="label label-default">입양완료</span>
										</c:if>
									</div>
									
									<div style="float: left; width: 40%;">
										<span class="input-group-btn" style="text-align: right;">
											<button type="button" class="btn btn-xs" id="btn_like" style="background-color: white; color:red; border-color:red;" name="likePet" num="${p.id}">관심친구 등록♥</button>		
										</span>
									</div>
								</h3>
								<p class="articleDesc">
									${p.breed} | 
									<c:choose>
										<c:when test="${p.sex==1}">수컷</c:when>
										<c:when test="${p.sex==2}">암컷</c:when>
										<c:otherwise> - </c:otherwise>
									</c:choose>
									 | ${p.age}세 <br><br><br>
								</p>
							</article>
						</div>

						<c:if test="${status.count%3==0 || status.last}">
							</div>
						</c:if>
							
					</c:forEach>
					
			</div>
    	</div>
    </section>
    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>


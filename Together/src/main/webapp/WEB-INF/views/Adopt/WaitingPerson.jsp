<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>  
	<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
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
	
	<title>Together | 입양신청 상세보기</title>
	
	<!-- webapp/resources 가 CSS의 디폴트 경로.  -->
	<!-- <link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath }/resources/memberCss.css" /> -->
  

	<!-- jquery 라이브러리 불러들이기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script>
		$(document).ready(function(){
		
			$("button").click(function(){
				var num=$(this).attr("num");
				
				if( $(this).text()=="입양 승인" ){
					var flag=confirm("정말로 입양을 승인하겠습니까?");
					if(flag==false) return;
				
					location.href="/Adopt/AdoptAccept?num="+num;
				}else if( $(this).text()=="입양 거절" ){
					var flag=confirm("정말로 입양을 거절하겠습니까?");
					if(flag==false) return;
					
					location.href="/Adopt/AdoptReject?num="+num;
				}else if( $(this).text()=="신청 삭제" ){
					var flag=confirm("정말로 신청을 삭제하겠습니까?");
					if(flag==false) return;
					
					$.post("/Adopt/MemberAdoptDelete",{num:num})
					.done(function(json){
						alert(num+"번 입양신청 글을 삭제했습니다. \n입양신청 리스트로 돌아갑니다.");
						location.href="/Adopt/MemberAdoptWishList";
					})
					.fail(function(){
						alert("error");
					});
				}else if( $(this).text()=="신청 수정" ){
					var flag=confirm("이 내용대로 신청을 수정하시겠습니까?");
					if(flag==false) return;
					
					// form parameter serialize
					var params=$("#form_adoptEdit").serialize();
					$.post("/Adopt/MemberAdoptEdit", params)
					.done(function(json){
						alert(num+"번 입양신청을 수정했습니다.");
					})
					.fail(function(){
						alert("error");
					});
				}
			});
			
		});
	</script>  

</head>
<body>


<!-- 뷰 세팅================================================== -->
	<!-- locationCityKorean : 펫이 있는 장소의 도시를 한글화 합니다. -->
		<c:set var="locationCityKorean">
			<c:if test="${Adopt.pet.location == 1 }">서울</c:if>
			<c:if test="${Adopt.pet.location == 2 }">경기</c:if>
			<c:if test="${Adopt.pet.location == 3 }">부산</c:if>
		</c:set>
	<!-- locationKorean : 펫이 있는 장소를 한글화 합니다. -->
		<c:set var="locationKorean">
			<c:if test="${Adopt.pet.location == 1 }">강남</c:if>
			<c:if test="${Adopt.pet.location == 2 }">안양</c:if>
			<c:if test="${Adopt.pet.location == 3 }">해운대</c:if>
		</c:set>
	<!-- sexKorean : 펫 성별을 한글화 합니다. -->
		<c:set var="sexKorean">
			<c:if test="${Adopt.pet.sex == 1 }">남자</c:if>
			<c:if test="${Adopt.pet.sex == 2 }">여자</c:if>
		</c:set>
	<!-- isWriter : 글쓴 사람이 본인이면 수정할 수 있게 합니다. -->
		<c:set var="isWriter">
			<c:if test="${Adopt.writer == sessionScope.id }">true</c:if>
			<c:if test="${Adopt.writer != sessionScope.id }">false</c:if>
		</c:set>
<!-- 뷰 세팅 끝================================================== -->


    <!-- Happy Client
    ================================================== -->
    <section id="nino-happyClient">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Detail</span>
				입양신청 #${Adopt.num }
			</h2>
			<div class="sectionContent">
				<div class="row">
					<!-- Pet 정보 -->
					<div class="col-md-6">
						<div layout="row" class="item">
							<div class="nino-avatar fsr" style="width: 120px; height: 120px; border-radius: 70%; overflow: hidden;">
								<a href="/Adopt/WaitingPet?id=${Adopt.pet.id }">
									<img class="img-circle" src="/AddPet/petImg?id=${Adopt.pet.id}&petImgNum=1"  alt="" style="width: 100%; height: 100%; object-fit: cover;">
								</a>
							</div>
							<div class="info" style="width:320px;">
								<h4 class="name"><a href="/AddPet/WaitingPet?id=${Adopt.pet.id }">${Adopt.pet.name }</a></h4>
								<span class="regency">${Adopt.pet.breed }</span>
								<p class="desc">성별 : ${sexKorean }</p>
								<p class="desc">나이 : ${Adopt.pet.age }살</p>
								<p class="desc">무게 : ${Adopt.pet.weight }kg</p>
								<p class="desc">보호소 위치 : (${locationCityKorean })${locationKorean }점</p>
								<c:if test="${isWriter==true }">
									<label style="margin-top: 11px;">상세 사항 : </label> 
								</c:if>
								<c:if test="${isWriter==false }">
									<label>상세 사항 : </label> 
								</c:if>
								<textarea class="form-control" readonly rows="8" style="resize: vertical;  background: #E1E1E1;">${Adopt.pet.info }</textarea>
							</div>
						</div>
					</div>
					<!-- Pet 정보 끝 -->
					
					<!-- Member 정보 -->
					<div class="col-md-6">
						<div layout="row" class="item" style="width:100%;">
							<div class="nino-avatar fsr" style="width: 120px; height: 120px; border-radius: 70%; overflow: hidden;">
								<img class="img-circle" src="/resources/judayoung/defaultPerson.jpg" alt="" style="width: 100%; height: 100%; object-fit: cover;">
							</div>
						<!-- 본인 글이 아닐 때는 수정이 불가능하다. -->	
						<c:if test="${isWriter == false }">
							<div class="info" style="width:320px;">
								<h4 class="name">ID : ${Adopt.writer }</h4>
								<p class="desc">제목 : ${Adopt.title }</p>
								<p class="desc">가족 구성 : ${Adopt.family }</p>
								<p class="desc">직업 : ${Adopt.job }</p>
								<p class="desc">산책 가능 시간 : ${Adopt.walktime }</p>
								<p class="desc">현재까지 순대와의 만남 : ${Adopt.dating }번</p>
								<label>자기 소개 : </label> 
								<textarea class="form-control" readonly rows="8" style="resize: vertical;  background: #E1E1E1;">${Adopt.content }</textarea>
							</div>
						</c:if>
						
						<!-- 본인글이면 수정이 가능하다. -->	
						<c:if test="${isWriter == true }">
						
						<!-- 입양신청 수정 폼 -->
						<form id="form_adoptEdit" action="/Adopt/MemberAdoptEdit" method="post">
							<div class="info" style="width:320px;">
							
								<input type="hidden" name="num" value=${Adopt.num }>
							
								<h4 class="name">NickName : ${sessionScope.nickname }</h4>
								
								<input class="form-control" type="text" name="title" value="${Adopt.title }" placeholder="제목 : 행복하게 해주겠습니다.">
								<input class="form-control" type="text" name="family" value="${Adopt.family }" value="${MemberInfo.family }" placeholder="가족구성 : (반려동물 포함)" style="margin-top: 3px;">
								<input class="form-control" type="text" name="job" value="${Adopt.job }" value="${MemberInfo.job }" placeholder="직업 : (반려동물 케어에 필요한 정보입니다)" style="margin-top: 3px;">
								<input class="form-control" type="text" name="walktime" value="${Adopt.walktime }" value="${MemberInfo.walktime }" placeholder="산책가능한 시간 : (하루 1시간/일주일 4시간)" style="margin-top: 3px;">
								<p class="desc" style="margin-top: 3px;">
									<input type="hidden" id="dating" value="${Adopt.dating }">
									현재까지 ${Adopt.pet.name }와의 만남 회수 : ${Adopt.dating }번
								</p>
								<label>자기 소개 : </label> 
								<textarea class="form-control" rows="8" id="content" placeholder="자기 소개 : ${pet.name }를 향한 내 마음 ♥ 적기" style="resize: vertical;">${Adopt.content }</textarea>
		
							</div>
						</form>
						
						</c:if>
						
						</div>
					</div>
					<!-- Member 정보 끝 -->
				</div>
			</div>
			

    <footer id="footer" style="background: none;">
        <div class="container">
        	<div class="row">  
        		<div class="col-md-12" style="text-align: center;">
        			<div class="colInfo">
        				<!-- 고객일 때는 글 상태만 보인다. -->
        				<c:if test="${Adopt.state==0 && sessionScope.type==1}">
        					<span style="font-size: 20px; padding: 20px;">입양신청 중인 글입니다.</span>
        					
        					<c:if test="${Adopt.writer == sessionScope.id }">
        						<form class="nino-subscribeForm" style=" padding: 20px;">
	        						<div class="input-group input-group-lg">
										<span class="input-group-btn">
											<button num="${Adopt.num }" class="btn btn-success" type="button" style="font-size: 25px; background: #f38181;">신청 삭제</button>			
											<button num="${Adopt.num }" class="btn btn-success" type="button" style="font-size: 25px; background: #4FC9DE;">신청 수정</button>
										</span>
									</div>
	        					</form>
        					</c:if>
        				</c:if>
        				
        				<!-- 관리자 일때는 승인/거절 -->
        				<c:if test="${Adopt.state==0 && sessionScope.type==2}">
	        				<form class="nino-subscribeForm">
	        					<div class="input-group input-group-lg">
									<span class="input-group-btn">
										<button num="${Adopt.num }" class="btn btn-success" type="button" style="font-size: 25px; background: #f38181;">입양 거절</button>			
										<button num="${Adopt.num }" class="btn btn-success" type="button" style="font-size: 25px; background: #4FC9DE;">입양 승인</button>
									</span>
								</div>
	        				</form>
	        			</c:if>
	        			<c:if test="${Adopt.state==1 }">
							<span style="font-size: 20px; color: #4FC9DE;">입양신청이 승인된 글입니다.</span>
						</c:if>
						<c:if test="${Adopt.state==2 }">
							<span style="font-size: 20px; color: #f38181;">입양신청이 거절된 글입니다.</span>
						</c:if>
        			</div>
        		</div>
        	</div>
		</div>
    </footer>

			
    	</div>
    </section>
    <!--/#nino-happyClient-->


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
	
</body>
</html>
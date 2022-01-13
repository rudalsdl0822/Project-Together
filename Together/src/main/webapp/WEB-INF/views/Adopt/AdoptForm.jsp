<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>  
	<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  

<!DOCTYPE html>
<html lang="en" class=" js csstransitions">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	
	<title>Together | 입양신청 폼</title>

	<!-- jquery 라이브러리 불러들이기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- jquery 함수 시작================================================== -->

	<script>
	function fn_form_submit(form_id){
		var title=$("#title").val();
		var family=$("#family").val();
		var job=$("#job").val();
		var walktime=$("#walktime").val();
		var dating=0;
		var content=$("#content").val();
		
		var data="?title="+title+"&family="+family+"&job="+job+"&walktime="+walktime
				+"&dating="+dating+"&content="+content;
		
		alert("입양신청이 완료되었습니다. 메인 페이지로 이동합니다.");
		
		$("#"+form_id).attr("action","/Adopt/AdoptWish"+data); 
		$("#"+form_id).submit();
	}
	
	// 입양신청 폼 유효성 검사
	function fn_checkData(){
		$("#btn_adoptWish").attr("disabled",true);
		
		var p=$("#p_checkAdoptForm");
		p.text("");
		p.attr("style","color:red;");
		
		if($("#title").val()==""){
			p.text("제목은 필수입력입니다.");
			return false;
		}else if($("#family").val()==""){
			p.text("가족 구성은 필수입력입니다.");
			return false;
		}else if($("#job").val()==""){
			p.text("직업은 필수입력입니다.");
			return false;
		}else if($("#walktime").val()==""){
			p.text("산책 가능한 시간은 필수입력입니다.");
			return false;
		}else if($("#content").val()==""){
			p.text("자기소개는 필수입력입니다.");
			return false;
		}
		
		p.text("입양신청 폼이 완료되었습니다.");
		p.attr("style","color:blue;");
		$("#btn_adoptWish").attr("disabled",false);
			
		return true;
	}
	
	
	var member_id="${sessionScope.id}";
	var type="${sessionScope.type}";
	
		$(document).ready(function(){
			// 입양신청 버튼 비활성화
			$("#btn_adoptWish").attr("disabled",true);
			
			// 입양신청 폼 유효성을 검사
			$('input[type="text"], textarea').focusout(function () {
				fn_checkData();
			});
			
			// 입양신청 버튼
			$("#btn_adoptWish").click(function(){
				// 로그인이 되어있는지 확인합니다.
				if(member_id==""){
					var flag=confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if(flag){
						location.href="/Member/loginForm";
					}else{
						return;
					}
				}
				
				// 로그인 type 이 고객인지 확인합니다.
				if(type=="2"){
					alert("관리자는 입양신청이 불가능합니다.");
					return;
				}
				
				// 데이터가 다 들어가 있는지 확인합니다.
				var checkData = fn_checkData();
				if(checkData==false) return;
				
				// 입양신청을 한번 더 확인합니다.
				var flag=confirm("정말 ${pet.name}를 입양신청하시겠습니까?");
				
				if(flag){
					fn_form_submit("form_adoptWish");
				}
				
			});
		});
	</script>
	<!-- jquery 함수 시작 끝================================================== -->

</head>
<body>


<!-- 뷰 세팅================================================== -->
	<!-- locationCityKorean : 펫이 있는 장소의 도시를 한글화 합니다. -->
		<c:set var="locationCityKorean">
			<c:if test="${pet.location == 1 }">서울</c:if>
			<c:if test="${pet.location == 2 }">경기</c:if>
			<c:if test="${pet.location == 3 }">부산</c:if>
		</c:set>
	<!-- locationKorean : 펫이 있는 장소를 한글화 합니다. -->
		<c:set var="locationKorean">
			<c:if test="${pet.location == 1 }">강남</c:if>
			<c:if test="${pet.location == 2 }">안양</c:if>
			<c:if test="${pet.location == 3 }">해운대</c:if>
		</c:set>
	<!-- sexKorean : 펫 성별을 한글화 합니다. -->
		<c:set var="sexKorean">
			<c:if test="${pet.sex == 1 }">남자</c:if>
			<c:if test="${pet.sex == 2 }">여자</c:if>
		</c:set>
<!-- 뷰 세팅 끝================================================== -->


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
						<div layout="row" class="item" style="width:100%;">
							<div class="nino-avatar fsr" style="width: 120px; height: 120px; border-radius: 70%; overflow: hidden;">
								<a href="/Adopt/WaitingPet?id=${pet.id }">
									<img class="img-circle" src="/AddPet/petImg?id=${pet.id}&petImgNum=1" alt="" style="width: 100%; height: 100%; object-fit: cover;">
								</a>
							</div>
							<div class="info" style="width:320px;">
								<h4 class="name"><a href="/Adopt/WaitingPet?id=${pet.id}">${pet.name }</a></h4>
								<span class="regency">${pet.breed }</span>
								<p class="desc">성별 : ${sexKorean }</p>
								<p class="desc">나이 : ${pet.age }살</p>
								<p class="desc">무게 : ${pet.weight }kg</p>
								<p class="desc">보호소 위치 : (${locationCityKorean })${locationKorean }점</p>
								<p class="desc" style="width: 90%;">
									상세 사항 : 
									<textarea rows="5" id="content" readonly style="width:100%; resize: vertical;  background: #E1E1E1;">${pet.info }</textarea>
								</p>
							</div>
						</div>
					</div>
					<!-- Pet 정보 끝 -->
					
					<!-- Member 정보 -->
					<div class="col-md-6">
						<div layout="row" class="item" style="width:100%;">
							<div class="nino-avatar fsr" style="width: 120px; height: 120px; border-radius: 70%; overflow: hidden;">
								<img class="img-circle" src="/resources/judayoung/defaultPerson.jpg" alt="">
							</div>
							<div class="info" style="width:320px;">
								<h4 class="name">NickName : ${sessionScope.nickname }</h4>
								<span class="regency" style="width:100%;">
									<input type="text" id="title" placeholder="제목 : 행복하게 해주겠습니다." style="width:100%;" style="width: 100%; height: 100%; object-fit: cover;">
								</span>
								<p class="desc">
									<input type="text" id="family" value="${MemberInfo.family }" placeholder="가족구성을 적어주세요(반려동물 포함)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="text" id="job" value="${MemberInfo.job }" placeholder="직업 : (반려동물 케어에 필요한 정보입니다)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="text" id="walktime" value="${MemberInfo.walktime }" placeholder="산책가능한 시간 : (하루 1시간/일주일 4시간)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="hidden" id="dating" value="${MemberInfo.dating }">
									현재까지 ${pet.name }와의 만남 회수 : ${MemberInfo.dating }번
								</p>
								<p class="desc" style="width: 90%;">
									자기 소개 :
									<textarea rows="5" id="content" placeholder="자기 소개 : ${pet.name }를 향한 내 마음 ♥ 적기" style="width:100%; resize: vertical;"></textarea>
								</p>
								
								
								<p id="p_checkAdoptForm" class="desc" style="color: red;"></span>
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
        			
        				<!-- 입양신청 폼 시작 -->
	        			<form id="form_adoptWish" method="post" class="nino-subscribeForm">
	        				<div class="input-group input-group-lg">
								<span class="input-group-btn">
									<input type="hidden" value="${sessionScope.id }" name="writer">
									<input type="hidden" value="${pet.id }" name="pet_id">
									<button id="btn_adoptWish" class="btn btn-success" type="button" style="font-size: 25px;">${pet.name }와 함께 할래요</button>
								</span>
							</div>
	        			</form>
	        			<!-- 입양신청 폼 끝 -->
	        			
        			</div>
        		</div>
        	</div>
		</div>
    </footer>
    <!--/#footer-->
			
    	</div>
    </section>

   
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
	
</body>
</html>
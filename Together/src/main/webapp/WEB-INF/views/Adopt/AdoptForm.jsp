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
	
	<title>Together | 입양신청 폼</title>
	
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
	
	function fn_checkData(){
		if($("#title").val()==""){
			alert("제목을 적어주세요");
			$("#title").focus();
			return false;
		}else if($("#family").val()==""){
			alert("가족 구성을 적어주세요");
			$("#family").focus();
			return false;
		}else if($("#job").val()==""){
			alert("직업을 적어주세요");
			$("#job").focus();
			return false;
		}else if($("#walktime").val()==""){
			alert("산책 가능 시간을 적어주세요");
			$("#walktime").focus();
			return false;
		}else if($("#content").val()==""){
			alert("내용을 적어주세요");
			$("#content").focus();
			return false;
		}
			
		return true;
	}
	
	
	var member_id="${sessionScope.id}";
	var type="${sessionScope.type}";
	
		$(document).ready(function(){
			
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

<h3>상단 배너</h3>


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
						<div layout="row" class="item">
							<div class="nino-avatar fsr">
								<a href="/Adopt/WaitingPet?id=1111">
									<img class="img-circle" src="/resources/judayoung/waitingPet-1.jpg" alt="">
								</a>
							</div>
							<div class="info">
								<h4 class="name"><a href="/Adopt/WaitingPet?id=1111">${pet.name }</a></h4>
								<span class="regency">${pet.breed }</span>
								<p class="desc">성별 : ${sexKorean }</p>
								<p class="desc">나이 : ${pet.age }살</p>
								<p class="desc">무게 : ${pet.weight }kg</p>
								<p class="desc">보호소 위치 : (${locationCityKorean })${locationKorean }점</p>
								<p class="desc">상세 사항 : ${pet.info }</p>
							</div>
						</div>
					</div>
					<!-- Pet 정보 끝 -->
					
					<!-- Member 정보 -->
					<div class="col-md-6">
						<div layout="row" class="item" style="width:100%;">
							<div class="nino-avatar fsr">
								<img class="img-circle" src="/resources/judayoung/defaultPerson.jpg" alt="">
							</div>
							<div class="info" style="width:100%;">
								<h4 class="name">NickName : ${sessionScope.nickname }</h4>
								<span class="regency" style="width:100%;">
									<input type="text" id="title" placeholder="제목 : 행복하게 해주겠습니다." style="width:100%;">
								</span>
								<p class="desc">
									<input type="text" id="family" value="${MemberInfo.family }" placeholder="가족구성을 적어주세요(반려동물 포함)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="text" id="job" value="${MemberInfo.job }" placeholder="직업을 적어주세요(반려동물 케어에 필요한 정보입니다)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="text" id="walktime" value="${MemberInfo.walktime }" placeholder="산책가능한 시간을 적어주세요(하루 1시간/일주일 4시간)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="hidden" id="dating" value="${MemberInfo.dating }">
									현재까지 ${pet.name }와의 만남 회수 : ${MemberInfo.dating }번
								</p>
								<textarea rows="5" id="content" placeholder="자기 소개 : ${pet.name }를 향한 내 마음 ♥ 적기" style="width:100%; resize: vertical;"></textarea>
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
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
	
	<title>Together | 입양신청 상세보기</title>
	
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
		
			$("button").click(function(){
				if( $(this).text()=="입양 승인" ){
					var flag=confirm("정말로 입양을 승인하겠습니까?");
					if(flag==false) return;
				
					var num=$(this).attr("num");
				
					location.href="/Adopt/AdoptAccept?num="+num;
				}else{
					
				}
			});
		
		});
	</script>

</head>
<body>

<h3>상단 배너</h3>


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
								<p class="desc" style="width: 90%;">
									상세 사항 : 
									<textarea rows="5" id="content" readonly style="width:100%; resize: vertical;">${Adopt.pet.info }</textarea>
								</p>
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
								<!-- ==== 수정할 사항 : member nickname 가져오기 ===== -->
								<h4 class="name">ID : ${Adopt.writer }</h4>
								<span class="regency">title : ${Adopt.title }</span>
								<p class="desc">가족 구성 : ${Adopt.family }</p>
								<p class="desc">직업 : ${Adopt.job }</p>
								<p class="desc">산책 가능 시간 : ${Adopt.walktime }</p>
								<p class="desc">현재까지 순대와의 만남 : ${Adopt.dating }번</p>
								<p class="desc" style="width: 90%;">
									자기 소개 : 
									<textarea rows="5" id="content" readonly style="width:100%; resize: vertical;">${Adopt.content }</textarea>
								</p>
							</div>
						</c:if>
						
						<!-- 본인글이면 수정이 가능하다. -->	
						<c:if test="${isWriter == true }">
							<div class="info" style="width:280px;">
								<h4 class="name">NickName : ${sessionScope.nickname }</h4>
								<span class="regency" style="width:100%;">
									<input type="text" id="title" value="${Adopt.title }" placeholder="제목 : 행복하게 해주겠습니다." style="width:100%;" style="width: 100%; height: 100%; object-fit: cover;">
								</span>
								<p class="desc">
									<input type="text" id="family" value="${Adopt.family }" placeholder="가족구성을 적어주세요(반려동물 포함)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="text" id="job" value="${Adopt.job }" placeholder="직업을 적어주세요(반려동물 케어에 필요한 정보입니다)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="text" id="walktime" value="${Adopt.walktime }" placeholder="산책가능한 시간을 적어주세요(하루 1시간/일주일 4시간)" style="width:100%;">
								</p>
								<p class="desc">
									<input type="hidden" id="dating" value="${Adopt.dating }">
									현재까지 ${Adopt.pet.name }와의 만남 회수 : ${Adopt.dating }번
								</p>
								<p class="desc" style="width: 90%;">
									자기 소개 : 
									<textarea rows="5" id="content" placeholder="자기 소개 : ${Adopt.pet.name }를 향한 내 마음 ♥ 적기" style="width:100%; resize: vertical;">${Adopt.content }</textarea>
								</p>
							</div>
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


    <!-- Footer
    ================================================== -->
    <footer id="footer">
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			<div class="colInfo">
	        			<div class="footerLogo">
	        				<a href="${pageContext.request.contextPath}/index" >Together</a>	
	        			</div>
	        			<p>강남점 : 서울특별시 강남구 강남대로 396, TEL: 010-0000-0000 
	        			<br>안양점 : 경기 안양시 만안구 만안로 232, TEL: 010-0000-0000
	        			<br>해운대점 : 부산광역시 해운대구 해운대로 626, TEL: 010-0000-0000</p>
        			</div>
        		</div>
        		
        		
        	</div>
			<div class="nino-copyright">Copyright &copy; 2021. All Rights Reserved. <br/> MoGo free PSD template by <a href="https://www.behance.net/laaqiq">Laaqiq</a></div>
        </div>
    </footer><!--/#footer-->


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
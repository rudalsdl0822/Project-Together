<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<!-- jstl -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" class=" js csstransitions">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	
	<title>Together | 내 입양신청 내역</title>
	
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
	
	<!-- 함수 -->
	<script>
	/* select 함수 시작*/
	function selChange(){	
		var state=document.getElementById("state").value;
		
		location.href="/Adopt/MemberAdoptWishList?state="+state;
		
	}
	/* select 함수 끝*/

		$(document).ready(function(){
			
			$("button").click(function(){
				var num=$(this).attr("num");
				
				var flag=confirm("정말로 "+num+"번 입양신청글을 삭제하겠습니까?");
				if(flag==false) return;

				$.post("/Adopt/MemberAdoptDelete",{num:num})
				.done(function(json){
					location.reload();
				})
				.fail(function(){
					alert("error");
				});
				
			});
			
		});
	</script>
	<!-- 함수 끝-->

</head>
<body>


    <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">List</span>
				나의 입양신청 내역
			</h2>
			
			<div class="sectionContent">
				<!-- 옵션선택 시작 -->
				<div style="text-align: right; padding: 10px;">
					<!-- state select -->
					<select id="state" name="stateSel" onchange="selChange()">
						<option value="0"
							<c:if test="${state==0 }">selected</c:if>>신청중인 입양신청글만 보기</option>
						<option value="1"
							<c:if test="${state==1 }">selected</c:if>>승인된 입양신청글만 보기</option>
						<option value="2"
							<c:if test="${state==2 }">selected</c:if>>거절된 입양신청글만 보기</option>
						<option value="3"
							<c:if test="${state==3 }">selected</c:if>>전체 입양신청글 보기</option>
					</select>

				</div>
				<!-- 옵션선택 끝 -->
			
			
			<!-- ======== adoptList 시작 ============================================= -->
			<c:if test="${adoptList.isEmpty()==true }"> 입양신청한 글이 없습니다. </c:if>
			<c:forEach items="${adoptList }" var="Adopt" varStatus="status">
			
			
				<!-- 뷰 세팅================================================== -->
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
				<!-- 뷰 세팅 끝================================================== -->
			
				
				<!-- 한줄 시작 -->
				<c:if test="${status.count%3==1 }">
					<div class="row" style="margin-bottom: 25px;">
				</c:if>
						<div class="col-md-4 col-sm-4">
							<article>
							<!-- 입양신청 1개 시작-->
							<a href="/Adopt/WaitingPerson?num=${Adopt.num }">
								<div class="articleThumb">
									<div style="text-align: right; position: relative; width: 100%; height: 0; overflow: hidden; padding-bottom: 60%; object-fit: cover;">
										<img src="/AddPet/petImg?id=${Adopt.pet_id}&petImgNum=1" alt="" style="position: absolute; width: 88%; top: 0; right: 0;">
									</div>
									
									<div class="date">
										<span class="number" style="font-size: 18px; padding: 5px;">${Adopt.pet.name }</span>
										<span class="text"">
											${locationKorean }점
										</span>
										<span class="text">
											${sexKorean }
										</span>
									</div>

								</div>
								<h3 class="articleTitle"  style="width: 90%; text-overflow: ellipsis; overflow: hidden; white-space: no-wrap;">
									입양신청 번호 : ${Adopt.num }
								</h3>
								<h3 class="articleTitle"  style="width: 90%; text-overflow: ellipsis; overflow: hidden; white-space: no-wrap;">
									제목 : ${Adopt.title }
								</h3>
								<p class="articleDesc"  style="width: 90%; text-overflow: ellipsis; overflow: hidden; white-space: no-wrap;">
									자기 소개 : ${Adopt.content }
								</p>
							</a>
							
							<div class="articleMeta">
								<i class="mdi mdi-eye nino-icon"></i> 만난 회수 : ${Adopt.dating }
								<div style="text-align: right;">
									<c:if test="${Adopt.state==0 }">
										<span style="color: #000000;">입양신청 중인 글입니다.</span>
										<button type="button" num="${Adopt.num }" class="btn btn-default btn-lg" style="margin: 1px; padding: 3px; font-size: 12px; color: #f38181;">
											<span class="glyphicon glyphicon-remove" aria-hidden="true" style="font-size: 12px;"></span> 신청 삭제
										</button>
									</c:if>
									<c:if test="${Adopt.state==1 }">
										<span style="color: #4FC9DE;">입양신청이 승인된 글입니다.</span>
									</c:if>
									<c:if test="${Adopt.state==2 }">
										<span style="color: #f38181;">입양신청이 거절된 글입니다.</span>
									</c:if>									
								</div>
							</div>
							<!-- 입양신청 1개 끝 -->
				
						</article>
					</div>
				<!-- 한줄 끝 -->
				<c:if test="${status.count%3==0 || status.last}">
					</div>
				</c:if>
				
			</c:forEach>
			
			
				
			</div>
    	</div>
    </section>
    <!--/#nino-latestBlog-->


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
	<%@ include file="/WEB-INF/views/header_test.jsp" %>
</html>
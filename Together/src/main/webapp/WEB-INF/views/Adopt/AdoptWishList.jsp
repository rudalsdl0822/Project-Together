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
	
	<title>Together | 입양신청자 리스트</title>
	
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
		var sel=document.getElementById("cntPerPage").value;
		
		var recent_state="${state }";
		var state=document.getElementById("state").value;
		
		if(recent_state==state){
			location.href="/Adopt/AdoptWishList?nowPage=${paging.nowPage}&cntPerPage="+sel+"&state="+state;
		}else{
			location.href="/Adopt/AdoptWishList?cntPerPage="+sel+"&state="+state;
		}
		
	}
	/* select 함수 끝*/

		$(document).ready(function(){
			
			$("button").click(function(){
				var num=$(this).attr("num");
				
				if( $(this).text()=="입양 승인" ){
					var flag=confirm("정말로 입양을 승인하겠습니까?");
					if(flag==false) return;
					
					var sel=document.getElementById("cntPerPage").value;
					var state=document.getElementById("state").value;
					location.href="/Adopt/AdoptAccept?num="+num+"&nowPage=${paging.nowPage}&cntPerPage="+sel+"&state="+state;
				}else{
					var flag=confirm("정말로 입양을 거절하겠습니까?");
					if(flag==false) return;
					
					var sel=document.getElementById("cntPerPage").value;
					var state=document.getElementById("state").value; 
					location.href="/Adopt/AdoptReject?num="+num+"&nowPage=${paging.nowPage}&cntPerPage="+sel+"&state="+state;
				}
			});
			
		});
	</script>
	<!-- 함수 끝-->

</head>
<body>

<h3>상단 배너</h3>


    <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">List</span>
				입양신청 리스트
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
					<!-- paging select -->
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="3"
							<c:if test="${paging.cntPerPage==3 }">selected</c:if>>3개씩 보기</option>
						<option value="6"
							<c:if test="${paging.cntPerPage==6 }">selected</c:if>>6개씩 보기</option>
						<option value="9"
							<c:if test="${paging.cntPerPage==9 }">selected</c:if>>9개씩 보기</option>
						<option value="12"
							<c:if test="${paging.cntPerPage==12 }">selected</c:if>>12개씩 보기</option>
						<option value="24"
							<c:if test="${paging.cntPerPage==24}" >selected</c:if>>24개씩 보기</option>
					</select>
				</div>
				<!-- 옵션선택 끝 -->
			
			
			<!-- ======== adoptList 시작 ============================================= -->
			<c:forEach items="${adoptList }" var="Adopt" varStatus="status">
				
				<!-- 한줄 시작 -->
				<c:if test="${status.count%3==1 }">
					<div class="row" style="margin-bottom: 25px;">
				</c:if>
						<div class="col-md-4 col-sm-4">
							<article>
							<!-- 입양신청 1개 시작-->
							<a href="/Adopt/WaitingPerson?num=${Adopt.num }">
								<div class="articleThumb">
									<div style="text-align: right;">
										<img src="/resources/judayoung/waitingPet-1.jpg" alt="" width="88%">
									</div>
									
									<div class="date">
										<span class="number" style="padding: 5px;">${Adopt.num }</span>
										<span class="text">
											이름
										</span>
										<span class="text">id : ${Adopt.pet_id }</span>
									</div>

								</div>
								<h3 class="articleTitle">입양신청자 ID : ${Adopt.writer }</h3>
								<h3 class="articleTitle">title : ${Adopt.title }</h3>
								<!-- *********수정할 사항 : content 길어지면 ...으로 축약하기********* -->
								<p class="articleDesc">
									자기 소개 : ${Adopt.content }
								</p>
							</a>
							
							<div class="articleMeta">
								<i class="mdi mdi-eye nino-icon"></i> 만난 회수 : ${Adopt.dating }
								<div style="text-align: right;">
									<c:if test="${Adopt.state==0 }">
										<form method="post">
											<span class="input-group-btn">
												<button class="btn btn-success" num="${Adopt.num }" type="button" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">입양 거절</button>			
												<button class="btn btn-success" num="${Adopt.num }" type="button" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">입양 승인</button>
											</span>
										</form>
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
			
			
			<!-- ========= 페이징 번호 시작 =========================================== -->
			<div style="display: block; text-align: center;">
				<!-- 왼쪽 화살표 링크 -->
				<c:if test="${paging.startPage!=1 }">
					<a href="/Adopt/AdoptWishList?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}&state=${state}" style="font-size: 25px; padding: 10px">&lt;</a>
				</c:if>
				<!-- 페이지 숫자 링크 -->
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<!-- 현재 페이지는 굵은 글씨로 링크 없이. -->	<!-- 다른 페이지는 링크 있게. -->
					<c:choose>
						<c:when test="${p==paging.nowPage }"> <b style="font-size: 30px; padding: 10px"">${p }</b></c:when>
						<c:when test="${p!=paging.nowPage }"> 
							<a href="/Adopt/AdoptWishList?nowPage=${p }&cntPerPage=${paging.cntPerPage}&state=${state}" style="font-size: 25px; padding: 10px"">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<!-- 오른쪽 화살표 링크 -->
				<c:if test="${paging.endPage!=paging.lastPage }">
					<a href="/Adopt/AdoptWishList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&state=${state}" style="font-size: 25px; padding: 10px"">&gt;</a>
				</c:if>
			</div>	
			<!-- ========= 페이징 번호 끝 =========================================== -->
				
			</div>
    	</div>
    </section>
    <!--/#nino-latestBlog-->


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
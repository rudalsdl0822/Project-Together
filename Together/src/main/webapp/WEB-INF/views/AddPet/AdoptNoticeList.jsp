<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 


	<title>입양공고</title>


	<!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/template.css" />
	
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
		
	</script>
	
</head>
<body data-target="#nino-navbar" data-spy="scroll">

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
								<li><a href="${pageContext.request.contextPath}/index">홈</a></li>
								<li class="active"><a href="${pageContext.request.contextPath}/AddPet/AdoptNoticeList">입양공고<span class="sr-only">(current)</span></a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후기게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/AddPet/AddPet">입소신청</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후원하기</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">회원가입 / 로그인</a></li>
							</ul>
						</div><!-- /.navbar-collapse -->
					
					</div>
				</div><!-- /.container-fluid -->
			</nav>
		</div>
	</header><!--/#header-->

	

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
						       <li><a href="#" onClick="location.href='${pageContext.request.contextPath}/AddPet/LocationList?location=1'">강남점</a></li>
						       <li><a href="#" onClick="location.href='${pageContext.request.contextPath}/AddPet/LocationList?location=2'">안양점</a></li>
						       <li><a href="#" onClick="location.href='${pageContext.request.contextPath}/AddPet/LocationList?location=3'">해운대점</a></li>
						      </ul>
						    </div>
						    <div class="btn-group">
						      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						      입양상태 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
						        <li><a href="#" onClick="location.href='${pageContext.request.contextPath}/AddPet/StateList?state=2&page=AdoptNotice'">입양대기</a></li>
						        <li><a href="#" onClick="location.href='${pageContext.request.contextPath}/AddPet/StateList?state=3&page=AdoptNotice'">입양문의중</a></li>
						       </ul>
						    </div>
						  </div>
						</div>
					</div>
					<br><br>
					
					<c:if test="${empty list}">
						<br>
						등록된 입양공고가 없습니다
						<br>
					</c:if>
					
					<c:forEach var="p" items="${list}" varStatus="status">
						<c:if test="${p.state!=4}">
							
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
							
						</c:if>
					</c:forEach>
					
			</div>
    	</div>
    </section>
    
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
   
    <!-- Scroll to top
    ================================================== -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	<!-- javascript -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/template.js"></script>


</body>
</html>


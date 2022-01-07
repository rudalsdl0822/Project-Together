<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>Together | 회원정보수정</title>
	
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
	<script type="text/javascript">
	
	
	$(document).ready(function () {
		$("#join").click(function () {
			
			
			var f= document.joinForm;
			var arrRadio = document.getElementsByName("gender");
		     if(f.pwd.value==""){
				alert("비밀번호를 입력하세요.");
				f.pwd.focus();
				return false;
			}else if(f.pwd2.value==""){
				alert("비밀번호 확인을 입력하세요.");
				f.pwd2.focus();
				return false;
			}else if(f.nickname.value==""){
				alert("닉네임을 입력하세요.");
				f.nickname.focus();
				return false;
			}else if(f.name.value==""){
				alert("성명을 입력하세요.");
				f.name.focus();
				return false;
			}else if(!arrRadio[0].checked && !arrRadio[1].checked){
				alert("성별을 선택하세요.");
				return false;
			}else if(f.phone.value==""){
				alert("휴대폰 번호를 입력하세요.");
				f.phone.focus();
				return false;
			}else if(f.address.value==""){
				alert("주소를 입력하세요.");
				f.address.focus();
				return false;
			}else if(f.email.value==""){
				alert("이메일을 입력하세요.");
				f.email.focus();
				return false;
			}
			
			if(f.pwd.value != f.pwd2.value){
				alert("두 비밀번호가 서로 일치하지 않습니다.");
				return false;
			}
			
		});
	});
	</script>
	
	
</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">

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
								<li><a href="${pageContext.request.contextPath}/views/">입양공고</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후기게시판</a></li>
								<li><a href="${pageContext.request.contextPath}/AddPet/AddPet">입소신청</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후원하기</a></li>
								<li class="active"><a href="${pageContext.request.contextPath}/Member/loginForm">회원가입 / 로그인</a></li>
							</ul>
						</div><!-- /.navbar-collapse -->
					
					</div>
				</div><!-- /.container-fluid -->
			</nav>
		</div>
	</header>

 <!-- container Form
    ================================================== -->
<section id="onlineAddPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				내정보수정
			</h2>
<form name="editForm" class="form-signin" action="${pageContext.request.contextPath}/Member/edit" method="post">
  <fieldset>
  <legend>회원정보수정</legend>
    <div class="form-group">
      <label for="inputPetName">아이디 </label>
      <input type="text" class="form-control" id="id"  name="id" value="${m.id}" placeholder="아이디" readonly>
      <span id="idResult"></span>
    </div>
    <div class="form-group">
      <label for="inputBreed">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name= "pwd" value="${m.pwd }" placeholder="비밀번호를 입력하세요.">
    </div>
    <div class="form-group">
      <label for="inputBreed">비밀번호 확인</label>
      <input type="password" class="form-control" id="pwd2" name= "pwd2" placeholder="비밀번호 확인">
    </div>   
    <div class="form-group">
      <label for="inputBreed">닉네임</label>
      <input type="text" class="form-control" id="nickname" name= "nickname" value="${m.nickname }" placeholder="닉네임을 입력하세요.">
    </div>
    
    <fieldset class="form-group">
      <legend>개인정보</legend>
      
     <div class="form-group">
      <label for="inputAge">성명</label>
      <input type="text" class="form-control" id="name" name="name" value="${m.name}" placeholder="성명을 입력하세요.">
    </div>
    
  
       <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" id="gender" value="1" checked>
          남성
        </label>
      </div>
      
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" id="gender" value="2">
          여성
        </label>
      </div>
      <div class="form-group">
      <label for="inputAge">휴대폰번호</label>
      <input type="text" class="form-control" id="phone" name="phone" value="${m.phone }" placeholder="-없이 입력하세요.">
    </div>
    
    <div class="form-group">
      <label for="inputAge">주소</label>
      <input type="text" class="form-control" id="address" name="address" value="${m.address }" placeholder="주소를 입력하세요.">
    </div>
    
    <div class="form-group">
      <label for="inputAge">이메일</label>
      <input type="email" class="form-control" id="email" name="email" value="${m.email }" placeholder="이메일을 입력하세요.">
    </div>
      </fieldset>
    
       <legend>회원유형</legend>
     
    <div class="form-group">
      <label for="selectLocation">회원 유형</label>
    <c:choose>
	<c:when test="${m.type==1 }">관리자</c:when>
	<c:when test="${m.type==2 }">고객</c:when>
    </c:choose>
      
    </div>
    
    
    <hr>
    <button type="reset" class="nino-btn" name=""> 초기화 </button>
    <button type="submit" class="nino-btn" style="background: #95e1d3;" name="" >회원정보수정</button>
     </fieldset>
</form>
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

    <!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
   
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

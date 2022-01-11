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
	<title>Together | 온라인 입소 신청 글쓰기</title>
	
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
	var maxSize = 5 * 1024 * 1024; // file max size 5MB
	var fileSize; // 파일 사이즈
	
	$(document).ready(function(){
		
		$('#btn_submit').click(function(){
			// 필수 항목 유효성 체크
			if($('#inputPetName').val()==""){
				alert("Pet의 이름을 입력해주세요.");
				$('#inputPetName').focus();
				return false;
			} else if ($('#selectLocation').val()==""){
				alert("신청하려는 보호소 지점을 선택해주세요.");
				$('#selectLocation').focus();
				return false;
			} else if ($('#inputFile1').val() == ""){
				alert("(필수) 사진 이미지를 올려주세요.");
				$('#inputFile1').focus();
				return false;
			} else if ($('#inputFile2').val() == ""){
				alert("(필수) 사진 이미지를 올려주세요.");
				$('#inputFile2').focus();
				return false;
			} else if ($('#inputFile3').val() == ""){
				alert("(필수) 사진 이미지를 올려주세요.");
				$('#inputFile3').focus();
				return false;
			}
			$('#form_addPet').submit();
		});
		
		$('input[type=file]').change(function(){
			if ($(this).val != "" && $(this).val != null) {
				// 확장자 체크
				var ext = $(this).val().split(".").pop().toLowerCase();
				if ($.inArray(ext, ["gif","jpg","jpeg","png","hwp","pdf","doc","xls","xlsx","ppt","pptx","docx"])==-1){
					alert("이미지 파일(gif, jpg, jpeg, png 파일)만 업로드 가능합니다.");
			    	$(this).val("");
			        return;
				}
				
				// 용량 체크
				for (var i=0; i<this.files.length;i++){
					fileSize = this.files[i].size;
					if (fileSize>maxSize){
						alert("이미지 파일 용량은 5MB 미만으로 등록 가능합니다.");
						$(this).val("");
						return;
					}
				}
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
								<li class="active"><a href="${pageContext.request.contextPath}/AddPet/AddPet">입소신청</a></li>
								<li><a href="${pageContext.request.contextPath}/views/">후원하기</a></li>
								
								<!--  로그인 이전 -->
								<c:if test="${empty sessionScope.id}">
								<li><a href="${pageContext.request.contextPath}/Member/loginForm">로그인/회원가입</a></li>
								</c:if>
								
								<!-- 로그인 한 경우 -->
								<c:if test="${not empty sessionScope.id}">
								
								<!-- 관리자의 경우 -->
								<c:if test="${sessionScope.type==2}">
								<li class="nav-item dropdown">
								        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent;">관리자페이지<span class="caret"></span></a>
									        <ul class="dropdown-menu">
									        
									          <li><a class="dropdown-item" href="#">관리자페이지 - 홈</a></li>
									        
									          <li class="dropdown-header">회원 정보</li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Member/logout">로그아웃</a></li>
									          <li><a class="dropdown-item" href="#">내 정보수정</a></li>
									          <li><a class="dropdown-item" href="#">전체 회원 관리</a></li>
									          <li><a class="dropdown-item" href="#">1:1 문의 답변</a></li>
									         
									          <li class="dropdown-header">신청 리스트</li>
									          <li><a class="dropdown-item" href="#">입양 신청 리스트</a></li>
									          <li><a class="dropdown-item" href="#">입소 신청 리스트</a></li>
									        </ul>
								    </li>
								    </c:if>
								    
								    <!-- 고객의 경우 -->
								    <c:if test="${sessionScope.type==1}">
									<li class="nav-item dropdown">
								        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" style="background-color:transparent;">마이페이지<span class="caret"></span></a>
									        <ul class="dropdown-menu">
									          <li><a class="dropdown-item" href="#">마이페이지 - 홈</a></li>
									          
									          <li class="dropdown-header">내 정보</li>
									          <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Member/logout">로그아웃</a></li>
									          <li><a class="dropdown-item" href="#">내 정보수정</a></li>
									          <li><a class="dropdown-item" href="#">관심등록 목록</a></li>
									          <li><a class="dropdown-item" href="/Ask/AskForm">1:1 문의하기</a></li>
									          
									          <li class="dropdown-header">신청 내역</li>
									          <li><a class="dropdown-item" href="#">입양 신청 내역</a></li>
									          <li><a class="dropdown-item" href="#">입소 신청 내역</a></li>
									        </ul>
								    </li>
								    </c:if>
								</c:if>
							</ul>
						</div><!-- /.navbar-collapse -->
					</div>
				</div><!-- /.container-fluid -->
			</nav>
		</div>
	</header>
	
	
	
	<!-- 로그인 하지 않은 경우, 작성 불가하도록! -->
	
<c:if test="${empty sessionScope.id}">
<section id="onlineAddPet">
		<div class="container" style="text-align:center;">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				회원 로그인 해야 입소신청이 가능합니다
			</h2>
			<br>
			<button type="submit" class="nino-btn" style="background: #95e1d3;" onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>
			
		</div>
</section>

</c:if>

<!-- 로그인 한 경우 -->

<c:if test="${not empty sessionScope.id}">
 <!-- container Form
    ================================================== -->
<section id="onlineAddPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				온라인 입소 신청
			</h2>

<form class="form-signin" action="${pageContext.request.contextPath}/AddPet" id="form_addPet" method="post" enctype="multipart/form-data">
  <fieldset>
  <input type="hidden" name="writer_id" value="${sessionScope.id}"> <!-- id 값 session에서 가져오기 작성해야함 kyungmin -->
    <div class="form-group">
      <label for="inputPetName">펫 이름</label><span class="badge badge-pill badge-info">필수</span>
      <input type="text" class="form-control" id="inputPetName" name="name" placeholder="펫의 이름을 적어주세요.">
    </div>
    <div class="form-group">
      <label for="inputBreed">품종</label> <!-- null -->
      <input type="text" class="form-control" id="inputBreed" name= "breed" placeholder="품종을 적어주세요. ex)말티즈 ">
    </div>
    <fieldset class="form-group">
      <label for="inputSex">성별</label><span class="badge badge-pill badge-info">필수</span>
	  <div class="form-check">
	      <input type="radio" class="form-check-input"  name="sex" id="sex" value="1" checked>수컷
	  </div>
	  <div class="form-check">
	      <input type="radio" class="form-check-input" name="sex" id="sex" value="2">암컷
	  </div>
    </fieldset>
    <div class="form-group">
      <label for="inputAge">나이</label> <!-- null -->
      <input type="text" class="form-control" id="inputAge" name="age" placeholder="나이를 숫자로 적어주세요.">
    </div>
     <div class="form-group">
      <label for="inputAge">무게</label> <!-- null -->
      <input type="text" class="form-control" id="inputWeight" name="weight" placeholder="무게를 숫자로 적어주세요.">
    </div>
    <div class="form-group">
      <label for="selectLocation">신청 보호소 지점</label><span class="badge badge-pill badge-info">필수</span>
      <select class="form-control" name="location" id="selectLocation">
        <option value="">-선택-</option>
        <option value="1">강남점</option>
        <option value="2">안양점</option>
        <option value="3">해운대점</option>
      </select>
    </div>
    <div class="form-group">
      <label for="textareaInfo">상세사항 (성격 등 특징들을 적어주세요.)</label> <!-- null -->
      <textarea class="form-control" id="textareaInfo" name="info" rows="5" style="resize: none;"></textarea>
    </div>
    <hr>
    <div class="form-group">
    	<label for="inputFile">펫 이미지 첨부</label><br>
      <label for="inputFile1">사진 파일 1</label><span class="badge badge-pill badge-info">필수</span>
      <input type="file" class="form-control-file" name="file1" id="inputFile1" accept="image/*"  aria-describedby="fileHelp">
   	</div>
   	 <div class="form-group">
      <label for="inputFile2">사진 파일 2</label><span class="badge badge-pill badge-info">필수</span>
      <input type="file" class="form-control-file" name="file2" id="inputFile2" accept="image/*" aria-describedby="fileHelp">
    </div>
     <div class="form-group">
      <label for="inputFile3">사진 파일 3</label><span class="badge badge-pill badge-info">필수</span>
      <input type="file" class="form-control-file" name="file3" id="inputFile3" accept="image/*" aria-describedby="fileHelp">
    </div>
     <small id="emailHelp" class="form-text text-muted">이미지 파일은 5MB 미만의 용량 파일만 등록 가능하며, 3가지 이미지를 필수로 등록해야합니다.</small>
    <hr>
    <button type="submit" class="nino-btn" style="background: #95e1d3;" id="btn_submit">온라인 입소 신청</button>
     </fieldset>
</form>
</div>
</section>

</c:if>
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

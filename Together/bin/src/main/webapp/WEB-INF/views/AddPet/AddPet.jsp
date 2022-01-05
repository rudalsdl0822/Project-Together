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
								<li><a href="${pageContext.request.contextPath}/views/">회원가입 / 로그인</a></li>
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
				온라인 입소 신청
			</h2>
<form class="form-signin" action="${pageContext.request.contextPath}/AddPet" method="post" enctype="multipart/form-data">
  <fieldset>
    <div class="form-group">
      <label for="inputPetName">펫 이름</label>
      <input type="text" class="form-control" id="inputPetName"  name="name" placeholder="펫의 이름을 적어주세요.">
    </div>
    <div class="form-group">
      <label for="inputBreed">품종</label>
      <input type="text" class="form-control" id="inputBreed" name= "breed" placeholder="품종을 적어주세요. ex)말티즈 ">
    </div>
    <fieldset class="form-group">
      <legend>성별</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="sex" id="sex" value="1" checked>
          수컷
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="sex" id="sex" value="2">
          암컷
        </label>
      </div>
      </fieldset>
    <div class="form-group">
      <label for="inputAge">나이</label>
      <input type="text" class="form-control" id="inputAge" name="age" placeholder="나이를 숫자로 적어주세요.">
    </div>
     <div class="form-group">
      <label for="inputAge">무게</label>
      <input type="text" class="form-control" id="inputWeight" name="weight" placeholder="무게를 숫자로 적어주세요.">
    </div>
    <div class="form-group">
      <label for="selectLocation">신청 보호소 지점</label>
      <select class="form-control" id="selectLocation">
        <option value="">-선택-</option>
        <option value="1">강남점</option>
        <option value="2">안양점</option>
        <option value="3">해운대점</option>
      </select>
    </div>
    <div class="form-group">
      <label for="textareaInfo">상세사항 (성격 등 특징들을 적어주세요.)</label>
      <textarea class="form-control" id="textareaInfo" rows="5"></textarea>
    </div>
    <hr>
    <div class="form-group">
      <label for="inputFile1">사진 파일 1</label>
      <input type="file" class="form-control-file" name="file1" id="inputFile1" aria-describedby="fileHelp">
    </div>
    <div class="form-group">
      <label for="inputFile2">사진 파일 2</label>
      <input type="file" class="form-control-file" name="file2" id="inputFile2" aria-describedby="fileHelp">
    </div>
    <div class="form-group">
      <label for="inputFile3">사진 파일 3</label>
      <input type="file" class="form-control-file" name="file3" id="inputFile3" aria-describedby="fileHelp">
    </div>
    <hr>
    <button type="submit" class="btn btn-primary" name="">온라인 입소 신청</button>
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

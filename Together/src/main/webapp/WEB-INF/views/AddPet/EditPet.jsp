<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>Together | 입소 신청 내용</title>
	
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
		$(document).ready(function() {
			$(".petImg").mouseover(function() {
				$("#bigImg").attr('src', this.src);
			});
			
			$("#delPet").click(function(){
				if(confirm("정말 삭제하시겠습니까? 삭제 시 작성된 신청서는 복구되지 않습니다")){
					alert("삭제가 완료되었습니다");
					$("#editPetForm").attr('action', '/Addpet/DeletePet');
					$("#editPetForm").submit();
				}else{
					alert("삭제가 취소되었습니다");
				}
			});
			
			$("#approPet").click(function(){
				if(confirm("입소승인 하시겠습니까?")){
					alert("입소승인이 완료되어 '입양대기'로 상태 변경되었습니다.");
					$("input[type=hidden][name=state]").val(2);
					$("#editPetForm").submit();
				}else{
					alert("입소승인이 취소되었습니다");
				}
			});
		});
	</script>
	
</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">

	<!-- Header ================================================== -->
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
	
	<section id="EditPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				입소 신청 내용
			</h2>

			<form id="editPetForm" action="${pageContext.request.contextPath}/Addpet/EditPet" method="post">
				<input type="hidden" name="id" value="${p.id}">
				
				<table style="margin-left: auto; margin-right: auto;" border="1" cellspacing="0">
					<tr>
						<td colspan="3">
							<img id="bigImg" src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" style="width:450px; height:auto;">
						</td>
					</tr>
					<tr>
						<td><img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" class="petImg" width="150" height="150"></td>
						<td><img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=2" class="petImg" width="150" height="150"></td>
						<td><img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=3" class="petImg" width="150" height="150"></td>
					</tr>
				</table>
				
				<fieldset>
				    <div class="form-group">
				      <label for="editWriter_id">작성자</label>
				      <input type="text" class="form-control" id="editWriter_id"  name="writer_id" value="${p.writer_id}" readonly>
				    </div>
					<div class="form-group">
						<label for="editPetName">펫 이름</label>
						<input type="text" class="form-control" id="editPetName" name="name" value="${p.name}">
					</div>
					<div class="form-group">
						<label for="editPetBreed">품종</label>
						<input type="text" class="form-control" id="editPetBreed" name="breed" value="${p.breed}">
					</div>
					<fieldset class="form-group">
				      <legend>성별</legend>
				      <div class="form-check">
				        <label class="form-check-label">
				          <input type="radio" class="form-check-input" name="sex" id="sex" value="1" <c:if test="${p.sex==1}">checked</c:if>>
				          수컷
				          <input type="radio" class="form-check-input" name="sex" id="sex" value="2" <c:if test="${p.sex==2}">checked</c:if>>
				          암컷
				        </label>
				      </div>
				    </fieldset>
	      			<div class="form-group">
						<label for="editPetAge">나이</label>
						<input type="text" class="form-control" id="editPetAge" name="age" value="${p.age}">
					</div>
					<div class="form-group">
						<label for="editPetWeight">무게</label>
						<input type="text" class="form-control" id="editPetWeight" name="weight" value="${p.weight}">
					</div>
				    <label for="selectLocation">신청 보호소 지점</label>
				      <select class="form-control" name="location" id="selectLocation">
				        <option value="">-선택-</option>
				        <option value="1" <c:if test="${p.location==1}">selected</c:if>>강남점</option>
				        <option value="2" <c:if test="${p.location==2}">selected</c:if>>안양점</option>
				        <option value="3" <c:if test="${p.location==3}">selected</c:if>>해운대점</option>
				      </select>
		    		  <div class="form-group">
						<label for="editTextareaInfo">상세사항</label>
						<textarea class="form-control" id="editTextareaInfo" rows="5" name="info">${p.info}</textarea>
					  </div>
				</fieldset>

				<input type="hidden" name="state" value="1">
				
				<c:if test="${p.state==1 || sessionScope.type==2}">
					<div style="text-align: center;">
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit" name="edit" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">수정</button>			
							<button class="btn btn-success" type="button" name="delete" id="delPet" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">삭제</button>
						</span>						
					</div>
				</c:if>				
				
				<br>

				<!-- 관리자일 경우 -->
				<c:if test="${sessionScope.type==2}">
					<div style="text-align: center;">
						<span class="input-group-btn">
							<button type="button" class="nino-btn" style="background: #95e1d3; border-color:#95e1d3;" name="approval" id="approPet">입소 승인</button>
							<button type="button" class="nino-btn" style="color:#95e1d3; background: #FFFFFF; border-color:#95e1d3;" name="rejection">입소 거절</button>
						</span>						
					</div>
				</c:if>

			</form>
		</div>
	</section>

    <!-- Footer ================================================== -->
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


</body>
</html>
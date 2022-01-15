<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>Together | Pet List</title>
	
	<style type="text/css">
		 form {display:inline}
	</style>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function(){
			$("button[type=button][name=deletePet]").click(function(){
				var petId=$(this).attr("num");
				console.log(petId);
				
				if(confirm("정말 삭제하시겠습니까?")){
					alert("삭제가 완료되었습니다");
					location.href="${pageContext.request.contextPath}/Addpet/DeletePet?id="+petId;
				}else{
					alert("삭제가 취소되었습니다");
				}
			});
		});
		
		function fn_petAllState(){
			location.href = "${pageContext.request.contextPath}/AddPet/PetAllList";
		}
		
		function fn_petState(num){
			var petStateLoca = "${pageContext.request.contextPath}/AddPet/StateList?page=PetAllList&state=";
			
			if(num==1){
				location.href=petStateLoca+num;
			}else if(num==2){
				location.href=petStateLoca+num;
			}else if(num==3){
				location.href=petStateLoca+num;
			}else if(num==4){
				location.href=petStateLoca+num;
			}else{
				alert("error");
			}
		}
		
		function fn_petLocation(num){
			var petAllLoca = "${pageContext.request.contextPath}/AddPet/LocationAllList?location=";
			
			if(num==1){
				location.href=petAllLoca+num;
			}else if(num==2){
				location.href=petAllLoca+num;
			}else if(num==3){
				location.href=petAllLoca+num;
			}else{
				alert("error");
			}
		}
		
	</script>
	
</head>
<body style="padding-top: 50px;" class="nino-fixed-nav">

	<section class="nino-testimonial bg-white">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				<c:if test="${sessionScope.type==1}">
					My Pet List
				</c:if>
				<c:if test="${sessionScope.type==2}">
					Pet List
				</c:if>
			</h2>
    		<div class="nino-testimonialSlider">
    		
    			<div class="row">
						<div class="col-md-12 col-sm-12" style="text-align: right;">
						  <div class="btn-group">
						    <button type="button" class="btn btn-default" onClick="fn_petAllState();">전체리스트</button>
						    <div class="btn-group">
						      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						      입양상태 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
							   <li><a href="#" onClick="fn_petState(1);">입소신청중</a></li>
						       <li><a href="#" onClick="fn_petState(2);">입양대기</a></li>						       
						       <li><a href="#" onClick="fn_petState(3);">입양문의중</a></li>
						       <li><a href="#" onClick="fn_petState(4);">입양완료</a></li>
						      </ul>
						    </div>
						    <div class="btn-group">
						      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						      보호소 지점 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
							   <li><a href="#" onClick="fn_petLocation(1);">강남점</a></li>
						       <li><a href="#" onClick="fn_petLocation(2);">안양점</a></li>						       
						       <li><a href="#" onClick="fn_petLocation(3);">해운대점</a></li>
						      </ul>
						    </div>
						  </div>
						</div>
					</div>
					
					<br>
					
					<div class="row">
						<div class="col-md-12 col-sm-12" style="text-align: right;">
							<form action="${pageContext.request.contextPath}/AddPet/SearchPet" method="get">
							    <div class="form-group">
								    <div class="input-group">
								    	<div class="input-group-btn">
								    		<input type="hidden" name="page" value="PetAllList">
								    		<button class="btn btn-default" type="submit" id="btn_petSearch" style="float: right;height:34px;"><i class="glyphicon glyphicon-search"></i></button>
								    		<input type="text" name="value" value="${value}" style="float: right;width:250px;height:34px;" size="2" class="form-control">
								      		<select class="form-control" name="search" id="search" style="float: right; width:130px; height:34px;">
												<option value="" selected disabled>검색 항목</option>
												<c:if test="${sessionScope.type==2}"><option ${search=='writer_id'?'selected':''} value="writer_id">작성자</option></c:if>
												<option ${search=='breed'?'selected':''} value="breed">품종</option>
												<option ${search=='age'?'selected':''} value="age">나이</option>
												<option ${search=='name'?'selected':''} value="name">펫 이름</option>
											</select>
								      </div>
								    </div>
							    </div>
							  </form>
						</div>
					</div>
					
					<br><br>

				<ul>
					<c:forEach var="p" items="${list}" varStatus="status">
					
						<c:if test="${sessionScope.id==p.writer_id || sessionScope.type==2}">
						
							<li>
								<div layout="row" class="verticalCenter">
									<div class="nino-avatar fsr">
										<a href="${pageContext.request.contextPath}/AddPet/petView?id=${p.id}">
											<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" alt=""> 
										</a>
									</div>
									<div>
										<span class="name">작성자 : ${p.writer_id}</span>
										<p class="quote">이름 : ${p.name}</p>
										<p class="quote">품종 : ${p.breed}</p>
										<p class="quote">나이 : ${p.age}</p>
										<p class="quote">성별 : 
											<c:choose>
												<c:when test="${p.sex==1}">수컷</c:when>
												<c:when test="${p.sex==2}">암컷</c:when>
												<c:otherwise>잘못된 성별정보 입니다</c:otherwise>
											</c:choose>
										</p>
										<p class="quote">지점 : 
											<c:choose>
												<c:when test="${p.location==1}">(서울)강남점</c:when>
												<c:when test="${p.location==2}">(경기)안양점</c:when>
												<c:when test="${p.location==3}">(부산)해운대점</c:when>
												<c:otherwise>잘못된 지점정보 입니다</c:otherwise>
											</c:choose>
										</p>
										<p class="quote">상태 : 
											<c:choose>
												<c:when test="${p.state==1}">입소신청중</c:when>
												<c:when test="${p.state==2}">입양대기</c:when>
												<c:when test="${p.state==3}">입양문의중</c:when>
												<c:when test="${p.state==4}">입양완료</c:when>
												<c:otherwise>잘못된 상태정보 입니다</c:otherwise>
											</c:choose>
										</p>
										
										<c:if test="${p.state==1 || sessionScope.type==2}">
											<button class="btn btn-success" type="button" onClick="location='${pageContext.request.contextPath}/AddPet/petView?id=${p.id}'" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">수정</button>			
											<button class="btn btn-success" type="button" name="deletePet" id="delPet" num="${p.id}" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">삭제</button>
										</c:if>
										
									</div>
								</div>
							</li>
							<hr>
							
							<!--<c:set var="isEmpty" value=""/>-->
						</c:if>
						
						<!-- 수정예정 -->
						<!--<c:if test="${sessionScope.id!=p.writer_id && sessionScope.type!=2}">
							<c:set var="isEmpty" value="리스트가 비어있습니다"/>-->
							<!--<c:if test="${status.count==1}">
							리스트가 비어있습니다
							</c:if>-->
						<!--</c:if>-->
						
					</c:forEach>
					
					<!--<c:if test="${sessionScope.id!=p.writer_id && sessionScope.type!=2}">
						${isEmpty}
					</c:if>-->
					
				</ul>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- 	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/template.js"></script>
	 -->
	
	<script>
	$(document).ready(function(){
		$('#a_logout').click(function(){
			var flag = confirm("로그아웃 하시겠습니까?");
			if (flag){
				alert("로그아웃 되었습니다.");
				location.href="/Member/logout";
			} else {
				return;
			}
		});
	});
	</script>

</body>
</html>
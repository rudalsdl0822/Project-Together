<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 


	<title>Together | 입양공고</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	// 로그인 팝업 함수  
	function fn_loginPopup(){
		// loginPopup   window.open('팝업주소','팝업창 이름','팝업창 설정');
		var popup=window.open("/Member/loginFormPopup","Together | 로그인",
			"width=460px, height=340px, scrollbars=no, top=100px, left=300px, location=no");
		return false;
	}
	
		var member_id="${sessionScope.id}";
	
		$(document).ready(function(){
			// 펫 아이디 리스트를 가져와 관심등록 했는지 체크한다.
			var p_id_list="${p_id_list }";
			var p_ids=JSON.parse(p_id_list);

			for(var i=0;i<p_ids.length;i++){
				fn_check_like(p_ids[i]);
			}
	
	$(".number").click(function(){
		var p_id=$(this).attr("p_id");
		
		if(member_id==""){
			Swal.fire({ 
				title : '로그인이 필요합니다. 로그인하시겠습니까?',
				icon: 'question', 
				showCancelButton: true, 
				confirmButtonColor: '#3085d6', 
				cancelButtonColor: '#d33',
				confirmButtonText: '확인', 
				cancelButtonText: '취소'
			 }).then((result) => { 
				 if (result.isConfirmed) { 
				 fn_loginPopup();
			     }else{
				 return; 
			     }
			 })
		}else if( $("#span_like_"+p_id).attr("class") == "glyphicon glyphicon-heart-empty" ){  //관심등록
			fn_like(p_id);
		}else if( $("#span_like_"+p_id).attr("class") == "glyphicon glyphicon-heart" ){  //관심등록 해제
			Swal.fire({ 
				title: '정말 관심등록을 해제하시겠습니까?', 
				icon: 'question', 
				showCancelButton: true, 
				confirmButtonColor: '#3085d6', 
				cancelButtonColor: '#d33',
				 confirmButtonText: '해제', 
				cancelButtonText: '취소' 
				}).then((result) => { 
				if (result.isConfirmed) { 
				fn_like_delete(p_id);
			}
				})
		}
	});
	
	$("button[type=button][name=AdoptNotice]").click(function(){
		location.href="${pageContext.request.contextPath}/AddPet/AdoptNoticeList";
	});
});

	
		
		
		function fn_like(p_id){
			$.post("/like/add", {pet_id:p_id})
			.done(function(){
				$("#span_like_"+p_id).attr("class","glyphicon glyphicon-heart");		
			})
			.fail(function(){
				alert("error");
			});
		}
		function fn_like_delete(p_id){
			$.post("/like/delete", {pet_id:p_id})
			.done(function(){
				$("#span_like_"+p_id).attr("class","glyphicon glyphicon-heart-empty");
			})
			.fail(function(){
				alert("error");
			});
		}
		function fn_check_like(p_id){
			$.post("/like/checkLike", {p_id:p_id})
			.done(function(json){
				var likeObj=JSON.parse(json);

				if(likeObj.result==true){
					$("#span_like_"+p_id).attr("class","glyphicon glyphicon-heart");
				}else{
					$("#span_like_"+p_id).attr("class","glyphicon glyphicon-heart-empty");
				}
			})
			.fail(function(){
				alert("error");
			});
		}
		
		function fn_location(num){
			location.href="${pageContext.request.contextPath}/AddPet/LocationState23List?location="+num;
		}
		
		function fn_state(num){
			location.href="${pageContext.request.contextPath}/AddPet/StateList?page=AdoptNotice&state="+num;
		}
				
	</script>
	
	<style>
	.number:hover{
		cursor: pointer;
	}
	</style>
	
</head>
<body style="padding-top: 50px;" class="nino-fixed-nav">

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
							   <li><a href="#" onClick="fn_location(1);">강남점</a></li>
						       <li><a href="#" onClick="fn_location(2);">안양점</a></li>						       
						       <li><a href="#" onClick="fn_location(3);">해운대점</a></li>
						      </ul>
						    </div>
						    <div class="btn-group">
						      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						      입양상태 <span class="caret"></span></button>
						      <ul class="dropdown-menu" role="menu">
						        <li><a href="#" onClick="fn_state(2);">입양대기</a></li>
						        <li><a href="#" onClick="fn_state(3);">입양문의중</a></li>
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
								    		<input type="hidden" name="page" value="AdoptNotice">
								    		<button class="btn btn-default" type="submit" style="float: right;height:34px;"><i class="glyphicon glyphicon-search"></i></button>
								    		<input type="text" name="value" value="${value}" style="float: right;width:250px;height:34px;" size="2" class="form-control" placeholder="검색할 항목을 먼저 선택해 주세요">
								      		<select class="form-control" name="search" id="search" style="float: right; width:130px; height:34px;">
												<option value="" selected disabled>검색 항목</option>
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
					
					<c:if test="${empty list}">
						<br>
						등록된 입양공고가 없습니다
						<br>
					</c:if>
					
					<c:forEach var="p" items="${list}" varStatus="status">
						
							
						<c:if test="${status.first || status.count%3==1}">
							<div class="row">
						</c:if>
					
						<div class="col-md-4 col-sm-4">
							<article>
								<div class="articleThumb">
								
								<!-- count, current, index 확인용
								count : ${status.count}<br>
								current : ${status.current}<br>
								index : ${status.index}<br> -->
								
									<a href="${pageContext.request.contextPath}/Adopt/WaitingPet?id=${p.id}">
										<img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" alt="">
									</a>
									<div class="date">
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
									
									<div class="item" style="float: left; width: 40%; text-align: center;" >
                               			<div class="number" id="btn_like_${p.id }" p_id="${p.id }" style="display: inline-block; border: 1px solid #f38181; width: 65%; font-size: 13px; color: #f38181; ">
                            				<span class="glyphicon glyphicon-heart-empty" id="span_like_${p.id }" aria-hidden="true" style="font-size: 13px; color: #f38181; "></span> 
                                    		관심등록
                               			</div>
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
							
					</c:forEach>
					
			</div>
    	</div>
    </section>
    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>


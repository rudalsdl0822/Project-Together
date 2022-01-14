<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>  
	<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
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
	
	<!-- jquery 라이브러리 불러들이기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 함수 -->
	<script>
	/* select 함수 시작*/
	function selChange(var newCnt){
		// setting
		setting(newCnt);
		
		// 이전에 클릭한 입양신청 상태 
		var recent_state="${state }";
		
		if(recent_state==state){
			location.href="/Adopt/AdoptWishList?nowPage=${paging.nowPage}&cntPerPage="+cntPerPage+"&state="+state;
		}else{
			location.href="/Adopt/AdoptWishList?cntPerPage="+cntPerPage+"&state="+state;
		}
		
	}
	/* select 함수 끝*/
	
	function setting(var newCnt){
		document.getElementById("cntPerPage").value=newCnt;
		alert(document.getElementById("cntPerPage").value);
		
		cntPerPage=document.getElementById("cntPerPage").value;
		state=document.getElementById("state").value;
	}
	
	var cntPerPage;  //페이지당 글 개수
	var state;  // Adopt state

		$(document).ready(function(){
			
			setting(3);
			
			$("button").click(function(){
				var num=$(this).attr("num");
				
				if( $(this).text()=="입양 승인" ){
					var flag=confirm("정말로 입양을 승인하겠습니까?");
					if(flag==false) return;
					
					setting();
					
					location.href="/Adopt/AdoptAccept?num="+num+"&nowPage=${paging.nowPage}&cntPerPage="+cntPerPage+"&state="+state;
				}else if( $(this).text()=="입양 거절" ){
					var flag=confirm("정말로 입양을 거절하겠습니까?");
					if(flag==false) return;
					
					setting();
					
					location.href="/Adopt/AdoptReject?num="+num+"&nowPage=${paging.nowPage}&cntPerPage="+cntPerPage+"&state="+state;
				}
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
				입양신청 리스트
			</h2>
			
			<div class="sectionContent">
				<!-- =============================== toggle row =============================== -->
				<div class="row">
					<div class="col-md-12 col-sm-12" style="text-align: right;">
						<span style="padding-right: 10px;">TOTAL : ${total }</span>
						<div class="btn-group">
						    <button type="button" class="btn btn-default" name="AdoptNotice">입양공고 전체</button>
						    <div class="btn-group">
						    	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						    	보호소 지점 <span class="caret"></span></button>
						    	<ul class="dropdown-menu" role="menu">
						    		<li><a onClick="location.href='/AddPet/LocationList?location=1'">강남점</a></li>
						    		<li><a onClick="location.href='/AddPet/LocationList?location=2'">안양점</a></li>
						    		<li><a onClick="location.href='/AddPet/LocationList?location=3'">해운대점</a></li>
						    	</ul>
						    </div>
						    <!-- paging toggle -->
						    <div class="btn-group">
						    	<input type="hidden" id="cntPerPage" value="${paging.cntPerPage }">
						    	<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						    		<c:if test="${paging.cntPerPage==3 }">3개씩 보기</c:if>
						    		<c:if test="${paging.cntPerPage==6 }">6개씩 보기</c:if>
						    		<c:if test="${paging.cntPerPage==9 }">9개씩 보기</c:if>
						    		<c:if test="${paging.cntPerPage==12 }">12개씩 보기</c:if>
						    		<c:if test="${paging.cntPerPage==24 }">24개씩 보기</c:if>
						    		<span class="caret"></span>
						    	</button>
						      	<ul class="dropdown-menu" role="menu">
						        	<li><a onClick="selChange(3);">3개씩 보기</a></li>
						        	<li><a onClick="selChange(6);">6개씩 보기</a></li>
						        	<li><a onClick="selChange(9);">9개씩 보기</a></li>
						        	<li><a onClick="selChange(12);">12개씩 보기</a></li>
						        	<li><a onClick="selChange(24);">24개씩 보기</a></li>
						        </ul>
						    </div>
						</div>
					</div>
				</div>
			
			
				<!-- 옵션선택 시작 -->
				<div style="text-align: right; padding: 10px;">
					
				
					<!-- state select -->
					<select name="stateSel" onchange="selChange()">
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
					<select name="sel" onchange="selChange()">
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
									입양신청 번호 : ${Adopt.num } / 신청자 : ${Adopt.writer }
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


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
	
</body>
</html>
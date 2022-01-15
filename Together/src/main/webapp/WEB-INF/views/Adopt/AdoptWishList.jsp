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
	function selChange(){
		var state=document.getElementById("state").value;
		var recent_state="${state }";
		
		var form=document.getElementById("form_select");
		if(recent_state==state){
			form.action="/Adopt/AdoptWishList?nowPage=${paging.nowPage}";
		}else{
			form.action="/Adopt/AdoptWishList";
		}
		form.submit();		
	}
	/* select 함수 끝*/
	
	// 검색 함수
	function fn_search_pet(){
		var searchText=document.getElementById("search_pet").value;
		
		// 검색 1. pet name 검색
		var path="/Adopt/AdoptWishList?nowPage=1&cntPerPage=24&state=0";
		if( isNaN(searchText) ){
			alert(searchText+"글자");
			path+="&searchPet_name="+searchText;
		}else{ // 검색 2. pet id 검색
			alert(searchText+"숫자");
			path+="&searchPet_id="+searchText;
		}
		location.href=path;
	}

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

<style>
.breadcrumb-item>a, .table-primary>a {
	color: #777;
}

.breadcrumb-item>a:hover, .table-primary>a:hover {
	color: #337ab7;
}

.nino-btn > #btn {
 	background: #95e1d3;
}

.nino-btn > #btn:hover {
	background: #00ced1;
}
</style>


</head>
<body style="padding-top: 50px;" class="nino-fixed-nav">
	<!-- 빠른 페이지 이동 (로그인 한 경우) -->
	<c:if test="${not empty sessionScope.id}">
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"> <a href="/index">홈</a> </li>
				<li class="breadcrumb-item">
					<a href="/Member/MyPage"> 
						<c:if test="${sessionScope.type==1}">마이페이지</c:if> 
						<c:if test="${sessionScope.type==2}">관리자페이지</c:if>
					</a>
				</li>
				<li class="breadcrumb-item active"> 입양신청 리스트</li>
			</ol>
		</div>
	</c:if>


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
				<form id="form_select" style="overflow: hidden;">
				
				<!-- 검색창 : pet id / pet name -->					
				<div style="float: left; width:50%; text-align: left; padding: 10px;">
					<input type="text" id="search_pet" value="${searchPet_id }${searchPet_name }" placeholder="pet id / pet name 검색">
					<input type="button" value="검색" onclick="fn_search_pet();">
				</div>
				<div style="float: left; width:50%; text-align: right; padding: 10px;">
					<span style="padding-right: 10px;">TOTAL : ${total }</span>
					<select id="state" name="state" onchange="selChange()">
						<option value="0"
							<c:if test="${state==0 }">selected</c:if>>신청중인 입양신청글만 보기</option>
						<option value="1"
							<c:if test="${state==1 }">selected</c:if>>승인된 입양신청글만 보기</option>
						<option value="2"
							<c:if test="${state==2 }">selected</c:if>>거절된 입양신청글만 보기</option>
						<option value="100"
							<c:if test="${state==100 }">selected</c:if>>마감된 입양신청글만 보기</option>
						<option value="3"
							<c:if test="${state==3 }">selected</c:if>>전체 입양신청글 보기</option>
					</select>
					<!-- paging select -->
					<select id="cntPerPage" name="cntPerPage" onchange="selChange()">
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
				</form>
				<!-- 옵션선택 끝 -->
			
			
			<!-- ======== adoptList 시작 ============================================= -->
			<c:if test="${adoptList.isEmpty()==true }"> 불러올 입양신청 글이 없습니다. </c:if>
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
											id : ${Adopt.pet_id }
										</span>
										<span class="text"">
											${locationKorean }점
										</span>
										<span class="text">
											${sexKorean }
										</span>
									</div>

								</div>
								<h3 class="articleTitle"  style="width: 90%; text-overflow: ellipsis; overflow: hidden; white-space: no-wrap;">
									입양신청 번호 : ${Adopt.num } / 신청자 ID : ${Adopt.writer }
								</h3>
								<h3 class="articleTitle"  style="width: 90%; text-overflow: ellipsis; overflow: hidden; white-space: no-wrap;">
									제목 : ${Adopt.title }
								</h3>
								<div style="width: 90%; text-overflow: ellipsis; overflow: hidden; white-space: no-wrap; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;">
									자기 소개 : ${Adopt.content }
								</div>
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
									<c:if test="${Adopt.state==100 }">
										<span style="color: #000000;">Together 친구가 새 가족을 만나, 입양신청이 마감되었습니다.</span>
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
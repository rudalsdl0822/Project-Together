<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>  
	<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
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
	
	<title>Together | 입양공고 상세보기</title>
	
	<!-- webapp/resources 가 CSS의 디폴트 경로.  -->
	<!-- <link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath }/resources/memberCss.css" /> -->
  

	<!-- jquery 라이브러리 불러들이기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 카카오 지도 api 스크립트 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63171c0be6b6cd8384cb03cb48fcdf17"></script>

	
	<!-- 함수 시작 -->
	<script>
	// 로그인 팝업 함수  
	function fn_loginPopup(){
		// loginPopup   window.open('팝업주소','팝업창 이름','팝업창 설정');
		var popup=window.open("/Member/loginFormPopup","Together | 로그인",
			"width=460px, height=340px, scrollbars=no, top=100px, left=300px, location=no");
		return false;
	}
	
	function fn_like(){
		$.post("/like/add", {pet_id:pet_id})
		.done(function(){
			$("#btn_like").attr("ifLikePet","true");
			fn_check_like();
		})
		.fail(function(){
			alert("error");
		});
	}
	function fn_like_delete(){
		$.post("/like/delete", {pet_id:pet_id})
		.done(function(){
			$("#btn_like").attr("ifLikePet","false");
			fn_check_like();
		})
		.fail(function(){
			alert("error");
		});
	}
	function fn_check_like(){
		if( $("#btn_like").attr("ifLikePet")=="true" ){
			$("#span_like").attr("class","glyphicon glyphicon-heart");
		}else{
			$("#span_like").attr("class","glyphicon glyphicon-heart-empty");
		}
	}
	
	var member_id="${sessionScope.id }";
	var pet_id="${pet.id }";
	
		$(document).ready(function(){
			//지도 숨기기
			$("#map").hide();
			
			//지도 toggle하기
			$("#p_viewMap").click(function(){
				$("#map").toggle();
			});
			
			//관심등록 여부 확인
			fn_check_like();
			
			//관심등록 버튼 클릭
			$("#btn_like").click(function(){
				// 로그인 체크
				if(member_id==""){
					var flag=confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if(flag){
						fn_loginPopup();
					}else{
						return; 
					}
				}else if( $("#btn_like").attr("ifLikePet")=="false" ){  
					fn_like();
				}else{ 
					var flag=confirm("정말 관심등록을 해제하시겠습니까?");
					if(flag){
						fn_like_delete();
					}
				}
			});
			
			// 입양신청 버튼 클릭
			$("#btn_go_AdoptForm").click(function(){
				if(member_id==""){
					var flag=confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if(flag){
						fn_loginPopup();
					}else{
						return;
					}
				}else{
					location.href="/Adopt/AdoptForm?id=${pet.id}";
				}
			});
			
			// 댓글 입력
			$("#btn_addReply").click(function(){
				
				var form=document.form_addReply;
				
				if(member_id==""){
					var flag=confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if(flag){
						fn_loginPopup();
					}else{
						return; 
					}
				}else{
					form.submit();
				}
				
				
			});
			
		});
		
		// 대댓글 등록창
		function toggleReply(reply_num) {
			$(`#form-${"${reply_num}"}`).slideToggle();
		}
		
		// 댓글|대댓글 수정
		replyList = {};
		function editReply(reply_num) {
                const reply = $(`#reply-${"${reply_num}"}`);
                if (replyList[reply_num] === undefined) {
                    replyList[reply_num] = reply.text();
                    let html = `
                        <form action="${pageContext.request.contextPath}/reply/edit" method="post">
                            <div>
                                <textarea name="reply_content" class="form-control" rows="3" style="width: 100%;">${"${reply.text()}"}</textarea>
                                <button class="btn btn-danger btn-block" type="submit">댓글 수정</button>
                            </div>
                            <input type="hidden" name="reply_num" value="${"${reply_num}"}" />
                        </form>`;
                    reply.css("white-space", "normal");
                    reply.html(html);
                } else {
                    reply.text(replyList[reply_num]);
                    reply.css("white-space", "pre");
                    replyList[reply_num] = undefined;
                }
            }
		
		// 댓글|대댓글 삭제
		function deleteReply(reply_num) {
			if(confirm("삭제하시겠습니까?")) {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/reply/delete",
                    data: { reply_num },
                    success: function (response) {
                        location.href = location.href.split("#")[0];
                    },
                });
			}
		}
	</script>
	<!-- 함수 끝 -->
	
	<style>
	#btn_like, #btn_like_delete, #btn_go_AdoptForm, #p_viewMap:hover{
		cursor: pointer;
	}
	</style>

</head>

<body style="padding-top: 50px;" class="nino-fixed-nav">


<!-- 뷰 세팅================================================== -->
	<!-- locationKorean : 펫이 있는 장소를 한글화 합니다. -->
		<c:set var="locationKorean">
			<c:if test="${pet.location == 1 }">강남</c:if>
			<c:if test="${pet.location == 2 }">안양</c:if>
			<c:if test="${pet.location == 3 }">해운대</c:if>
		</c:set>
	<!-- sexKorean : 펫 성별을 한글화 합니다. -->
		<c:set var="sexKorean">
			<c:if test="${pet.sex == 1 }">남자</c:if>
			<c:if test="${pet.sex == 2 }">여자</c:if>
		</c:set>
<!-- 뷰 세팅 끝================================================== -->



<!-- Story About Us
    ================================================== -->
	<section id="nino-story" style="padding-bottom: 30px;">
		<div class="container">
			<h2 class="nino-sectionHeading">

				<span class="nino-subHeading">Shall We Together?</span>
				${pet.breed }, ${pet.name }
				
				<c:if test="${pet.state==2}">
					<span class="label label-warning" style="font-size: 11px;">입양대기</span>
				</c:if>
				<c:if test="${pet.state==3}">
					<span class="label label-success" style="font-size: 11px;">입양문의중</span>
				</c:if>
				<c:if test="${pet.state==4}">
					<span class="label label-default" style="font-size: 11px;">입양완료</span>
				</c:if>
			</h2>


			<!-- pet 이미지 -->
				<div class="row nino-hoverEffect" style="margin-bottom: 30px;">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<!-- ********** 추후 추가예정 : 이미지 저장하기 ********** -->
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									
								</span>
								<img src="/AddPet/petImg?id=${pet.id}&petImgNum=1" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									
								</span>
								<img src="/AddPet/petImg?id=${pet.id}&petImgNum=2" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									
								</span>
								<img src="/AddPet/petImg?id=${pet.id}&petImgNum=3" alt="">
							</a>
						</div>
					</div>
				</div>
    					
			
			<!-- =============지도 : 카카오 api 시작============= -->
			<p class="nino-sectionDesc" id="p_viewMap" style="color: #f38181; margin-bottom: 8px;">
				${pet.name }에게로 가는 길<i class="mdi mdi-map-marker nino-icon"></i>
			</p>
				<div id="map" style="width:100%;height:400px; margin-bottom: 8px;"></div>
				<script>
					// 강남점 안양점 해운대점 위도와 경도 구분.
					var pet_location="${pet.location }";
					var latitude=37.49832;
					var longitude=127.02827;
					if( pet_location==2 ){
						latitude=37.40188;
						longitude=126.92285;
					}else if( pet_location==3 ){
						latitude=35.16371;
						longitude=129.15941;
					}

					// 1. 지도 생성
					var container = document.getElementById('map');					
					var options = {
						center: new kakao.maps.LatLng(latitude, longitude),
						level: 3
					};
					var map = new kakao.maps.Map(container, options);
					
					// 2. 지도에 마커와 인포윈도우(텍스트) 생성					
					var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					marker.setMap(map);
					
					var iwContent = '<div style="padding:5px; text-align: center;">Together[${locationKorean}점] ${pet.name}</div>';
				    iwPosition = new kakao.maps.LatLng(latitude, longitude); 
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					infowindow.open(map, marker); 
					
					// 3. 지도에 컨트롤 생성.(줌, 지도/스카이뷰 변환)
					var mapTypeControl = new kakao.maps.MapTypeControl();
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				</script>
			<!-- =============지도 : 카카오 api 끝============= -->			

				
			</div>
		</div>		
	</section>
	<!--/#nino-story-->
	
	
	<!-- Counting
    ================================================== -->
    <section id="nino-counting">
    	<div class="container">
    		<div layout="row" class="verticalStretch">
    			<div class="item" style="width:18%;">
    				<div class="number">${sexKorean }</div>
    				<div class="text">SEX</div>
    			</div>
    			<div class="item" style="width:18%;"> 
    				<div class="number">${pet.age }살</div>
    				<div class="text">AGE</div>
    			</div>
    			<div class="item" style="width:18%;">
    				<div class="number">${pet.weight }</div>
    				<div class="text">WEIGHT</div>
    			</div>
    			<div class="item" style="width:26%;">
    				<div class="number">${locationKorean }</div>
    				<div class="text">location</div>
    			</div>
    			<div class="item" id="btns" style="width:20%; margin-top: 45px; padding: 5px; text-align: center;" >
    				<!-- 관심등록이 안되어 있다면 빈하트, 관심등록이 되어 있다면 하트 -->
    				<div class="number" id="btn_like" ifLikePet="${ifLikePet }" style="display: inline-block; border: 1px solid white; width: 70%; padding: 7px; font-size: 20px; color: #f38181; ">
    					<span class="glyphicon glyphicon-heart-empty" id="span_like" aria-hidden="true" style="font-size: 20px; color: #f38181; "></span> 
    						관심등록
    				</div>
    				<div class="number" id="btn_go_AdoptForm"  style="display: inline-block; border: 1px solid white; width: 70%; padding: 7px; font-size: 20px; color: #f38181; ">
    					<span class="glyphicon glyphicon-pencil" aria-hidden="true" style="font-size: 20px; color: #f38181; "></span> 
    					입양신청
    				</div>
    			</div>
    			
    					
    		</div>
    	</div>
    </section>
    <!--/#nino-counting-->
    
    
    <section id="nino-testimonial">
    	<div class="container">
    		<div layout="row" class="verticalStretch" style="margin: 10px;">
    			<div class="nino-symbol fsr">
					<i class="mdi mdi-comment-multiple-outline nino-icon" style="font-size: 30px;"></i>
				</div>
				<div style="margin: 10px; width: 100%;">
					<pre class="quote" style="font-size: 18px; font-family: 'Roboto', sans-serif;">${pet.info }</pre>
				</div>
			</div>
		</div>
	</section>

    
    
	<!-- Happy Client
    ================================================== -->

		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Say Together</span> 댓글
			</h2>

			<!-- 댓글쓰기란 -->
			<div class="sectionContent">
				<div class="replys" id="reply-add-form" style="border-radius: 35px; padding: 5px 15px; margin: 30px;">

					<!-- 댓글 등록폼 -->
					<form name="form_addReply" action="${pageContext.request.contextPath}/reply/add" method="post" class="add-reply-form">
						<div>
							<span class="regency" style="font-weight: bold; margin: 5px">NICKNAME : ${sessionScope.nickname}</span>
							<textarea name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
							<button id="btn_addReply" type="button" class="btn btn-danger btn-block">댓글 등록</button>
						</div>

						<input type="hidden" name="writer_id" value="${sessionScope.id}" />
						<input type="hidden" name="board_num" value="${pet.id}" />
						<input type="hidden" name="parent_reply_num" value="-1" />
					</form>
				</div>

				<!-- 댓글목록 -->
				<ul>
					<c:forEach var="reply" items="${replys}">
						<c:set var="status" value="${reply.reply_content==null?'deleted':'normal'}" />
						<c:choose>
							<%-- 댓글이 정상일 때 --%>
							<c:when test="${status != 'deleted'}">
								<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px;">
									<div class="reply-writer">
										<span class="regency" style="font-weight: bold">NICKNAME : ${reply.member.nickname}</span>
									</div>
									<div class="reply-content" id="reply-${reply.reply_num}">${reply.reply_content}</div>
									<div class="reply_date" align="right" style="padding: 0 1em;">${reply.reply_date}</div>

									<div class="reply-menu" align="right">
										<c:if test="${sessionScope.id != null}">
											<button onclick="toggleReply('${reply.reply_num}')" class="btn btn-link btn-sm">
												<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>댓글
											</button>
										<c:if test="${reply.writer_id==sessionScope.id}">
											<button onclick="editReply('${reply.reply_num}')" class="btn btn-link btn-sm">
												<span class="glyphicon glyphicon-erase" aria-hidden="true"></span>수정
											</button>
											<button onclick="deleteReply('${reply.reply_num}')" class="btn btn-link btn-sm">
												<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>삭제
											</button>
										</c:if>
										</c:if>
									</div>
								</li>
								<%-- 댓글목록 끝 --%>

								<%-- 대댓글 등록폼 --%>
								<form action="${pageContext.request.contextPath}/reply/add" method="post" class="add-child-reply-form" id="form-${reply.reply_num}" style="display: none">
									<div>
										<textarea name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
										<button id="btn_addChildReply" type="submit" class="btn btn-danger btn-block">댓글 등록</button>
									</div>
									<input type="hidden" name="writer_id" value="${sessionScope.id}" />
									<input type="hidden" name="board_num" value="${pet.id}" />
									<input type="hidden" name="parent_reply_num" value="${reply.reply_num}" />
								</form>

								<%-- 대댓글 등록폼 끝 --%>
							</c:when>

							<%-- 댓글이 삭제된 경우 --%>
							<c:otherwise>
								<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px;">
									<div class="reply-content">삭제된 댓글입니다.</div>
								</li>
							</c:otherwise>
						</c:choose>

						<%-- 대댓글이 있는 경우 --%>
						<c:if test="${not empty reply.child_reply}">
							<c:forEach var="c_reply" items="${reply.child_reply}">
								<c:set var="child_status" value="${c_reply.reply_content==null?'deleted':'normal'}" />
								<c:choose>
									<c:when test="${child_status != 'deleted'}">
										<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px; margin-left: 150px;">
											<div class="childReply-writer">
												<span class="regency" style="font-weight: bold">NICKNAME : ${c_reply.member.nickname}</span>
											</div>
											<div class="childReply-content" id="reply-${c_reply.reply_num}">${c_reply.reply_content}</div>
											<div class="childReply_date" align="right" style="padding: 0 1em;">${reply.reply_date}</div>

											<div class="childReply-menu" align="right">
												<c:if test="${c_reply.writer_id==sessionScope.id}">
													<button onclick="editReply('${c_reply.reply_num}')" class="btn btn-link btn-sm">
														<span class="glyphicon glyphicon-erase" aria-hidden="true"></span>수정
													</button>
													<button onclick="deleteReply('${c_reply.reply_num}')" class="btn btn-link btn-sm">
														<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>삭제
													</button>

												</c:if>
											</div>
										</li>
									</c:when>
									<c:otherwise>
										<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px; margin-left: 150px;">
											<div class="childReply-content">삭제된 댓글입니다.</div>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>

	<!-- 댓글리스트 끝-->

    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
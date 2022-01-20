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
	function fn_swal_fire_login(){
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
	}
	function fn_swal_fire_like_delete(){
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
				fn_like_delete();
			}else{
				 return; 
		    }
		})
	}
	
	var member_id="${sessionScope.id }";
	var pet_id="${pet.id }";
	
	var member_type = "${sessionScope.type}";
	var board_num = "${pet.id}";
	var str= "";
	
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
					fn_swal_fire_login();
				}else if( $("#btn_like").attr("ifLikePet")=="false" ){  
					fn_like();
				}else{ 
					fn_swal_fire_like_delete();
				}
			});
			
			// 입양신청 버튼 클릭
			$("#btn_go_AdoptForm").click(function(){
				if(member_id==""){
					fn_swal_fire_login();
				}else{
					location.href="/Adopt/AdoptForm?id=${pet.id}";
				}
			});
			
			
			// 댓글 입력(비동기)
			$(document).on("click","#btn_addReply",function() {
				if (member_id == "" || member_id == null) {
					var flag = confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if (flag) {
						fn_loginPopup();
					} else {
						return false;
					}
				} else if($("#reply_content").val()=="" || $("#reply_content").val()==null) {
					alert("댓글 내용을 입력해주세요.");
					$("#reply_content").focus();
					return false;
				} else {
					$.post("/reply/add",{
						board_num:board_num,
						writer_id:member_id,
						parent_reply_num:-1,
						reply_content:$("#reply_content").val()
					}).done(function(data) {
						alert("댓글이 등록되었습니다!");
						$("#reply_content").val("");
						var reply = $.parseJSON(data);
						var html = makeTbl(reply);
						 $("#reply_list").append(html);
					});
				}
			});
					
			// 댓글 전체 리스트 불러오기 (비동기)
			getAllReply();
			
			// 댓글 버튼 누르면 대댓글 작성폼이 나온다.
			$(document).on("click","button[type='btn_rr']",function() {
				var num = $(this).attr("num");
				toggleReply(num);
			});
						
			$(document).on("click","button[type='editReplyForm']",function() {
				var num = $(this).attr("num");
				var flag = confirm("수정하시겠습니까?");
				if(flag) {
					$.post("/reply/get",{
						reply_num:num
					}).done(function(data) {
						var r = $.parseJSON(data);
						var id = "editReply";
						var name = "li_reply_";
						
						if (r.parent_reply_num != -1) {
							// 자식 댓글(대댓글)인 경우
							id = "editReply2";
							name = "li_childReply_";
						}
						makeEditForm(id,name,r);	
					});	
				} else {
					return false;
				}
			});
				
			$(document).on("click","button[name='btn_editReply']",function() {
				var reply_num = $(this).attr("num");
				var type = $(this).attr("type");
				var txt = $("#edit_content_"+reply_num).val();
				if(txt=="") {
					alert("댓글 내용을 입력해주세요.");
					$("#edit_content_"+reply_num).focus();
					return false;
				} else {
					$.post("/reply/edit",{
						board_num:board_num,
						writer_id:member_id,
						reply_num:reply_num,
						reply_content:txt
					}).done(function(data) {
						var reply = $.parseJSON(data);
						var html = "";
						if (type == "editReply") {
							html = makeReply(reply);
						} else {
							html = makeChildReply(reply);
						}
						$("#edit_r_reply-"+reply_num).replaceWith(html);
						alert("댓글이 수정되었습니다!");
					});
				}
			});		
				
			$(document).on("click","button[type='deleteReply']",function() {
				var num = $(this).attr("num");
				var flag = confirm("삭제하시겠습니까?");
				if(flag) {
					$.post("/reply/delete",{
						reply_num:num
					}).done(function(data) {
						var r = $.parseJSON(data);
						if (r.parent_reply_num == -1) {
							 $("#ul_reply_"+num).remove();
						} else {
							$("#li_childReply_"+num).remove();
						}
					});
				} else {
					return false;
				}
			});
			
			$(document).on("click","button[type='addReply2']",function() {
				var parent_reply_num = $(this).attr("num");
				var txt = $("#childReply_content_"+parent_reply_num).val();
				if (member_id == "" || member_id == null) {
					var flag = confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if (flag) {
						fn_loginPopup();
					} else {
						return false;
					}
				} else if(txt=="") {
					alert("댓글 내용을 입력해주세요.");
					$("#childReply_content_"+parent_reply_num).focus();
					return false;
				} else {
					$.post("/reply/add",{
						board_num:board_num,
						writer_id:member_id,
						parent_reply_num:parent_reply_num,
						reply_content:txt
					}).done(function(data) {
						alert("댓글이 등록되었습니다!");
						$("#childReply_content_"+parent_reply_num).val("");
						var reply = $.parseJSON(data);
						var html = makeChildReply(reply);
						$(`#input_r_reply-${"${parent_reply_num}"}`).slideToggle();
						 $("#childReply_list_"+parent_reply_num).append(html);
					});
				}
			});
		});

		var makeTbl = function(reply) {
			// 댓글 리스트 + 대댓글, 수정, 삭제 버튼
			str = "<ul id='ul_reply_"+reply.reply_num+"'>";
			str += makeRL(reply);
			str += "</ul>";
			return str;
		}
	
	 	function makeRL (reply) {
			str = makeReply(reply);
			
			// 대댓글 작성폼
			str += "<div id='input_r_reply-"+reply.reply_num+"' style='display:none;'><textarea id ='childReply_content_"+reply.reply_num+"' name='reply_content' class='form-control' rows='3' placeholder='댓글을 입력하세요.'>";
			str += "</textarea><button id='btn_addChildReply' type='addReply2' num='"+reply.reply_num+"' class='btn btn-danger btn-block'>댓글 등록</button></div><div id='childReply_list_"+reply.reply_num+"'>";
		
			// 대댓글 리스트 + 수정, 삭제 버튼
			if (reply.child_reply !="undefined" && reply.child_reply !=null) {
				for (i=0;i<reply.child_reply.length;i++) {
					str += makeChildReply(reply.child_reply[i]);
				}
			}
			str += "</div>";
			return str;
		}
	 
	 	function makeReply(reply) {
			// 부모 댓글(댓글) 리스트 + 대댓글, 수정, 삭제 버튼
			str = "<li class='li_reply' id='li_reply_"+reply.reply_num+"'><div class='reply-writer'>";
			str += "<span class='regency' style='font-weight: bold;'>ID : " + reply.writer_id + "</span></div>";
			str += "<div class='reply-content' id='reply-"+reply.reply_num+"'>" + reply.reply_content + "</div>";
			str += "<div class='reply_date' align='right' style='padding: 0 1em;'>" + reply.reply_date + "</div>";
			str += "<div class='reply-menu' align='right'>";
			str += "<button type='btn_rr' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
			str += "<span class='glyphicon glyphicon-share-alt' aria-hidden='true'></span>댓글";
			str += "</button>";
			
			if (member_id == reply.writer_id || member_type == "2") {
				str += "<button type='editReplyForm' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
				str += "<span class='glyphicon glyphicon-erase' aria-hidden='true'></span>수정</button>";
				str += "<button type='deleteReply' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
				str += "<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>삭제";
				str += "</button>";
			}
			str += "</div></li>";
			return str;
		}
 	
	 	function makeChildReply(reply) {
			// 자식 댓글(대댓글) 리스트 + 수정, 삭제 버튼
			str = "<li class='li_childReply' id='li_childReply_"+reply.reply_num+"'><div class='childReply-writer'>";
			str += "<span class='regency' style='font-weight: bold;'>ID : " + reply.writer_id + "</span></div>";
			str += "<div class='childReply-content' id='reply-"+reply.reply_num+"'>" + reply.reply_content + "</div>";
			str += "<div class='childReply_date' align='right' style='padding: 0 1em;'>" + reply.reply_date + "</div>";
			str += "<div class='reply-menu' align='right'>";
			if (member_id == reply.writer_id || member_type == "2"){
				str += "<button type='editReplyForm' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
				str += "<span class='glyphicon glyphicon-erase' aria-hidden='true'></span>수정</button>";
				str += "<button type='deleteReply' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
				str += "<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>삭제";
				str += "</button>";
			}
			str += "</div></li>";
			return str;
		}

	 	function getAllReply() {
			// 전체 댓글 리스트 가져오기
			$.ajax({
				url:"/reply/getReplyList",
				data: "board_num="+board_num,
				type:'post',
				success: function(result) {
					var arr = $.parseJSON(result);
					makeList(arr);
				}
			});
		 }

	 	var makeList = function(arr) {
			// 전체 리스트 작성
			for (x=0;x<arr.length;x++) {
				var html = makeTbl(arr[x]);
				$("#reply_list").append(html);
			}
		}
	
		function makeEditForm(id,name,r) {
			// 수정폼 만드는 함수
			str = "<div id='edit_r_reply-"+r.reply_num+"' ><textarea id ='edit_content_"+r.reply_num+"' name='reply_content' class='form-control' rows='3'>";
			str += r.reply_content+"</textarea>";
			str += "<button name='btn_editReply' type='"+id+"' num='"+r.reply_num+"' class='btn btn-danger btn-block'>댓글 수정</button></div>";
			$("#"+name+r.reply_num).replaceWith(str);
		}

		// 대댓글 등록창 (비동기)
		function toggleReply(reply_num) {
			$(`#input_r_reply-${"${reply_num}"}`).slideToggle();
		}
		
</script>
<!-- 함수 끝 -->

<style>
#btn_like, #btn_like_delete, #btn_go_AdoptForm, #p_viewMap:hover {
	cursor: pointer;
}
</style>

<style>
.breadcrumb-item>a, .table-primary>a {
	color: #777;
}

.breadcrumb-item>a:hover, .table-primary>a:hover {
	color: #337ab7;
}

.nino-btn>#btn {
	background: #95e1d3;
}

.nino-btn>#btn:hover {
	background: #00ced1;
}

.li_reply{
	border-bottom: 1px solid; 
	border-color: #C0C0C0; 
	padding: 15px; 
	margin: 5px 40px 5px;
}
.li_childReply{
	border-bottom: 1px solid; 
	border-color: #C0C0C0; 
	padding: 15px; 
	margin: 5px 40px 5px;
	margin-left: 150px;
}
</style>


</head>

<body style="padding-top: 50px;" class="nino-fixed-nav">
	<!-- 빠른 페이지 이동 -->
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"> <a href="/index">홈</a> </li>
				<li class="breadcrumb-item">
					<a href="/AddPet/AdoptNoticeList">입양공고</a>
				</li>
				<li class="breadcrumb-item active">입양공고 상세보기</li>
			</ol>
		</div>


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
	<!-- default : 정보가 없는 경우에는 -를 넣는다. -->
		<c:set var="default_breed">
			<c:if test="${empty pet.breed }">사랑둥이</c:if>
		</c:set>
		<c:set var="default_sex">
			<c:if test="${empty pet.sex }">-</c:if>
		</c:set>
		<c:set var="default_age">
			<c:if test="${empty pet.age }">-</c:if>
		</c:set>
		<c:set var="default_weight">
			<c:if test="${empty pet.weight }">-</c:if>
		</c:set>
<!-- 뷰 세팅 끝================================================== -->



<!-- Story About Us
    ================================================== -->
	<section id="nino-story" style="padding-bottom: 30px;">
		<div class="container">
			<h2 class="nino-sectionHeading">

				<span class="nino-subHeading">Shall We Together?</span>
				${pet.breed }${default_breed }, ${pet.name }
				
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
    				<div class="number">${sexKorean }${default_sex }</div>
    				<div class="text">SEX</div>
    			</div>
    			<div class="item" style="width:18%;"> 
    				<div class="number">${pet.age }${default_age }살</div>
    				<div class="text">AGE</div>
    			</div>
    			<div class="item" style="width:18%;">
    				<div class="number">${pet.weight }${default_weight }</div>
    				<div class="text">WEIGHT</div>
    			</div>
    			<div class="item" style="width:26%;">
    				<div class="number">${locationKorean }</div>
    				<div class="text">location</div>
    			</div>
    			<div class="item" id="btns" style="width:20%; padding: 5px; text-align: center;" >
    				<!-- 관심등록이 안되어 있다면 빈하트, 관심등록이 되어 있다면 하트 -->
    				<div class="number" id="btn_like" ifLikePet="${ifLikePet }" style="display: inline-block; border: 1px solid white; width: 70%; padding: 7px; margin-top:50px; font-size: 20px; color: #f38181; ">
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
    
    
    <section id="nino-testimonial" style="background: #95e1d3; padding-top: 10px; margin-top: 0px; padding-bottom: 20px; margin-bottom: 60px;">
    	<div class="container">
    		<div layout="row" class="verticalStretch" style="margin: 10px;">
    			<div class="nino-symbol fsr">
					<i class="mdi mdi-comment-multiple-outline nino-icon" style="font-size: 30px;"></i>
				</div>
				<div style="margin: 10px; width: 100%;">
					<pre class="quote" style="font-size: 18px; font-family: 'Roboto', sans-serif;">"${pet.info }"</pre>
				</div>
			</div>
		</div>
	</section>


	<!-- 댓글리스트 시작 -->
		<div class="container">
			<h2 class="nino-sectionHeading" style="margin-top: 8%;">
				<span class="nino-subHeading">Say Together</span> 댓글
			</h2>

			<!-- 댓글 작성란 -->
			<div class="sectionContent">
				<div class="replys" id="reply-add-form" style="border-radius: 35px; padding: 5px 15px; margin: 30px;">

					<!-- 댓글 등록폼 -->
					<div  id="input_reply">
						<span class="regency" style="font-weight: bold; margin: 5px;">ID : ${sessionScope.id}</span>
						<textarea id ="reply_content" name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
						<button id="btn_addReply" type="button" class="btn btn-danger btn-block">댓글 등록</button>
				</div>
			</div>

			<!-- 댓글목록 -->
			<div id="reply_list"></div>
			</div>
		</div>
	<!-- 댓글리스트 끝-->

    
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
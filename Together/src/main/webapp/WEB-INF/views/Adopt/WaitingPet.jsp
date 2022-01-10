<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<title>Together | 입양공고 상세보기</title>
	
	<!-- favicon -->
    <link rel="shortcut icon" href="/resources/images/ico/favicon.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/template.css" />

	<!-- webapp/resources 가 CSS의 디폴트 경로.  -->
	<!-- <link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath }/resources/memberCss.css" /> -->
  

	<!-- jquery 라이브러리 불러들이기 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 함수 시작 -->
	<script>
	// 로그인 팝업 함수  ******** 추후 추가할 예정 : 팝업시 부모창 비활성화  또는 모달창
	function fn_loginPopup(){
		// loginPopup   window.open('팝업주소','팝업창 이름','팝업창 설정');
		var popup=window.open("/Member/loginFormPopup","Together | 로그인",
			"width=460px, height=600px, scrollbars=yes, top=100px, left=300px, location=no");
		return false;
	}
	
	function fn_like(){
		$.post("/like/add", {pet_id:pet_id})
		.done(function(){
			alert("관심등록이 완료되었습니다.");			
		})
		.fail(function(){
			alert("error");
		});
	}
	
	var member_id="${sessionScope.id }";
	var pet_id="${pet.id }";
	
		$(document).ready(function(){
			//관심등록 버튼 클릭
			$("#btn_like").click(function(){				
				if(member_id==""){
					var flag=confirm("로그인이 필요합니다. 로그인하시겠습니까?");
					if(flag){
						fn_loginPopup();
					}else{
						return; 
					}
				}else{
					fn_like();
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
                                <textarea name="reply_content" class="form-control" rows="3" style="width:100%; borrder: none; background: none">${"${reply.text()}"}</textarea>
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
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/reply/delete",
                    data: { reply_num },
                    success: function (response) {
                        location.href = location.href.split("#")[0];
                    },
                });
            }
	</script>
	<!-- 함수 끝 -->

</head>
<body>

<h3>상단 배너</h3>

<!-- 뷰 세팅================================================== -->
	<!-- locationEnglish : 펫이 있는 장소를 영어화 합니다. -->
		<c:set var="locationEnglish">
			<c:if test="${pet.location == 1 }">GangNam</c:if>
			<c:if test="${pet.location == 2 }">AnYang</c:if>
			<c:if test="${pet.location == 3 }">HaeUnDae</c:if>
		</c:set>
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
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">

				<span class="nino-subHeading">I'm In ${locationEnglish }</span>
				${pet.breed }, ${pet.name }
			</h2>
			<p class="nino-sectionDesc">${pet.name }는 사랑입니다</p>

				<div class="row nino-hoverEffect">
					<div class="col-md-4 col-sm-4">
						<div class="item">
							<a class="overlay" href="#">
								<span class="content">
									<!-- ********** 추후 추가예정 : 이미지 저장하기 ********** -->
									<i class="mdi mdi-image-filter-center-focus-weak nino-icon"></i>
									이미지 다운로드하기
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
									이미지 다운로드하기
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
									이미지 다운로드하기
								</span>
								<img src="/AddPet/petImg?id=${pet.id}&petImgNum=3" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</section>
	<!--/#nino-story-->
	
	
    <!-- Footer
    ================================================== -->
	<footer id="footer" style="padding: 0;">
        <div class="container">
        	<div class="row">
        		<div class="col-md-12">
        			<div class="colInfo">
	        			<div class="nino-followUs">
	        				<div class="totalFollow"><span>15k</span> views</div>
	        				<div class="socialNetwork">
	        					<span class="text">SNS로 공유하기 : </span>
	        					<a href="" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-google-plus"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-youtube-play"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-dribbble"></i></a>
	        					<a href="" class="nino-icon"><i class="mdi mdi-tumblr"></i></a>
	        				</div>
	        			</div>
        			</div>
        		</div>
        	</div>		
        </div>
    </footer>
    <!--/#footer-->
	
	
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
    			<div class="item" style="width:20%; margin: 0px; padding: 20px;">
    				<!-- *********수정할 사항 : 관심등록 하트 구현하기********* -->
    				<div class="number">
    					<button id="btn_like" class="nino-btn" style="font-size: 20px; background: #95e1d3;">관심등록</button>
    					<button id="btn_go_AdoptForm" class="nino-btn" style="font-size: 20px; background: #95e1d3;">입양신청</button>
    				</div>
    				<div class="text"></div>
    			</div>
    			
    					
    		</div>
    	</div>
    </section>
    <!--/#nino-counting-->
    
    
    <section id="nino-testimonial">
    	<div class="container">
    		<div layout="row" class="verticalStretch">
    			<div class="nino-symbol fsr">
					<i class="mdi mdi-comment-multiple-outline nino-icon" style="font-size: 30px;"></i>
				</div>
				<div  style="margin: 10px;">
					<p class="quote" style="font-size: 20px;">"${pet.info }"</p>
				</div>
			</div>
		</div>
	</section>

    
    
	<!-- Happy Client
    ================================================== -->
	<section id="nino-happyClient">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Say Together</span> 댓글
			</h2>

			<!-- 댓글쓰기란 -->
			<div class="sectionContent">
				<div class="replys" id="reply-add-form" style="border: 5px dotted white; border-radius: 35px; padding: 5px 15px; margin: 30px;">

					<!-- 댓글 등록폼 -->
					<form name="form_addReply" action="${pageContext.request.contextPath}/reply/add" method="post" class="add-reply-form">
						<div>
							<span class="regency">NICKNAME : ${sessionScope.nickname}</span>
							<textarea name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요." style="borrder: none; background: none"></textarea>
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
										<span class="regency">NICKNAME : ${reply.member.nickname}</span>
									</div>
									<div class="reply-content" id="reply-${reply.reply_num}">${reply.reply_content}</div>
									<div class="reply_date" align="right">${reply.reply_date}</div>

									<div class="reply-menu" align="right">
										<c:if test="${sessionScope.id != null}">
											<button onclick="toggleReply('${reply.reply_num}')" class="btn btn-link btn-sm">
												<span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>댓글
											</button>
											<button onclick="editReply('${reply.reply_num}')" class="btn btn-link btn-sm">
												<span class="glyphicon glyphicon-erase" aria-hidden="true"></span>수정
											</button>
											<button onclick="deleteReply('${reply.reply_num}')" class="btn btn-link btn-sm">
												<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>삭제
											</button>
										</c:if>
									</div>
								</li>
								<%-- 댓글목록 끝 --%>

								<%-- 대댓글 등록폼 --%>
								<form action="${pageContext.request.contextPath}/reply/add" method="post" class="add-child-reply-form" id="form-${reply.reply_num}" style="display: none">
									<div>
										<textarea name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요." style="borrder: none; background: none"></textarea>
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
												<span class="regency">NICKNAME : ${reply.member.nickname}</span>
											</div>
											<div class="childReply-content" id="reply-${c_reply.reply_num}">${c_reply.reply_content}</div>
											<div class="childReply_date" align="right">${reply.reply_date}</div>

											<div class="childReply-menu" align="right">
												<c:if test="${sessionScope.id != null}">
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
	</section>
	<!-- 댓글리스트 끝-->
	<!--/#nino-happyClient-->
    

    
<h3>하단 입양공고 리스트</h3>


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
    <form action="" id="nino-searchForm">
    	<input type="text" placeholder="Search..." class="form-control nino-searchInput">
    	<i class="mdi mdi-close nino-close"></i>
    </form><!--/#nino-searchForm-->
    
    <!-- Scroll to top
    ================================================== -->
    <a href="#" id="nino-scrollToTop" style="display: inline;">Go to Top</a>
    
    <!-- javascript -->
	<script type="text/javascript" src="/resources/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript" src="/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="/resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="/resources/js/template.js"></script>

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
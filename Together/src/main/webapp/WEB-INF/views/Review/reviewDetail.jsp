<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>Together | 후기게시판 자세히 보기</title>
	
	<style>
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
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var member_id="${sessionScope.id}";
var member_type = "${sessionScope.type}";
var board_num = ${r.num};
var str= "";

 	$(document).ready(function () {
		// 후기 글의 이미지 관련 스크립트
		$(".img").mouseover(function () {
			$("#bigImg").attr("src",this.src);
		});
		
		// 댓글 입력 (동기)
		/* $("#btn_addReply").click(function(){
			
			var form=document.form_addReply;
		
				form.submit();
			
		});  */
		
// 댓글 입력(비동기)
$(document).on("click","#btn_addReply",function(){
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
				$.post("/reviewReply/add",{
					board_num:board_num,
					writer_id:member_id,
					parent_reply_num:-1
				}).done(function(data){
					alert("댓글이 등록되었습니다!");
					$("#reply_content").val("");
					getAllReply();
				});
			}
			
		});

		// 댓글 전체 리스트 불러오기 (비동기)
		$.ajax({
			url:"/reviewReply/getReplyList",
			data: "board_num="+board_num,
			type:'post',
			success: function(result){
				var arr = $.parseJSON(result);
				makeList(arr);
			}
			
		});
		
		// 댓글 버튼 누르면 대댓글 작성폼이 나온다.
		$(document).on("click","button[type='btn_rr']",function(){
			var num = $(this).attr("num");
			toggleReply(num);
		});
				
		$(document).on("click","button[type='editReply']",function(){
			var num = $(this).attr("num");
			
		});
		
		$(document).on("click","button[type='deleteReply']",function(){
			var num = $(this).attr("num");
			
		});
		
	});
/* 
 	var num = "${r.num}";
	
	function deleteReview() {
		console.log(num);
		if(confirm("삭제하시겠습니까?")) {
			location.href="${pageContext.request.contextPath}/Review/delete?num=" + num;
		}
	}
 */
	
 	var makeTbl = function(reply){
		// 댓글 리스트 + 대댓글, 수정, 삭제 버튼
		str = "<ul id='ul_reply_"+reply.reply_num+"'><li class='li_reply'><div class='reply-writer'>";
		str += "<span class='regency' style='font-weight: bold;'>ID : " + reply.writer_id + "</span></div>";
		str += "<div class='reply-content' id='reply-"+reply.reply_num+"'>" + reply.reply_content + "</div>";
		str += "<div class='reply_date' align='right' style='padding: 0 1em;'>" + reply.reply_date + "</div>";
		str += "<div class='reply-menu' align='right'>";
		str += "<button type='btn_rr' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
		str += "<span class='glyphicon glyphicon-share-alt' aria-hidden='true'></span>댓글";
		str += "</button>";
		
		if (member_id == reply.writer_id || member_type == "2") {
			str += "<button type='editReply' num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
			str += "<span class='glyphicon glyphicon-erase' aria-hidden='true'></span>수정</button>";
			str += "<button type='deleteReply num='"+reply.reply_num+"' class='btn btn-link btn-sm'>";
			str += "<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>삭제";
			str += "</button>";
		}
		str += "</div></li>";
		
		// 대댓글 작성폼
		str += "<div id='input_r_reply-"+reply.reply_num+"' style='display:none;'><textarea id ='childReply_content' name='reply_content' class='form-control' rows='3' placeholder='댓글을 입력하세요.'>";
		str += "</textarea><button id='btn_addChildReply' type='submit' class='btn btn-danger btn-block'>댓글 등록</button></div>";
	
		// 대댓글 리스트 + 수정, 삭제 버튼
		if (reply.child_reply !="undefined" && reply.child_reply !=null){
			for (i=0;i<reply.child_reply.length;i++){
				str += "<li class='li_childReply'><div class='childReply-writer'>";
				str += "<span class='regency' style='font-weight: bold;'>ID : " + reply.child_reply[i].writer_id + "</span></div>";
				str += "<div class='childReply-content' id='reply-"+reply.child_reply[i].reply_num+"'>" + reply.child_reply[i].reply_content + "</div>";
				str += "<div class='childReply_date' align='right' style='padding: 0 1em;'>" + reply.child_reply[i].reply_date + "</div>";
				str += "<div class='reply-menu' align='right'>";
				/* str += "<button type='btn_rr_' onclick='toggleReply(" + reply.reply_num + ")' class='btn btn-link btn-sm'>";
				str += "<span class='glyphicon glyphicon-share-alt' aria-hidden='true'></span>댓글</button>"; */
				if (member_id == reply.child_reply[i].writer_id || member_type == "2"){
					str += "<button type='editReply' num='"+reply.child_reply[i].reply_num+"' class='btn btn-link btn-sm'>";
					str += "<span class='glyphicon glyphicon-erase' aria-hidden='true'></span>수정</button>";
					str += "<button type='deleteReply num='"+reply.child_reply[i].reply_num+"' class='btn btn-link btn-sm'>";
					str += "<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>삭제";
					str += "</button>";
				}
				str += "</div></li>";		
			}
		}
		str += "</ul>";
		return str;
 	}
	


	 function getAllReply() {
		$.ajax({
			url:"/reviewReply/getReplyList",
			data: "board_num="+board_num,
			type:'post',
			success: function(result){
				var arr = $.parseJSON(result);
				makeList(arr);
			}
			
		});
	 }

	var makeList = function(arr){
 		for (x=0;x<arr.length;x++){
 			var html = makeTbl(arr[x]);
 			$("#reply_list").append(html);
 		}
 	}
 	
 	function fn_loginPopup(){
		// loginPopup   window.open('팝업주소','팝업창 이름','팝업창 설정');
		var popup=window.open("/Member/loginFormPopup","Together | 로그인",
			"width=460px, height=340px, scrollbars=no, top=100px, left=300px, location=no");
		return false;
	}
 /* 
 	 // 대댓글 등록창 (동기)
	function toggleReply(reply_num) {
		$(`#form-${"${reply_num}"}`).slideToggle();
	} */
	
	 // 대댓글 등록창 (비동기)
	function toggleReply(reply_num) {
		$(`#input_r_reply-${"${reply_num}"}`).slideToggle();
	}
 	 
 	 
	// 댓글|대댓글 수정
	replyList = {};
	function editReply(reply_num) {
            const reply = $(`#reply-${"${reply_num}"}`);
            if (replyList[reply_num] === undefined) {
                replyList[reply_num] = reply.text();
                let html = `
                    <form action="${pageContext.request.contextPath}/reviewReply/edit" method="post">
                        <div>
                            <textarea name="reply_content" class="form-control" rows="3" style="width:100%;">${"${reply.text()}"}</textarea>
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
                url: "${pageContext.request.contextPath}/reviewReply/delete",
                data: { reply_num },
                success: function (response) {
                    location.href = location.href.split("#")[0];
                },
            });
        }
	 
</script>
	
</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">


 <!-- container Form
    ================================================== -->

		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				후기 게시판
			</h2>
  <fieldset>
  	 
	 <div class="form-group">
		<c:if test="${not empty file0 }">
						<table style="margin-left: auto; margin-right: auto;">
							<tr>
								<td colspan="3"><img id="bigImg" src="${pageContext.request.contextPath }/img?fname=${file0}&num=${r.num}" style="width: 450px; height: 300px;"></td>
							</tr>
							
							<tr>
								<td><img src="${pageContext.request.contextPath }/img?fname=${file0}&num=${r.num}" class="img" width="150" height="150"></td>
								<td><img src="${pageContext.request.contextPath }/img?fname=${file1}&num=${r.num}" class="img" width="150" height="150"></td>
								<td><img src="${pageContext.request.contextPath }/img?fname=${file2}&num=${r.num}" class="img" width="150" height="150"></td>
							</tr>
						</table>
					</c:if>
	</div>
	
	<div class="review-menu" align="right">		  
	<c:if test="${sessionScope.nickname==r.w_writer}">
	<a href="${pageContext.request.contextPath}/Review/editReviewForm?num=${r.num}" class="nino-btn" style="background: #95e1d3;">수정</a>
	<a href="#" onclick="deleteReview();" class="nino-btn" id="delete" num="${r.num}" style="background: #95e1d3;">삭제</a>
	</c:if>
	</div>
					  
  <div class="form-group">
  
      <label for="inputPetName">작성자</label>
      <input type="text" class="form-control" id="w_writer"  name="w_writer" value="${r.w_writer }" readonly="readonly">
    </div>
  
    <div class="form-group">
      <label for="inputPetName">제목</label>
      <input type="text" class="form-control" id="title"  name="title" value="${r.title }" readonly="readonly">
    </div>
    
    <div class="form-group">
    	 <label for="selectLocation">보호소 지점</label>
    	 
    	 <c:if test="${r.location == 1 }">
    	 	<input type="text" class="form-control" id="location" name="location" value="강남점" readonly="readonly">
    	 </c:if>
    	 
    	 <c:if test="${r.location == 2 }">
    	 	<input type="text" class="form-control" id="location" name="location" value="안양점" readonly="readonly">
    	 </c:if>
    	 
    	 <c:if test="${r.location == 3 }">
    	 	<input type="text" class="form-control" id="location" name="location" value="해운대점" readonly="readonly">
    	 </c:if>
    	<!--  
      	<select class="form-control" id="location" name="location">
       		<option value="">-선택-</option>
        	<option value="1">강남점</option>
        	<option value="2">안양점</option>
        	<option value="3">해운대점</option>
      </select> -->
    </div>
    
    <div class="form-group">
      <label for="inputBreed">내용</label>
      <textarea class="form-control" id="content" name="content" rows="10" readonly="readonly">${r.content }</textarea>
    </div>
    <div class="review-menu" align="right">
    <a href="${pageContext.request.contextPath}/Review/reviewList" class="nino-btn" style="background: #95e1d3;">목록</a>
	</div>
     </fieldset>
</div>

		<!-- Happy Client
   		 ================================================== -->
		<div class="container">
			<h2 class="nino-sectionHeading" style="margin-top: 8%;">
				<span class="nino-subHeading">Say Together</span> 댓글
			</h2>

			<!-- 댓글쓰기란 -->
			<div class="sectionContent">
				<div class="replys" id="reply-add-form" style="border-radius: 35px; padding: 5px 15px; margin: 30px;">

					<!-- 댓글 등록폼 -->
					<%-- <form name="form_addReply" action="${pageContext.request.contextPath}/reviewReply/add" method="post" class="add-reply-form"> --%> 
						<div  id="input_reply">
							<span class="regency" style="font-weight: bold; margin: 5px;">ID : ${sessionScope.id}</span>
							<textarea id ="reply_content" name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
							<button id="btn_addReply" type="button" class="btn btn-danger btn-block">댓글 등록</button>
						</div>

					<%-- <input type="hidden" name="writer_id" value="${sessionScope.id}" />
						<input type="hidden" name="board_num" value="${r.num}" />
						<input type="hidden" name="parent_reply_num" value="-1" /> 
						  </form>  -->--%>
				</div>

				<!-- 댓글목록 -->
				<div id="reply_list">
					
					<%-- <c:forEach var="reply" items="${replys}">
						<c:set var="status" value="${reply.reply_content==null?'deleted':'normal'}" />
						<c:choose>
							댓글이 정상일 때
							<c:when test="${status != 'deleted'}">
								<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px;">
									<div class="reply-writer">
										<span class="regency" style="font-weight: bold;">NICKNAME : ${reply.member.nickname}</span>
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
								댓글목록 끝

								대댓글 등록폼
								<form action="${pageContext.request.contextPath}/reviewReply/add" method="post" class="add-child-reply-form" id="form-${reply.reply_num}" style="display: none">
									<div>
										<textarea name="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
										<button id="btn_addChildReply" type="submit" class="btn btn-danger btn-block">댓글 등록</button>
									</div>
									<input type="hidden" name="writer_id" value="${sessionScope.id}" />
									<input type="hidden" name="board_num" value="${r.num}" />
									<input type="hidden" name="parent_reply_num" value="${reply.reply_num}" />
								</form>

								대댓글 등록폼 끝
							</c:when>

							댓글이 삭제된 경우
							<c:otherwise>
								<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px;">
									<div class="reply-content">삭제된 댓글입니다.</div>
								</li>
							</c:otherwise>
						</c:choose>

						대댓글이 있는 경우
						<c:if test="${not empty reply.child_reply}">
							<c:forEach var="c_reply" items="${reply.child_reply}">
								<c:set var="child_status" value="${c_reply.reply_content==null?'deleted':'normal'}" />
								<c:choose>
									<c:when test="${child_status != 'deleted'}">
										<li style="border-bottom: 1px solid; border-color: #C0C0C0; padding: 15px; margin: 5px 40px 5px; margin-left: 150px;">
											<div class="childReply-writer">
												<span class="regency" style="font-weight: bold;">NICKNAME : ${c_reply.member.nickname}</span>
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
					</c:forEach> --%>
				
				</div>
			</div>
		</div>
		<!-- 댓글리스트 끝-->
		<!--/#nino-happyClient-->
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>  
	<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">


<title>Together | 1:1 문의 상세</title>


<style>
.breadcrumb-item>a, .table-primary>a {
	color: #777;
}

.breadcrumb-item>a:hover, .table-primary>a:hover {
	color: #337ab7;
}
.balloon_1 {
	position: relative;
/* 	margin: 50px; */
	width: 90%;
	height: auto;
	background: #95e1d3;
	color: #fff;
	border-radius: 10px;
	padding: 15px 15px;
}

.balloon_1:after {
	border-top: 15px solid #95e1d3;
	border-left: 15px solid transparent;
	border-right: 0px solid transparent;
	border-bottom: 0px solid transparent;
	content: "";
	position: absolute;
	top: 10px;
	left: -15px;
}

.balloon_2 {
	position: relative;
	margin: 50px;
	width: 90%;
	height: auto;
	background: rgba(243, 129, 129, 0.9);
	color: #fff;
	border-radius: 10px;
	padding: 15px 15px;
}

.balloon_2:after {
	border-top: 15px solid rgba(243, 129, 129, 0.9);
	border-left: 0px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 0px solid transparent;
	content: "";
	position: absolute;
	top: 10px;
	right: -15px;
}

#btnSubmit>#btn_submit {
	background: #95e1d3
}

#btnSubmit>#btn_submit:hover {
	background: #00ced1;
}

#ansInfo {
	text-align:right;
	/* color:#999;  */
	font-size:10;
}

#ans_edit, #ans_del, #ask_del, #ask_edit {
	color:black;
	margin:2px;
	
}
#ans_edit:hover, #ans_del:hover, #ask_del:hover, #ask_edit:hover {
	color:black;
	margin:2px;
	
}


</style>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function() {
		var flag = false;
		var str = "";
		var num = ${ask.num};
		
		// 답변과 답변작성부분 우선 숨김
		$('#answerResult').hide();
		$('#input_answer').hide();
		
		// 답변이 있는 지 확인해서 답변이 있다면 추가해주는 함수
		getAnswer(num);
		
		
		$(document).on("click","#btn_submit",function(){
			// 답변 작성 버튼을 누르면 답변 입력되도록 하는 함수
			if ($('#ans_content').val() == ""){
				// 답변란 내용 유효성 체크
				alert("답변을 입력해주세요.");
				$('#ans_content').focus();
				return false;
			} 
			flag = confirm("답변을 입력하시겠습니까?");
			
			if (flag){
				var type = $("#btn_submit").attr("type");
				if (type=="submit"){
					$.post("/Ask/AddAnswer",
						{
							admin_id:"${sessionScope.id}",
							ans_content:$('#ans_content').val(),
							ask_num:num
							
						}).done(function(data){
							alert("답변이 등록되었습니다!");
							getAnswer(num);
						});
				} else if (type=="button"){
					$.post("/Ask/EditAnswer",
							{
								admin_id:"${sessionScope.id}",
								ans_content:$('#ans_content').val(),
								ask_num:num
								
							}).done(function(data){
								alert("답변이 수정 등록 되었습니다!");
								$("#btn_submit").attr("type","submit");
								$('#input_answer').val("");
								$('#input_answer').hide();
								getAnswer(num);
							});
				}
			} else {
				return false;
			}
		});
		
		
		$(document).on("click","#ask_edit",function(){
			flag = confirm("문의글을 수정 하시겠습니까?");
			if (flag){
				alert("수정 페이지로 이동합니다.");
				location.href="/Ask/OneAsk?num="+num+"&type=2";
			}
		});
		
		$(document).on("click","#ask_del",function(){
			flag = confirm("정말 문의글을 삭제 하시겠습니까?");
			if (flag){
				$.post("/Ask/DelAsk",
					{
						num : num
					}).done(function(json){
						alert("문의가 삭제되었습니다.");
						location.href="/Ask/AskList";
					});
			} else {
				return false;
			}
		});
		
		$(document).on("click","#ans_edit",function(){
			flag = confirm("문의 답변을 수정 하시겠습니까?");
			if (flag){
				$.post("/Ask/getAnswer",
						{
							ask_num:num
						}).done(function(data){
								var ans = $.parseJSON(data);
								var content = ans.ans_content;
								if (content != null && content != ""){
									$("#ans_content").val(content);
									// 답변 보여주기
									$('#answerResult').html("");
									$('#answerResult').hide();
									$("#input_answer").show();
									$("#btn_submit").attr("type","button");
									
								} 
						});
			} else {
				return false;
			}
		});
		
		$(document).on("click","#ans_del",function(){
			flag = confirm("정말 삭제 하시겠습니까?");
			if (flag){
				$.post("/Ask/DelAns",
					{
						ask_num :num
					}).done(function(){
						alert("문의 답변이 삭제되었습니다.");
						$('#ans_content').val("");
						getAnswer(num);
						
					});
			} else {
				return false;
			}
		});
		

		function getAnswer(num){
			// 답변 리스트 가져오는 함수
			$.post("/Ask/getAnswer",
					{
						ask_num:num
					}).done(function(data){
							var ans = $.parseJSON(data);
							if (ans.ans_content == "" || ans.ans_content == null) {
								if (${sessionScope.type==2}){
									// 관리자의 경우 답변이 없으면 답변 입력란을 보여준다
									$('#input_answer').show();
								} 
								$('#answerResult').html("");
								$('#answerResult').hide();
							}
							else if (ans.ans_content != null && ans.ans_content != ""){
								// 답변이 있으면 답변을 말풍선에 담아 보여준다.
								str = "<div id='askAnswer' class='balloon_2'><p>A.</p><span id='answer'>"+ans.ans_content+"</span><div id='ansInfo'>";
								str += ans.ans_date + " 관리자: "+ans.admin_id;
								str += "<c:if test='${sessionScope.type==2}'><br>";
								str += "<button class='edit' id='ans_edit'>수정</button><button class='del' id='ans_del'>삭제</button>";
								str += "</c:if></div></div>";
								// 답변 보여주기
								$('#answerResult').html(str);
								$('#answerResult').show();
								
							} 
					});
		}
		
	});
</script>

</head>
<body data-target="#nino-navbar" data-spy="scroll"
	style="padding-top: 50px;" class="nino-fixed-nav">

	<!-- 로그인 하지 않은 경우, 작성 불가하도록! -->

	<c:if test="${empty sessionScope.id}">
		<section id="onlineAddPet">
			<div class="container" style="text-align: center;">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Together</span> 로그인을 먼저 해야합니다.
				</h2>
				<br>
				<button type="submit" class="nino-btn" id="btn" style="background: #95e1d3;"
					onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>

			</div>
		</section>

	</c:if>

	<!-- 로그인 한 경우 -->

	<c:if test="${not empty sessionScope.id}">
		<!-- container Form
    ================================================== -->
    <div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/index">홈</a></li>
				<li class="breadcrumb-item"><a href="/Member/MyPage"> <c:if
							test="${sessionScope.type==1}">마이페이지</c:if> <c:if
							test="${sessionScope.type==2}">관리자페이지</c:if>
				</a></li>
				<li class="breadcrumb-item"><a href="/Ask/AskList">문의내역</a></li>
				<li class="breadcrumb-item active">1:1 문의상세보기</li>
			</ol>
		</div>
    
		<c:if test="${not empty ask.answer}">
			<c:set var="state" value="답변 완료"></c:set>
		</c:if>
		<c:if test="${empty ask.answer}">
			<c:set var="state" value="답변 대기중"></c:set>
		</c:if>
		
		
		<section id="onlineAddPet">
			<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Together</span> 1:1 문의 상세
				</h2>
				<button type="submit" class="nino-btn" id="btn"
						style="background: #95e1d3;"
						onclick="location.href='/Ask/AskList'">문의내역 보기</button>
						<br>
					<table class="table">
					<tr class="table-primary">
						<th scope="col">글 번호</th>
						<td>${ask.num}</td>
					</tr>
					<tr class="table-primary">
						<th scope="col">유형</th>
						<td><c:choose>
								<c:when test="${ask.category==1}">[1.회원 정보]</c:when>
								<c:when test="${ask.category==2}">[2.입양 관련]</c:when>
								<c:when test="${ask.category==3}">[3.입소 관련]</c:when>
								<c:when test="${ask.category==4}">[4.사이트 관련 오류]</c:when>
								<c:when test="${ask.category==5}">[5.기타 문의]</c:when>
								<c:otherwise>분류 없음</c:otherwise>
							</c:choose></td>
					</tr>
					<c:if test="${sessionScope.type==1}">
						<tr class="table-primary">
						<th scope="col">문의 상태</th>
						<td>
						${state}
						</td>
						</tr>
					</c:if>
					<c:if test="${sessionScope.type==2}">
						<tr class="table-primary">
						<th scope="col">작성자</th>
						<td>
						${ask.writer_id}
						</td>
						</tr>
					</c:if>
					
					<tr class="table-primary">
						<th scope="col">제목</th>
						<td>${ask.title}</td>
					</tr>
					<tr class="table-primary">
						<td colspan="2">
							<div id="askContent" class="balloon_1">
								<p>Q.</p>
								${ask.content} 
								
								<c:if test="${not empty file0}">
								<br>
									<img alt="img1"
										src="/Ask/getImg?ask_num=${ask.num}&fileName=${file0}" width="300" height="auto">
								</c:if>
								<c:if test="${not empty file1}">
									<img alt="img2"
										src="/Ask/getImg?ask_num=${ask.num}&fileName=${file1}" width="300" height="auto">
								</c:if>
								<c:if test="${not empty file2}">
									<img alt="img3"
										src="/Ask/getImg?ask_num=${ask.num}&fileName=${file2}" width="300" height="auto">
								</c:if>
								<c:if test="${sessionScope.id==ask.writer_id || sessionScope.type==2}">
								<br>
								<div id="ansInfo">
								<button class="edit" id="ask_edit">수정 </button><button class="del" id="ask_del"> 삭제</button>
								</div>
								</c:if>
								
							</div> 
							<div id="answerResult" class="">
								
							</div>
						</td>
					</tr>
					
					<!-- 답변이 없고, 로그인 아이디가 관리자일때 보이는 답변 입력란 -->
						<tr id="input_answer" class="table-primary">
							<td colspan="2">
								<p>A.</p>
								<div class="form-group">
									<form id ="answerForm" action="" method="post">
			     						<textarea class="form-control" id="ans_content" name="ans_content" rows="5" style="resize: none;"placeholder="답변을 입력하세요"></textarea>
			     						<div id="btnSubmit" style="text-align: center;">
											<button type="submit" class="nino-btn" id="btn_submit">답변 등록</button>
										</div>
									</form>
								</div>
							</td>
						</tr>
					
				</table>
			</div>
		</section>
	</c:if>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
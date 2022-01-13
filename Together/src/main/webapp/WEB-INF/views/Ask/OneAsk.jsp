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
</style>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function() {
		var flag = false;
		
		$('#btn_submit').click(function(){
			if ($('#ans_content').val() == ""){
				alert("답변을 입력해주세요.");
				$('#ans_content').focus();
				return false;
			} 
			flag = confirm("답변을 입력하시겠습니까?");
			if (flag){
				$.post("/Ask/AddAnswer",
					{
						admin_id:$('#admin_id').val(),
						ans_content:$('#ans_content').val(),
						ask_num:$('#ask_num').val()
						
					}).done(function(data){
						var str = "<div class='balloon_2'><p>A.</p>"+data.ans_content+"<div id='ansInfo'>";
						str += data.ans_date + " 관리자: "+data.admin_id+"</div></div>";
						$('#answerResult').html(str);
						alert("답변이 등록되었습니다!");
					});
			} else {
				return false;
			}
		});
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
				<li class="breadcrumb-item"><a href="/MyPage"> <c:if
							test="${sessionScope.type==1}">마이페이지</c:if> <c:if
							test="${sessionScope.type==2}">관리자페이지</c:if>
				</a></li>
				<li class="breadcrumb-item"><a href="/Ask/AskList">문의내역</a></li>
				<li class="breadcrumb-item active">1:1 문의상세보기</li>
			</ol>
		</div>
    
		<c:if test="${not empty a.answer}">
			<c:set var="state" value="답변 완료"></c:set>
		</c:if>
		<c:if test="${empty a.answer}">
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
						<td>${a.num}</td>
					</tr>
					<tr class="table-primary">
						<th scope="col">유형</th>
						<td><c:choose>
								<c:when test="${a.category==1}">[1.회원 정보]</c:when>
								<c:when test="${a.category==2}">[2.입양 관련]</c:when>
								<c:when test="${a.category==3}">[3.입소 관련]</c:when>
								<c:when test="${a.category==4}">[4.사이트 관련 오류]</c:when>
								<c:when test="${a.category==5}">[5.후원 관련]</c:when>
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
						${a.writer_id}
						</td>
						</tr>
					</c:if>
					
					<tr class="table-primary">
						<th scope="col">제목</th>
						<td>${a.title}</td>
					</tr>
					<tr class="table-primary">
						<td colspan="2">
							<div id="askContent" class="balloon_1">
								<p>Q.</p>
								${a.content} <br>
								
								
								<c:if test="${not empty file0}">
									<img alt="img1"
										src="/Ask/getImg?ask_num=${a.num}&fileName=${file0}" width="300" height="auto">
								</c:if>
								
								<c:if test="${not empty file1}">
									<img alt="img2"
										src="/Ask/getImg?ask_num=${a.num}&fileName=${file1}" width="300" height="auto">
								</c:if>
								
								<c:if test="${not empty file2}">
									<img alt="img3"
										src="/Ask/getImg?ask_num=${a.num}&fileName=${file2}" width="300" height="auto">
								</c:if>
								
							</div> 
							<div id="answerResult">
								<c:if test="${not empty a.answer}">
									<div id="askAnswer" class="balloon_2">
										<p>A.</p>
										${a.answer.ans_content}
										<div id="ansInfo">${a.answer.ans_date}관리자:
											${a.answer.admin_id}</div>
									</div>
								</c:if>
							</div>
						</td>
					</tr>

					<c:if test="${sessionScope.type==2}">
					<c:if test="${empty a.answer}">
						<tr class="table-primary">
							<td colspan="2">
								<p>A.</p>
								<div class="form-group">
									<form id ="answerForm" action="" method="post">
										<input type="hidden" id="ask_num" name="ask_num" value="${a.num}">
										<input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.id}">
			     						<textarea class="form-control" id="ans_content" name="ans_content" rows="5" style="resize: none;"></textarea>
			     						<div id="btnSubmit" style="text-align: center;">
											<button type="submit" class="nino-btn" id="btn_submit">답변 등록</button>
										</div>
									</form>
								</div>
							</td>
						</tr>
					</c:if>
					</c:if>
				</table>
			</div>
		</section>
	</c:if>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
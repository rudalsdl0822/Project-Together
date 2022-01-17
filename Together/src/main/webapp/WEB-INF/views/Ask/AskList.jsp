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


<title>Together | 1:1 문의 내역</title>


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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
					<button type="submit" class="nino-btn" id="btn"
						style="background: #95e1d3;"
						onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>
				</div>
			</section>
		</c:if>

		<!-- 로그인 한 경우 -->
	<c:if test="${not empty sessionScope.id}">
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/index">홈</a></li>
				<li class="breadcrumb-item"><a href="/Member/MyPage"> <c:if
							test="${sessionScope.type==1}">마이페이지</c:if> <c:if
							test="${sessionScope.type==2}">관리자페이지</c:if>
				</a></li>
				<li class="breadcrumb-item active">1:1 문의 리스트</li>
			</ol>
		</div>
		<!-- container Form
    ================================================== -->
		<section id="AskList">
			<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Together</span> 1:1 문의 리스트
				</h2>

				<!-- 고객의 경우 -->
				<c:if test="${sessionScope.type == 1}">
					<button type="submit" class="nino-btn" id="btn"
						style="background: #95e1d3;"
						onclick="location.href='/Ask/AskForm'">1:1 문의하기</button>

				</c:if>

				<c:if test="${empty list}">
					<div id="noList" style="text-align: center;">
						등록된 1:1 문의 리스트가 없습니다<br>

					</div>
				</c:if>

				<c:if test="${not empty list}">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글 번호</th>
								<th scope="col">유형</th>
								<th scope="col">제목</th>
								<th scope="col">문의 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="a">
								<tr class="table-primary">
									<td>${a.num}</td>
									<td><c:if test="${a.category==1}">[1.회원 정보]</c:if>
										<c:if test="${a.category==2}">[2.입양 관련]</c:if> <c:if
											test="${a.category==3}">[3.입소 관련]</c:if> <c:if
											test="${a.category==4}">[4.사이트 관련 오류]</c:if> <c:if
											test="${a.category==5}">[5.기타 문의]</c:if></td>
									<td><a href="/Ask/OneAsk?num=${a.num}&type=1">${a.title}</a></td>
									<td><c:if test="${empty a.answer}">답변대기중</c:if> <c:if
											test='${not empty a.answer}'>답변완료</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>

			</div>
		</section>
	</c:if>


		<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
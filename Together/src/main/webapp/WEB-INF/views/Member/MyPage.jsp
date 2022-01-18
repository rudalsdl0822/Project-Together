<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
<title>MyPage</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
	$().ready(function () {
	            $("#out").click(function () {
	                Swal.fire({
	                    title: '정말 탈퇴하시겠습니까?',
	                    text: "다시 되돌릴 수 없습니다. 신중하세요.",
	                    icon: 'warning',
	                    showCancelButton: true,
	                    confirmButtonColor: '#3085d6',
	                    cancelButtonColor: '#d33',
	                    confirmButtonText: '탈퇴',
	                    cancelButtonText: '취소'
	                }).then((result) => {
	                    if (result.isConfirmed) {
	                        alert("회원 탈퇴 되었습니다.");
	                        location.href="/Member/out";
	                    }
	                })
	            });
	        });
	</script>

<%@ include file="/WEB-INF/views/common/css_set.jsp"%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/mypage.css" />
    
	
        <script src="./js/script/js"></script>
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	

</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">

	<%@ include file="/WEB-INF/views/common/header.jsp" %> 
	
	<c:if test="${empty sessionScope.id}">
<section id="onlineAddPet">
		<div class="container" style="text-align:center;">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				먼저 로그인 해주세요.
			</h2>
			<br>
			<button type="submit" class="nino-btn" style="background: #95e1d3;" onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>
			
		</div>
</section>
</c:if>

<section id="onlineAddPet">
	<div class="container">
		<h2 class="nino-sectionHeading">
			<span class="nino-subHeading">Together</span>
			<c:if test="${sessionScope.type==1}">
			${sessionScope.id }님의 마이 페이지
			</c:if>
			<c:if test="${sessionScope.type==2}">
			${sessionScope.id }님의 관리자 페이지
			</c:if>
		</h2>


  <form action="${pageContext.request.contextPath}/MyPage/MyPage" method="post">

  <div style="text-align: center;">
    <ul>
      <a class="card_small" href="${pageContext.request.contextPath }/Member/editForm">
        <h3 class="softblack">정보수정</h3>
        <p class="card_text">회원 정보를 수정하실 수 있습니다.</p>
        <p class="card_textlink">수정하기</p>
      </a>
    </ul>

<c:if test="${sessionScope.type==1}">
    <ul>
      <a class="card_small" href="/like/likeList">
        <h3>관심목록</h3>
        <p class="card_text">관심등록을 한 친구들을 보실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>

    <ul>
      <a class="card_small"  href="/Adopt/MemberAdoptWishList">
        <h3 class="softblack">입양신청내역</h3>
        <p class="card_text">입양 신청 내역을 보실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>

    <ul>
      <a class="card_small" href="/Ask/AskList">
        <h3>문의내역</h3>
        <p class="card_text">관리자에게 문의하신 사항을 확인하실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
    <ul>
      <a class="card_small" href="/Review/reviewList">
        <h3>후기등록</h3>
        <p class="card_text">입양 후기를 등록하실 수 있습니다.</p>
        <p class="card_textlink">등록하기</p>
      </a>
    </ul>
    
     <ul>
      <a class="card_small" href="/AddPet/PetAllList">
        <h3>입소신청내역</h3>
        <p class="card_text">입소 신청 내역을 보실 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
    </c:if>
    
    
    <c:if test="${sessionScope.type==2}">
    <ul>
      <a class="card_small" href="#">
        <h3>전체 회원 관리</h3>
        <p class="card_text">가입된 전체 회원 정보를 조회할 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>

    <ul>
      <a class="card_small"  href="/Adopt/AdoptWishList">
        <h3 class="softblack">입양신청내역</h3>
        <p class="card_text">입양 신청 내역을 확인하고 승인/거절을 할 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>

    <ul>
      <a class="card_small" href="/Ask/AskList">
        <h3>1:1 문의 리스트</h3>
        <p class="card_text">1:1 문의글을 확인하고 답변을 작성할 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
    <ul>
      <a class="card_small" href="#">
        <h3>후원관리</h3>
        <p class="card_text">후원 현황을 확인할 수 있습니다.</p>
        <p class="card_textlink">등록하기</p>
      </a>
    </ul>
    
     <ul>
      <a class="card_small" href="/AddPet/PetAllList">
        <h3>입소신청내역</h3>
        <p class="card_text">입소 신청 내역을 확인하고 승인/거절을 할 수 있습니다.</p>
        <p class="card_textlink">확인하기</p>
      </a>
    </ul>
    </c:if>
    
    
  </div>
  </form>
  </div>
  </section>
  <br>
  <div align="right">
 
   <button type="button" class="nino-btn" id ="out" style="background: #95e1d3;">탈퇴하기</button>
	<br>
	</div>
  <br>
  <br>
  <br>
 
  
</body>


</html>
 <%@ include file="/WEB-INF/views/common/footer.jsp" %> 
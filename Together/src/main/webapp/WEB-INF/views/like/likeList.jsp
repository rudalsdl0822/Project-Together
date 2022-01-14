<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>  
<%@ include file="/WEB-INF/views/common/css_set.jsp" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 


	<title>Together | 관심친구목록</title>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://kit.fontawesome.com/f685a04a4f.js" crossorigin="anonymous"></script>
	
	<script>
            if ("${sessionScope.id}" === "") {
                alert("로그인이 필요한 페이지입니다.");
                location.href = `${pageContext.request.contextPath}/Member/loginForm?refer=${"${location.href}"}`;
            }
            
            
            $(document).ready(function () {
            	// 관심 삭제
				 $("button[type=button][name=delete_like]").click(function () {
					 	var petId=$(this).attr("num");
	                    $.ajax({
	                        type: "post",
	                        url: "${pageContext.request.contextPath}/like/delete",
	                        data: { pet_id: petId },
	                        success: function (response) {
	                            alert("삭제되었습니다");
                            location.href = location.href;
                        	},
                        	error: function(e) {
                        		alert(e);
                        	}
                    });
                });
            	
                //관심 전체 삭제
                $("#deleteAll").click(function () {
                    var confirm_val = confirm("정말 삭제하시겠습니까?");
                    if (confirm_val) {
                        location.href = "/like/likeDelAll";
                    } else {
                        alert("전체삭제 취소");
                    }
                });
            });
        </script>


</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">>
	<section id="nino-latestBlog">
    	<div class="container">
    		<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				관심친구목록
			</h2>
					<br><br>
					
					<c:if test="${empty list}">
						<br>
						등록한 관심친구가 없습니다.
						<a id="go_adopt" href="${pageContext.request.contextPath}/AddPet/AdoptNoticeList">입양 공고 보러가기</a>
						<br>
					</c:if>
					<c:if test="${not empty list }">
					<c:forEach var="like" items="${list}" varStatus="status">
							<div class="col-md-4 col-sm-4">
								<article>
									<div class="articleThumb" id="${like.pet_id}">				
										<a href="${pageContext.request.contextPath}/Adopt/WaitingPet?id=${like.pet_id}">
											<img src="${pageContext.request.contextPath}/AddPet/petImg?id=${like.pet_id}&petImgNum=1" alt="pet">
										</a>
										
										<div class="date">
											<!-- <span class="number">ㅇㅇㅇ</span> -->
											<span class="text">
											
												<c:choose>
													<c:when test="${like.p.location==1}">강남점</c:when>
													<c:when test="${like.p.location==2}">안양점</c:when>
													<c:when test="${like.p.location==3}">해운대점</c:when>
													<c:otherwise> - </c:otherwise>
												</c:choose>
											</span>
										</div>
									</div>
									<h3 class="articleTitle">
										 <div style="float: left; width: 60%;">
											<a href="${pageContext.request.contextPath}/Adopt/WaitingPet?id=${like.pet_id}">${like.p.name}</a>
											<c:if test="${like.p.state==2}">
												<span class="label label-warning">입양대기</span>
											</c:if>
											<c:if test="${like.p.state==3}">
												<span class="label label-success">입양문의중</span>
											</c:if>
											<c:if test="${like.p.state==4}">
												<span class="label label-default">입양완료</span>
											</c:if>
										</div>
										
										<div style="float: left; width: 40%;">
											<span class="input-group-btn" style="text-align: right;">
											<button type="button" class="btn btn-xs" id="like_delete" style="background-color: white; color:black; border-color:black;" name="delete_like" num="${like.pet_id}">관심삭제</button>
											<button type="button" class="btn btn-xs" id="btn_like" style="background-color: white; color:red; border-color:red;" name="likePet" onclick="location.href='${pageContext.request.contextPath}/Adopt/AdoptForm?id=${like.pet_id}'">입양신청<i class="fas fa-paw"></i></button>
											</span>
										</div>
									</h3>
									 <p class="articleDesc">
										${like.p.breed} | 
										<c:choose>
											<c:when test="${like.p.sex==1}">수컷</c:when>
											<c:when test="${like.p.sex==2}">암컷</c:when>
											<c:otherwise> - </c:otherwise>
										</c:choose>
										 | ${like.p.age}세 <br><br><br>
									</p>
								</article>
							</div>
</c:forEach>
						</c:if>
					
					
			</div>
    </section>
   
    <div align="center">
				
				<button type="button" class="nino-btn" style="background: #95e1d3;" id="deleteAll">전체삭제</button>
				<br>
			</div>
    <br>
    <br>
   
<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
</body>
</html>


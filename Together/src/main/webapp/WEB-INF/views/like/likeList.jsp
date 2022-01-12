<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/f685a04a4f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/likeList.css" />
<script>
$(document).ready(function() {
	//선택 삭제
 	$(".delete").click(function(){
 		var item = $(".delete").attr("itemid");
 		$.ajax({
 			type: "post" ,
 			url: "${pageContext.request.contextPath}/like/delete",
        	data: { like_num: item },
        	success: function(response){
        		alert("삭제되었습니다");
        		location.href=location.href;
        	},
 		});
		
	}); 
	
	//전체 삭제
	$("#deleteAll").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		if(confirm_val){
			location.href = "/like/likeDelAll";
		} else {
			//no
			alert("전체삭제 취소");
		}		
	});
	
});
</script>
</head>
<body>
<h3>관심 친구 목록</h3>
<form id="l" action="${pageContext.request.contextPath }/like/likeList" method="post">
<c:if test="${empty list }">
관심 친구가 없습니다.
</c:if>
<c:if test="${not empty list }">

<body style="margin: 0; padding: 0;">

<!-- ARTICLE SECTION -->
<c:forEach var="like" items="${list}">
<table class="table" border="0" cellpadding="0" cellspacing="0" width="100%">
    
    <tr>
        <td align="center" bgcolor="#f1efef">
            <table border="0" cellpadding="0" cellspacing="0" width="580" class="wrapper">
                <tr>
                    <td style="padding: 40px 0px 40px 0px;" class="mobile-wrapper">
                         <table border="0" cellpadding="0" cellspacing="0" width="500" class="wrapper">
                            <tr>
                                <td bgcolor="#ffffff" style="padding: 30px;" class="card-padding-mobile">
                                    <!-- LEFT COLUMN -->
                                    <table cellpadding="0" cellspacing="0" border="0" width="250" align="left" class="responsive-table">
                                        <!-- IMAGE -->
                                        <tr>
                                            <td width="100%" align="center">
                                                <table  width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td align="center" style=" padding-top:0px; padding-bottom: 0px; padding-left: 0px;" class="content_image_container">
                                                            <a href="${pageContext.request.contextPath}/Adopt/WaitingPet?id=${like.pet_id}" target="_blank"><img alt="PET" src="/AddPet/petImg?id=${like.pet_id}&petImgNum=1" width="250" height="250" style="display: block;" border="0" class="content_image"></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <!-- RIGHT COLUMN -->
                                    <table cellpadding="0" cellspacing="0" border="0" width="40%" align="right" class="responsive-table">
                                        <tr>
                                            <td bgcolor="#ffffff" width="100%" align="center">
                                                <table  width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <!-- HEADLINE -->
                                                    <tr>
                                                    <br>
                                                    <br>
                                                        <td align="left" style="padding-top: 0px; padding-left: 20px; padding-bottom: 10px; color: #666666; font-family: Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 500; text-transform: uppercase;" class="padding-headline">
                                                            ${like.p.name}
                                                        </td>
                                                    </tr>
                                                    <!-- COPY -->
                                                    <tr>
                                                        <td bgcolor="#ffffff" align="left" style="padding-left: 20px; padding-right: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px; letter-spacing: .5px; font-weight: 100; color: #999999; line-height: 26px;" class="padding-copy">
                                                        <c:choose>
														<c:when test="${like.p.location==1}">강남점</c:when>
														<c:when test="${like.p.location==2}">안양점</c:when>
														<c:when test="${like.p.location==3}">해운대점</c:when>
														<c:otherwise> - </c:otherwise>
													</c:choose></td>
                                                    </tr>
                                                      <tr>
                                                        <td bgcolor="#ffffff" align="left" style="padding-left: 20px; padding-right: 0px; font-family: Helvetica, Arial, sans-serif; font-size: 14px; letter-spacing: .5px; font-weight: 100; color: #999999; line-height: 26px;" class="padding-copy">
                                                  관심등록일 : ${like.like_date}</td>
                                                   
                                                  
                                                    <!-- BUTTON -->
                                                     <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mobile-button-container">
                                                                <tr>
                                                                    <td align="right" style="padding: 15px 0 0 20px;" class="cta">
                                                                        <table border="0" cellspacing="0" cellpadding="0" class="responsive-table">
                                                                            <tr>
                                                                                <td align="center">
                                                                                <br>
                                                                                
                                                                                    <a href="${pageContext.request.contextPath}/Adopt/AdoptForm?id=${like.pet_id}" target="_blank" style="font-size: 14px; font-family: Helvetica, Arial, sans-serif; font-weight: 100; color: #222222; text-decoration: none; display: inline-block;" class="cta-text">
                                                                                        입양신청하러가기<i class="fas fa-paw"></i>
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</c:forEach>
<button type="button" value="전체삭제" id="deleteAll"></button>
</c:if>
</form>
</body>

</html>
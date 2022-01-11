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
<h3>관심 목록</h3>
<form id="l" action="${pageContext.request.contextPath }/like/likeList" method="post">
<c:if test="${empty list }">
관심 친구가 없습니다.
</c:if>
<c:if test="${not empty list }">
<table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th>번호</th>
                                    <th>친구 이름</th>   
                                    <th>사진</th>                               
                                    <th>관심 등록일</th>
                                </tr>
                            </thead>
                            <c:forEach var="like" items="${list}">
                                <tr>
                                    <td>${like.like_num}</td>
                                    <td>
                                    
                                    <a href="${pageContext.request.contextPath}/Addpet/WaitingPerson?pet_id=${like.pet_id}">이름</a>
                                    </td>
                                    <td><img src="/AddPet/petImg?id=${like.pet_id}&petImgNum=1" width="200" height="200">
                                    </td>
                                    <td>${like.like_date}</td>
                             
                                    <td>
                                  	<button type="button" value="삭제" class="delete" itemid="${like.like_num }"><i class="fas fa-times" aria-hidden="true"></i></button>                
                                  	</td>
                                </tr>                                                         
                            </c:forEach>
                        </table><br>
                         		
                                	<button type="button" value="전체삭제" id="deleteAll"></button>
                                
</c:if>
</form>
</body>
</html>
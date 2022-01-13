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
<title>together - 관심목록</title>

</head>
<body data-target="#nino-navbar" data-spy="scroll"
	style="padding-top: 50px;" class="nino-fixed-nav">

	<script>
            if ("${sessionScope.id}" === "") {
                alert("로그인이 필요한 페이지입니다.");
                location.href = `${pageContext.request.contextPath}/Member/loginForm?refer=${"${location.href}"}`;
            }
            
       
            
            $(document).ready(function () {
                   //선택 삭제
                $(".delete").click(function () {
                    var pet = $(".delete").attr("pet_id");
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/Like/delete",
                        data: { like_num: pet },
                        success: function (response) {
                            alert("삭제되었습니다");
                            location.href = location.href;
                        },
                    });
                });
             
                //전체 삭제
                $("#deleteAll").click(function () {
                    var confirm_val = confirm("정말 삭제하시겠습니까?");
                    if (confirm_val) {
                        location.href = "/Like/likeDelAll";
                    } else {
                        //no
                        alert("전체삭제 취소");
                    }
                });
            });
        </script>
        
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
		

</body>
</html>

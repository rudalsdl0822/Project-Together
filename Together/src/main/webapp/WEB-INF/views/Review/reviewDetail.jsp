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
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 	$(document).ready(function () {
		$(".img").mouseover(function () {
			$("#bigImg").attr("src",this.src);
		});
	});
	 
	 
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
 
     </fieldset>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
</body>
</html>

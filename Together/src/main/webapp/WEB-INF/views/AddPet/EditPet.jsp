<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>Together | 입소 신청 내용</title>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".petImg").mouseover(function() {
				$("#bigImg").attr('src', this.src);
			});
			
			$("#delPet").click(function(){
				if(confirm("정말 삭제하시겠습니까? 삭제 시 작성된 신청서는 복구되지 않습니다")){
					alert("삭제가 완료되었습니다");
					$("#editPetForm").attr('action', '/Addpet/DeletePet');
					$("#editPetForm").submit();
				}else{
					alert("삭제가 취소되었습니다");
				}
			});
			
			$("#approPet").click(function(){
				if(confirm("입소승인 하시겠습니까?")){
					alert("입소승인이 완료되어 '입양대기'로 상태 변경되었습니다.");
					$("input[type=hidden][name=state]").val(2);
					$("#editPetForm").submit();
				}else{
					alert("입소승인이 취소되었습니다");
				}
			});
		});
	</script>
	
</head>
<body style="padding-top: 50px;" class="nino-fixed-nav">

	<section id="EditPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				입소 신청 내용
			</h2>

			<form id="editPetForm" action="${pageContext.request.contextPath}/Addpet/EditPet" method="post">
				<input type="hidden" name="id" value="${p.id}">
				
				<table style="margin-left: auto; margin-right: auto;" border="1" cellspacing="0">
					<tr>
						<td colspan="3">
							<img id="bigImg" src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" style="width:450px; height:auto;">
						</td>
					</tr>
					<tr>
						<td><img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=1" class="petImg" width="150" height="150"></td>
						<td><img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=2" class="petImg" width="150" height="150"></td>
						<td><img src="${pageContext.request.contextPath}/AddPet/petImg?id=${p.id}&petImgNum=3" class="petImg" width="150" height="150"></td>
					</tr>
				</table>
				
				<fieldset>
				    <div class="form-group">
				      <label for="editWriter_id">작성자</label>
				      <input type="text" class="form-control" id="editWriter_id"  name="writer_id" value="${p.writer_id}" readonly>
				    </div>
					<div class="form-group">
						<label for="editPetName">펫 이름</label>
						<input type="text" class="form-control" id="editPetName" name="name" value="${p.name}">
					</div>
					<div class="form-group">
						<label for="editPetBreed">품종</label>
						<input type="text" class="form-control" id="editPetBreed" name="breed" value="${p.breed}">
					</div>
					<fieldset class="form-group">
				      <legend>성별</legend>
				      <div class="form-check">
				        <label class="form-check-label">
				          <input type="radio" class="form-check-input" name="sex" id="sex" value="1" <c:if test="${p.sex==1}">checked</c:if>>
				          수컷
				          <input type="radio" class="form-check-input" name="sex" id="sex" value="2" <c:if test="${p.sex==2}">checked</c:if>>
				          암컷
				        </label>
				      </div>
				    </fieldset>
	      			<div class="form-group">
						<label for="editPetAge">나이</label>
						<input type="text" class="form-control" id="editPetAge" name="age" value="${p.age}">
					</div>
					<div class="form-group">
						<label for="editPetWeight">무게</label>
						<input type="text" class="form-control" id="editPetWeight" name="weight" value="${p.weight}">
					</div>
				    <label for="selectLocation">신청 보호소 지점</label>
				      <select class="form-control" name="location" id="selectLocation">
				        <option value="">-선택-</option>
				        <option value="1" <c:if test="${p.location==1}">selected</c:if>>강남점</option>
				        <option value="2" <c:if test="${p.location==2}">selected</c:if>>안양점</option>
				        <option value="3" <c:if test="${p.location==3}">selected</c:if>>해운대점</option>
				      </select>
		    		  <div class="form-group">
						<label for="editTextareaInfo">상세사항</label>
						<textarea class="form-control" id="editTextareaInfo" rows="5" name="info">${p.info}</textarea>
					  </div>
				</fieldset>

				<input type="hidden" name="state" value="1">
				
				<c:if test="${p.state==1 || sessionScope.type==2}">
					<div style="text-align: center;">
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit" name="edit" style="font-size: 13px; background: #4FC9DE; border-color: #FFFFFF;">수정</button>			
							<button class="btn btn-success" type="button" name="delete" id="delPet" style="font-size: 13px; background: #f38181; border-color: #FFFFFF;">삭제</button>
						</span>						
					</div>
				</c:if>				
				
				<br>

				<!-- 관리자일 경우 -->
				<c:if test="${sessionScope.type==2}">
					<div style="text-align: center;">
						<span class="input-group-btn">
							<button type="button" class="nino-btn" style="background: #95e1d3; border-color:#95e1d3;" name="approval" id="approPet">입소 승인</button>
							<button type="button" class="nino-btn" style="color:#95e1d3; background: #FFFFFF; border-color:#95e1d3;" name="rejection">입소 거절</button>
						</span>						
					</div>
				</c:if>

			</form>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
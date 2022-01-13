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
	<title>Together | 온라인 입소 신청 글쓰기</title>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script>
	var maxSize = 5 * 1024 * 1024; // file max size 5MB
	var fileSize; // 파일 사이즈
	
	$(document).ready(function(){
		
		$('#btn_submit').click(function(){
			// 필수 항목 유효성 체크
			if($('#inputPetName').val()==""){
				alert("Pet의 이름을 입력해주세요.");
				$('#inputPetName').focus();
				return false;
			} else if ($('#selectLocation').val()==""){
				alert("신청하려는 보호소 지점을 선택해주세요.");
				$('#selectLocation').focus();
				return false;
			} else if ($('#inputFile1').val() == ""){
				alert("(필수) 사진 이미지를 올려주세요.");
				$('#inputFile1').focus();
				return false;
			} else if ($('#inputFile2').val() == ""){
				alert("(필수) 사진 이미지를 올려주세요.");
				$('#inputFile2').focus();
				return false;
			} else if ($('#inputFile3').val() == ""){
				alert("(필수) 사진 이미지를 올려주세요.");
				$('#inputFile3').focus();
				return false;
			}
			$('#form_addPet').submit();
		});
		
		$('input[type=file]').change(function(){
			if ($(this).val != "" && $(this).val != null) {
				// 확장자 체크
				var ext = $(this).val().split(".").pop().toLowerCase();
				if ($.inArray(ext, ["gif","jpg","jpeg","png","hwp","pdf","doc","xls","xlsx","ppt","pptx","docx"])==-1){
					alert("이미지 파일(gif, jpg, jpeg, png 파일)만 업로드 가능합니다.");
			    	$(this).val("");
			        return;
				}
				
				// 용량 체크
				for (var i=0; i<this.files.length;i++){
					fileSize = this.files[i].size;
					if (fileSize>maxSize){
						alert("이미지 파일 용량은 5MB 미만으로 등록 가능합니다.");
						$(this).val("");
						return;
					}
				}
			}
		});
		
		$('#a_logout').click(function(){
			var flag = confirm("로그아웃 하시겠습니까?");
			if (flag){
				alert("로그아웃 되었습니다.");
				location.href="/Member/logout";
			} else {
				return;
			}
		});
		
	});
	</script>
	
	
</head>
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">
	
	<!-- 로그인 하지 않은 경우, 작성 불가하도록! -->
	
<c:if test="${empty sessionScope.id}">
<section id="onlineAddPet">
		<div class="container" style="text-align:center;">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				회원 로그인 해야 입소신청이 가능합니다
			</h2>
			<br>
			<button type="submit" class="nino-btn" style="background: #95e1d3;" onclick="location.href='/Member/loginForm'">로그인 하러 가기</button>
			
		</div>
</section>

</c:if>

<!-- 로그인 한 경우 -->

<c:if test="${not empty sessionScope.id}">
 <!-- container Form
    ================================================== -->
<section id="onlineAddPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				온라인 입소 신청
			</h2>
s
<form class="form-signin" action="${pageContext.request.contextPath}/AddPet" id="form_addPet" method="post" enctype="multipart/form-data">
  <fieldset>
  <input type="hidden" name="writer_id" value="${sessionScope.id}"> 
    <div class="form-group">
      <label for="inputPetName">펫 이름</label><span class="badge badge-pill badge-info">필수</span>
      <input type="text" class="form-control" id="inputPetName" name="name" placeholder="펫의 이름을 적어주세요.">
    </div>
    <div class="form-group">
      <label for="inputBreed">품종</label> <!-- null -->
      <input type="text" class="form-control" id="inputBreed" name= "breed" placeholder="품종을 적어주세요. ex)말티즈 ">
    </div>
    <fieldset class="form-group">
      <label for="inputSex">성별</label><span class="badge badge-pill badge-info">필수</span>
	  <div class="form-check">
	      <input type="radio" class="form-check-input"  name="sex" id="sex" value="1" checked>수컷
	  </div>
	  <div class="form-check">
	      <input type="radio" class="form-check-input" name="sex" id="sex" value="2">암컷
	  </div>
    </fieldset>
    <div class="form-group">
      <label for="inputAge">나이</label> <!-- null -->
      <input type="text" class="form-control" id="inputAge" name="age" placeholder="나이를 숫자로 적어주세요.">
    </div>
     <div class="form-group">
      <label for="inputAge">무게</label> <!-- null -->
      <input type="text" class="form-control" id="inputWeight" name="weight" placeholder="무게를 숫자로 적어주세요.">
    </div>
    <div class="form-group">
      <label for="selectLocation">신청 보호소 지점</label><span class="badge badge-pill badge-info">필수</span>
      <select class="form-control" name="location" id="selectLocation">
        <option value="">-선택-</option>
        <option value="1">강남점</option>
        <option value="2">안양점</option>
        <option value="3">해운대점</option>
      </select>
    </div>
    <div class="form-group">
      <label for="textareaInfo">상세사항 (성격 등 특징들을 적어주세요.)</label> <!-- null -->
      <textarea class="form-control" id="textareaInfo" name="info" rows="5" style="resize: none;"></textarea>
    </div>
    <hr>
    <div class="form-group">
    	<label for="inputFile">펫 이미지 첨부</label><br>
      <label for="inputFile1">사진 파일 1</label><span class="badge badge-pill badge-info">필수</span>
      <input type="file" class="form-control-file" name="file1" id="inputFile1" accept="image/*"  aria-describedby="fileHelp">
   	</div>
   	 <div class="form-group">
      <label for="inputFile2">사진 파일 2</label><span class="badge badge-pill badge-info">필수</span>
      <input type="file" class="form-control-file" name="file2" id="inputFile2" accept="image/*" aria-describedby="fileHelp">
    </div>
     <div class="form-group">
      <label for="inputFile3">사진 파일 3</label><span class="badge badge-pill badge-info">필수</span>
      <input type="file" class="form-control-file" name="file3" id="inputFile3" accept="image/*" aria-describedby="fileHelp">
    </div>
     <small id="emailHelp" class="form-text text-muted">이미지 파일은 5MB 미만의 용량 파일만 등록 가능하며, 3가지 이미지를 필수로 등록해야합니다.</small>
    <hr>
    <button type="submit" class="nino-btn" style="background: #95e1d3;" id="btn_submit">온라인 입소 신청</button>
     </fieldset>
</form>
</div>
</section>

</c:if>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
</body>
</html>

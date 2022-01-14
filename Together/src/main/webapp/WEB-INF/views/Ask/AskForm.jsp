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
<title>Together | 1:1문의하기</title>

<style>
.breadcrumb-item>a {
	color: #777;
}

.breadcrumb-item>a:hover {
	color: #337ab7;
}

#btnSubmit > #btn_submit {
 	background: #95e1d3
}

#btnSubmit > #btn_submit:hover {
	background: #00ced1;
}
</style>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	var maxSize = 5 * 1024 * 1024; // file max size 5MB
	var fileSize; // 파일 사이즈
	
	$(document).ready(function(){
		
		$('#btn_submit').click(function(){
			// 필수 항목 유효성 체크
			if($('#inputTitle').val()==""){
				alert("문의 제목을 입력해주세요.");
				$('#inputTitle').focus();
				return false;
			} else if ($('#selectCategory').val()==""){
				alert("문의 유형을 선택해주세요.");
				$('#selectCategory').focus();
				return false;
			} else if ($('#textareaContent').val()==""){
				alert("문의 내용을 작성해주세요.");
				$('#textareaContent').focus();
				return false;
			} 
			// 마지막 확인
			var flag = confirm("문의글을 등록하시겠습니까?");
			if (!flag){
				return;
			} else {
				alert("문의글이 정상적으로 등록되었습니다!");
				$('#form_addPet').submit();
			}
			
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
		
	});
	</script>
</head>


<body data-target="#nino-navbar" data-spy="scroll"
	style="padding-top: 50px;" class="nino-fixed-nav">

	<!-- 로그인 한 경우 -->

	<c:if test="${not empty sessionScope.id}">
		<!-- container Form
    ================================================== -->
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/index">홈</a></li>
				<li class="breadcrumb-item"><a href="/Member/MyPage">마이페이지</a></li>
				<li class="breadcrumb-item active">1:1문의하기</li>
			</ol>
		</div>
		<section id="ask">
			<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Together</span> 1:1 문의하기
				</h2>
				<button type="submit" class="nino-btn" id="btn"
						style="background: #95e1d3;"
						onclick="location.href='/Ask/AskList'">문의내역 보기</button>
						
				<form class="form-Ask" action="/Ask/AddAsk" id="form_addAsk"
					method="post" enctype="multipart/form-data">
					<fieldset>
						<input type="hidden" name="writer_id" value="${sessionScope.id}">
						<div class="form-group">
							<label for="inputAskTitle">제목</label><span
								class="badge badge-pill badge-info">필수</span> <input type="text"
								class="form-control" id="inputTitle" name="title"
								placeholder="문의 글 제목">
						</div>
						<div class="form-group">
							<label for="selectCategory">문의 유형</label><span
								class="badge badge-pill badge-info">필수</span> <select
								class="form-control" name="category" id="selectCategory">
								<option value="">-선택-</option>
								<option value="1">1. 회원 정보</option>
								<option value="2">2. 입양 관련</option>
								<option value="3">3. 입소 관련</option>
								<option value="4">4. 사이트 관련</option>
								<option value="5">5. 후원 관련</option>
							</select>
						</div>
						<div class="form-group">
							<label for="textareaContent">문의 내용</label><span
								class="badge badge-pill badge-info">필수</span>
							<textarea class="form-control" id="textareaContent"
								name="content" rows="5" placeholder="문의 내용을 적어주세요" style="resize: none;"></textarea>
						</div>
						 <hr>
    <div class="form-group">
    	<label for="inputFile">사진 첨부 (선택 사항)</label><br>
      <label for="inputFile1">사진 파일 1</label>
      <input type="file" class="form-control-file" name="file1" id="inputFile1" accept="image/*"  aria-describedby="fileHelp">
   	</div>
   	 <div class="form-group">
      <label for="inputFile2">사진 파일 2</label>
      <input type="file" class="form-control-file" name="file2" id="inputFile2" accept="image/*" aria-describedby="fileHelp">
    </div>
     <div class="form-group">
      <label for="inputFile3">사진 파일 3</label>
      <input type="file" class="form-control-file" name="file3" id="inputFile3" accept="image/*" aria-describedby="fileHelp">
    </div>
     <small id="imageHelp" class="form-text text-muted">이미지 파일은 5MB 미만의 용량 파일만 등록 가능하며, 최대 3가지 이미지를 등록할 수 있습니다.</small>
    <hr>
						<div id="btnSubmit" style="text-align: center;">
							<button type="submit" class="nino-btn"
								 id="btn_submit">문의 글 등록</button>
						</div>
					</fieldset>
				</form>
			</div>
		</section>

	</c:if>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
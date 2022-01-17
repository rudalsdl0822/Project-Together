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
	<title>Together | 후기작성</title>
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			
			<script>
			var maxSize = 5 * 1024 * 1024; // file max size 5MB
			var fileSize; // 파일 사이즈
			
			$(document).ready(function(){
				
				$('#btn_submit').click(function(){
					// 필수 항목 유효성 체크
					if($('#title').val()==""){
						alert("제목을 입력해주세요.");
						$('#title').focus();
						return false;
					} else if ($('#location').val()==""){
						alert("보호소 지점을 선택해주세요.");
						$('#location').focus();
						return false;
					} else if ($('#content').val()==""){
						alert("내용을 선택해주세요.");
						$('#content').focus();
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
					$('#form_addReview').submit();
				});
				
				$('input[type=file]').change(function(){
					if ($(this).val != "" && $(this).val != null) {
						// 확장자 체크
						var ext = $(this).val().split(".").pop().toLowerCase();
						if ($.inArray(ext, ["gif","jpg","jpeg","png"])==-1){
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
<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">

 <!-- container Form
    ================================================== -->
<section id="onlineAddPet">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">Together</span>
				후기 작성
			</h2>
<form id="form_addReview" class="form-signin" action="${pageContext.request.contextPath}/Review/review" method="post" enctype="multipart/form-data">
  <fieldset>
  
  <div class="form-group">
      <label for="inputPetName">작성자</label>
      <input type="text" class="form-control" id="w_writer"  name="w_writer" value="${sessionScope.nickname }" readonly="readonly">
    </div>
  
    <div class="form-group">
      <label for="inputPetName">제목</label>
      <input type="text" class="form-control" id="title"  name="title" id="title" placeholder="제목을 입력하세요.">
    </div>
    
    <div class="form-group">
    	 <label for="selectLocation">이용한 보호소 지점</label>
      	<select class="form-control" id="location" name="location">
       		<option value="">-선택-</option>
        	<option value="1">강남점</option>
        	<option value="2">안양점</option>
        	<option value="3">해운대점</option>
      </select>
    </div>
    
    <div class="form-group">
      <label for="inputBreed">내용</label>
      <textarea class="form-control" id="content" name="content" placeholder="내용을 입력하세요." rows="10"></textarea>
    </div>
 
    <hr>
    <div class="form-group">
      <label for="inputFile1">사진 파일 1</label>
      <input type="file" class="form-control-file" name="file1" id="inputFile1" aria-describedby="fileHelp">
    </div>
    <div class="form-group">
      <label for="inputFile2">사진 파일 2</label>
      <input type="file" class="form-control-file" name="file2" id="inputFile2" aria-describedby="fileHelp">
    </div>
    <div class="form-group">
      <label for="inputFile3">사진 파일 3</label>
      <input type="file" class="form-control-file" name="file3" id="inputFile3" aria-describedby="fileHelp">
    </div>
    <hr>
    <button type="submit" id="btn_submit" class="nino-btn" style="background: #95e1d3;" name="">저장</button>
     </fieldset>
</form>
</div>
</section>
  
<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
		
</body>
</html>

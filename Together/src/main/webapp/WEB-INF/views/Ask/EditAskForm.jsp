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
<title>Together | 1:1문의수정</title>

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
	/* var maxSize = 5 * 1024 * 1024; // file max size 5MB
	var fileSize; // 파일 사이즈 */
	var flag;
	
	$(document).ready(function(){
		
		$(document).on("click","#btn_submit",function(){
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
			flag = confirm("문의글을 수정하시겠습니까?");
			if (!flag){
				return false;
			} else {
				alert("문의글이 정상적으로 수정되었습니다!");
				$('#form_updateAsk').submit();
			}
			
		});
		
		
		$(document).on("click","#btn_delete",function(){
			flag = confirm("정말 문의글을 삭제하시겠습니까?");
			if (flag){
				$.post("/Ask/DelAsk",
						{
							num : ${ask.num}
						}).done(function(json){
							alert("문의가 삭제되었습니다.");
							location.href="/Ask/AskList";
						});
				} else {
					return false;
				}
			})
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
						
				<form class="form-Ask" action="/Ask/updateAsk" id="form_updateAsk"
					method="post">
					<fieldset>
						<input type="hidden" name="num" value="${ask.num }">
						<input type="hidden" name="writer_id" value="${ask.writer_id}">
						<div class="form-group">
							<label for="inputAskTitle">제목</label><span
								class="badge badge-pill badge-info">필수</span> <input type="text"
								class="form-control" id="inputTitle" name="title"
								placeholder="문의 글 제목" value="${ask.title}">
						</div>
						<div class="form-group">
						
						
						
							<label for="selectCategory">문의 유형</label><span
								class="badge badge-pill badge-info">필수</span> <select
								class="form-control" name="category" id="selectCategory">
								<option value="">-선택-</option>
								<option value="1" <c:if test="${ask.category==1}">selected</c:if>>1. 회원 정보</option>
								<option value="2" <c:if test="${ask.category==2}">selected</c:if>>2. 입양 관련</option>
								<option value="3" <c:if test="${ask.category==3}">selected</c:if>>3. 입소 관련</option>
								<option value="4" <c:if test="${ask.category==4}">selected</c:if>>4. 사이트 관련</option>
								<option value="5" <c:if test="${ask.category==5}">selected</c:if>>5. 기타 문의</option>
							</select>
						</div>
						<div class="form-group">
							<label for="textareaContent">문의 내용</label><span
								class="badge badge-pill badge-info">필수</span>
							<textarea class="form-control" id="textareaContent"
								name="content" rows="5" placeholder="문의 내용을 적어주세요" style="resize: none;">${ask.content}</textarea>
						</div>
						 <hr>
   <!--  <div class="form-group">
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
    <hr> -->
						<div id="btnSubmit" style="text-align: center;">
							<button type="submit" class="nino-btn"
								 id="btn_submit">문의 글 수정</button>
								 <button type="button" class="nino-btn"
								 id="btn_delete">삭제</button>
						</div>
					</fieldset>
				</form>
			</div>
		</section>

	</c:if>


	<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>
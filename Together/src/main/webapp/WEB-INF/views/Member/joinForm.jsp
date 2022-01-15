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
	<title>Together | 회원가입</title>
	
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	
	$(document).ready(function () {
		
		
		$("#idCheck").click(function () {
			$.post("/Member/idCheck",{id:$("#id").val()})
			.done(function (data) {
				$("#idResult").text(data);	
			});
		});
		
		$("#nicknameCheck").click(function () {
			$.post("/Member/nicknameCheck",{nickname:$("#nickname").val()})
			.done(function (data) {
				$("#nicknameResult").text(data);	
			});
		});
		
		$("#join").click(function () {
			
			
			var f= document.joinForm;
			var arrRadio = document.getElementsByName("gender");
			

			if(f.id.value==""){
				alert("아이디를 입력하세요.");
				f.id.focus();
				return false;
			}else if(f.pwd.value==""){
				alert("비밀번호를 입력하세요.");
				f.pwd.focus();
				return false;
			}else if(f.pwd2.value==""){
				alert("비밀번호 확인을 입력하세요.");
				f.pwd2.focus();
				return false;
			}else if(f.nickname.value==""){
				alert("닉네임을 입력하세요.");
				f.nickname.focus();
				return false;
			}else if(f.name.value==""){
				alert("성명을 입력하세요.");
				f.name.focus();
				return false;
			}else if(!arrRadio[0].checked && !arrRadio[1].checked){
				alert("성별을 선택하세요.");
				return false;
			}else if(f.phone.value==""){
				alert("휴대폰 번호를 입력하세요.");
				f.phone.focus();
				return false;
			}else if(f.address.value==""){
				alert("주소를 입력하세요.");
				f.address.focus();
				return false;
			}else if(f.email.value==""){
				alert("이메일을 입력하세요.");
				f.email.focus();
				return false;
			}else if(f.type.value==""){
				alert("회원유형을 선택하세요.");
				return false;
			}
			
			if(f.pwd.value != f.pwd2.value){
				alert("두 비밀번호가 서로 일치하지 않습니다.");
				return false;
			}
			
			if($("#idResult").text().trim() =="사용 가능한 아이디 입니다."){
				if($("#nicknameResult").text().trim() =="사용 가능한 닉네임 입니다."){
					$("form").submit();
				}else{
					alert("아이디 혹은 닉네임 중복체크 후 이용가능합니다.");	
				} 
			}else{
				alert("아이디 혹은 닉네임 중복체크 후 이용가능합니다.");	
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
				회원가입
			</h2>
<form name="joinForm" class="form-signin" action="${pageContext.request.contextPath}/Member/join" method="post">
  <fieldset>
  <legend>회원정보</legend>
    <div class="form-group">
      <label for="inputPetName">아이디 </label>
      <input type="text" class="form-control" id="id"  name="id" placeholder="아이디를 입력하세요.">
      <input type="button" value="중복확인" id="idCheck"
    style="position: relative;
    		width:100px;
			background-color: # D3D3D3;
			border-radius: 4px;
			color:black;
			line-height: 25px;
			-webkit-transition: none;
			transition: none;
			text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
			margin-top: 3px; "><span id="idResult" style="color: red;"></span>
    </div>
    <div class="form-group">
      <label for="inputBreed">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name= "pwd" placeholder="비밀번호를 입력하세요.">
    </div>
    <div class="form-group">
      <label for="inputBreed">비밀번호 확인</label>
      <input type="password" class="form-control" id="pwd2" name= "pwd2" placeholder="비밀번호 확인">
    </div>   
    <div class="form-group">
      <label for="inputBreed">닉네임</label>
      <input type="text" class="form-control" id="nickname" name= "nickname" placeholder="닉네임을 입력하세요.">
      <input type="button" value="중복확인" id="nicknameCheck"
    style="position: relative;
    		width:100px;
			background-color: # D3D3D3;
			border-radius: 4px;
			color:black;
			line-height: 25px;
			-webkit-transition: none;
			transition: none;
			text-shadow: 0 1px 1px rgba(0, 0, 0, .3);
			margin-top: 3px; "><span id="nicknameResult" style="color: red;"></span>
    </div>
    
    <fieldset class="form-group">
      <legend>개인정보</legend>
      
     <div class="form-group">
      <label for="inputAge">성명</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="성명을 입력하세요.">
    </div>
    
    
      
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" id="gender" value="1" checked>
          남성
        </label>
      </div>
      
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" id="gender" value="2">
          여성
        </label>
      </div>
      
      <div class="form-group">
      <label for="inputAge">휴대폰번호</label>
      <input type="text" class="form-control" id="phone" name="phone" placeholder="-없이 입력하세요.">
    </div>
    
    <div class="form-group">
      <label for="inputAge">주소</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="주소를 입력하세요.">
    </div>
    
    <div class="form-group">
      <label for="inputAge">이메일</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
    </div>
      </fieldset>
    
       <legend>회원유형</legend>
     
    <div class="form-group">
      <label for="selectLocation">회원 유형 선택</label>
      <select class="form-control" id="type" name="type">
        <option value="">-선택-</option>
        <option value="1">고객</option>
        <option value="2">관리자</option>
      </select>
    </div>
    
    
    <hr>
    <button type="reset" class="nino-btn" name=""> 초기화 </button>
    <button type="button" class="nino-btn" style="background: #95e1d3;" name="" id="join">회원가입</button>
     </fieldset>
</form>
</div>
</section>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>  
		
</body>
</html>

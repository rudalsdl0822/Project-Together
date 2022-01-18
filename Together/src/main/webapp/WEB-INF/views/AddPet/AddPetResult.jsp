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
	<title>Together | 입소신청 완료</title>
	
	<style>
		#btn_addPetList{
		background: #95e1d3;
		}
		#btn_addPetList:hover{
		background: #00ced1;
		}
		</style>
		
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
	$(document).ready(function(){
		$('#btn_addPetList').click(function(){
			location.href="/AddPet/PetAllList";
		});
	});
	
		</script>
		
	</head>
	<body data-target="#nino-navbar" data-spy="scroll" style="padding-top: 50px;" class="nino-fixed-nav">
	
	<section id="onlineAddPet">
			<div class="container">
				<h2 class="nino-sectionHeading">
					<span class="nino-subHeading">Together</span>
					온라인 입소 신청 완료되었습니다 !
				</h2>
				<div style="text-align:center;">
					<input type="button" class="nino-btn" style="background: #95e1d3;" id="btn_addPetList" value="입소 신청내역 확인"/>
				</div>
		
    
</div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>  

</body>
</html>

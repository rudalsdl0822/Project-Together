<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
	<meta name="copyright" content="ninodezign.com"> 
	<title>입소신청 리스트</title>
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/template.css" />
	
</head>
<body data-target="#nino-navbar" data-spy="scroll">

<!-- 이미지 경로는 우선 기존과 동일하게 함 -->
<!-- 폰트를 기존과 동일하게 가면 한글로 바뀌었을 때 많이 다르게 나옴 폰트 변경 불가시, 첫번째 것으로 고 -->
<!-- 승인버튼 눌렀을 때 state==2로 해야함 / form 태그 넣어야함 -->

    <section class="nino-testimonial bg-white">
    	<div class="container">
    		<div class="nino-testimonialSlider">
				<ul>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<a href="#">
									<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/images/testimonial/dog1.jpg" alt="">
								</a>
							</div>
							<div>
								<p class="quote">이름 : 춘식</p>  <!--  기존 span 태그에서 p태그로 변경(name) -->
								<p class="q2">나이 : 2세</p>  <!-- 기존 p태그 클래스명 변경 -->
								<p class="q2">품종 : 말티즈</p>
								<p class="q2">성별 : 암컷</p>
								<p class="q2">보호소 지점 : 안양점</p>
								<button type="submit" class="btn btn-primary" name="approval">승인</button>
								<button type="button" class="btn btn-primary" name="rejection">거절</button>
							</div>
						</div>
					</li>
					<hr>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<a href="#">
									<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/images/testimonial/dog2.jpg" alt="">
								</a>
							</div>
							<div>
								<span class="name">이름 : 라이언</span>
								<p class="quote">나이 : 3세</p>
								<p class="quote">품종 : ㅇㅇㅇ</p>
								<p class="quote">성별 : 수컷</p>
								<p class="location">보호소 지점 : 강남점</p>
								<button type="submit" class="btn btn-primary" name="approval">승인</button>
								<button type="button" class="btn btn-primary" name="rejection">거절</button>
							</div>
						</div>
					</li>
					<hr>
					<li>
						<div layout="row" class="verticalCenter">
							<div class="nino-avatar fsr">
								<a href="#">
									<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/resources/images/testimonial/dog3.jpg" alt="">
								</a>
							</div>
							<div>
								<span class="name">이름 : 콘</span>
								<p class="quote">나이 : 4세</p>
								<p class="quote">품종 : ㅁㅁㅁ</p>
								<p class="quote">성별 : 수컷</p>
								<p class="quote">보호소 지점 : 해운대점</p>
								<button type="submit" class="btn btn-primary" name="approval">승인</button>
								<button type="button" class="btn btn-primary" name="rejection">거절</button>
							</div>
						</div>
					</li>
					<hr>
				</ul>
				
				<c:if test="${not empty list}">
					<ul>
						<c:forEach var="p" items="${list}">
							<li>
								<div layout="row" class="verticalCenter">
									<div class="nino-avatar fsr">
										<a href="${pageContext.request.contextPath}/AddPet/AddPetList?id=${p.id}">
											<img class="img-circle img-thumbnail" src="${pageContext.request.contextPath}/AddPet/imgList?id=${p.id}" alt="">
										</a>
									</div>
									<div>
									<span class="name">이름 : ${p.name}</span>
									<p class="quote">품종 : ${p.breed}</p>
									<p class="quote">나이 : ${p.age}</p>
									<p class="quote">성별 : ${p.sex}</p>
									<p class="quote">지점 : ${p.location}</p>
									<button type="submit" class="btn btn-primary" name="approval">승인</button>
									<button type="button" class="btn btn-primary" name="rejection">거절</button>
								</div>
								</div>
							</li>
						</c:forEach>
						<hr>
					</ul>
				</c:if>
				
				<c:if test="${empty list}">
				등록된 입소신청서가 없습니다
				</c:if>
				
			</div>
    	</div>
    </section>
		
		<!-- sadaRe > product > importList.jsp 참고 -->
		<!-- 
		<div class="list-group addPetList">
			<c:forEach var="p" items="${list}">
				<a href="${pageContext.request.contextPath}/AddPet/AddPetList?id=${p.id}">
					<div class="petInfo row g-2">
						<div class="img col-md-4 align-middle">
							<img class="petImg img-fluid w-100" src="${pageContext.request.contextPath}/AddPet/imgList?id=${p.id}">
						</div>
						<div class="petDetail col-md-8 row g-2 px-3">
							<div class="petName">
								<h2 class="name display-3">
									${p.name}
									<button type="submit" class="btn btn-primary" name="approval">승인</button>
									<button type="button" class="btn btn-primary" name="rejection">거절</button>
								</h2>
							</div>
							<div class="age">${p.age}</div>
							<div class="sex">${p.sex}</div>
							<div class="location">${p.location}</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		
		<c:if test="${empty list}">
		등록된 입소신청서가 없습니다
		</c:if>
	</div>
	 -->
    
</body>
</html>
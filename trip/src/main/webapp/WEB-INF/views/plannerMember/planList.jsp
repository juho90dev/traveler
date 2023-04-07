<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage1.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
		<div class="container">
			<div class="breadcrumb-hero">
				<h2>${loginMember.userId}님의 플랜 리스트</h2>
				<p>플랜 리스트를 보여줘!</p>
			</div>
		</div>
	</div>
	<div class="container">
		<ol>
			<li><a href="/">Home</a></li>
			<li><a href="${path }/planList">플랜</li>
		</ol>
	</div>
</section><!-- End Breadcrumbs -->


<section id="services" class="services ">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-airplane" style="color: #ff689b;"></i></div>
					<h4 class="title"><a href="">서울에서 해남까지</a></h4>
					<p class="description">우리 모두 땅끝마을로 떠나봅시다.</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-book" style="color: #e9bf06;"></i></div>
						<h4 class="title"><a href="">제주도의 푸른밤</a></h4>
						<p class="description">떠나요 둘이서 떠나요 둘이서 모든 걸 훌훌 버리고 </p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="icon-box">
						<div class="icon"><i class="bi bi-card-checklist" style="color: #3fcdc7;"></i></div>
						<h4 class="title"><a href="">여행을 떠나요</a></h4>
						<p class="description">푸른 언덕에 배낭을 메고 황금빛 태양</p>
					</div>
				</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-binoculars" style="color:#41cf2e;"></i></div>
					<h4 class="title"><a href="">고속도로 로망스</a></h4>
					<p class="description">창을 열어 소리쳐봐 우리는 바다로 향</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-globe" style="color: #d6ff22;"></i></div>
					<h4 class="title"><a href="">너와 나 단 둘이서 떠나가는 여행</a></h4>
					<p class="description">난 너와 같은 차를 타고 난 너와 같은 곳을 보고</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-clock" style="color: #4680ff;"></i></div>
					<h4 class="title"><a href="">끝없이 이어진 저 철길 따라</a></h4>
					<p class="description">Guitar를 메고 떠나는 여행길</p>
				</div>
			</div>
		</div>
	</div>
</section><!-- End Services Section -->

   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
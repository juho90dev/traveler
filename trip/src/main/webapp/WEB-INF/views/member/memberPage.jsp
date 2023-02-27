<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage1.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
		<div class="container">
			<div class="breadcrumb-hero">
            	<h2>회원 페이지</h2>
            	<p>다른 회원님의 정보를 알아보세요.</p>
			</div>
		</div>
	</div>
 	<div class="container">
		<ol>
			<li><a href="/">Home</a></li>
			<li><a href="${path }/memberPage/${member.userId}">${member.userId }</a></li>
		</ol>
	</div>
</section><!-- End Breadcrumbs -->


<section id="blog" class="blog">
	<div class="container" data-aos="fade-up">
		<div class="row">
			<div class="col-lg-8 entries">
				<article class="entry entry-single">
					<div class="container">
						<div class="box1">
							<div class="box2">
								<h3>${member.userId}</h3>
								<br>
								<div class="image">
									<c:if test="${member.image ne null }">
										<img src="/resources/upload/profile/${member.image }" height="300" width="300"  alt="">
									</c:if>
									<c:if test="${member.image eq null }">
										<img src="/resources/img/team/team-3.jpg" class="img-fluid" height="300" width="300"  alt="">
									</c:if>
									<%-- <img src="${path }/resources/upload/profile/${member.image }" width='300' height='300' alt="" class="profile" > --%>
								</div>
								<br>
								<br> <br> <br> <br>
								<br>
								<hr>
								<h4>자기소개</h4>
								<br>
								${member.introduce }
								<hr>
								<br>
								<h4>관심지역</h4>
								<br>
								${member.city }
								<hr>
								<br>
								<h4>등급</h4>
								<br>
								${member.grade }
								<hr>
								<br>
								<h4>가입일</h4>
								<br>
								${member.enrollDate }
								<hr>
							</div>
						</div>
					</div>
				</article><!-- End blog entry -->
			</div><!-- End blog entries list -->
			<div class="col-lg-4">
				<div class="sidebar">
					<h3 class="sidebar-title">Categories</h3>
					<div class="sidebar-item categories">
		                <ul>
		                  <li><a href="${path }/planList">${member.userId }님의 플랜 </a></li>
		                  <li><a href="/request/${member.userId}">${member.userId }님에게 플랜 요청하기</a></li>
		                  <li><a href="#">${member.userId }님을 신고하기 <span>(8)</span></a></li>
		                </ul>
					</div><!-- End sidebar categories-->
				</div><!-- End sidebar recent posts-->
			</div><!-- End sidebar -->
		</div><!-- End blog sidebar -->
	</div>
</section><!-- End Blog Single Section -->
<style>

.image {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
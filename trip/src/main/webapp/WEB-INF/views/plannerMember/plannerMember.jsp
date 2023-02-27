<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
		<div class="container">
			<div class="breadcrumb-hero">
				<h2>플래너 회원</h2>
				<p>다양한 회원과 여행을 계획해보세요!</p>
			</div>
		</div>
	</div>
	<div class="container">
		<ol>
			<li><a href="/">Home</a></li>
			<li><a href="${Path}/plannerMember">플래너 회원</a></li>
		</ol>
	</div>
</section>

<!-- ======= Team Section ======= -->
<section id="team" class="team">
	<div class="container">
		<div class="row">
			<c:if test="${not empty member }">
				<c:forEach items="${member}" var="m">
					<div class="col-lg-4 col-md-6 d-flex align-items-stretch">
						<div class="member" data-aos="fade-up">
							<div class="member-img">
								<c:if test="${m.image ne null }">
									<img  src="resources/upload/profile/${m.image }" height="300" width="300"  alt="">
								</c:if>
								<c:if test="${m.image eq null }">
									<img src="resources/img/team/team-3.jpg" class="img-fluid" height="300" width="300"  alt="">
								</c:if>
								<div class="social">
									<a href=""><i class="bi bi-chat"></i></a>
									<a href=""><i  class="bi bi-emoji-smile"></i></a>
									<a href="${path }/memberPage/${m.userId}"><i class="bi bi-person-check"></i></a>
								</div>
							</div>
							<div class="member-info">
								<h4><c:out value="${m.userId}"/></h4>
								<span><c:out value="${m.introduce}"/></span>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
</section><!-- End Team Section -->



<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- ======= Footer ======= -->
 
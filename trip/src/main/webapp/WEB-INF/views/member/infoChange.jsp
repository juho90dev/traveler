<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 헤더 적용 -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
		<div class="container">
			<div class="breadcrumb-hero">
				<h2>내 정보 수정</h2>
			</div>
		</div>
	</div>
	<div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/infoChange">내 정보 수정</a></li>
        </ol>
      </div>
</section><!-- End Breadcrumbs -->
<section id="contact" class="contact">
      <div class="container">

        <div class="row mt-5">

          <div class="col-lg-8 mt-5 mt-lg-0" data-aos="fade-left">

            <form action="${pageContext.request.contextPath }/updateInfo" method="post" class="php-email-form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input name="userId" id="userId" type="text" value="<c:out value="${loginMember.userId}"/>"  readonly class="form-control">
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="password" class="form-control" id="password" placeholder="password" required>
                 </div>
               </div>
               <div class="row">
                <div class="col-md-6 form-group">
                   <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
               </div>
               <div class="row">
                <div class="col-md-6 form-group">
                   <input type="text" class="form-control" name="phone" id="phone" placeholder="phone" required>
                </div>
               </div>
               <div class="row">
                <div class="col-md-6 form-group">
                   <input type="text" class="form-control" name="city" id="city"  placeholder="도(ex. 서울/경기)">
                </div>
                <div class="col-md-6 form-group">
                   <input type="text" class="form-control" name="country" id="country"  placeholder="시(ex. 수원/용인)">
                </div>
               </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="introduce" rows="5" id="introduce"  placeholder="자기 소개" required></textarea>
              </div>
				<div class="col-lg-10 col-sm-9">
					<p><input type=file name="mb_icon2"></p>
				</div>
              <div class="text-center"><button type="submit" class="btn btn-primary">정보 수정</button></div>
            </form>

          </div>

        </div>

      </div>

    </section><!-- End Contact Section -->


<!--푸터 적용  -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
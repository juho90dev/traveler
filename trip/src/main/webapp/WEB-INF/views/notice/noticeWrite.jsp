<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>공지사항</h2>
            <p>※ 중요 내용을 안내해드립니다.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/notice">공지 게시판</a></li>
        </ol>
      </div>
    </section>
<section class="py-5 my-5">
	<div class="container">
		<div class="bg-white shadow rounded-lg d-block d-sm-flex">
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<form action="insertNotice" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>제목</label>
								  	<input type="text" class="form-control" name="noticeTitle" id="noticeTitle" value="[공지사항] " required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									  <input name="writer" id="writer" type="hidden" value="<c:out value="${loginMember.userId}"/>"  readonly class="form-control">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
								  	<label>내용</label>
									<textarea class="form-control" name="noticeContent" rows="5" id="noticeContent" required></textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<input  type="file" name="img">
								</div>
							</div>
						</div>
						<div>
							<button class="btn btn-primary">작성</button>
							<button type="reset" class="btn btn-primary" value="reset">재설정</button>
	                    	<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/notice')">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<style>
body {
	background: #f9f9f9;
	font-family: "Roboto", sans-serif;
}

.shadow {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
}

.profile-tab-nav {
	min-width: 250px;
}

.tab-content {
	flex: 1;
}

.form-group {
	margin-bottom: 1.5rem;
}

.nav-pills a.nav-link {
	padding: 15px 20px;
	border-bottom: 1px solid #ddd;
	border-radius: 0;
	color: #333;
}
.nav-pills a.nav-link i {
	width: 20px;
}

.img-circle img {
	height: 100px;
	width: 100px;
	border-radius: 100%;
	border: 5px solid #fff;
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
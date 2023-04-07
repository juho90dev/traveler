<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>신고 글 작성</h2>
            <p>허위로 신고할 경우 불이익을 당할 수 있습니다. 신중히 해주세요.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/report">신고 게시판</a></li>
        </ol>
      </div>
    </section>
<section class="py-5 my-5">
	<div class="container">
		<div class="bg-white shadow rounded-lg d-block d-sm-flex">
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<form action="${Path }/insertReport" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
			                        <label for="id">작성자ID</label>
			                        <input name="writer" id="writer" type="text" value="<c:out value="${loginMember.userId }"/>" readonly class="form-control">
		                      	</div>
							</div>
							<div class="col-md-6">	
								<div class="form-group">
									<label for="phone">신고 ID</label>
	                        		<input name="targetId" id="inquiryEmail" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
		                        	<label for="title">제목</label>
		                        	<input name="inquiryTitle" id="inquiryTitle" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="title">신고 유형</label>
									<select name="inquiryType" class="form-control">
                          				<option selected>선택</option>
                          				<option value="욕설">욕설</option>
                          				<option value="채팅">채팅</option>
                          				<option value="정치">정치</option>
                          				<option value="사기">사기</option>
                          				<option value="기타">기타</option>
                        			</select>
                        		</div>
                        	</div>
							<div class="col-md-12">
								<div class="form-group">
			                        <label for="inquiryContent">신고 내용</label>
			                        <textarea name="inquiryContent" id="inquiryContent" class="form-control"></textarea>
								</div>
                    		</div>
		                    <div class="col-md-6">
								<div class="form-group">
									<input  type="file" name="img">
								</div>
							</div>
						</div>
                  		<div class="row">
							<div class="col-md-12 text-right">
	                      		<button type="submit" class="btn btn-primary">등록</button>
	                      		<button type="reset" class="btn btn-primary">재설정</button>
	                      		<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/reportList')">취소</button>
							</div>
                    	</div>
                  <!-- /.row-->
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
 
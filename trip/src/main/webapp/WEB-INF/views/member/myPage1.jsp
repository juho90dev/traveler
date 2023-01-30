<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage1.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- ======= Hero Section ======= -->
<!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
        <div class="container">
        	<div class="breadcrumb-hero">
        		<h2>마이 페이지</h2>
        	</div>
        </div>
	</div>
	<div class="container">
		<ol>
			<li>
				<a href="/">Home</a>
			</li>
	        <li>
	        	<a href="${Path}/mypage">마이 페이지</a>
	        </li>
        </ol>
    </div>
</section>
<!-- End Breadcrumbs -->
<section class="py-5 my-5">
<c:if test="${loginMember.userId  eq 'admin'}">
	<div class="container">
		<div class="bg-white shadow rounded-lg d-block d-sm-flex">
			<div class="profile-tab-nav border-right">
				<div class="p-4">
          				<c:if test="${loginMember.image eq null}">
							<div class="img-circle text-center mb-3">
								<img src="resources/img/logo1.jpeg" alt="Image" class="shadow">
							</div>
						</c:if>
        				<c:if test="${loginMember.image ne null}">
	        				<div class="img-circle text-center mb-3">
	        					<img src="${path }/resources/upload/profile/${loginMember.image}" alt="Image" class="shadow">
	        				</div>
        				 </c:if>
					<h4 class="text-center">${loginMember.userId }</h4>
				</div>
				<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
						내 정보
					</a>
					<a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
						신고글
					</a>
					<a class="nav-link" id="application-tab" data-toggle="pill" href="#application" role="tab" aria-controls="application" aria-selected="false">
						문의글
					</a>
				</div>
			</div>
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<form action="/updateInfo" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>아이디</label>
									  <input name="userId" id="userId" type="text" value="<c:out value="${loginMember.userId}"/>"  readonly class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>비밀번호</label>
								  	<input type="text" name="password" class="form-control" id="password" placeholder="password" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Email</label>
								  	<input type="text" class="form-control" name="email" id="email" value="<c:out value="${loginMember.email}"/>" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Phone</label>
								  	<input type="text" class="form-control" name="phone" id="phone" value="<c:out value="${loginMember.phone}"/>" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>도</label>
								  	<input type="text" class="form-control" name="city" id="city"  value="<c:out value="${loginMember.city}"/>">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>시</label>
								  	<input type="text" class="form-control" name="country" id="country"  value="<c:out value="${loginMember.country}"/>">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
								  	<label>Introduce</label>
									<textarea class="form-control" name="introduce" rows="5" id="introduce" required>${loginMember.introduce }</textarea>
								</div>
							</div>
							<div class="col-md-6">
							<div class="form-group">
							  	<label>첨부 파일</label>
							  	<input  type="file" name="img">
							</div>
						</div>
						</div>
						<div>
							<button class="btn btn-primary">수정</button>
							<button type="reset" class="btn btn-primary" value="reset">재설정</button>
	                    	<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/')">취소</button>
						</div>
					</form>
				</div>
				<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab">
					<section id="board-container" class="container">
				        <table id="tbl-board" class="table table-striped table-hover">
				            <tr>
				                <th>번호</th>
				                <th>제목</th>
				                <th>신고한 아이디</th>
				                <th>신고당한 아이디</th>
				                <th>작성일</th>
				            </tr>
				            <tr>
					        	<td>1</td>
								<td>폭력당했어요!!</td>
								<td>${loginMember.userId}</td>
								<td>엄석대</td>	
								<td>2022.12.12</td>
				            </tr>
				        </table> 
					</section>
				</div>
				<div class="tab-pane fade" id="application" role="tabpanel" aria-labelledby="application-tab">
					<section id="board-container" class="container">
				        <table id="tbl-board" class="table table-striped table-hover">
				            <tr>
				                <th>번호</th>
				                <th>제목</th>
				                <th>신고한 아이디</th>
				                <th>신고당한 아이디</th>
				                <th>작성일</th>
				                <th>삭제</th>
				            </tr>
				            <tr>
					        	<td>1</td>
								<td>폭력당했는데 신고 되나요</td>
								<td>${loginMember.userId}</td>
								<td>엄석대</td>	
								<td>2022.12.12</td>
								<td>
		                        	<a href="${pageContext.request.contextPath }/myPage1"><i class="fa fa-trash-o"></i></a>
		                        </td>
				            </tr>
				        </table> 
					</section>
				</div>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${loginMember.userId  ne 'admin'}" >
	<div class="container">
		<div class="bg-white shadow rounded-lg d-block d-sm-flex">
			<div class="profile-tab-nav border-right">
				<div class="p-4">
          				<c:if test="${loginMember.image eq null}">
							<div class="img-circle text-center mb-3">
								<img src="resources/img/logo1.jpeg" alt="Image" class="shadow">
							</div>
						</c:if>
        				<c:if test="${loginMember.image ne null}">
	        				<div class="img-circle text-center mb-3">
	        					<img src="${path }/resources/upload/profile/${loginMember.image}" alt="Image" class="shadow">
	        				</div>
        				 </c:if>
					<h4 class="text-center">${loginMember.userId }</h4>
				</div>
				<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
						내 정보
					</a>
					<a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
						신고글
					</a>
					<a class="nav-link" id="application-tab" data-toggle="pill" href="#application" role="tab" aria-controls="application" aria-selected="false">
						문의글
					</a>
					<a class="nav-link" id="notification-tab" data-toggle="pill" href="#notification" role="tab" aria-controls="notification" aria-selected="false">
						탈퇴
					</a>
				</div>
			</div>
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<form action="/updateInfo" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
								  	<label>아이디</label>
									  <input name="userId" id="userId" type="text" value="<c:out value="${loginMember.userId}"/>"  readonly class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>비밀번호</label>
								  	<input type="text" name="password" class="form-control" id="password" placeholder="password" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Email</label>
								  	<input type="text" class="form-control" name="email" id="email" value="<c:out value="${loginMember.email}"/>" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>Phone</label>
								  	<input type="text" class="form-control" name="phone" id="phone" value="<c:out value="${loginMember.phone}"/>" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>도</label>
								  	<input type="text" class="form-control" name="city" id="city"  value="<c:out value="${loginMember.city}"/>">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>시</label>
								  	<input type="text" class="form-control" name="country" id="country"  value="<c:out value="${loginMember.country}"/>">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
								  	<label>Introduce</label>
									<textarea class="form-control" name="introduce" rows="5" id="introduce" required>${loginMember.introduce }</textarea>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<label>첨부 파일</label>
								  	<input  type="file" name="img">
								</div>
							</div>
						</div>
						<div>
							<button class="btn btn-primary">수정</button>
							<button type="reset" class="btn btn-primary" value="reset">재설정</button>
	                    	<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/')">취소</button>
						</div>
					</form>
				</div>
				<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab">
					<section id="board-container" class="container">
				        <table id="tbl-board" class="table table-striped table-hover">
				            <tr>
				                <th>번호</th>
				                <th>제목</th>
				                <th>신고한 아이디</th>
				                <th>신고당한 아이디</th>
				                <th>작성일</th>
				            </tr>
				            <tr>
					        	<td>1</td>
								<td>폭력당했어요!!</td>
								<td>${loginMember.userId}</td>
								<td>엄석대</td>	
								<td>2022.12.12</td>
				            </tr>
				        </table> 
					</section>
				</div>
				<div class="tab-pane fade" id="application" role="tabpanel" aria-labelledby="application-tab">
					<section id="board-container" class="container">
				        <table id="tbl-board" class="table table-striped table-hover">
				            <tr>
				                <th>번호</th>
				                <th>제목</th>
				                <th>신고한 아이디</th>
				                <th>신고당한 아이디</th>
				                <th>작성일</th>
				                <th>삭제</th>
				            </tr>
				            <tr>
					        	<td>1</td>
								<td>폭력당했는데 신고 되나요</td>
								<td>${loginMember.userId}</td>
								<td>엄석대</td>	
								<td>2022.12.12</td>
								<td>
		                        	<a href="${pageContext.request.contextPath }/myPage1"><i class="fa fa-trash-o"></i></a>
		                        </td>
				            </tr>
				        </table> 
					</section>
					</div>
					<div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
						<h3 class="mb-4">계정 탈퇴</h3>
						<div class="col-md-6">
							<div class="form-group">
							</div>
						</div>
						<div>
							<button class="btn btn-primary">탈퇴</button>
							<button class="btn btn-light">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	</section>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
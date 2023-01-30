<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/memberList.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
		<div class="breadcrumb-hero">
			<h2>회원 리스트</h2>
		</div>
	</div>
	<div class="container">
		<ol>
			<%-- <li><a href="/">Home</a></li>
			<li><a href="${Path}/memberlist">회원 리스트</a></li> --%>
			<li><a href="<%=request.getContextPath()%>/memberList">전체</a></li>
			<li><a href="<%=request.getContextPath()%>/normalMemberList">일반</a></li>
			<li><a href="<%=request.getContextPath()%>/plannerMemberList">플래너</a></li>
		</ol>
	</div>
</section>
<section id="about" class="about">
   
<br>
   
<section id="memberList-container">
	<div id="search-container">
		<select id="searchType">
			<option value="city" >대도시</option>
			<option value="country" >소도시</option>
			<option value="email">이메일</option>
		</select>
		<div id="search-city">
			<form action="${pageContext.request.contextPath }/searchMember">
				<input type="hidden" name="searchType" value="city" >
				<input type="text" name="searchKeyword" size="25" placeholder="검색할 대도시를 입력하세요" list="ids">
				<datalist id="ids"></datalist>
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		</div>
		<div id="search-country">
			<form action="${pageContext.request.contextPath }/searchMember">
				<input type="hidden" name="searchType" value="country" >
				<input type="text" class="form-control"name="searchKeyword" size="25" placeholder="검색할 소도시를 입력하세요" list="ids">
				<datalist id="ids"></datalist>
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		</div>
 		<div id="search-email">
			<form action="${pageContext.request.contextPath }/searchMember">
				<input type="hidden" name="searchType" value="email">
				<input type="text" name="searchKeyword" size="25" placeholder="검색할 이메일을 입력하세요">
				<button type="submit" class="btn btn-primary">검색</button>
			</form>
		</div>
	</div>
    <br>
    <table class="table">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>휴대폰번호</th>
				<th>관심 시/도</th>
				<th>관심 시/군/구</th>
				<th>평점</th>
				<th>등급</th>
				<th>등급관리</th>
				<th>가입일</th>
				<th>회원삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${not empty member }">
				<c:forEach items="${member}" var="m">
					<tr>
						<td><c:out value="${m.userId}"/></td>
						<td><c:out value="${m.email}"/></td>
						<td><c:out value="${m.phone}"/></td>
						<td><c:out value="${m.city}"/></td>
						<td><c:out value="${m.country}"/></td>
						<td><c:out value="${m.avgscore}"/></td>
						<td><c:out value="${m.grade}"/></td>
						<c:if test="${m.grade eq '일반' }">
							<td>
								<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/upGrade/${m.userId}')">승급</button>
							</td>
						</c:if>
			            <c:if test="${m.grade eq '플래너' }">
							<td>
								<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/downGrade/${m.userId}')">강등</button>
							</td>
						</c:if>
						<c:if test="${m.grade eq '관리자' }">
							<td>
								관리자
							</td>
						</c:if>
						<td><fmt:formatDate value="${m.enrollDate}" pattern="yyyy-MM-dd"/></td>
						<td>
							<a href="<%=request.getContextPath()%>/">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table> 
			<c:if test="${empty member }">
				<tr>
					<td colspan="7" align="center">조회 결과 없음</td>
				</tr>
			</c:if>
	<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
</section>
<script>
	$(()=>{
		$("#searchType").change(e=>{
			const type=$(e.target).val();
			$("#search-container>div[id!=search-]").hide();
			$("#search-"+type).css("display","inline-block");
		});
		$("#searchType").change();
	})
</script>



</section><!-- End About Section -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
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
            <h2>공지사항</h2>
            <p>※ 중요 내용을 안내해드립니다.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/inquiryList">문의 게시판</a></li>
        </ol>
      </div>
    </section>
<section class="py-5 my-5">
<div class="container">
	
		<table class="table table-bordered">
			<colgroup>
				<col width = "130px" />
			</colgroup>
			<thead>
			</thead>
			<tbody >
			    <tr>
					<th align="center" style="text-align: center">답글 번호</th>
					<td align="center" style="text-align: center"><c:out value="${inquiry.inquiryNo}"/></td>
				</tr>
				<tr>
					<th align="center" style="text-align: center">제목</th>
					<td align="center" style="text-align: center"><c:out value="${inquiry.inquiryTitle}"/></td>
				</tr>
				<tr>
					<th align="center" style="text-align: center">작성자</th>
					<td align="center" style="text-align: center"><c:out value="${inquiry.writer.userId}"/></td>
				</tr>
				<tr>
					<th align="center" style="text-align: center">문의 유형</th>
					<td align="center" style="text-align: center"><c:out value="${inquiry.inquiryType}"/></td>
				</tr>
				<tr>
					<th align="center" style="text-align: center">내용</th>
					<td colspan="2" height="200px" style="text-align: center"><c:out value="${inquiry.inquiryContent}"/></td>
				</tr>
				
			</tbody>
		</table>
	<div>
		<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/inquiryList')">목록</button>
		<c:if test="${loginMember.userId eq 'admin'}">
			<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/inquyiryUpdate/${inquiry.inquiryNo}')">수정</button>
			<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/inquiryDelete/${inquiry.inquiryNo}')">삭제</button>
		</c:if>
	</div>
	
</div>
	
</section>
<style>
.container44 {
	border : 1;
	width="200"; 
	height="100"
}

td {
		text-align: left !important;
	}

</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
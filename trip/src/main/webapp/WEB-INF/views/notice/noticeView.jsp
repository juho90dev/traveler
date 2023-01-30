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
          <li><a href="${Path}/notice">공지 게시판</a></li>
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
					<th scope="col"align="center" style="text-align: center">글번호</th>
					<td style="text-align: center"><c:out value="${notice.notiNo}"/></td>
				</tr>
				<tr>
					<th style="text-align: center">제목</th>
					<td style="text-align: center"><c:out value="${notice.noticeTitle}"/></td>
				</tr>
				<tr>
					<th align="center" style="text-align: center">작성자</th>
					<td style="text-align: center">관리자</td>
				</tr>
				<tr>
					<th align="center" style="text-align: center">첨부파일</th>
					<c:if test="${notice.originalFileName ne null }">
						<td>
							<a href="${pageContext.request.contextPath }/nfDownload.do/?oriname=${notice.originalFileName }&rename=${notice.renameFileName }">
								<img src="${pageContext.request.contextPath }/resources/img/file.png" width="20">
								<c:out value= "${notice.originalFileName }"/>
							</a>
						</td>
						</c:if>
						<c:if test="${notice.originalFileName eq null }">
							<td>
								첨부파일없음
							</td>
						</c:if>
					</tr>
				<tr>
					<th align="center" style="text-align: center">내용</th>
					<td colspan="2" height="200px" style="text-align: center"><c:out value="${notice.noticeContent}"/></td>
				</tr>
				
			</tbody>
		</table>
	<c:if test="${loginMember.userId eq 'admin'}">
	<div>
		<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/notice')">목록</button>
		<button type="button" class="btn btn-primary" onclick="location.assign('${pageContext.request.contextPath }/noticeUpdate/${notice.notiNo}')">수정</button>
	</div>
	</c:if>
	
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
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
<section id="about" class="about">
	<div class="container">
		<br>
		<c:if test="${loginMember.userId eq 'admin'}">
			<a class=likeabutton href="<%=request.getContextPath()%>/noticeWrite">공지 글 작성</a>
		</c:if>
		<div id="joinInfoArea">
			<section id="memberList-container">
        		 <div id="search-container">
<%--         			<div id="search-email">
        				<form action="<%=request.getContextPath()%>/notice">
        					<input type="hidden" name="searchType" value="email">
        					<input type="text" name="searchKeyword" size="25" placeholder="검색할 이메일을 입력하세요">
        					<button type="submit">검색</button>
        				</form>
        			</div> --%>
       			</div>
				<br>
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>첨부파일</th>
						<th>등록일</th>
						<c:if test="${loginMember.userId eq 'admin'}">
							<th>삭제</th>
						</c:if>
					</tr>
					<tbody>
					<c:if test="${not empty notice }">
					<c:forEach items="${notice}" var="n">
						<tr>
							<td><c:out value="${n.notiNo}"/></td>
							<td>
								<a href="${pageContext.request.contextPath }/noticeView/${n.notiNo}"><c:out value="${n.noticeTitle}"/></a>
							</td>
							<td>관리자</td>
							<c:if test="${n.originalFileName ne null }">
								<td>
								<a href="${pageContext.request.contextPath }/nfDownload.do/?oriname=${n.originalFileName }&rename=${n.renameFileName }">
									<img src="${pageContext.request.contextPath }/resources/img/file.png" width="20">
									<c:out value= "${f.originalFileName }"/>
									</a>
								</td>
							</c:if>
							<c:if test="${n.originalFileName eq null }">
								<td>
									첨부파일없음
								</td>
							</c:if>
							<td><fmt:formatDate value="${n.notiDate}" pattern="yyyy-MM-dd"/></td>
							<c:if test="${loginMember.userId eq 'admin'}">
								<td>
									<a href="${pageContext.request.contextPath }/deleteNotice/${n.notiNo}"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
		                        </td>
							</c:if>
						</tr>
						</c:forEach>
		                </c:if>
			            <c:if test="${empty notice }">
							<tr>
								<td colspan="7" align="center">조회 결과 없음</td>
							</tr>
						</c:if>
					</tbody>
				</table> 
				<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
			</section>
		</div>
	</div>
</section><!-- End About Section -->

<style type="text/css">
	section#memberList-container {text-align:center;}	
	section#memberList-container table#tbl-member {width:100%; border:1px solid gray; border-collapse:collapse;}
	section#memberList-container table#tbl-member th, table#tbl-member td {border:1px solid gray; padding:10px; }
 	div#search-container {margin:0 0 10px 0; padding:3px; }
    div#search-MEMBER_ID{display:inline-block;}
    div#search-email{display:none;}
    div#search-gender{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;} 
</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
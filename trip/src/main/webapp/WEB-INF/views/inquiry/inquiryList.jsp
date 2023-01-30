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
          <li><a href="${Path}/inquiryList">문의 게시판</a></li>
        </ol>
      </div>
    </section>
<section id="about" class="about">
	<div class="container">
		<br>
		<a class=likeabutton href="<%=request.getContextPath()%>/inquiryWrite">문의 글 작성</a>
		<div id="joinInfoArea">
			<section id="memberList-container">
        		 <div id="search-container">
        			<select id="searchType">
        				<option value="inquiryTitle" >제목</option>
        				<option value="inquiryType">유형</option>
        			</select>
        			<div id="search-MEMBER_ID">
        				<form action="<%=request.getContextPath()%>/inquiry">
        					<input type="hidden" name="searchType" value="MEMBER_ID" >
        					<input type="text" name="searchKeyword" size="25" placeholder="아이디 혹은 유형을 입력하세요." list="ids">
        					<datalist id="ids">
        					</datalist>
        					<button type="submit">검색</button>
        				</form>
        			</div>
        			<div id="search-email">
        				<form action="<%=request.getContextPath()%>/">
        					<input type="hidden" name="searchType" value="email">
        					<input type="text" name="searchKeyword" size="25" placeholder="검색할 이메일을 입력하세요">
        					<button type="submit">검색</button>
        				</form>
        			</div>
       			</div>
				<br>
				<table class="table">
					<tr>
						<th>번호</th>
						<th>문의 유형</th>
						<th>제목</th>
						<th>ID</th>
						<th>작성일</th>
						<c:if test="${loginMember.userId eq 'admin'}">
							<td>삭제</td>
						</c:if>
					</tr>
					<tbody>
						<c:if test="${not empty inquiry }">
							<c:forEach items="${inquiry}" var="i">
								<tr>
									<td><c:out value="${i.inquiryNo}"/></td>
									<td><c:out value="${i.inquiryType}"/></td>
									<td>
										<a href="${Path }/inquiryView/${i.inquiryNo}">
											<c:out value="${i.inquiryTitle}"/>
										</a>
									</td>
									<c:if test="${loginMember.userId eq i.writer.userId }">
		                          		<td style="color:#4fbfa8">${i.writer.userId }</td>
		                          	</c:if>
		                          	<c:if test="${loginMember.userId ne i.writer.userId }">
		                          		<td>${i.writer.userId }</td>
		                          	</c:if>	
									<td><fmt:formatDate value="${i.inquiryDate}" pattern="yyyy-MM-dd"/></td>
								<c:if test="${loginMember.userId eq 'admin'}">
									<td>
										<a href="${pageContext.request.contextPath }/deleteInquiry"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
			                        </td>
								</c:if>
								</tr>
								<c:if test="${i.reInquiry.reinquiryNo ne null }">
		                        	<tr>
		                          		<td></td>
		                          		<td><c:out value="${i.inquiryType}"/></td>
		                          		<td colspan=1>
		                          			<a href="${pageContext.request.contextPath }/replyView/${i.inquiryNo}">
												[답변]: <c:out value="${i.reInquiry.reinquiryTitle}"/>
											</a>
		                          		</td>
		                          		
		                          		<td style="color:blue">관리자</td>
		                          		<td><fmt:formatDate value="${i.reInquiry.reinquiryDate}" pattern="yyyy-MM-dd"/></td>
		                          		<c:if test="${loginMember.userId  eq 'admin'}">
			                          		<td>
			                          			<a href="${pageContext.request.contextPath }/deleteReply/${i.reInquiry.reinquiryNo}"><i class="fa fa-trash-o"></i></a>
			                          		</td>
		                          		</c:if>
		                        	</tr>
								</c:if>
							</c:forEach>
		                </c:if>
		                <c:if test="${empty inquiry }">
		                	<tr>
		                		<td colspan="8" align="center">조회 결과 없음</td>
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
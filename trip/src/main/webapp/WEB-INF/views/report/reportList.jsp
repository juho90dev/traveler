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
				<h2>신고 게시판</h2>
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
</section><!-- End Breadcrumbs -->
<section id="about" class="about">
	<div class="container">
		<br>
		<a class=likeabutton href="${Path}/report">신고 글 작성</a>
		<div id="joinInfoArea">
			<section id="memberList-container">
        		 <div id="search-container">
        			<select id="searchType">
        				<option value="MEMBER_ID" >아이디</option>
        				<option value="email">유형</option>
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
						<th>신고 유형</th>
						<th>신고자 ID</th>
						<th>제목</th>
						<th>신고대상 ID</th>
						<th>신고일</th>
						<c:if test="${loginMember.userId eq 'admin'}">
							<th>삭제</th>
						</c:if>
					</tr>
					<tbody>
						<tr>
							<td>1</td>
							<td>폭력</td>
							<td>한병태</td>
							<td>이 새끼 순 나쁜새끼에요</td>	
							<td>엄석대</td>		
							<td>2022.09.12</td>
							<c:if test="${loginMember.userId eq 'admin'}">
								<td><a href="${pageContext.request.contextPath }/deleteReply/${i.reInquiry.replyinquiryNo}"><i class="fa fa-trash-o"></i></a></td>
							</c:if>
						</tr>
					</tbody>
				</table> 
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



<!--푸터 적용  -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
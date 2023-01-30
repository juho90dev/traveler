<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>자유 게시판</h2>
            <p>욕설, 홍보, 사기 글을 올리면 계정탈퇴를 당할 수 있습니다.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/boardList">자유 게시판</a></li>
        </ol>
      </div>
    </section>
<section id="about" class="about">
	<div class="container">
		<br>
		<a class=likeabutton href="<%=request.getContextPath()%>/boardList">글 작성</a>

		<div id="joinInfoArea">
			<section id="memberList-container">
        		 <div id="search-container">
       			</div>
				<br>
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<c:if test="${loginMember.userId eq 'admin'}">
							<th>삭제</th>
						</c:if>
					</tr>
					<tbody>
						<tr>
							<td>1</td>
							<td>
								오 개설함?
							</td>
							<td>엄석대</td>
							<td>2023-01-06</td>
							<c:if test="${loginMember.userId eq 'admin'}">
								<td>
									<a href="${pageContext.request.contextPath }/boardList"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
		                        </td>
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


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
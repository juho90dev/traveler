<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- ======= Hero Section ======= -->
<!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
        <div class="container">
        	<div class="breadcrumb-hero">
        		<h2>${member.userId }님의 정보</h2>
        	</div>
        </div>
	</div>
	<div class="container">
		<ol>
			<li>
				<a href="/">Home</a>
			</li>
	        <li>
	        	<a style="color:blue" href="${Path}/memberPage">${member.userId }</a>님의 페이지
	        </li>
        </ol>
    </div>
</section>
<!-- End Breadcrumbs -->
    <div class="sidebar-item search-form">
                <form action="">
                  <input type="text">
                  <button type="submit"><i class="bi bi-search"></i></button>
                </form>
              </div><!-- End sidebar search formn-->

              <h3 class="sidebar-title">Categories</h3>
              <div class="sidebar-item categories">
                <ul>
                  <li><a href="#">General <span>(25)</span></a></li>
                  <li><a href="#">Lifestyle <span>(12)</span></a></li>
                  <li><a href="#">Travel <span>(5)</span></a></li>
                  <li><a href="#">Design <span>(22)</span></a></li>
                  <li><a href="#">Creative <span>(8)</span></a></li>
                  <li><a href="#">Educaion <span>(14)</span></a></li>
                </ul>
              </div><!-- End sidebar categories-->

              <h3 class="sidebar-title">Recent Posts</h3>
              <div class="sidebar-item recent-posts">
                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-1.jpg" alt="">
                  <h4><a href="blog-single.html">Nihil blanditiis at in nihil autem</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-2.jpg" alt="">
                  <h4><a href="blog-single.html">Quidem autem et impedit</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-3.jpg" alt="">
                  <h4><a href="blog-single.html">Id quia et et ut maxime similique occaecati ut</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-4.jpg" alt="">
                  <h4><a href="blog-single.html">Laborum corporis quo dara net para</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

                <div class="post-item clearfix">
                  <img src="assets/img/blog/blog-recent-5.jpg" alt="">
                  <h4><a href="blog-single.html">Et dolores corrupti quae illo quod dolor</a></h4>
                  <time datetime="2020-01-01">Jan 1, 2020</time>
                </div>

              </div><!-- End sidebar recent posts-->

              <h3 class="sidebar-title">Tags</h3>
              <div class="sidebar-item tags">
                <ul>
                  <li><a href="#">App</a></li>
                  <li><a href="#">IT</a></li>
                  <li><a href="#">Business</a></li>
                  <li><a href="#">Mac</a></li>
                  <li><a href="#">Design</a></li>
                  <li><a href="#">Office</a></li>
                  <li><a href="#">Creative</a></li>
                  <li><a href="#">Studio</a></li>
                  <li><a href="#">Smart</a></li>
                  <li><a href="#">Tips</a></li>
                  <li><a href="#">Marketing</a></li>
                </ul>
              </div><!-- End sidebar tags-->

            </div><!-- End sidebar -->

          </div><!-- End blog sidebar -->
<!-- ======= Blog Section ======= -->
<section id="testimonials" class="testimonials">
	<div class="container">
		<div class="section-title">
			<h2>${member.userId }</h2>
			<p>${member.grade }</p>
        </div>
        <div class="swiper-wrapper">
        	<div class="swiper-slide">
        		<div class="testimonial-item">
        					<img src="${path }/resources/upload/profile/${member.image }" class="testimonial-img" alt="">
     
                	<h3>${member.email }</h3>
                	<h4>${member.phone }</h4>
                	
                	<p>자기소개</p>
                	<p>
                		<h1>${member.introduce }</h1>
                	</p>
                    <div class="tab_container">
                    	<c:if test="${member.userId ne 'admin'}">
							<input id="tab1" type="radio" name="tabs" checked>
							<label for="tab1"><span>플랜</span></label>
				
							<input id="tab2" type="radio" name="tabs">
							<label for="tab2"><span>자유 게시판</span></label>
				
							<input id="tab3" type="radio" name="tabs">
							<label for="tab3"><span>자기 소개</span></label>
				
							<input id="tab4" type="radio" name="tabs">
							<label for="tab4"><span>신고 글</span></label>
				
							<input id="tab5" type="radio" name="tabs">
							<label for="tab5"><span>문의 글</span></label>
				
							<section id="content1" class="tab-content">
								<h3>Headline 1</h3>
						      	<p>Tab 1 Content.</p>
							</section>
				
							<section id="content2" class="tab-content">
								 <c:choose >
			        				<c:when test="${loginMember.image eq null}">
			        					<img src="resources/img/testimonials/testimonials-1.jpg"  class="testimonial-img" alt="">
			        					<%-- <img src="resources/img/testimonials/testimonials-1.jpg" style=" max-width: 50%;  height: auto;"> <br /> --%>
			        					<p><input type=file name="mb_icon2"></p>
			        				</c:when>
			        				<c:when test="${loginMember.image ne null}">
			        					<img src="${loginMember.image }" class="testimonial-img" alt="">
			        					<%-- <img src="resources/img/testimonials/testimonials-1.jpg" style=" max-width: 50%;  height: auto;"> <br /> --%>
			        				</c:when>
        							</c:choose>	       
						              <form action="/member/updateImg" method="post" enctype="multipart/form-data">
						                <input type="file" name="file">
						                <input type="hidden" name="memberId" id="memberId" value="${loginMember.userId}">
						               <button type="submit" class="btn btn-primary">사진변경</button>
						             </form>
						             
							</section>
				
							<section id="content3" class="tab-content">
								<h3>${loginMember.introduce}</h3>
						      	
							</section>
				
							<section id="content4" class="tab-content">
								<div class="container">
								<table class="table">
										<tr>
											<th>번호</th>
											<th>문의 유형</th>
											<th>제목</th>
											<th>ID</th>
											<th>작성일</th>
											<td>삭제</td>
										</tr>
									<tbody>
										<tr>
											<td>1</td>
											<td>폭력</td>
											<td>폭력당했는데 신고 되나요</td>
											<td>한병태</td>	
											<td>2022.09.12</td>
											<td>
												<a href="${pageContext.request.contextPath }/deleteInquiry/${i.inquiryNo}"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
						                    </td>
										</tr>
									</tbody>
								</table> 
								</div>
							</section>
				
							<section id="content5" class="tab-content">
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
								<a href="${pageContext.request.contextPath }/notice">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
							</td>
							<td>admin</td>
							<td>2022.09.12</td>
							<c:if test="${loginMember.userId eq 'admin'}">
								<td>
									<a href="${pageContext.request.contextPath }/mypage"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
		                        </td>
							</c:if>
						</tr>
					</tbody>
				</table> 
							</section>
						</c:if>
						
					</div>
              </div>
            </div><!-- End testimonial item -->        
          </div>         


      </div>
    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
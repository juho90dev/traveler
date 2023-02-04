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
 <div id="search-option-container" style="text-align:right;"> 
	<button id="btn_toggle1" class="btn btn-primary">키워드 검색</button>
	<button id="btn_toggle2" class="btn btn-primary">지역 검색</button>
	<button id="btn_toggle3" class="btn btn-primary">테마 검색</button>
</div>

<div>
	<div id="Toggle1"  style="display:none; text-align:center">
		<form action="${pageContext.request.contextPath }/searchMember">
			<input type="hidden" name="searchType" value="city" >
			<input type="text" name="searchKeyword" size="25" placeholder="지역을 입력하세요" list="ids">
			<datalist id="ids"></datalist>
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
	<div id="Toggle2"  style="display:none; text-align:center>
	<form id="search" action="${path }/searchPlace" method="post">
					<div class="travel1">
						<select name="mainTema" id="mainTema" onchange="change(this)">
							<option value="tematitle">테마 선택</option>
							<option value="자연">자연</option>
							<option value="인문">인문(문화/예술/역사)</option>
							<option value="추천코스">추천코스</option>
							<option value="레포츠">레포츠</option>
							<option value="숙박">숙박</option>
							<option value="쇼핑">쇼핑</option>
							<option value="음식">음식</option>
						</select>

						<select name="subTema" id="subTema">
							<option value="subtematitle">상세테마 선택</option>
						</select>
					</div>
					<div class="btnTest">
						<button type="submit">검색</button>
					</div>
				</form>
				</div>
	<div id="Toggle"  style="display:none; text-align:center">
		<form action="${pageContext.request.contextPath }/searchMember">
			<input type="hidden" name="searchType" value="city" >
			<input type="text" name="searchArea" size="25" placeholder="지역을 입력하세요" list="ids">
			<datalist id="ids"></datalist>
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
</div>
<script>

$(function (){
	$("#btn_toggle1").click(function (){
  	$("#Toggle1").toggle();
  });
});
$(function (){
	$("#btn_toggle2").click(function (){
  	$("#Toggle2").toggle();
  });
});
$(function (){
	$("#btn_toggle3").click(function (){
  	$("#Toggle3").toggle();
  });
});


</script>
<style>
#btn_toggle1{
  font-size:14px;
  padding:10px 15px;
  border:1px solid #ddd;
  border-radius:5px;
  font-weight:bold;
}
#Toggle1{
  font-size:14px;
}
#btn_toggle2{
  font-size:14px;
  padding:10px 15px;
  border:1px solid #ddd;
  border-radius:5px;
  font-weight:bold;
}
#Toggle2{
  font-size:14px;
}
#btn_toggle3{
  font-size:14px;
  padding:10px 15px;
  border:1px solid #ddd;
  border-radius:5px;
  font-weight:bold;
}
#Toggle3{
  font-size:14px;
}
</style>


</section><!-- End About Section -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
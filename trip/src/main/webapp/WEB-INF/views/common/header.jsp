<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page import="com.jh.trip.member.model.vo.Member" %>
 <%
 Member login=(Member)session.getAttribute("loginMember");
 %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Traveler</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
 <%--  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon"> --%>
<!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${path}/resources/vendor/font-awesome/css/font-awesome.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=705b81233756fa3f99e7c61bf323dd7e&libraries=services"></script>
  <!-- =======================================================
  * Template Name: Serenity - v4.9.0
  * Template URL: https://bootstrapmade.com/serenity-bootstrap-corporate-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center">
	<div class="container d-flex align-items-center justify-content-between">
		<div class="logo">
			<h1 class="text-light"><a href="/"><img src="${path }/resources/img/traveler.png" style="width:250px;height:100px"alt="" class=""></a></h1>
		</div>
		<nav id="navbar" class="navbar">
	        <ul>
				<li><a class="active" href="/">Home</a></li>
				<li><a href="${path}/plannerMember" onclick="openPlanner()">플랜 크리에이터</a></li>
				<li><a href="${path}/placeList">장소</a></li>
				<li><a href="${path }/plan" onclick="openPlanner()">플랜</a></li>       
				<li class="dropdown"><a href="${path}/faq"><span>FAQ</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${path}/notice">공지사항</a></li>
						<li><a href="${path}/inquiryList" onclick="openInquiry()">문의사항</a></li>
						<li><a href="${path}/boardList" onclick="openBoard()">자유게시판</a></li>
						<li><a href="${path}/report" onclick="openReport()">신고게시판</a></li>
						<li><a href="${path}/faq">자주 묻는 질문</a></li>
					</ul>
				</li>
				<c:if test="${loginMember.userId eq null}">
					<li><a href="${path }/loginpage">login</a></li>
	 				<li><a href="${path }/joinForm">sign in</a></li>
				</c:if>
				<c:if test="${loginMember.userId ne null}">
					<li class="dropdown"><a href="/"><span>${loginMember.userId }님</span> <i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="${path }/myPage">마이 페이지</a></li>
							<c:if test="${loginMember.userId eq 'admin'}">
								<li><a href="${path}/memberList">회원 명단</a></li>
							</c:if>
							<li><a href="${path}/logout">logout</a></li>
		                </ul>
					</li>        	
				</c:if>
				<li class="list-inline-item"><a href="${path}/contact">Contact</a>
				<i class="bi bi-list mobile-nav-toggle"></i></li>
			</ul>
		</nav><!-- .navbar -->
	</div>
</header><!-- End Header -->

<main id="main">
<script>
const openPlanner=()=>{
	<%if(login!=null) {%>
		location.href=("<%=request.getContextPath()%>/plannerMember");
	<%}else {%>
		alert("회원전용메뉴입니다. 로그인 후 사용해주세요!");    
    <%}%>
 }
const openPlan=()=>{
	<%if(login!=null) {%>
		location.href=("<%=request.getContextPath()%>/plan");
	<%}else {%>
		alert("회원전용메뉴입니다. 로그인 후 사용해주세요!");    
    <%}%>
 }
const openInquiry=()=>{
	<%if(login!=null) {%>
		location.href=("<%=request.getContextPath()%>/inquiryList");
	<%}else {%>
		alert("회원전용메뉴입니다. 로그인 후 사용해주세요!");    
    <%}%>
 }
const openBoard=()=>{
	<%if(login!=null) {%>
		location.href=("<%=request.getContextPath()%>/boardList");
	<%}else {%>
		alert("회원전용메뉴입니다. 로그인 후 사용해주세요!");    
    <%}%>
 }
const openReport=()=>{
	<%if(login!=null) {%>
		location.href=("<%=request.getContextPath()%>/report");
	<%}else {%>
		alert("회원전용메뉴입니다. 로그인 후 사용해주세요!");    
    <%}%>
 }
</script>
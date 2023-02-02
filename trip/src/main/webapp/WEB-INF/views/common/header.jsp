<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Traveler</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">
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
				<li><a href="${path}/plannerMember">플랜 크리에이터</a></li>
				<li><a href="${path}/plateList">장소</a></li>
				<li><a href="/">플랜</a></li>       
				<li class="dropdown"><a href="${path}/faq"><span>FAQ</span> <i class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${path}/notice">공지사항</a></li>
						<li><a href="${path}/inquiryList">문의사항</a></li>
						<li><a href="${path}/boardList">자유게시판</a></li>
						<li><a href="${path}/report">신고게시판</a></li>
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
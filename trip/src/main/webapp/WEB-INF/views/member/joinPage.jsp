<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/joinForm.css"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="signupFrm">
    <form action="/join" class="form" method="post">
      <h5 class="title">회원 가입</h5>

      <div class="inputContainer">
        <input type="text" required name="userId" id="userId_" class="input_id" placeholder="a">
        <label for="" class="label">ID</label>
      </div>

      <div class="inputContainer">
        <input type="password" required name="password" id="password_" class="input_password" placeholder="a">
        <label for="" class="label">PASSWORD</label>
      </div>
		<div class="inputContainer">
        <input type="text" required name="phone" id="phone" class="input_phone" placeholder="a">
        <label for="" class="label">PHONE</label>
      </div>
      <div class="inputContainer">
        <input type="email" required name="email" id="email" class="input-check-email" placeholder="a">
        <label for="" class="label">EMAIL</label>
      </div>
      <div class="inputContainer">
        <input type="text" required name="city" id="city" class="input_city" placeholder="a">
        <label for="" class="label">도(ex. 서울/경기)</label>
      </div>
      <div class="inputContainer">
        <input type="text" required name="country" id="country" class="input_country" placeholder="a">
        <label for="" class="label">시(ex. 수원/용인)</label>
      </div>
		<div class="inputContainer">
                <input class="introduce" name="introduce"  id="introduce" placeholder="a" required>
      <label for="" class="label">자기 소개</label>
      </div>
      <div></div>
      <input type="submit" class="submitBtn" value="가입하기">
    </form>
  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
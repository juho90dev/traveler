<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/loginForm.css"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="bg-img">
	<div class="content">
		<form action="/loginaction" method="post">
			<div class="field">
				<span class="fa fa-user"></span>
				<input type="text"required name="userId" id="userId" required placeholder="ID를 입력하세요">
			</div>
			<div class="field space">
				<span class="fa fa-lock"></span>
				<input type="password" required name="password" class="pass-key" required placeholder="비밀번호를 입력하세요">
				<span class="show">SHOW</span>
			</div>
			<br>
			<div class="field">
				<input type="submit" value="LOGIN">
			</div>
		</form>
		<div class="signup">
		<br>
			<a href="${path }/joinForm">회원가입 </a><span class="colorS">|</span><a href="/"> HOME</a>
		</div>
	</div>
</div>

<script>
const pass_field = document.querySelector('.pass-key');
const showBtn = document.querySelector('.show');

showBtn.addEventListener('click', function(){
	if(pass_field.type === "password"){
		pass_field.type = "text";
		showBtn.textContent = "HIDE";
		showBtn.style.color = "#3498db";
	}else{
		pass_field.type = "password";
		showBtn.textContent = "SHOW";
		showBtn.style.color = "#222";
	}
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
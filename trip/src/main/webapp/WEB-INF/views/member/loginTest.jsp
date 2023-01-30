<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/loginForm.css"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>




<div class="">
	<form id="loginFrm" action="/loginaction" method="post">
    	<div class="input-field">
			<input type="text" required name="userId" id="userId">
				<label>아이디 입력</label>
		</div>
		<div class="input-field">
			<input class="pswrd" type="password" required name="password" id="password">
			<span class="show">SHOW</span>
			<label>비밀번호 입력</label>
		</div>
            <div class="button">
               <div class="inner"></div>
               <button>LOGIN</button>
            </div>
	</form>
	<a href="/">아이디 찾기</a> | <a href="/">비밀번호 찾기</a> | <a href="/">HOME</a>
		<div class="signup">
            회원이 아니라면 <a href="${path }/joinForm">지금 가입하세요</a>
		</div>
      </div>
      
      <script>
         var input = document.querySelector('.pswrd');
         var show = document.querySelector('.show');
         show.addEventListener('click', active);
         function active(){
           if(input.type === "password"){
             input.type = "text";
             show.style.color = "#1DA1F2";
             show.textContent = "HIDE";
           }else{
             input.type = "password";
             show.textContent = "SHOW";
             show.style.color = "#111";
           }
         }
      </script>


<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>
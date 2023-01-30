<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>플랜 요청</h2>
            <p>여행 계획을 맡겨보세요.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/request/${loginMember.userId}">플랜 요청</a></li>
        </ol>
      </div>
    </section>
<section class="py-5 my-5">
	<div class="container">
		<div class="bg-white shadow rounded-lg d-block d-sm-flex">
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel"aria-labelledby="account-tab">
					<form action="${Path }/insertRequest" method="post" onsubmit="return checkBox(this);">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="id">신청자 ID</label> 
									<input name="userId" id="userId" type="text" value="<c:out value="${loginMember.userId }"/>" readonly class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="plannerId">플래너아이디</label> <input name="plannerId" id="plannerId" type="text" class="form-control" value="<c:out value="${member.userId}"/>" readonly>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="title">제목</label> 
									<input name="requestTitle" id="requestTitle" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group"></div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="theme">테마</label><br> 
									<input id="t1" type="checkbox" name="theme" value="맛집" >맛집&nbsp;&nbsp;
									<input id="t2" type="checkbox" name="theme" value="액티비티">액티비티&nbsp;&nbsp;
									<input id="t3" type="checkbox" name="theme" value="유적지">유적지&nbsp;&nbsp;
									<input id="t4" type="checkbox" name="theme" value="힐링">힐링&nbsp;&nbsp;
									<input id="t5" type="checkbox" name="theme" value="자연">자연&nbsp;&nbsp;
									<input id="t6" type="checkbox" name="theme" value="자유여행">자유여행&nbsp;&nbsp;
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group"></div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="startDay">첫 날</label><br>
									<p><input id="p4" type="date" name="startDay" required>
									</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="endDay">마지막 날</label><br>
									<p><input id="p5" type="date" name="endDay" required></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="transport">교통수단</label><br> 
									<input id="trans1" type="checkbox" name="transport" value="자동차">자동차&nbsp;&nbsp;
									<input id="trans2" type="checkbox" name="transport" value="버스">버스&nbsp;&nbsp;
									<input id="trans3" type="checkbox" name="transport" value="기차">기차&nbsp;&nbsp;
									<input id="trans4" type="checkbox" name="transport" value="도보">도보&nbsp;&nbsp;
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="requestContent">요청 상세 내용</label>
									<textarea name="requestContent" id="requestContent"
										class="form-control"></textarea>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 text-right">
								<button type="submit" class="btn btn-primary">등록</button>
								<button type="reset" class="btn btn-primary">재설정</button>
								<button type="button" class="btn btn-primary"
									onclick="location.assign('${pageContext.request.contextPath }/memberPage/${member.userId}')">취소</button>
							</div>
						</div>
						<!-- /.row-->
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	const checkBox=(form)=>{ 
		//테마 체크박스 적어도 1개 이상 선택
		var arr_form = document.getElementsByName('theme'); 
	    var num = 0; 
	    for(var i=0; i<arr_form.length; i++){ 
	        if(arr_form[i].checked){ 
	            num++; 
	        } 
	    } 
	    if(!num){ 
	        alert('테마를 적어도 하나 이상 선택해주시기 바랍니다'); 
	        return false; 
	    } 
			
		//교통수단 체크박스 최소 1개 이상 선택
	    var arr_form = document.getElementsByName('transport'); 
	    var num = 0; 
	    for(var i=0; i<arr_form.length; i++){ 
	        if(arr_form[i].checked){ 
	            num++; 
	        } 
	    } 
	    if(!num){ 
	        alert('교통수단을 적어도 하나 이상 선택해주시기 바랍니다'); 
	        return false; 
	    } 
	} 

	const fmReset=()=>{
		$("#p4").val("");
		$("#p5").val("");
		$("#t1").val("");
		$("#t2").val("");
		$("#t3").val("");
		$("#t4").val("");
		$("#t5").val("");
		$("#t6").val("");
		$("#content").val("");
		$("#trans1").val("");
		$("#trans2").val("");
		$("#trans3").val("");
		$("#trans4").val("");
	}

    
</script>
<style>
body {
	background: #f9f9f9;
	font-family: "Roboto", sans-serif;
}

.shadow {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
}

.profile-tab-nav {
	min-width: 250px;
}

.tab-content {
	flex: 1;
}

.form-group {
	margin-bottom: 1.5rem;
}

.nav-pills a.nav-link {
	padding: 15px 20px;
	border-bottom: 1px solid #ddd;
	border-radius: 0;
	color: #333;
}
.nav-pills a.nav-link i {
	width: 20px;
}

.img-circle img {
	height: 100px;
	width: 100px;
	border-radius: 100%;
	border: 5px solid #fff;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
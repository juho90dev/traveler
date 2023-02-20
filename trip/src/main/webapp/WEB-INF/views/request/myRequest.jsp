<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>문의사항</h2>
            <p>※ 궁금한 점을 문의하세요.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/myRequest/${loginMember.userId}">플랜 요청 내역</a></li>
        </ol>
      </div>
    </section>
<section class="py-5 my-5">
	<div class="container">
		<div class="bg-white shadow rounded-lg d-block d-sm-flex">
			<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
				<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
					<div id="joinInfoArea">

					<table class="table">
					  <caption>표 제목</caption>
					  <tr>
					  <th>요청 번호</th>
					  <th>플래너아이디</th>
					  <th>여행 제목</th>
					  <th>여행 시작일</th>
					  <th>여행 종료일</th>
					  <th>교통 수단</th>
					  <th>관광 테마</th>
					  <th>수락 여부</th>
					  <th>요청 삭제</th>
					  </tr>

				<tbody>

					<tr>
					<td>1</td>
					<td>korea</td>
					<td>강원도 여행가드래요</td>
					<td>2022-12-23</td>
					<td>2022-12-23</td>
					<td>기차</td>
					<td>맛집</td>
					<td>
						<button onclick="acceptRequest()">수락하기</button>
					</td>
					<td>
					<a href="<%=request.getContextPath()%>/">삭제</a>
					</td>
					</tr>
				</tbody>
				</table> 
		</div>

				</div>
			</div>
		</div>
	</div>
</section>
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
<script>
	const acceptRequest=(orderNum)=> {
		console.log(orderNum);
		if(confirm("수락을 확정하시겠습니까?")){
	
			$.ajax({
				url: "<%=request.getContextPath()%>/acceptUpdate.do",
				data: {"orderNum":orderNum},
				success: data=()=>{
					alert("수락완료");
					location.reload();
				}
				
			});
			
		}else{
			
		} 
	}
	
	const acceptAlert=()=>{
		alert("이미 수락이 완료되었습니다!");
	}
	
	
</script>
<style>
		.outer{
		width:100%;
		min-width : 1000px;
		/* background: rgb(248, 249, 250); */
		box-shadow: rgba(0, 0, 0, 0.06) 0px 0px 4px 0px;
		margin:auto;
		margin-top : 70px;
		margin-bottom : 70px;
	}
	
	#joinForm {
		margin: auto;
		padding: 10px;
		text-align:center;
	}
	

	.table {
      border-collapse: collapse;
      border-top: 3px solid rgb(77, 78, 79);
	  text-align:center;
		margin: auto;
		padding: 10px;
    }  
    .table th {
      color: rgba(0, 0, 0, 0.861);
      background: #dadada46;
      text-align: center;
    }

    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}

	.button {
	  text-align:right;
    }  

	.likeabutton {
    text-decoration: none; 
    font: menu;
    display: inline-block; 
    padding: 2px 8px;
    background: ButtonFace; 
    color: ButtonText;
    border-style: solid; 
    border-width: 2px;
    border-color: ButtonHighlight ButtonShadow ButtonShadow ButtonHighlight;
	}
	
	.likeabutton:active {
    border-color: ButtonShadow ButtonHighlight ButtonHighlight ButtonShadow;
	}


	
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
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
			<li><a href="<%=request.getContextPath()%>/">Home</a></li>
			<li><a href="<%=request.getContextPath()%>/testPlace">검색</a></li>
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
			<input type="text" name="searchKeyword" size="25" placeholder="키워드를 입력하세요" list="ids">
			<datalist id="ids"></datalist>
			<button type="submit" class="btn btn-primary">검색</button>
		</form>
	</div>
	<div id="Toggle2"  style="display:none; text-align:center">
		<form id="search" action="${path }/searchTema" method="post">
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
				<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>
	<div id="Toggle3"  style="display:none; text-align:center">
		<form action="${path }/searchArea">
			<div class="citytravel1">
				<select name="addressDo" id="addressDo" onchange="addressDochange(this)">
					<option value="sigun">시/도 선택</option>
					<option value="서울">서울</option>
					<option value="인천">인천</option>
					<option value="경기도">경기도</option>
					<option value="강원도">강원도</option>
					<option value="충청북도">충청북도</option>
					<option value="충청남도">충청남도</option>
					<option value="대전">대전</option>
					<option value="세종">세종</option>
					<option value="경상북도">경상북도</option>
					<option value="경상남도">경상남도</option>
					<option value="대구">대구</option>
					<option value="울산">울산</option>
					<option value="부산">부산</option>
					<option value="전라북도">전라북도</option>
					<option value="전라남도">전라남도</option>
					<option value="광주">광주</option>
					<option value="제주">제주</option>
				</select>
				<select name="addressDogun" id="addressDogun">
					<option value="sigundo">시/군/구</option>
				</select>
			<button type="submit" class="btn btn-primary">검색</button>
			</div>
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

// 테마 드롭다운
let d1;
function change(e1) {

  const 자연 = ["자연관광지", "관광자원"];
  const 인문 = ["역사관광지", "휴양관광지", "체험관광지", "산업관광지", "건축/조형물", "문화시설", "축제", "공연/행사"];
  const 추천코스 = ["가족코스", "나홀로코스", "힐링코스", "도보코스", "캠핑코스", "맛코스"];
  const 레포츠 = ["레포츠 소개", "육상 레포츠", "수상 레포츠", "항공 레포츠", "복합 스포츠"];
  const 숙박 = ["숙박 시설"];
  const 쇼핑 = ["쇼핑"];
  const 음식 = ["음식점"];

  let target1 = document.getElementById("subTema");
  
  if (e1.value == "tematitle") d1 = tematitle;
  else if (e1.value == "자연") d1 = 자연;
  else if (e1.value == "인문") d1 = 인문;
  else if (e1.value == "추천코스") d1 = 추천코스;
  else if (e1.value == "레포츠") d1 = 레포츠;
  else if (e1.value == "숙박") d1 = 숙박;
  else if (e1.value == "쇼핑")  d1 = 쇼핑;
  else if (e1.value == "음식")  d1 = 음식;

  target1.options.length = 0;

  d1.forEach(v1=>{
    let opt1 = document.createElement("option");
    opt1.value = v1;
    opt1.innerHTML = v1;
    target1.appendChild(opt1);
  });
}


// 지역
let d;
    // 지역 드롭다운 함수
    function addressDochange(e) {

      const 서울 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
      const 인천 = ["강화군", "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "옹진군", "중구"];
      const 경기도 = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"];
      const 강원도 = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"];

      const 충청북도 = ["괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "제천시", "진천군", "청원군", "청주시", "충주시", "증평군"];
      const 충청남도 = ["공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아신시", "예산군", "천안시", "청양군", "태안군", "홍성군", "계룡시"];
      const 대전 = ["대덕구", "동구", "서구", "유성구", "중구"];
      const 세종 = ["세종특별자치시"];
      const 경상북도 = ["경산시", "경주시", "고령군", "구미시", "군위군", "김천시", "문경시", "봉화군", "상주시", "성주군", "안동시", "영덕군", "영양군", "영주시", "영천시", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군", "포항시"];
      const 경상남도 = ["거제시", "거창군", "고성군", "김해시", "남해군", "마산시", "밀양시", "사천시", "산청군", "양산시", "의령군", "진주시", "진해시", "창녕군", "창원시", "통영시", "하동군", "함안군", "함양군", "합천군"];

      const 대구 = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];
      const 울산 = ["중구", "남구", "동구", "북구", "울주군"];
      const 부산 = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"];

      const 전라북도 = ["고창군", "군산시", "김제시", "남원시", "무주군", "부안군", "순창군", "완주군", "익산시", "임실군", "장수군", "전주시", "정읍시", "진안군"];
      const 전라남도 = ["강진군", "고흥군", "곡성군", "광양시", "구례군", "나주시", "담양군", "목포시", "무안군", "보성군", "순천시", "신안군", "여수시", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
      const 광주 = ["광산구", "남구", "동구", "북구", "서구"];

      const 제주 = ["남제주군", "북제주군", "서귀포시", "제주시"];

      const target = document.getElementById("addressDogun");

      if (e.value == "서울") d = 서울;
      else if (e.value == "인천") d = 인천;
      else if (e.value == "경기도") d = 경기도;
      else if (e.value == "강원도") d = 강원도;
      else if (e.value == "충청북도") d = 충청북도;
      else if (e.value == "충청남도") d = 충청남도;
      else if (e.value == "대전")  d = 대전;
      else if (e.value == "세종")  d = 세종;
      else if (e.value == "경상북도")  d = 경상북도;
      else if (e.value == "경상남도") d = 경상남도;
      else if (e.value == "대구") d = 대구;
      else if (e.value == "울산") d = 울산;
      else if (e.value == "부산") d = 부산;
      else if (e.value == "전라북도") d = 전라북도;
      else if (e.value == "전라남도") d = 전라남도;
      else if (e.value == "광주") d = 광주;
      else if (e.value == "제주") d = 제주;

      target.options.length = 0;

      d.forEach(v1=>{
        let opt = document.createElement("option");
        opt.value = v1;
        opt.innerHTML = v1;
        target.appendChild(opt);
      });
    }

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
#mainTema {
	width: 120px;
	height: 30px;
	text-align: center;
}

#subTema {
	width: 120px;
	height: 30px;
	text-align: center;
}
.btnTest{

	display : inline-block;
}


#addressDo {
	width: 120px;
	height: 30px;
	text-align: center;
}

#addressDogun {
	width: 120px;
	height: 30px;
	text-align: center;
}
</style>


</section><!-- End About Section -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
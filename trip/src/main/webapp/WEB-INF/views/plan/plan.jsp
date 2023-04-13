<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>플랜</h2>
            <p>다양한 플랜을 검색해보세요.</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/plan">플랜</a></li>
        </ol>
      </div>
    </section>
<section id="about" class="about">
	<div class="container">
		<br>
		<div id="search-option-container" style="text-align:center;">
			<button id="btn_toggle2" class="btn btn-primary">테마 검색</button>
			<button id="btn_toggle3" class="btn btn-primary">지역 검색</button>
			<button id="btn_toggle4" class="btn btn-primary">키워드 검색</button>
			<button id="btn_toggle1" class="btn btn-primary">통합 검색</button>
			<a class="btn btn-primary" href="<%=request.getContextPath()%>/planMake">플랜 작성</a>
			<a class="btn btn-primary" href="<%=request.getContextPath()%>/planMakeTest">플랜작성테스트</a>
		</div>
		<br>
		<div>
			<div id="Toggle1"  style="display:none; text-align:center">
				<form action="${pageContext.request.contextPath }/searchPlace" method="get">
					<div class="travel1">
						<select name="mainTema" id="mainTema" onchange="change(this)">
							<option value="tematitle">테마 선택</option>
							<option value="자연">자연</option>
							<option value="인문(문화/예술/역사)">인문(문화/예술/역사)</option>
							<option value="추천코스">추천코스</option>
							<option value="레포츠">레포츠</option>
							<option value="숙박">숙박</option>
							<option value="쇼핑">쇼핑</option>
							<option value="음식">음식</option>
						</select>
						<select name="subTema" id="subTema">
							<option value="subtematitle">상세테마 선택</option>
						</select>
						<select name="area" id="area" onchange="areachange(this)">
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
							<option value="제주도">제주도</option>
						</select>
						<select name="sigungu" id="sigungu">
							<option value="sigundo">시/군/구</option>
						</select>
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
			<div id="Toggle2"  style="display:none; text-align:center">
				<form id="search" action="${path }/searchTema" method="get">
					<div class="travel1">
						<select name="mainTema" id="mainTema" onchange="changeT(this)">
							<option value="tematitle1">테마 선택</option>
							<option value="자연">자연</option>
							<option value="인문(문화/예술/역사)">인문(문화/예술/역사)</option>
							<option value="추천코스">추천코스</option>
							<option value="레포츠">레포츠</option>
							<option value="숙박">숙박</option>
							<option value="쇼핑">쇼핑</option>
							<option value="음식">음식</option>
						</select>
						<select name="subTema1" id="subTema1">
							<option value="subtematitle">상세테마 선택</option>
						</select>
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
			<div id="Toggle3"  style="display:none; text-align:center">
				<form action="${path }/searchArea">
					<div class="citytravel1">
						<select name="area" id="area" onchange="changeA(this)">
							<option value="sigun1">시/도 선택</option>
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
							<option value="제주도">제주도</option>
						</select>
						<select name="sigungu1" id="sigungu1">
							<option value="sigundo">시/군/구</option>
						</select>
					<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
			<div id="Toggle4"  style="display:none; text-align:center">
				<div class="keyword">
					<form action="${path }/searchKeyword">
						<input type="text" name="keyword" size="25" placeholder="키워드 검색">
						<button type="submit" class="btn btn-primary">검색</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<section id="services" class="services ">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-airplane" style="color: #ff689b;"></i></div>
					<h4 class="title"><a href="">서울에서 해남까지</a></h4>
					<p class="description">우리 모두 땅끝마을로 떠나봅시다.</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-book" style="color: #e9bf06;"></i></div>
						<h4 class="title"><a href="">제주도의 푸른밤</a></h4>
						<p class="description">떠나요 둘이서 떠나요 둘이서 모든 걸 훌훌 버리고 </p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="icon-box">
						<div class="icon"><i class="bi bi-card-checklist" style="color: #3fcdc7;"></i></div>
						<h4 class="title"><a href="">여행을 떠나요</a></h4>
						<p class="description">푸른 언덕에 배낭을 메고 황금빛 태양</p>
					</div>
				</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-binoculars" style="color:#41cf2e;"></i></div>
					<h4 class="title"><a href="">고속도로 로망스</a></h4>
					<p class="description">창을 열어 소리쳐봐 우리는 바다로 향</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-globe" style="color: #d6ff22;"></i></div>
					<h4 class="title"><a href="">너와 나 단 둘이서 떠나가는 여행</a></h4>
					<p class="description">난 너와 같은 차를 타고 난 너와 같은 곳을 보고</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="icon-box">
					<div class="icon"><i class="bi bi-clock" style="color: #4680ff;"></i></div>
					<h4 class="title"><a href="">끝없이 이어진 저 철길 따라</a></h4>
					<p class="description">Guitar를 메고 떠나는 여행길</p>
				</div>
			</div>
		</div>
	</div>
</section><!-- End Services Section -->
<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>

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
$(function (){
	$("#btn_toggle4").click(function (){
  	$("#Toggle4").toggle();
  });
});

// 테마 드롭다운
let d1;
function change(e1) {

  const 자연 = ["자연 관광지", "관광자원"];
  const 인문 = ["역사 관광지", "휴양 관광지", "체험 관광지", "산업 관광지", "건축/조형물", "문화시설", "축제", "공연/행사"];
  const 추천코스 = ["가족코스", "나홀로코스", "힐링코스", "도보코스", "캠핑코스", "맛코스"];
  const 레포츠 = ["레포츠 소개", "육상 레포츠", "수상 레포츠", "항공 레포츠", "복합 스포츠"];
  const 숙박 = ["숙박시설"];
  const 쇼핑 = ["쇼핑"];
  const 음식 = ["음식점"];

  let target1 = document.getElementById("subTema");
  
  if (e1.value == "tematitle") d1 = tematitle;
  else if (e1.value == "자연") d1 = 자연;
  else if (e1.value == "인문(문화/예술/역사)") d1 = 인문;
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

let d2
function changeT(e2) {

  const 자연 = ["자연 관광지", "관광 자원"];
  const 인문 = ["역사 관광지", "휴양 관광지", "체험 관광지", "산업 관광지", "건축/조형물", "문화시설", "축제", "공연/행사"];
  const 추천코스 = ["가족코스", "나홀로코스", "힐링코스", "도보코스", "캠핑코스", "맛코스"];
  const 레포츠 = ["레포츠 소개", "육상 레포츠", "수상 레포츠", "항공 레포츠", "복합 스포츠"];
  const 숙박 = ["숙박시설"];
  const 쇼핑 = ["쇼핑"];
  const 음식 = ["음식점"];

  let target2 = document.getElementById("subTema1");
  
  if (e2.value == "tematitle1") d2 = tematitle;
  else if (e2.value == "자연") d2 = 자연;
  else if (e2.value == "인문(문화/예술/역사)") d2 = 인문;
  else if (e2.value == "추천코스") d2 = 추천코스;
  else if (e2.value == "레포츠") d2 = 레포츠;
  else if (e2.value == "숙박") d2 = 숙박;
  else if (e2.value == "쇼핑")  d2 = 쇼핑;
  else if (e2.value == "음식")  d2 = 음식;

  target2.options.length = 0;

  d2.forEach(v2=>{
    let opt2 = document.createElement("option");
    opt2.value = v2;
    opt2.innerHTML = v2;
    target2.appendChild(opt2);
  });
}

// 지역
let d;
    // 지역 드롭다운 함수
    function areachange(e) {

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

      const 제주도 = ["남제주군", "북제주군", "서귀포시", "제주시"];

      const target = document.getElementById("sigungu");

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
      else if (e.value == "제주도") d = 제주도;

      target.options.length = 0;

      d.forEach(v1=>{
        let opt = document.createElement("option");
        opt.value = v1;
        opt.innerHTML = v1;
        target.appendChild(opt);
      });
    }

let a;
    // 지역 드롭다운 함수
    function changeA(e) {

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

      const 제주도 = ["남제주군", "북제주군", "서귀포시", "제주시"];

      const target = document.getElementById("sigungu1");

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
      else if (e.value == "제주도") d = 제주도;

      target.options.length = 0;

      d.forEach(v1=>{
        let opt = document.createElement("option");
        opt.value = v1;
        opt.innerHTML = v1;
        target.appendChild(opt);
      });
    }
    

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/memberList.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=705b81233756fa3f99e7c61bf323dd7e&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Alkatra&family=Jua&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- <section>
	<div class="plan-header">
		<label class="planTitle" style="font-family: 'Jua', sans-serif;">여행 제목 : </label>
		<input type="text" name="title_input" class="title_input">
		<button class="addDay" onclick="addDay()">Day 추가</button>
		<button class="savePlan" onclick="saveClick()">저장</button>
		<button class="plan-header_button-close">닫기</button>
		<button class="closePlan"  onClick = " if (confirm ('작성 취소하겠습니까?')) history.back(); ">닫기</button>
		
	</div>
</section> -->
<section id="breadcrumbs" class="breadcrumbs">
	<div class="plan-header">
		<button class="addDay" onclick="addDay()">Day 추가</button>
		<button class="savePlan" onclick="saveClick()">저장</button>
		<button class="closePlan"  onClick = " if (confirm ('작성 취소하겠습니까?')) history.back(); ">닫기</button>
		
	</div>
</section>
<section class="layout">
	<div class="day">
		<div class="schedule">
			<h3>일정</h3>
		</div>
		<div id="dayBox" class="dayBox">
		</div>
	</div>
	<div class="myPlaces">
	<div class="myPlacesOne">
		<h3 class="placeName">장소</h3>
	</div>
	<div class="placeBox" id="placeBox"></div>
	</div>
	<div class="places">
		<div class="searchPlace">
			<form action="${pageContext.request.contextPath }/planKeword" method="get">
				<input class="search" type="text" name="keyword" size="6" placeholder="검색하세요" id="value" >
				<button class="searchBtn" type="submit">검색</button>
			</form>
		</div>
		<div class="placeBox">
		
			<!-- <div class="infoBox">
				<div>
					<img src="https://storage.doopedia.co.kr/upload/_upload/image5/travel/editor/2020/10/24/20201024150752312_thumb.jpg" class="placeImg">
				</div>
				<div class="infoPlace">
					<div class="infoTitle">경복궁</div>
					<div class="infoAddr">서울특별시 종로구 사직로 161</div>
					<div class="infoLat">37.578611, 126.977222</div>
				</div>
				<div class="infoAdd">
					<button onclick="addBtn1('경복궁','서울특별시 종로구 사직로 161','https://storage.doopedia.co.kr/upload/_upload/image5/travel/editor/2020/10/24/20201024150752312_thumb.jpg');" class="addBtn">+</button>
				</div>
			</div>
			<div class="infoBox">
				<div>
					<img src="https://mediahub.seoul.go.kr/wp-content/uploads/2018/04/22c5a3d1813fa21f59ba17bc17b8e934.jpg" class="placeImg">
				</div>
				<div class="infoPlace">
					<div class="infoTitle">세종문화회관</div>
					<div class="infoAddr">서울특별시 종로구 세종대로 175</div>
					<div class="infoLat">37.5725, 126.975556</div>
				</div>
				<div class="infoAdd">
					<button onclick="addBtn1('세종문화회관','서울특별시 종로구 세종대로 175','https://mediahub.seoul.go.kr/wp-content/uploads/2018/04/22c5a3d1813fa21f59ba17bc17b8e934.jpg');" class="addBtn">+</button>
				</div>
			</div>
			<div class="infoBox">
				<div>
					<img src="https://www.much.go.kr/cmm/fms/getOrgImage.do?atchFileId=FILE_000000000014528&fileSn=0" class="placeImg">
				</div>
				<div class="infoPlace">
					<div class="infoTitle">대한민국역사박물관</div>
					<div class="infoAddr">서울특별시 종로구 세종대로 198</div>
					<div class="infoLat">37.573834, 126.97811</div>
				</div>
				<div class="infoAdd">
					<button onclick="addBtn1('대한민국역사박물관','서울특별시 종로구 세종대로 198','https://www.much.go.kr/cmm/fms/getOrgImage.do?atchFileId=FILE_000000000014528&fileSn=0');" class="addBtn">+</button>
				</div>
			</div>
			<div class="infoBox">
				<div>
					<img src="http://newsimg.hankookilbo.com/2014/11/11/201411111983372861_1.jpg" class="placeImg">
				</div>
				<div class="infoPlace">
					<div class="infoTitle">보신각</div>
					<div class="infoAddr">서울특별시 종로구 종로 54</div>
					<div class="infoLat">37.56982,126.98352</div>
				</div>
				<div class="infoAdd">
					<button onclick="addBtn1('보신각','서울특별시 종로구 종로 54','http://newsimg.hankookilbo.com/2014/11/11/201411111983372861_1.jpg');" class="addBtn">+</button>
				</div>
			</div>
			<div class="infoBox">
				<div>
					<img src="http://www.bizhankook.com/upload/bk/article/202112/thumb/23046-55060-sample.jpg" class="placeImg">
				</div>
				<div class="infoPlace">
					<div class="infoTitle">명동성당</div>
					<div class="infoAddr">서울특별시 중구 명동길 74</div>
					<div class="infoLat">37.564167, 126.987306</div>
				</div>
				<div class="infoAdd">
					<button onclick="addBtn1('명동성당','서울특별시 중구 명동길 74','http://www.bizhankook.com/upload/bk/article/202112/thumb/23046-55060-sample.jpg');" class="addBtn">+</button>
				</div>
			</div> -->
			<c:if test="${place ne null }">
			<c:forEach items="${place}" var="p">
				<div class="infoBox">
					<div>
						<c:if test="${p.firstImage ne null }" >
							<img src="${p.firstImage }" class="placeImg">
						</c:if>
						<c:if test="${p.firstImage eq null }">
							<img src="${path }/resources/img/basicImg.png" class="placeImg">
						</c:if>
					</div>
					<div class="infoPlace">
						<div class="infoTitle">${p.title}</div>
						<div class="infoAddr">${p.address}</div>
					</div>
					<div class="infoAdd">
						<c:if test="${p.firstImage ne null }" >
							<button onclick="addBtn1('${p.title}','${p.address}','${p.firstImage}');" class="addBtn">+</button>
						</c:if>
						<c:if test="${p.firstImage eq null }">
							<button onclick="addBtn1('${p.title}','${p.address}','${path }/resources/img/basicImg.png');" class="addBtn">+</button>
						</c:if>
						<%-- <button onclick="addBtn1('${p.title}','${p.address}','${p.firstImage}');" class="addBtn">+</button> --%>
					</div>
				</div>
			</c:forEach>
			</c:if>
			<div id="pageBar"><c:out value="${pageBar }" escapeXml="false"/></div>
		</div>
	</div>
	<div id="map" style="width:1000px;height:698px;"></div>
</section>

	<div class="fDiv">
		<div class="calendar">
			<label class="calendar_detail_01">여행 시작일 : </label>
			<input class="input-date" type="date" id="sdate" value="" min=""/>
			<p class="wave">  ~   </p>
			<label class="calendar_detail_02">여행 종료일 : </label>
			<input class="input-date" type="date" id="edate" value="" min=""/>
		</div>
		<div>
			<button class="resetPlan" onclick="reloadP()">초기화</button>
		</div>
	</div>


<script>
// 지도를 표시할 div
var mapContainer = document.getElementById('map'),
	mapOption = {
		// 지도의 중심좌표
		center: new kakao.maps.LatLng(37.5725, 126.975556),
		level: 6 // 지도의 확대 레벨
	};
	
// 지도를 생성
var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커생성될  위치
var markerPosition  = new kakao.maps.LatLng(37.578611, 126.977222); 

// 마커를 생성합니다
/* var marker = new kakao.maps.Marker({
	position: markerPosition
}); */

// 마커 테스트를 해보자
var latLat = document.getElementsByClassName("infoLat");
var latAddr = document.getElementsByClassName("myAddr");
var infoAddr = document.getElementsByClassName("info");
var latTitle = document.getElementsByClassName("myTitle");

var latT = [];

for(var i=0;i<latTitle.length;i++){
	latT.push(latLat[i].innerHTML)
	console.log(latT);
}
console.log(latT);


// 마커 여러개 예시
var positions = [
	{
        title: '경복궁', 
        latlng: new kakao.maps.LatLng(37.578611, 126.977222),
    	place : '37.578611, 126.977222',
    	addr : '서울특별시 종로구 사직로 161',
    	image : 'https://storage.doopedia.co.kr/upload/_upload/image5/travel/editor/2020/10/24/20201024150752312_thumb.jpg'
    },
    {
        title: '세종문화회관', 
        latlng: new kakao.maps.LatLng(37.5725, 126.975556),
    	place : '37.5725, 126.975556',
    	addr : '서울특별시 종로구 세종대로 175',
    	image : 'https://mediahub.seoul.go.kr/wp-content/uploads/2018/04/22c5a3d1813fa21f59ba17bc17b8e934.jpg'
    },
    {
        title: '대한민국역사박물관', 
        latlng: new kakao.maps.LatLng(37.573834, 126.97811),
    	place : '37.573834, 126.97811',
    	addr : '서울특별시 종로구 세종대로 198',
    	image : 'https://www.much.go.kr/cmm/fms/getOrgImage.do?atchFileId=FILE_000000000014528&fileSn=0'
    },
    {
        title: '보신각',
        latlng: new kakao.maps.LatLng(37.56982,126.98352),
    	place : '37.56982,126.98352',
    	addr : '서울특별시 종로구 종로 54',
    	image : 'http://newsimg.hankookilbo.com/2014/11/11/201411111983372861_1.jpg'
    },

    {
        title: '명동성당',
        latlng: new kakao.maps.LatLng(37.564167, 126.987306),
    	place : '37.564167, 126.987306',
    	addr : '서울특별시 중구 명동길 74',
    	image : 'http://www.bizhankook.com/upload/bk/article/202112/thumb/23046-55060-sample.jpg'
    }
];

// 마커 이미지
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

// 마커 여러개 맵에 표시하기
for (var i = 0; i < positions.length; i ++) {
	
	// 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(24, 35);
	
	// 마커 이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: positions[i].latlng, // 마커를 표시할 위치
		//title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		image : markerImage, // 마커 이미지
		//content : content
	});
	var content="";
	// 인포윈도우로 장소에 대한 설명을 표시합니다
/* var infowindow = new kakao.maps.InfoWindow({
		//content: '<div style="width:150px;text-align:center;padding:6px 0;">'+positions[i].title+'</div>'
		//content: '<div style="padding:5px; width:100px; height:100px;">'+positions[i].title+ '<br><a href="https://map.kakao.com/link/to/'+positions[i].title+','+positions[i].place+'/"'+' style="color:blue" target="_blank">길찾기</a></div>'
		content : '<div class="wrap">' + 
		'<div class="info">' + 
		'<div class="title">' + 
			positions[i].title + 
		'</div>' + 
		'<div class="body">' + 
			'<div class="img">' +
				'<img src="'+ positions[i].image+'" width="73" height="70">' +
			'</div>' + 
			'<div class="desc">' + 
				'<div class="ellipsis">'+positions[i].addr+'</div>' + 
				'<div><a href="https://map.kakao.com/link/to/'+positions[i].title+','+positions[i].place+'/"" target="_blank" class="link">길찾기</a></div>' + 
			'</div>' + 
		'</div>' + 
	'</div>' +    
	'</div>'
        		
	}); */
	//infowindow.open(map, marker);
content = '<div class="wrap">' + 
	'<div class="info">' + 
	'<div class="title">' + 
		positions[i].title + 
	'</div>' + 
	'<div class="body">' + 
		'<div class="img">' +
			'<img src="'+ positions[i].image+'" width="73" height="70">' +
		'</div>' + 
		'<div class="desc">' + 
			'<div class="ellipsis">'+positions[i].addr+'</div>' + 
			'<div><a href="https://map.kakao.com/link/to/'+positions[i].title+','+positions[i].place+'/"" target="_blank" class="link">길찾기</a></div>' + 
		'</div>' + 
	'</div>' + 
'</div>' +    
'</div>';
var overlay = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: positions[i].latlng       
});
kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});
}

/* // 마커 선 잇기
var linePath;
var lineLine = new daum.maps.Polyline();
var distance;

for (var i = 0; i < positions.length; i++) {
	if (i != 0) {
		linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정
	};
	
	// 라인 설정
	lineLine.setPath(linePath);
	
	var drawLine = new daum.maps.Polyline({
		map : map, // 선을 표시할 지도입니다
		path : linePath,
		strokeWeight : 3, // 선의 두께
		trokeColor : '#db4040', // 선의 색깔
		strokeOpacity : 1, // 선의 불투명도입니다
		strokeStyle : 'solid' // 선의 스타일
	});
} */
	
// 마커가 지도 위에 표시되도록 설정
marker.setMap(map);

// 지도를 표시하는 div 크기를 변경하는 함수
function resizeMap() {
	var mapContainer = document.getElementById('map');
	mapContainer.style.width = '480px';
	mapContainer.style.height = '698px';
	relayout();
}

// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있다.
// 그래서 map.relayout 함수를 호출
// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출된다고 한다.
function relayout() {
	map.relayout();
}

const titles = document.getElementsByClassName("infoTitle");   
// const titles = document.getElementsByClassName("infoTitle");   
const addrs = document.getElementsByClassName("infoAddr");   
	

function reloadP(){
	location.reload();
}

// 달력 클릭 시 해당 기간만큼 dayBox 생성
var sdate;
var edate;
var dTime = 24*60*60*1000;
var diff;
var day;

const sd = document.getElementById("sdate");
sd.addEventListener("input", function(e) {
	// console.log(e.target.value);
	var currentSdate = e.target.value;
	// console.log(currentSdate);
	
	if(currentSdate == sdate) {
		return;
	}
	
	sdate = new Date(currentSdate);
	console.log("첫째날 : "+sdate);
	// diff  = edate - sdate;
	// day = (parseInt(diff/dTime))+1;
	// console.log(day);
})

const ed = document.getElementById("edate");
ed.addEventListener("input", function(e) {
	// console.log(e.target.value);
	var currentSdate = e.target.value;
	if(currentSdate == edate) {
		return;
	}
	
	edate = new Date(currentSdate);
	console.log("마지막날 : "+edate);
	diff  = edate - sdate;
	day = (Math.abs(diff / (1000 * 60 * 60 * 24)))+1;
	console.log("두 날짜 차이 : "+day);
	for(var i=1; i<=day; i++){
		addDay();
	}
})
        

// 클릭한 Day Div만 색상 변경 -> 다른 Day Div클릭하면 그 Div만 색상변경
var div2 = document.getElementsByClassName("eachDay");
// 클릭하면 claass명에 "clicked"생성 -> 다시 클릭하면 삭제
function handleClick(event) {
	console.log(event.target.classList);
	
	if (event.target.classList[1] === "clicked") {
		event.target.classList.remove("clicked");
	} else {
		for (var i = 0; i < div2.length; i++) {
			div2[i].classList.remove("clicked");
		}
		event.target.classList.add("clicked");
	}
}

function changeColor() {
	for (var i = 0; i < div2.length; i++) {
		div2[i].addEventListener("click", handleClick);
	}
}
	
// Day 클릭 시 장소 -> Day(해당 날짜로 변경)
function writeDay(value) {
	// document.getElementById("oneoneone").innerHTML = "DAY " + cnt;
	let x = document.getElementsByClassName("placeName")[0];
	x.innerText = "Day"+value;
	console.log(x);
}
	
// Day추가 버튼 누를때마다 카운팅
let cnt = 1;
	
// Day추가 버튼 누를 시 Day1, Day2...생성
const addDay=()=>{
	const tab1 = document.getElementById("dayBox");
	const dDiv = document.createElement("div");
	dDiv.setAttribute("class","eachDay");
	dDiv.innerText="Day"+(tab1.childElementCount+cnt);
	tab1.appendChild(dDiv);
	dDiv.ondblclick = function(){
		p = this.parentElement; //부모 HTML 태그요소
		p.removeChild(tab1.lastChild); // 자신을 부모 태그로 부터 제거
	}
	
	console.log(tab1.childElementCount);
	//cnt=tab1.childElementCount;
	changeColor(); // 생성과 동시에 함수 적용(클릭하면 색상변경)
}
	
// 장소 내 일정에 추가(일정에 추가된 장소 클릭 하면 다시 삭제기능)
const addBtn1=(title,adr,imgs)=>{
	// const p1 = document.createElement("p");
	// p1.innerText=adr;
	imgDiv = document.createElement("div");
	img = document.createElement("img");
	img.setAttribute("src", imgs);
	img.setAttribute("class", "myImg");
	imgDiv.appendChild(img);
	
	const newDiv = document.createElement("div");
	const newCont = document.querySelector('list1');
	newDiv.setAttribute("class", "myBox");
	newDiv.setAttribute("draggable","true");
	newDiv.setAttribute("style","background-color: skyblue;")
	
	const myPlace = document.createElement("div");
	myPlace.setAttribute("class", "myPlace");
	
	const myTitle = document.createElement("div");
	myTitle.setAttribute("class", "myTitle");
	myTitle.innerText = title;
	
	const myAddr = document.createElement("div");
	myAddr.setAttribute("class", "myAddr");
	myAddr.innerText = adr;
	
	// 클릭시 제거 함수 적용 -> 생성과 동시에 적용해야 한다.
	newDiv.onclick = function(){
		p = this.parentElement; //부모 HTML 태그요소
		p.removeChild(this); // 자신을 부모 태그로 부터 제거
	}
	
	addEventsDragAndDrop(newDiv); // 드래그 함수 적용 -> 클릭제거 함수와 마찬가지로 이것도 생성할때 적용해줘야 함.
	newDiv.appendChild(imgDiv);
	document.getElementById("placeBox").appendChild(newDiv); // 생성된 div(myDiv)를 상위 div(list1)에 자식으로 넣는다.
	newDiv.appendChild(myPlace);
	myPlace.appendChild(myTitle);
	myPlace.appendChild(myAddr);
}

// Drag and Drop 적용
var dragEl = null;
function dragStart(e) {
	this.style.opacity = '0.4';
	dragEl = this;
	e.dataTransfer.effectAllowed = 'move';
	e.dataTransfer.setData('text/html', this.innerHTML);
}
        
function dragOver(e) {
	if (e.preventDefault) {
		e.preventDefault();
	}
	e.dataTransfer.dropEffect = 'move';
	return false;
}

function dragEnter(e) {
	this.classList.add('over');
}

function dragLeave(e) {
	this.classList.remove('over');
}

function drop(e) {
	if (e.stopPropagation) {
		e.stopPropagation(); // e.stopPropagation는 이벤트가 상위 엘리먼트에 전달되지 않게 막아 준다.
	}
	if (dragEl != this) {
		dragEl.innerHTML = this.innerHTML;
		this.innerHTML = e.dataTransfer.getData('text/html');
	}
	return false;
}

function dragEnd(e) {
	this.style.opacity = '1';
	items.forEach(function (item) {
		item.classList.remove('over');
	});
}

let items = document.querySelectorAll('.infoBox');
items.forEach(function(item) {
	addEventsDragAndDrop(item);
});

function addEventsDragAndDrop(el) {
	el.addEventListener('dragstart', dragStart, false);
	el.addEventListener('dragenter', dragEnter, false);
	el.addEventListener('dragover', dragOver, false);
	el.addEventListener('dragleave', dragLeave, false);
	el.addEventListener('drop', drop, false);
	el.addEventListener('dragend', dragEnd, false);
}
</script>

<Style>
body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	font-family: 'Jua', sans-serif;
	font-size: 20px;
}

.layout {
	width: 100%;
	height: 700px;
	display: flex;
	gap: 16px;
	margin-bottom: 0%;
}

/* 폰트 */

.Jua{
	font-family: 'Alkatra', cursive;
	font-family: 'Jua', sans-serif;
}
        
/* 헤더 */
.savePlan {
	width: 75px;
	height: 35px;
	position: absolute;
	top: 15px;
	right: 140px;
	cursor: pointer;
	background-color: #6571a3;
	border: none;
	border-radius: 3px;
	font-size: 20px;
	font-family: 'Jua', sans-serif;
	color: white;
}
.savePlan:hover {
	background-color: #003476;
}

.addDay	{
	width: 100px;
	height: 35px;
	position: absolute;
	top: 15px;
	right: 250px;
	cursor: pointer;
	background-color: #6571a3;
	border: none;
	border-radius: 3px;
	font-size: 20px;
	font-family: 'Jua', sans-serif;
	color: white;
}
.addDay:hover {
	background-color: #003476;
}
.closePlan {
	width: 75px;
	height: 35px;
	position: absolute;
	top: 15px;
	right: 40px;
	cursor: pointer;
	background: #6571a3;
	color: #383838;
	border: none;
	border-radius: 3px;
	font-size: 20px;
	font-family: 'Jua', sans-serif;
	color: white;
}
.closePlan:hover {
	background-color: #003476;
}
.planTitle {
	left: 10px;
	font-size: 19px;
	width: 50px;
	overflow: hidden;
	text-overflow: ellipsis;
	font-family: 'Jua', sans-serif;
}
        
.title_input {
	width: 250px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	margin-top: 10px;
	font-family: 'Jua', sans-serif;
	text-align: center;
}

label {
	font-family: 'Jua', sans-serif;
	font-size: 20px;
	text-align: center;
}

.plan-header	{
	width: 100%;
	border-bottom: 1px solid ivory;
	height: 60px;
	text-align: center;
}

/* 일정 */
#dayTable	{
	margin: 0;
	width: 100%;
}

.dtBox button{
	background-color: #B7E1F5;
	border: none;
	cursor: pointer;
	padding: 25px 0;
	font-size: 22px;
	border-bottom: 1px solid white;
	width: 100%;
	margin-bottom: 0px;
	color: #0c3b54;
	font-family: 'Jua', sans-serif;
}

.dtBox button:hover {
	background-color: #b7d6f5;
}

.eachDay {
	background-color: #B7E1F5;
	border: none;
	cursor: pointer;
	padding: 25px 0;
	font-size: 22px;
	border-bottom: 1px solid white;
	width: 100%;
	margin-bottom: 0px;
	color: #0c3b54;
	font-family: 'Jua', sans-serif;
}

.schedule {
	width: 133px;
	height: 50px;
	text-align: center;
	margin: 0;
	margin-bottom: 10px;
	background-color: antiquewhite;
}
        
.day {
	text-align: center;
	width: 152px;
	height: 698px;
	margin-left: 20px;
	margin-bottom: 0%;
	background-color: white;
	border: 1px solid black;
	overflow: scroll;
}

.day h3 {
	margin: 0;
	line-height: 50px;
}

.clicked {
	background-color:antiquewhite;
}

/* 검색 */
.search {
	width: 160px;
	height: 25px;
	margin: 20px 10px 3px 13px;
	font-family: 'Jua', sans-serif;
}
        
.search {
	width: 150px;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	margin-top: 8px;
	font-family: 'Jua', sans-serif;
	text-align: center;
	
}

.searchBtn	{
	background-color: #6571a3;
	cursor: pointer;
	border: none;
	font-family: 'Jua', sans-serif;
	font-size: 18px;
	border-radius: 3px;
	color:white;
}
.searchBtn:hover {
	background-color: #003476;
}

/* 내 장소 */
.myPlaces {
	text-align: center;
	width: 270px;
	height: 698px;
	margin-bottom: 0%;
	border: 1px solid black;
	background-color: white;
	overflow: scroll;
}
        
.myPlacesOne {
	width: 250px;
	height: 50px;
	text-align: center;
	margin: 0;
	margin-bottom: 10px;
	background-color: antiquewhite;
}

.myPlacesOne h3 {
	margin: 0;
	line-height: 50px;
}

.myBox {
	width: 250px;
	height: 89px;
	text-align: center;
	margin-bottom: 10px;
	background-color: antiquewhite;
}

.myImg {
	margin: 5px;
	float: left;
	width: 80px;
	height: 80px;
}

.myPlace {
	width: 80px;
	height: 80px;
	float: left;
	margin: 5px;
}

.myTitle {
	font-size: 20px;
	width: 120px;
	height: 25px;
	float: left;
	margin: 5px;
	text-overflow: ellipsis;
	overflow:hidden;
	white-space:nowrap;
	text-align: left;
}

.myAddr {
	font-size: 13px;
	width: 120px;
	height: 25px;
	float: left;
	margin: 5px;
	text-overflow: ellipsis;
	overflow:hidden;
	white-space:nowrap;
	text-align: left;
}

/* 검색 장소 */
.places {
	width: 270px;
	height: 698px;
	background-color: white;
	border: 1px solid black;
	overflow: scroll;
}

.searchPlace {
	width: 250px;
	height: 50px;
	text-align: center;
	margin-bottom: 10px;
	background-color: antiquewhite;
}

/* infoBox */
.infoBox {
	width: 250px;
	height: 89px;
	text-align: center;
	margin-bottom: 10px;
	background-color: #6571a3;
/* 	background-color: rgba(148, 192, 69, 0.8); */
}

.placeImg {
	margin: 5px;
	float: left;
	width: 80px;
	height: 80px;
}

.infoPlace {
	width: 80px;
	height: 80px;
	float: left;
	margin: 5px;
}

.infoTitle {
	font-size: 20px;
	width: 120px;
	height: 25px;
	float: left;
	margin: 5px;
	text-overflow: ellipsis;
	overflow:hidden;
	white-space:nowrap;
	text-align: left;
	color:white
}

.infoAddr {
	font-size: 13px;
	width: 120px;
	height: 25px;
	float: left;
	margin: 5px;
	text-overflow: ellipsis;
	overflow:hidden;
	white-space:nowrap;
	text-align: left;
	color:white;
}

.infoLat {
	font-size: 13px;
	width: 120px;
	height: 25px;
	float: left;
	margin: 5px;
	text-overflow: ellipsis;
	overflow:hidden;
	white-space:nowrap;
	text-align: left;
	color:white;
}

.pAddr p {
	font-size: 22px;
	white-space : nowrap;
	text-overflow: ellipsis;
	overflow:hidden;
}

.infoAdd {
	width: 60px;
	height: 80px;
	float: left;
	margin: 5px;
}

.addBtn {
	width: 23px;
	height: 23px;
	border: 2px solid #6571a3;
	border-radius: 4px;
	background-color: white;
	color: #6571a3;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	padding: 0;
	float: right;
}

/* 지도 */
#map {
	flex-grow: 1;
	margin-right: 20px;
	border: 1px solid black;
}

/* footer */
.fDiv {
	border: 1px solid black;
	margin: 19px;
	width: 1451px;
	height: 50px;
}

.calendar {
	right:1100px;
}

.calendar_detail_01 {
	position:absolute;
	left:400px;
}

.calendar_detail_02 {
	position:absolute;
	left:700px;
}

#sdate {
	position:absolute;
	width: 120px;
	height: 35px;
	left:500px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom : 1px solid black;
	text-align: center;
}

#edate {
	position:absolute;
	width: 120px;
	height: 35px;
	left:800px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom : 1px solid black;
	text-align: center;
}

.wave {
	position:absolute;
	width: 50px;
	height: 50px;
	left:635px;
	text-align: center;
}

.resetPlan {
	width: 85px;
	height: 35px;
	position: absolute;
	right: 40px;
	cursor: pointer;
	background: aliceblue;
	color: #383838;
	border: none;
	border-radius: 3px;
	font-size: 20px;
	font-family: 'Jua', sans-serif;
	margin: 10px;
}


.wrap {
	position: absolute;
	left:0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	line-height: 1.5;
}
    
.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

/* .wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
} */

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
	font-family: 'Jua', sans-serif;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</Style>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
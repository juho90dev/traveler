<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=705b81233756fa3f99e7c61bf323dd7e&libraries=services"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Alkatra&family=Jua&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
		<div id="dayBox" class="dayBox"></div>
	</div>
	<div class="myPlaces">
		<div class="myPlacesOne">
			<h3 class="placeName">장소</h3>
		</div>
		<div class="placeBox" id="placeBox"></div>
	</div>
	<div id="map" style="width:600px;height:698px;"></div>
	<div class="places">
		<div class="searchPlace">
			<form action="${pageContext.request.contextPath }/planKeword" method="get">
				<input class="search" type="text" name="keyword" size="6" placeholder="검색하세요" id="value">
				<button class="searchBtn" type="submit">검색</button>
			</form>
		</div>
		<div class="placeBox">
			<div class="infoBox">
				<div>
					<img src="https://storage.doopedia.co.kr/upload/_upload/image5/travel/editor/2020/10/24/20201024150752312_thumb.jpg" class="placeImg">
				</div>
				<div class="infoPlace">
					<div class="infoTitle">경복궁</div>
					<div class="infoAddr">서울특별시 종로구 사직로 161</div>
					<div class="infoLat" style="display:none;">37.578611, 126.977222</div>
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
					<div class="infoAddr" style="display:none;">37.5725, 126.975556</div>
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
					<div class="infoAddr" style="display:none;">37.573834, 126.97811</div>
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
					<div class="infoAddr" style="display:none;">37.56982,126.98352</div>
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
					<div class="infoAddr" style="display:none;">37.564167, 126.987306</div>
				</div>
				<div class="infoAdd">
					<button onclick="addBtn1('명동성당','서울특별시 중구 명동길 74','http://www.bizhankook.com/upload/bk/article/202112/thumb/23046-55060-sample.jpg');" class="addBtn">+</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

//지도 설정
var mapContainer = document.getElementById('map'),
	mapOption = {
		center: new kakao.maps.LatLng(37.578611, 126.977222), // 지도의 중심좌표
		level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성   
var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    
    
const titles = document.getElementsByClassName("infoTitle");
const addrs = document.getElementsByClassName("infoAddr");

// 지도의 크기가 변할때 설정
function reloadP() {
	location.reload();
}

// 클릭한 Day Div만 색상 변경 -> 다른 Day Div클릭하면 그 Div만 색상변경하는 함수
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

.Jua {
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

.plan-header {
	width: 100%;
	border-bottom: 1px solid ivory;
	height: 60px;
	text-align: center;
}

/* 일정 */
#dayTable {
	margin: 0;
	width: 100%;
}

.dtBox button {
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

/* 검색 */
.search {
	width: 130px;
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

.searchBtn {
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

/* 검색 장소 */
.places {
	width: 262px;
        height: 698px;
        background-color: ivory;
        border: 1px solid black;
        overflow: scroll;
        margin-right: 20px;
        margin-left: 0px;
    }
    
    .searchPlace {
        width: 243px;
        height: 50px;
        text-align: center;
        margin-bottom: 10px;
        background-color: antiquewhite;
    }
    
    /* infoBox */
    .infoBox {
        width: 243px;
        height: 89px;
        text-align: center;
        margin-bottom: 10px;
        background-color: #6571a3;
    /* 	background-color: rgba(148, 192, 69, 0.8); */
    }
    
    .placeImg {
        margin: 5px;
        float: left;
        width: 60px;
        height: 60px;
        margin-top: 15px;
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
        width: 70px;
        height: 80px;
        float: left;
        margin: 5px;
        margin-top: 10px;;
    }
    
    .addBtn {
        width: 23px;
        height: 23px;
        border: 2px solid #6571a3;
        border-radius: 4px;
        background-color: white;
        color: #6571a3;
        font-size: 17px;
        font-weight: bold;
        cursor: pointer;
        padding: 0;
        float: right;
    }
    
    /* 지도 */
    #map {
        flex-grow: 1;
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/memberList.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=705b81233756fa3f99e7c61bf323dd7e&libraries=services"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<section id="breadcrumbs" class="breadcrumbs">
	<div class="breadcrumb-hero">
		<div class="breadcrumb-hero">
			<h2>검색</h2>
			<p>다양하게 검색해 보세요.</p>
		</div>
	</div>
 	<div class="container">
		<ol>
			<li><a href="<%=request.getContextPath()%>/">Home</a></li>
			<li><a href="<%=request.getContextPath()%>/placeView/${place.contentId}"><c:out value="${place.title}"/></a></li>
		</ol>
	</div>
</section>

<!-- ======= About Section ======= -->
<section id="about" class="about">
	<div class="container">
		<div class="row justify-content-end">
			<div class="col-lg-11">
<!-- 				<div class="row justify-content-end">
					<div class="col-lg-3 col-md-5 col-6 d-md-flex align-items-md-stretch">
						<div class="count-box py-5">
							<i class="bi bi-emoji-smile"></i>
							<span data-purecounter-start="0" data-purecounter-end="65" class="purecounter">0</span>
							<p>지도보기</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-5 col-6 d-md-flex align-items-md-stretch">
						<div class="count-box py-5">
							<i class="bi bi-journal-richtext"></i>
							<span data-purecounter-start="0" data-purecounter-end="85" class="purecounter">0</span>
							<p>Projects</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-5 col-6 d-md-flex align-items-md-stretch">
						<div class="count-box pb-5 pt-0 pt-lg-5">
							<i class="bi bi-clock"></i>
							<span data-purecounter-start="0" data-purecounter-end="27" class="purecounter">0</span>
							<p>Years of experience</p>
						</div>
					</div>
					<div class="col-lg-3 col-md-5 col-6 d-md-flex align-items-md-stretch">
						<div class="count-box pb-5 pt-0 pt-lg-5">
							<i class="bi bi-award"></i>
							<span data-purecounter-start="0" data-purecounter-end="22" class="purecounter">0</span>
							<p>Awards</p>
						</div>
					</div>
				</div> -->
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 video-box align-self-baseline position-relative">
				<%-- <img src="${place.firstImage }" class="img-fluid" alt=""> --%>
				<c:if test="${place.firstImage ne null }" >
					<img src="${place.firstImage }" height="400" width="600"  style="border: 1px solid black;  background-size: cover;">
				</c:if>
				<c:if test="${place.firstImage eq null }">
					<img src="${path }/resources/img/basicImg.png"  height="400" width="600"  style="border: 1px solid black;  background-size: cover;">
				</c:if>
			</div>
			<div class="col-lg-6 pt-3 pt-lg-0 content" style="text-align:left">
				<h3 style="text-align:center"><c:out value="${place.title}"/></h3>
				<p class="fst-italic" style="text-align:center">
					주소 : <c:out value="${place.address}"/>
				</p>
				<br>
				<ul>
					<li ><i class="bx bx-check-double" ></i>tel : <c:out value="${place.tel}"/></li>
					<br>
					<li><i class="bx bx-check-double"></i><c:out value="${place.address}"/></li>
					<br>
					<li><i class="bx bx-check-double"></i><c:out value="${place.address}"/></li>
					<br>
					<li><i class="bx bx-check-double"></i><c:out value="${place.address}"/></li>
				</ul>
			</div>
		</div>
	</div>
</section><!-- End About Section -->



<section id="skills" class="skills section-bg">
	<div class="container">
		<div class="row">
			<div id="map" style="width:100%;height:450px;"></div>
		</div>
	</div>
</section>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${place.address}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
/*
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        
     // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(result[0].y, result[0].x); 

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
 */
     // HTML 문자열 또는 Dom Element 입니다
        var content = '<div class="overlay_info">';
        content += '    <a href="https://map.kakao.com/"><strong>${place.title}</strong></a>';
        content += '    <div class="desc">';
        content += '        <img src="${place.firstImage}" style="height:50px; width:50px;" alt="">';
        content += '        <span class="address">${place.address}</span>';
        content += '    </div>';
        content += '</div>';

        // 커스텀 오버레이가 표시될 위치입니다 
        var position = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 커스텀 오버레이를 생성합니다
        var mapCustomOverlay = new kakao.maps.CustomOverlay({
            position: position,
            content: content,
            xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
            yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
        });

        // 커스텀 오버레이를 지도에 표시합니다
        mapCustomOverlay.setMap(map);
        
/*         // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0; border:1px solid blue"><b>${place.title}</b></div>'
        });
        infowindow.open(map, marker); */

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
}); 
</script>
<style>
.overlay_info {
	border-radius: 6px;
	margin-bottom: 12px;
	float:left;
	position:relative;
	border: 1px solid blue;
	border-bottom: 1px solid blue;
	background-color:#ffff;
}
.overlay_info:nth-of-type(n) {
	border:0;
	box-shadow: 0px 1px 2px #888;
}
.overlay_info a {
	display: block;
	background: #d95050;
	background: #green  no-repeat right 14px center;
	text-decoration: none;
	color: #fff;
	padding:12px 36px 12px 14px;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	text-align:center;
	background-color:green;
}

.overlay_info .desc {
	padding:18px;
	margin-bottom:30px;
	position: relative;
	min-width: 190px;
	height: 56px
}
.overlay_info img {
	vertical-align: top;
}
.overlay_info .address {
	font-size: 12px;
	color: #333;
	position: absolute;
	left: 80px;
	right: 14px;
	top: 24px;
	white-space: normal
}
.overlay_info:after {
	content:'';
	position: absolute;
	margin-left: -11px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;
}
</style>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
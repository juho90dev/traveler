<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/faq.css"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="breadcrumb-hero">
        <div class="container">
          <div class="breadcrumb-hero">
            <h2>FAQ</h2>
            <p>자주 묻는 질문</p>
          </div>
        </div>
      </div>
      <div class="container">
        <ol>
          <li><a href="/">Home</a></li>
          <li><a href="${Path}/faq">자주 묻는 질문</a></li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->
<div class="accordion">
  <div class="accordion-item">
    <div class="accordion-item-header">
      트래블러 서비스에 오류가 있습니다. 어디로 연락하나요?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
        트래블러는 익스플로러8 이하의 버전에서는 브라우저에 따라 서비스 화면 및 일부기능에 오류가 발생할 수 있습니다. 최신 브라우저로 업데이트 하시면 보다 쾌적한 서비스 이용이 가능합니다.
		만약 최신 브라우저를 사용하고 있음에도 기타 트래블러 서비스에 관한 오류사항이나 기술적인 문제 등 불편사항이 있을 경우 '문의하기' 에 관련 내용을 남겨 주시길 부탁 드립니다. 빠른 시간내에 해당 사항을 확인 후 답변드리겠습니다.
		우리는 사용자들의 피드백을 환영하며 더 나은 서비스 제공을 위해 노력하고 있습니다. 서비스에 관한 문의 사항은 'FAQ'에서 검색해 보시기 바라며 찾는 내용이 없는 경우 '문의하기'를 통해 문의해 주시기 바랍니다. 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
      플랜 만들기란 무엇인가요?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
        '플랜 만들기'란 트래블러에서 나만의 여행 일정을 계획하는 기능으로, 내가 가고 싶은 장소들의 위치를 지도에서 보며 동선을 계획하고 경로보기를 통해 가는 방법을 확인할 수 있습니다. 
        드래그 & 드롭하여 방문 순서를 정렬하면 자동으로 이동 동선과 경로가 보여집니다. 
        방문 일자별로 클립 명소들을 정렬하여 나만의 여행 일정을 손쉽게 만들 수 있습니다.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
      동행하는 친구와 함께 일정을 만들 수 있나요?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
      친구들과 함께 일정을 만들어보세요! 계획중인 미완성 일정에 친구를 초대할 수 있습니다. 
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
      여러 도시를 한 일정에 넣을 수 있나요?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
     가능합니다. 우선 일정 만들기를 시작해 보세요. 지도에서 일정을 만드는 과정에서 새로운 도시를 추가하거나 다른 도시의 클립보드를 불러와 클립된 장소들을 일정에 넣을 수 있습니다. 여러 도시의 방문 일정을 순서대로 계획하시면 됩니다.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <div class="accordion-item-header">
      회원을 탈퇴하려면 어떻게 하나요?
    </div>
    <div class="accordion-item-body">
      <div class="accordion-item-body-content">
       로그인 후, 마이페이지 '설정'에서 회원정보 수정 하단에 '회원탈퇴' 버튼이 있습니다. 트래블러 계정을 삭제하고 탈퇴를 원하시면 이 버튼을 클릭하면 됩니다. 탈퇴 시에는 귀하의 정보와 클립보드, 일정 등 모든 내용이 삭제됩니다. 신중히 고려하시기 바랍니다.
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
const accordionItemHeaders = document.querySelectorAll(".accordion-item-header");

accordionItemHeaders.forEach(accordionItemHeader => {
  accordionItemHeader.addEventListener("click", event => {



    accordionItemHeader.classList.toggle("active");
    const accordionItemBody = accordionItemHeader.nextElementSibling;
    if(accordionItemHeader.classList.contains("active")) {
      accordionItemBody.style.maxHeight = accordionItemBody.scrollHeight + "px";
    }
    else {
      accordionItemBody.style.maxHeight = 0;
    }

  });
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <!-- ======= Footer ======= -->
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>MY PAGE</title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="Around - Multipurpose Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, consulting, coworking space, services, creative agency, dashboard, e-commerce, mobile app showcase, multipurpose, product landing, shop, software, ui kit, web studio, landing, html5, css3, javascript, gallery, slider, touch, creative">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="${path}/resources/img/membership/logo2.jpg">
    <link rel="icon" type="image/png" sizes="32x32" href="${path}/resources/img/membership/logo2.jpg">
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/img/membership/logo2.jpg">
    <link rel="manifest" href="${path}/resources/site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
      .page-loading {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        -webkit-transition: all .4s .2s ease-in-out;
        transition: all .4s .2s ease-in-out;
        background-color: #fff;
        opacity: 0;
        visibility: hidden;
        z-index: 9999;
      }
      .page-loading.active {
        opacity: 1;
        visibility: visible;
      }
      .page-loading-inner {
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        text-align: center;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        -webkit-transition: opacity .2s ease-in-out;
        transition: opacity .2s ease-in-out;
        opacity: 0;
      }
      .page-loading.active > .page-loading-inner {
        opacity: 1;
      }
      .page-loading-inner > span {
        display: block;
        font-family: 'Inter', sans-serif;
        font-size: 1rem;
        font-weight: normal;
        color: #737491;
      }
      .page-spinner {
        display: inline-block;
        width: 2.75rem;
        height: 2.75rem;
        margin-bottom: .75rem;
        vertical-align: text-bottom;
        border: .15em solid #766df4;
        border-right-color: transparent;
        border-radius: 50%;
        -webkit-animation: spinner .75s linear infinite;
        animation: spinner .75s linear infinite;
      }
      @-webkit-keyframes spinner {
        100% {
          -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @keyframes spinner {
        100% {
          -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      
      .click_obj:hover {
        color: #2468b6 !important;
      }

      select:focus{
        border-color: #002C5F !important;
      }

      #my-card:hover {
        color: #2468b6;
      }

      #direct-go {
        border-color: #2468b6 !important;
        color: #2468b6 !important;
      }

      #direct-go:hover {
        border-color: #002C5F !important;
        background-color: #002C5F !important;
        color: white !important;
      }

    </style>
    <!-- Page loading scripts-->
    <script>
      (function () {
        window.onload = function () {
          var preloader = document.querySelector('.page-loading');
          preloader.classList.remove('active');
          setTimeout(function () {
            preloader.remove();
          }, 2000);
        };
      })();
      
    </script>
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">
  </head>

  <!-- Body-->
  <body style="background-color:#f4f4f4;">
    
    <!-- Page loading spinner-->
    <div class="page-loading active">
      <div class="page-loading-inner">
        <div class="page-spinner"></div><span>Loading...</span>
      </div>
    </div>
    <main class="page-wrapper">
      
      <!-- Page content-->
      <!-- Slanted background-->
      <div class="position-relative" style="height: 480px; background-color: #002C5F;">
        <div class="shape shape-bottom shape-slant bg-secondary d-none d-lg-block">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 260" style="color:#002C5F;">
            <polygon fill="currentColor" points="0,257 0,260 3000,260 3000,0"></polygon>
          </svg>
        </div>
      </div>


      <!-- 왼쪽 -->
      <div class="container position-relative zindex-5 pb-4 mb-md-3" style="margin-top: -350px;">
        <div class="row">
          <!-- Sidebar-->
          <div class="col-lg-4 mb-4 mb-lg-0">
            <div class="bg-light rounded-3 shadow-lg">
              <div class="px-4 py-4 mb-1 text-center">
                <img class="d-block rounded-circle mx-auto my-2" src="${path}/resources/img/membership/${sessionScope.signInUser.photo}" width="80" style="border: 3px solid #002C5F;">
                <h6 class="mb-0 pt-1">${sessionScope.signInUser.name }</h6>
              </div>
              <div class="d-lg-none px-4 pb-4 text-center"><a class="btn btn-primary px-5 mb-2" href="#account-menu" data-bs-toggle="collapse"><i class="ai-menu me-2"></i>Account menu</a></div>
              <div class="d-lg-block collapse pb-2" id="account-menu">
                <h3 class="d-block fs-sm fw-semibold text-muted mb-0 px-4 py-3"  style="background-color: #edf4ff;">나의 활동</h3>
                  <a class="d-flex click_obj align-items-center nav-link-style px-4 py-3" href="#"><i class="ai-shopping-bag fs-lg opacity-60 me-2"></i>나의 현대 자동차<span class="text-muted fs-sm fw-normal ms-auto">가진 차량 수</span></a>
                  <a class="d-flex click_obj align-items-center nav-link-style px-4 py-3" href="#"><i class="ai-award fs-lg opacity-60 me-2"></i>블루 멤버스 포인트</a>
              
                <h3 class="d-block fs-sm fw-semibold text-muted mb-0 px-4 py-3" style="background-color: #edf4ff;">계정 관리</h3>
                  <a class="d-flex click_obj align-items-center nav-link-style px-4 py-3" href="${path }/go_account">계정 관리</a>
                  <a class="d-flex click_obj align-items-center nav-link-style px-4 py-3 border-top" href="#">결제 수단 관리</a>
                  <a class="d-flex click_obj align-items-center nav-link-style px-4 py-3 border-top" href="${path }/user/logout"><i class="ai-log-out fs-lg opacity-60 me-2"></i>로그아웃</a>
              </div>
            </div>
          </div>


          <!-- 오른쪽 -->
          <div class="col-lg-8">
            <div class="d-flex flex-column h-100 bg-light rounded-3 shadow-lg p-4">
              <div class="py-2 p-md-3">
                
                <!-- Title -->
                <h1 class="h3 mb-4 text-center text-sm-start">
                  <span style="color: #2468b6;">${sessionScope.signInUser.name }</span> 님, 안녕하세요!
                </h1>

                <!-- 블루멤버십 포인트 + 등록 자동차 -->
                <div class="row g-3 mb-4" style="margin-top: 10px;">
                  <!-- 블루멤버십 포인트 카드 -->
                  <a class="col-md-6 nav-link-style fs-m" href="#">
                    <div class="card border-0 shadow-sm h-100">
                      <div class="card-body text-center">
                        <h6 class="text-muted mb-2">나의 블루멤버스 포인트</h6>
                        <h4 class="mb-0 fw-bold" style="color: #2468b6;">${totPoint }P</h4>
                      </div>
                    </div>
                  </a>

                  <!-- 등록 자동차 카드 -->
                  <a class="col-md-6 nav-link-style fs-m" href="#">
                    <div class="card border-0 shadow-sm h-100">
                      <div class="card-body text-center">
                        <h6 class="text-muted mb-2">나의 현대자동차</h6>
                        <h4 class="mb-0 fw-bold" style="color: #2468b6;">${carNum }대</h4>
                      </div>
                    </div>
                  </a>
                </div>

                <!-- 추가: 블루링크 스토어 안내 -->
                <div class="align-items-center mb-3" style="margin-top: 90px;">
                  <a href="https://commerce.hyundai.com/kr/ko/commerce/fod" class="h4 text-decoration-none nav-link-style"><span style="color:#002C5F; font-weight:700;">블루링크 스토어</span> &gt;</a>
                </div>

                <div class="card border-0 shadow-sm mb-4" style="margin-top: 10px;">
                  <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                      <h6 class="mb-0 fw-bold text-sm-start">블루링크 스토어</h6>
                      <a href="https://www.hyundai.com" class="btn btn-outline-primary btn-sm" id="direct-go">바로가기</a>
                    </div>
                    <p class="mb-2">차량 출고 후 디지털 사양을 통해 고객님의 차량을 업그레이드 해보세요.</p>
                    <div class="alert alert-info mb-0" style="font-size: 0.9rem; margin-top: 20px;">
                      ❗️ 블루링크 스토어는 블루링크 가입 기준으로 보유 차량이 표출됩니다.<br>
                      블루링크 스토어에서 보유 차량이 보이지 않는다면, 블루링크 가입자를 확인해 주세요.
                    </div>
                  </div>
                </div>

                <!-- 카드 상세 정보 -->
                <div class="d-flex justify-content-between align-items-center mb-3" style="margin-top: 80px;">
                  <a href="https://commerce.hyundai.com/kr/ko/commerce/fod" class="h4 text-decoration-none nav-link-style"><span style="color:#002C5F; font-weight:700;">카드 보유 현황</span> &gt;</a>
                  <div class="d-flex gap-2">
                    <select id="filter-status" class="form-select form-select-sm">
                      <option value="all">카드 상태 전체</option>
                      <option value="active">정상</option>
                      <option value="inactive">정지</option>
                    </select>
                    
                    <select id="filter-type" class="form-select form-select-sm">
                      <option value="all">카드 종류 전체</option>
                      <option value="blue-members">블루멤버스</option>
                      <option value="credit">신용카드</option>
                      <option value="check">체크카드</option>
                    </select>
                  </div>
                </div>

                <!-- 카드 상세 정보 -->
                <div class="card border-0 shadow-sm" style="margin-top: 20px;">
                  <div class="card-body">
                    <!-- 카드 상세 정보 테이블 -->
                    <div class="table-responsive">
                      <table class="table table-bordered text-center align-middle" id="card-table">
                        <thead class="table-light">
                          <tr>
                            <th>번호</th>
                            <th>카드 구분</th>
                            <th>카드 종류</th>
                            <th>카드 번호</th>
                            <th>신청일</th>
                            <th>카드 상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        
							<c:forEach var="card" items="${cards}" varStatus="status">
							    <!-- data-type을 먼저 계산 -->
							    <c:set var="dataType" value="${card.cardType eq '비신용카드' ? 'blue-members' : (card.cardType eq '신용카드' ? 'credit' : (card.cardType eq '체크카드' ? 'check' : ''))}" />
							
							    <!-- data-status도 동일한 방식으로 처리 -->
							    <c:set var="dataStatus" value="${card.status eq '정상' ? 'active' : 'inactive'}" />
							
							    <tr data-status="${dataStatus}" data-type="${dataType}">
							        <td>${status.index + 1}</td>
							        <td>${card.cardType}</td>
							        <td>${card.cardName}</td>
							        <td>${fn:substring(card.cardNumber, 0, 4)}********${fn:substring(card.cardNumber, 12, 16)}</td>
							        <td>${card.applicationDate}</td>
							        <td>${card.status}</td>
							    </tr>
							</c:forEach>
                          
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>


              </div>
            </div>
          </div>


        </div>
      </div>
    </main>

    <jsp:include page="/WEB-INF/views/jsps/footer.jsp" />

    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll data-fixed-element><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon ai-arrow-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>

    <!-- 필터링 스크립트 -->
    <script>
      const statusFilter = document.getElementById('filter-status');
      const typeFilter = document.getElementById('filter-type');
      const rows = document.querySelectorAll('#card-table tbody tr');

      function filterTable() {
        const selectedStatus = statusFilter.value;
        const selectedType = typeFilter.value;

        rows.forEach(row => {
          const rowStatus = row.getAttribute('data-status');
          const rowType = row.getAttribute('data-type');
          const matchStatus = (selectedStatus === 'all' || rowStatus === selectedStatus);
          const matchType = (selectedType === 'all' || rowType === selectedType);
          row.style.display = matchStatus && matchType ? '' : 'none';
        });
      }

      statusFilter.addEventListener('change', filterTable);
      typeFilter.addEventListener('change', filterTable);
    </script>
  </body>
</html>
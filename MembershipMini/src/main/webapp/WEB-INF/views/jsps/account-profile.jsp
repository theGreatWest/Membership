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
<html lang="en">
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
      <div class="position-relative" style="height: 480px; background-color: #002C5F;">
        <div class="shape shape-bottom shape-slant bg-secondary d-none d-lg-block">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 3000 260" style="color:#002C5F;">
            <polygon fill="currentColor" points="0,257 0,260 3000,260 3000,0"></polygon>
          </svg>
        </div>
      </div>

      <div class="container position-relative zindex-5 pb-4 mb-md-3" style="margin-top: -350px;">
        <div class="row">
          <!-- Sidebar-->
          <div class="col-lg-4 mb-4 mb-lg-0">
            <div class="bg-light rounded-3 shadow-lg">
              <div class="px-4 py-4 mb-1 text-center">
                <img class="d-block rounded-circle mx-auto my-2" src="${path}/resources/img/membership/${photo}" width="80" style="border: 3px solid #002C5F;">
                <h6 class="mb-0 pt-1">${name }</h6>
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

          <div class="col-lg-8">
            <div class="d-flex flex-column h-100 bg-light rounded-3 shadow-lg p-4">
              <div class="py-2 p-md-3">
                <div class="d-sm-flex align-items-center justify-content-between pb-4 text-center text-sm-start">
                  <h1 class="h3 mb-2 text-nowrap">계정 관리</h1><a class="btn btn-link text-danger fw-medium btn-sm mb-2" href="#"><i class="ai-trash-2 fs-base me-2"></i>계정 삭제</a>
                </div>

                <form action="[서버의 파일 업로드 URL]" method="post" enctype="multipart/form-data">
                  <div class="rounded-3 p-4 mb-4" style="background-color: #447ab8;">
                    <div class="d-block d-sm-flex align-items-center">
                      <img class="d-block rounded-circle mx-sm-0 mx-auto mb-3 mb-sm-0" id="profile-avatar" src="../dist/img/membership/Neo.png" alt="User Avatar" width="100">
                      <div class="ps-sm-3 text-center text-sm-start">
                        <label for="avatar-upload" class="btn btn-light shadow btn-sm mb-2">
                          <i class="ai-refresh-cw me-2"></i>대표 이미지 변경
                        </label>
                        <input type="file" id="avatar-upload" class="d-none" accept="image/jpeg, image/png, image/gif">
                        <div class="p mb-0 fs-ms" style="color: white;">Upload JPG, GIF or PNG image. 300 x 300 required.</div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="mb-3 pb-1">
                        <label class="form-label px-0" for="account-username">사용자 이름</label>
                        <div class="input-group">
                          <input class="form-control" type="text" id="account-username">
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="mb-3 pb-1">
                        <label class="form-label px-0" for="account-password">새비밀번호</label>
                        <input class="form-control" type="password" id="account-password">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="mb-3 pb-1">
                        <label class="form-label px-0" for="account-password-confirm">새비밀번호 확인</label>
                        <input class="form-control" type="password" id="account-password-confirm">
                      </div>
                    </div>
                    <div class="col-12">
                      <hr class="mt-2 mb-4">
                      <div class="d-flex flex-wrap justify-content-end align-items-center">
                        <button class="btn mt-3 mt-sm-0" id="saveChangesBtn" type="submit" disabled  style="background-color: #447ab8; color: white;"><i class="ai-save fs-lg me-2"></i>변경사항 저장</button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>


    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/jsps/footer.jsp" />

    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll data-fixed-element><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon ai-arrow-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="${path}/resources/js/theme.min.js"></script>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // HTML 요소 선택
        const passwordInput = document.getElementById('account-password');
        const confirmPasswordInput = document.getElementById('account-password-confirm');
        const saveChangesBtn = document.getElementById('saveChangesBtn');

        // ✅ 비밀번호 조건: 영어 1개 이상 + 특수문자 1개 이상 + 8자 이상
        function isValidPassword(password) {
          const regex = /^(?=.*[A-Za-z])(?=.*[^A-Za-z0-9]).{8,}$/;
          return regex.test(password);
        }

        // ✅ "Save changes" 버튼 활성화 조건 확인
        function checkPasswordAvailability() {
          const password = passwordInput.value;
          const confirmPassword = confirmPasswordInput.value;

          const passwordValid = isValidPassword(password);
          const passwordsMatch = password === confirmPassword;

          // 비밀번호 입력 필드 테두리 색상 변경
          if (password.length > 0) {
            passwordInput.style.borderColor = passwordValid ? '#28a745' : '#dc3545'; // 성공/실패 시 색상
          } else {
            passwordInput.style.borderColor = ''; // 초기화
          }

          if (confirmPassword.length > 0) {
            confirmPasswordInput.style.borderColor = passwordsMatch ? '#28a745' : '#dc3545'; // 성공/실패 시 색상
          } else {
            confirmPasswordInput.style.borderColor = ''; // 초기화
          }

          // 모든 조건 만족 시 버튼 활성화
          saveChangesBtn.disabled = !(passwordValid && passwordsMatch);
        }

        // ✅ 비밀번호 입력 이벤트
        passwordInput.addEventListener('input', checkPasswordAvailability);
        confirmPasswordInput.addEventListener('input', checkPasswordAvailability);
      });
      </script>
  </body>
</html>
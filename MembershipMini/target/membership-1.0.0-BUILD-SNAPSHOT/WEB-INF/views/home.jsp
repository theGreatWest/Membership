<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>LOGIN</title>
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

      :root {
        --bs-primary: #002C5F;
        --bs-secondary: #B0BEC5;
        --bs-info: #00A3E0;
        --bs-dark: #212121;
      }

      .nav-link-style.fs-ms:hover {
        color: #3470b5;
      }

      #email_auth {
        color: #3470b5;
        border-color: #d1d1d1;
      }

      #email_auth:hover {
        color: white;
        background-color: #3470b5;
        border-color: #3470b5;
      }

      #emailVerifyModal {
        z-index: 1060; /* 회원가입 모달보다 높게 */
      }
      .modal-backdrop.show:nth-of-type(2) {
        z-index: 1055; /* 두 번째 배경도 앞쪽에 표시 */
      }
      
      input.form-control:focus {
        border-color: #3470b5 !important;
        box-shadow: 0 0 0 0.2rem rgba(113, 172, 239, 0.25) !important;
        outline: none !important;
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

    
    <main class="page-wrapper d-flex flex-column">
      

      <!-- 인증 코드 입력 모달 -->
      <div class="modal fade" id="emailVerifyModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content border-0">
                  <div class="modal-header">
                    <h5 class="modal-title">이메일 인증</h5>
                  </div>
                  <div class="modal-body">
                    <p>이메일로 전송된 인증 코드를 입력하세요.</p>
                    <input id="emailCodeInput" type="text" class="form-control" placeholder="인증 코드">
                  </div>
                  <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" onclick="cancelVerification()">취소</button>
                    <button class="btn btn-primary" type="button" onclick="verifyEmailCode()" style="background-color: #002C5F; color: white; border-color: #002C5F;">완료</button>
                  </div>
                </div>
        </div>
      </div>
      
      
      <!-- Sign up Modal-->
      <div class="modal fade" id="modal-signin" tabindex="-2">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content border-0">
            <!-- 회원가입 모달 -->
            <div class="view" id="modal-signup-view">
              <div class="modal-header border-0 bg-dark px-4">
                <h4 class="modal-title text-light">Create Account</h4>
                <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label="btn-close"></button>
              </div>
              <div class="modal-body px-4">
                <form class="needs-validation" novalidate>
                  <div class="mb-3">
                    <input class="form-control" type="text" placeholder="Full name" required>
                  </div>
                  <div class="input-group mb-3">
                    <input id="emailInput" class="form-control" type="text" placeholder="Email" required>
                    <button id="email_auth" class="btn btn-outline-primary" type="button" disabled onclick="openVerifyModal()">인증하기</button>
                  </div>
                  <div class="mb-3 password-toggle">
                    <input class="form-control" type="password" placeholder="Password" required>
                    <label class="password-toggle-btn" aria-label="Show/hide password">
                      <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                    </label>
                  </div>
                  <div class="mb-3 password-toggle">
                    <input class="form-control" type="password" placeholder="Confirm password" required>
                    <label class="password-toggle-btn" aria-label="Show/hide password">
                      <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                    </label>
                  </div>
                  <button id="signupBtn" class="btn btn-primary d-block w-100" type="submit" style="background-color: #002C5F; border-color:#002C5F;" disabled>Sign up</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 로그인 뷰 -->
      <!-- Page content-->
      <section class="container d-flex justify-content-center align-items-center pt-7 pb-4" style="min-height: 100vh;">
        <div class="signin-form mt-3">
          <div class="signin-form-inner">
            <!-- Sign in view-->
            <div class="view show" id="signin-view">
              <h1 class="h2 text-center" style="margin-top: 40px; margin-bottom: 10px;"><img src="${path}/resources/img/membership/logo.png" width="80" height="80"></h1>
              <form class="needs-validation" action="${path }/user/sign_in" method="post" style="margin-top: 30px;" novalidate>
                <div class="input-group mb-3"><i class="ai-mail position-absolute top-50 start-0 translate-middle-y ms-3"></i>
                  <input class="form-control rounded" name="email" type="email" placeholder="Email" required>
                </div>
                <div class="input-group mb-3"><i class="ai-lock position-absolute top-50 start-0 translate-middle-y ms-3"></i>
                  <div class="password-toggle w-100">
                    <input class="form-control" name="password"  type="password" placeholder="Password" required>
                    <label class="password-toggle-btn" aria-label="Show/hide password">
                      <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                    </label>
                  </div>
                </div>
                <div class="d-flex justify-content-end align-items-center mb-3 pb-1">
                  <a class="nav-link-style fs-ms" href="${path}/get_new_password">Forgot password?</a>
                </div>
                <button class="btn btn-primary d-block w-100" type="submit" style="background-color: #002C5F; border-color: #002C5F; margin-top:50px;">LOGIN</button>
                <a class="btn btn-primary d-block w-100" href="#modal-signin" data-bs-toggle="modal" data-view="#modal-signup-view" style="margin-top: 10px; background-color: white; border-color:#E0E0E0; color: #002C5F;">Create Account</a>
              </form>
            </div>
          </div>
        </div>
      </section>
    </main>


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
        const emailInput = document.getElementById("emailInput");
        const authButton = document.getElementById("email_auth");
        const passwordInput = document.querySelectorAll('.password-toggle input[type="password"]')[0];
        const confirmPasswordInput = document.querySelectorAll('.password-toggle input[type="password"]')[1];
        const signupBtn = document.getElementById('signupBtn');
        const modalElement = document.getElementById('emailVerifyModal');
        const modal = new bootstrap.Modal(modalElement);

        let emailVerified = false;

        // ✅ 이메일 형식 검증
        function isValidEmail(email) {
          return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        }

        // ✅ 비밀번호 조건: 영어 1개 이상 + 특수문자 1개 이상 + 8자 이상
        function isValidPassword(password) {
          const regex = /^(?=.*[A-Za-z])(?=.*[^A-Za-z0-9]).{8,}$/;
          return regex.test(password);
        }

        // ✅ Sign up 버튼 활성화 조건 확인
        function checkSignupAvailability() {
          const passwordValid = isValidPassword(passwordInput.value);
          const passwordsMatch = passwordInput.value === confirmPasswordInput.value;

          // 비밀번호 테두리 색상
          passwordInput.style.borderColor = passwordValid ? '' : 'red';
          confirmPasswordInput.style.borderColor = passwordsMatch ? '' : 'red';

          // 모든 조건 만족 시 버튼 활성화
          signupBtn.disabled = !(emailVerified && passwordValid && passwordsMatch);
        }

        // ✅ 이메일 입력 시 인증 버튼 활성화 여부
        emailInput.addEventListener("input", function () {
          authButton.disabled = !isValidEmail(emailInput.value);
        });

        // ✅ 비밀번호 입력 이벤트
        passwordInput.addEventListener('input', checkSignupAvailability);
        confirmPasswordInput.addEventListener('input', checkSignupAvailability);

        // ✅ 인증 모달 열기
        window.openVerifyModal = function () {
          const email = emailInput.value;
          if (!isValidEmail(email)) {
            alert("올바른 이메일을 입력해주세요.");
            return;
          }

          modal.show();
          emailVerified = false; // 초기화
          signupBtn.disabled = true;

          fetch("/auth/email/send-code", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email })
          });
        };

        // ✅ 인증 코드 검증
        window.verifyEmailCode = function () {
          const email = emailInput.value;
          const code = document.getElementById("emailCodeInput").value;

          fetch("/auth/email/verify-code", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, code })
          })
            .then(res => res.json())
            .then(data => {
              modal.hide();

              if (data.verified) { // 인증 성공
                emailVerified = true;
              } else {
                alert("인증 실패! 이메일을 다시 입력해주세요.");
                emailInput.value = "";
                authButton.disabled = true;
                emailVerified = false;
              }

              checkSignupAvailability(); // 비밀번호 조건과 함께 다시 확인
            });
        };

        // ✅ 인증 취소
        window.cancelVerification = function () {
          emailInput.value = "";
          emailVerified = false;
          authButton.disabled = true;
          modal.hide();
          checkSignupAvailability();
        };
        
     	// 회원가입(Sign up) 버튼 클릭 → DB 저장 후 my-page.jsp로 이동
        signupBtn.addEventListener("click", function (event) {
          event.preventDefault();

          const fullName = document.querySelector('input[placeholder="Full name"]').value;
          const email = emailInput.value;
          const password = passwordInput.value;

          fetch("/auth/signup", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ fullName, email, password })
          })
            .then(res => {
              if (!res.ok) throw new Error("회원가입 실패! 다시 시도해주세요.");
              return res.json();
            })
            .then(data => { // 회원가입 성공 
              window.location.href = `${contextPath}/my_page`;
            })
            .catch(err => {});
        });
     
      });
    </script>
   	
  </body>
</html>
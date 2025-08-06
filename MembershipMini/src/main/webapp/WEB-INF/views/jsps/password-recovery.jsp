<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>GET NEW PASSWORD</title>
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

      #make_new_password {
        background-color: #014088;
        border-color: #014088;
        color: white;
      }

      #make_new_password:hover {
        background-color: #002C5F;
        border-color: #002C5F;
        color: white;
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
  <body>
    <!-- Page loading spinner-->
    <div class="page-loading active">
      <div class="page-loading-inner">
        <div class="page-spinner"></div><span>Loading...</span>
      </div>
    </div>
    <main class="page-wrapper">
      <!-- Page content-->
      <div class="container py-5 py-sm-6 py-md-7">
        <div class="row justify-content-center pt-4">
          <div class="col-lg-7 col-md-9 col-sm-11">
            <h1 class="h2 pb-3">임시 비밀번호 발급</h1>
            <p class="fs-sm">회원 가입 시 사용했던 이메일에서 임시 비밀번호를 확인할 수 있습니다.<br>로그인 후 임시 비밀번호를 변경해 주세요.</p>
            <ul class="list-unstyled fs-sm pb-1 mb-4">
              <li><span class="text-primary fw-semibold me-1">1.</span>회원 가입 시 사용했던 이메일 입력하기</li>
              <li><span class="text-primary fw-semibold me-1">2.</span>Get new password 누르기</li>
              <li><span class="text-primary fw-semibold me-1">3.</span>발급된 임시 비밀번호를 이용해 로그인하기</li>
            </ul>

            <div class="rounded-3 px-3 py-4 p-sm-4" style="background-color: #d8e9fc;">
              <form class="needs-validation p-2" novalidate>
                <div class="mb-3 pb-1">
                  <label class="form-label" for="recovery-email">Enter your email address</label>
                  <input class="form-control" type="email" name="email" required id="recovery-email">
                  <div class="invalid-feedback">Please provide a valid email address!</div>
                </div>
                <!-- 버튼 -->
                <div class="text-end">
                  <button type="button" class="btn" style="background-color: white; border: 1px solid #014088; color: #014088; margin-right:10px;" onclick="window.location.href='${path}/'">Cancel</button>
                  <button id="make_new_password" class="btn btn-primary" type="submit"  onclick="requestNewPassword()" disabled>Get new password</button>
                </div>
              </form>
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

    <script>
	  const emailInput = document.getElementById("recovery-email");
	  const getNewPasswordBtn = document.getElementById("make_new_password");
	
	  // 이메일 형식 검증
	  function isValidEmail(email) {
	    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
	  }
	
	  // 버튼 활성화/비활성화
	  emailInput.addEventListener("input", function () {
	    getNewPasswordBtn.disabled = !isValidEmail(emailInput.value);
	  });
	
	  // 새 비밀번호 발급 및 이메일 전송
	  function requestNewPassword() {
		  const email = document.getElementById("recovery-email").value;
	
	    // 1단계: 새 비밀번호 발급
	    fetch(`${path}/user/generate_new_password?email=${email}`, {
	      method: "POST"
	    })
	      .then(res => res.json())
	      .then(data => {
	        if (!data.success) {
	          alert("비밀번호 발급 실패: " + data.message);
	          return;
	        }
	
	        // 2단계: 새 비밀번호를 이메일로 전송
	        fetch("${path}/api/email/send", {
	          method: "POST",
	          headers: { "Content-Type": "application/json" },
	          body: JSON.stringify({ email })
	        })
	          .then(res => res.json())
	          .then(emailData => {
	            if (emailData.success) {
	              alert("새 비밀번호가 이메일로 전송되었습니다.");
	              window.location.href = `${path}/`; // 홈으로 이동
	            } else {
	              alert("이메일 전송 실패: " + emailData.message);
	            }
	          })
	          .catch(err => {
	            console.error("이메일 전송 중 오류:", err);
	            alert("이메일 전송 중 문제가 발생했습니다.");
	          });
	      })
	      .catch(err => {
	        console.error("비밀번호 발급 중 오류:", err);
	        alert("비밀번호 발급 중 문제가 발생했습니다.");
	      });
	  }
	
	  // 기존 submit 방지 + requestNewPassword 호출
	  getNewPasswordBtn.addEventListener("click", function (event) {
	    event.preventDefault();
	    requestNewPassword();
	  });
	</script>
  </body>
</html>
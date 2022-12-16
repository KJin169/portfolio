<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var='root' value='/'/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="ko">
<head>

  <!-- Basic Page Needs
	================================================== -->
  <meta charset="utf-8">
  <title>:: SKYCASTLE ::</title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">
  
  <!-- theme meta -->
  <meta name="theme-name" content="educenter" />

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- slick slider -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <!-- themefy-icon -->
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <!-- animation css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- aos -->
  <link rel="stylesheet" href="plugins/aos/aos.css">
  <!-- veskycastlelogo.pngnobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(300)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 300, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
</head>

<body>
<!-- ===============================  header  =============================== -->
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->
<!-- hero slider -->
<section class="box hero-section overlay bg-cover" data-background="images/banner/school-2761394_1920.jpg">
  <div class="container">
    <div class="hero-slider">
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">SKYCASTLE<br>성공을 확신합니다!</h1>
            <p class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">우리가 하는일은 누군가에게는 첫 출발, 또 누군가에게는 새로운 출발이 될 전환점이되는 곳입니다.
              </p>
            <a href="${root}board/about " class="btn btn-primary" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".7">더보기</a>
          </div>
        </div>
      </div>
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8" style="all:inherit;">
            <img class="hero-section overlay bg-cover" src="images/teachers/teacher-1.png" style="left: 8%;width: 20%;">
          <div style="display:inline-block;padding-left: 13%;">
          <br><br><br>
            <h1 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">12월 TOP강사</h1>
            <h3 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">차 해 나</h3>
            <h4 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">과목 : 언어</h4>
            <h5 class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">메가스터디 종로점</h5>
            <p class="text-white" data-animation-out="fadeOutRight" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".4">아이들의 취미와 특기를 다 잡겠습니다. 맡겨주세요</p>
        </div>
          </div>
        </div>
      </div>
      <!-- slider item -->
      <div class="hero-slider-item">
        <div class="row">
          <div class="col-md-8">
            <h1 class="text-white" data-animation-out="fadeOutDown" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">E V E N T</h1>
            <p class="text-white" data-animation-out="fadeOutDown" data-delay-out="5" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".4">현재 진행 중인 이벤트가 없습니다.
            직전 이벤트 사이트 추천 추첨 기프티콘
            </p>
            <a href="#" class="btn btn-primary" data-animation-out="fadeOutDown" data-delay-out="5" data-duration-in=".3" data-animation-in="zoomIn" data-delay-in=".7">더보기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- /hero slider -->

<!-- banner-feature -->
<section class="bg-gray overflow-md-hidden box" style="padding-top:10px;padding-bottom:0px;">
  <div class="container-fluid p-0">
    <div class="row no-gutters">
      <div class="col-xl-4 col-lg-5 align-self-end">
        <!-- <img class="img-fluid w-100" src="images/banner/banner-feature.png" alt="banner-feature"> -->
      </div>
      <div class="col-xl-8 col-lg-7">
        <div class="row feature-blocks justify-content-between" style="flex-wrap:nowrap;padding-top:25px;">
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-book mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a href="${root }board/gBoardList?a_classify=1">종합학원</a></h3>
           
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-blackboard mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a href="${root }board/gBoardList?a_classify=2">단과학원</a></h3>
            
          </div>
          <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-agenda mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4"><a href="${root }board/gBoardList?a_classify=3">예체능학원</a></h3>
            
          </div>
<!--           <div class="col-sm-6 col-xl-5 mb-xl-5 mb-lg-3 mb-4 text-center text-sm-left">
            <i class="ti-write mb-xl-4 mb-lg-3 mb-4 feature-icon"></i>
            <h3 class="mb-xl-4 mb-lg-3 mb-4">Admission Now</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
              et dolore magna aliqua. Ut enim ad</p>
          </div> -->
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /banner-feature -->

<!-- 즐겨찾기 학원 리스트-->

<section class="section text-center" style="padding-top:0px">
<h2>학원 즐겨찾기 리스트</h2><br>


<c:if test="${mainFavoritelist == null}">
      <div class="col-12 col-md-4" style="margin-left: 33%;">
        <div class="card mb-2" >
          <img class="card-img-top" src="images/logo.png" alt="logo" alt="Card image cap">
          <div class="card-body">
          	<p><br><br></p>
            <h4 class="card-title font-weight-bold">더 많은 정보를 보려면 로그인해주세요.<br>아이디가 없다면 회원가입해주세요.</h4>
            <p class="card-text"><br></p>
            <a class="btn btn-primary btn-md btn-rounded" href="${root }member/join">회원가입</a>
            <p><br><br></p>
          </div>
        </div>
      </div>
</c:if>
<c:if test="${mainFavoritelist != null}">
<div id="carousel-example-multi" class="carousel slide carousel-multi-item v-2" data-ride="carousel">
  <!--Controls-->
  <div class="controls-top">
      <a class="carousel-control-prev" href="#carousel-example-multi" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
      </a>
         <a class="carousel-control-next" href="#carousel-example-multi" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!--/.Controls-->


  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-multi" data-slide-to="0" class="active"></li>
    <% int i = 0; %>
    <c:forEach items="${mainFavoritelist}">
       <% i++; %>
       <li data-target="#carousel-example-multi" data-slide-to=<%=i %>></li>
    </c:forEach>
  </ol>
  <!--/.Indicators-->

  <div class="carousel-inner v-2" role="listbox">

    <div class="carousel-item active">
      <div class="col-12 col-md-4">
        <div class="card mb-2">
          <img class="card-img-top" src="images/logo.png" alt="logo" alt="Card image cap" style="width:100%">
          <div class="card-body">
          	<p><br><br></p>
            <h4 class="card-title font-weight-bold">더 많은 정보를 보려면 마이페이지를 확인해주세요.</h4>
            <p class="card-text"><br></p>
            <a class="btn btn-primary btn-md btn-rounded" href="${root }member/mypage">마이 페이지 바로가기</a>
            <p><br><br><br></p>
          </div>
        </div>
      </div>
    </div>
    <c:forEach var="mfl" items="${mainFavoritelist}">
       <div class="carousel-item">
         <div class="col-12 col-md-4">
           <div class="card mb-2">
			<c:choose>
				<c:when test="${mfl.a_mainImg != null }">
					<img class="card-img-top rounded-0" src="${root }upload/${mfl.a_mainImg}" style="width:80%;height:80%;"/>
				</c:when>
				<c:otherwise>
					<img class="card-img-top" src="images/courses/course-1.jpg" alt="이미지 없음">
				</c:otherwise>
			</c:choose>
             <div class="card-body">
               <h4 class="card-title font-weight-bold">${mfl.a_name }</h4>
               <p class="card-text">
               		<c:choose>
	               		<c:when test="${fn:length(mfl.a_introduce) <= 100}">
	               			${mfl.a_introduce }
	               		</c:when>
						<c:when test="${fn:length(mfl.a_introduce) > 100}">
							${fn:substring(mfl.a_introduce, 0, 99)}...
						</c:when>
					</c:choose>
               </p>
               <a class="btn btn-primary btn-md btn-rounded" href="board/gBoardRead?a_memberNo=${mfl.a_memberNo}">상세보기</a>
             </div>
           </div>
         </div>
       </div>
    </c:forEach>
  </div>
</div>
</c:if>
</section>
<!-- /즐겨찾기 학원 리스트 -->
<!-- ===============================  footer  =============================== -->
 <c:import url="/WEB-INF/views/include/footer.jsp"/>
<!-- ===============================  footer  =============================== -->

<!-- jQuery -->
<script src="plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="plugins/slick/slick.min.js"></script>
<!-- aos -->
<script src="plugins/aos/aos.js"></script>
<!-- venobox popup -->
<script src="plugins/venobox/venobox.min.js"></script>
<!-- filter -->
<script src="plugins/filterizr/jquery.filterizr.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
<script src="plugins/google-map/gmap.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>

</body>
</html>

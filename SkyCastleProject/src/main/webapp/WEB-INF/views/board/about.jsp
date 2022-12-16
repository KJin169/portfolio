<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title> SKYCASTLE 회사소개</title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">

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
  <!-- venobox popup -->
  <link rel="stylesheet" href="plugins/venobox/venobox.css">

  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>


<!-- ===============================  header  =============================== -->
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->

<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item h2 text-primary font-secondary">Home</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">회사소개</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- about -->
 <section class="section">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <img class="img-fluid w-100 mb-4" src="images/about/about-page.png" alt="about image">
        <h2 class="section-title"><span class="text-muted">SKYCASTLE</span>은 교육의 미래를 선도합니다</h2>
        <p>대한민국 최대의 학원정보공유 기업인 SKYCASTLE은 끊임없이 변화하는 교육의 패러다임 속에서 다양한 정책과 시스템의 변화를 통해 현재의 모습으로 진화해 왔습니다. 서울에서 경기, 인천에 이르기까지 국내 1위 교육기업으로서 전국적으로 사업을 확장해왔고, 학원 사업에서 출판, 온라인사업 분야까지 보다 넓은 분야로 확대해 나가고 있습니다. 하지만 이러한 진화는 변화에 발 빠르게 대처하기 위한 수단이 아니라, 장기적인 안목으로 교육을 변화시키고자 하는 미래 교육을 목표로 한 것이었습니다.
           교육의 변화를 따라가기보다 교육환경의 흐름을 연구하는 기업입니다. 이를 통해 학생들에게 ‘도달해야 할 목표’가 아닌 ‘목표로 가는 방법’을 제시하고자 합니다. 또 학생들과 함께 그 길을 걷고자 합니다.</p>
        <p>공교육과 사교육, 좋은 교육과 나쁜 교육의 경계는 경제적 개념과 구조에서 나오는 것이 아니라 어떤 교육 컨텐츠를 제공하느냐, 교육에 얼마나 기여하느냐에 달려있다고 생각하고 있습니다. 이것이 지금 이 시간에도 타임교육이 교육적 연구를 멈추지 않는 이유이기도 합니다.
        <br>세계에 내 놓아도 부끄럽지 않은 교육, 세계 교육을 선도하는 기업을 실현하겠습니다.</p>
      </div>
    </div>
  </div>
</section> 
 
<!-- /about -->

<!-- banner-feature -->
<section class="bg-white overflow-md-hidden">
  <!-- <img src="images/backgrounds/wave-bg.svg" class="wave-bg"> -->
  <div class="container">
    <div class="row justify-content-around align-items-center">
      <div class="col-12 mb-5 text-center">
        <h2>회사의 주요 임무는 무엇입니까</h2>
      </div>
      
      <div class="col-lg-4 col-md-6 text-center">
         <img src="images/icon/view.gif">
            <h3 class="mb-xl-4 mb-lg-3 mb-4">사용자 입장으로 운영</h3>
        <p class="mx-lg-3">우리는 사용자가 되어 다양한 방면으로의 사용 경험을 데이터 삼아 최적의 환경을 만듭니다.</p>
      </div>
      
       <div class="col-lg-4 col-md-6 text-center">
         <img src="images/icon/folder.gif">
            <h3 class="mb-xl-4 mb-lg-3 mb-4">신속한 정보 업데이트</h3>
        <p class="mx-lg-3">신속한 업데이트로 정보를 <br>놓치지 않도록 공유합니다</p>
      </div>
      
     <div class="col-lg-4 col-md-6 text-center">
         <img src="images/icon/chat.gif">
            <h3 class="mb-xl-4 mb-lg-3 mb-4">문의사항 신속 답변</h3>
        <p class="mx-lg-3">문의사항에 대한 답변의 진행상황과 결과를 <br>신속하고 정확하게 소통하고 공유합니다</p>
      </div>
      
    </div>
  </div>
</section>
<!-- /banner-feature -->



<!-- ===============================  footer  =============================== -->
<%--  <c:import url="/WEB-INF/views/include/footer.jsp"/> --%>
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
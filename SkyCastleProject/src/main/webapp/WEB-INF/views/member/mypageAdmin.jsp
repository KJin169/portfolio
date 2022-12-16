<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var='root' value='/' />
<!DOCTYPE html>

<html lang="ko">
<head>

<!-- Basic Page Needs
	================================================== -->
<meta charset="utf-8">
<title>:: My Page ::</title>

<!-- Mobile Specific Metas
	================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Construction Html5 Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="Themefisher">
<meta name="generator"
	content="Themefisher Educenter HTML Template v1.0">

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
<!-- Mypage CSS -->
<link href="css/mypagemenu.css" rel="stylesheet">
<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>
	

	<!-- ===============================  header  =============================== -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!-- ===============================  header  =============================== -->

	<!-- page title -->
	<section class="page-title-section overlay"
		data-background="images/backgrounds/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item h2 text-primary font-secondary">Home</li>
						<li class="list-inline-item text-white h3 font-secondary nasted">사이트
							관리</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- /page title -->

	<!-- side menu nav -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<ul class="list-inline text-center">
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}member/mypageAdmin_member"><h4>회원 정보</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}academymember/mypageAdmin_academy"><h4>학원 정보</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}serviceBoard/siteAskList"><h4>회원문의</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2"
						href="${root}serviceBoard/siteAcaAskList"><h4>학원문의</h4></a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- user info  -->
	<section class="section">
		<div class="container">
			<h3 class="text-center">관리자 마이페이지</h3>
			<hr>
			<div class="row justify-content-center">
				<div>

					<!--============================================  content here! ============================================-->
					<!-- <h2>추가 예정</h2>
					<hr>
					<h2>월별 가입자 수</h2>
					<h2>총 회원 수</h2>
					<h2>총 학원 수</h2> -->
					<p>관리자 마이페이지입니다</p>
					
				</div>
			</div>
		</div>
	</section>
	<!-- / user info -->
	<!-- ===============================  footer  =============================== -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
	<script src="plugins/google-map/gmap.js"></script>

	<!-- Main Script -->
	<script src="js/script.js"></script>

</body>
</html>
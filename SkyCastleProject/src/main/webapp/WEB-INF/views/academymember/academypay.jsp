<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="css/academyPay.css" rel="stylesheet">

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
						<li class="list-inline-item text-white h3 font-secondary nasted">My
							Page</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- /page title -->

	<!-- side menu nav -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center" >
				<ul class="list-inline text-center">
					<li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/my_academypage"><h4>학원 정보</h4></a></li>
		           	<li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyinfo"><h4>학원 소개</h4></a></li>
		            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyteacher"><h4>학원 강사 조회</h4></a></li>
					<li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academypay"><h4>결제 내역 조회</h4></a></li>     
		            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/mypage_siteAcaAsk"><h4>내 문의사항</h4></a></li>
		            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyBlacklist"><h4>내 블랙리스트 조회</h4></a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- academy pay -->
	
	<div class="container-fluid" style="background: linear-gradient(to right, rgba(235,224,232,1) 52%,#F7E600 53%,rgba(254,191,1,1) 100%);
font-family: 'Roboto', sans-serif;">
		<div class="row d-flex justify-content-center">
			<div class="col-sm-12">
				<div class="card mx-auto">
					<p class="heading">PAYMENT DETAILS</p>
					<c:forEach var="st" items="${ academypaylist}">
					<div class="form-group mb-0">
						<p class="text-warning mb-0" >시작일</p>
						
						<p><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${st.a_payStart }" /></p>
						<p class="text-warning mb-0">종료일</p>
						<p><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${st.a_payEnd}" /></p>
						<hr>
					</div>
					</c:forEach>
					<div class="form-group pt-2">
						<div class="row d-flex">
							<div class="col-sm-5 pt-0">
								<button type="button" class="btn btn-primary" onclick="location.href='${root }pay/pay_howlong?a_memberNo=${sessionScope.loginAcademyMemberBean.a_memberNo}'">GO TO MEMBERSHIP
									<i class="fas fa-arrow-right px-3 py-2"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var='root' value='/' />
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- Basic Page Needs
   ================================================== -->
<meta charset="utf-8">
<title>SKYCASTLE</title>

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
		data-background="images/backgrounds/bg_pagetitle1.png">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item h2 text-primary font-secondary">My page</li>
						<li class="list-inline-item text-white h3 font-secondary nasted">내 문의사항</li>

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
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/mypage"><h4>내 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/studentinfo"><h4>학생 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/myfavorite"><h4>찜 목록</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root }member/mypage_siteAsk?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}"><h4>내 문의사항</h4></a></li>
          </ul>
        </div>
      </div>
    </div>
	<!--  -->
	<!--  -->
	<section class="section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="text-center">내 문의사항</h3>
					<hr>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-8 mb-5 mb-lg-0">
						<div>
							<label for="sa_tele">전화번호</label>
							<input class="form-control mb-3" id="sa_tele" name="sa_tele" value="${myaskreadBean.sa_tele}" disabled="disabled"/>
						</div>
						<div>
							<label for="m_email">이메일</label>
							<input class="form-control mb-3" id="m_email" name="sa_tele" value="${myaskreadBean.m_email}" disabled="disabled"/>
						</div>
						<div>
							<label for="sa_time">작성날짜</label>
							<input class="form-control mb-3" value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${myaskreadBean.sa_time}"/>" disabled="disabled">
							
						</div>
						<div>
							<label for="sa_title">제목</label>
							<input class="form-control mb-3" id="sa_title" name="sa_title" value="${myaskreadBean.sa_title }" disabled="disabled"/>
						</div>		
						<div>
							<label for="sa_contents">내용</label>
							<textarea class="form-control mb-3" id="sa_contents" name="sa_contents" disabled="disabled" style="resize:none">${myaskreadBean.sa_contents}</textarea>
						</div>
						<br>
						<c:if test="${myaskreadBean.sa_file != null }">
						<div>
							<label for="sa_file">첨부 이미지</label>
							<img src="${root }upload/${myaskreadBean.sa_file}" width="100%"/>						
						</div>
					</c:if>
						<div>
							<div class="text-right">
								<a class="btn btn-primary" href="${root }member/mypage_siteAsk?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}">목록보기</a>
							</div>
						</div>
						

				</div>
			</div>
		</div>
	</section>

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
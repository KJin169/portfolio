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
<title>:: 자녀 정보 수정 ::</title>

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
		data-background="images/backgrounds/page-title.jpg">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<ul class="list-inline custom-breadcrumb mb-2">
						<li class="list-inline-item h2 text-primary font-secondary">My page</li>
						<li class="list-inline-item text-white h3 font-secondary nasted">자녀 정보 입력</li>
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
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/studentinfo"><h4>자녀 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/myfavorite"><h4>찜 목록</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/mypage_siteAsk?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}"><h4>내 문의사항</h4></a></li>
          </ul>
        </div>
      </div>
    </div>
	<!-- insert section -->
	<section class="section bg-gray">
		<div class="container">
			<div class="row">
			<div class="col-lg-12">
	<h3 class="text-center">자녀 정보 입력</h3><hr>
	</div>
	</div>
			<div class="row justify-content-center">
					<div class="col-lg-8 mb-5 mb-lg-0">
					<form:form action="${root}member/insertChild_pro" method="post" modelAttribute="insertChildBean">
					<form:hidden path="m_memberNo" value="${sessionScope.loginMemberBean.m_memberNo }"/>
						<div>
							<form:label path="c_name">학생이름</form:label>
							<form:input class="form-control mb-3" path="c_name" style="text-align:center" />
							<form:errors path="c_name" style="color:red"/>
							<hr>
						</div>
						<div>
							<form:label path="c_grade">학년</form:label>&nbsp;&nbsp;
							<form:select path="c_grade">
								<form:option value="0" label="미취학" />
								<form:option value="1" label="초1" />
								<form:option value="2" label="초2" />
								<form:option value="3" label="초3" />
								<form:option value="4" label="초4" />
								<form:option value="5" label="초5" />
								<form:option value="6" label="초6" />
								<form:option value="7" label="중1" />
								<form:option value="8" label="중2" />
								<form:option value="9" label="중3" />
								<form:option value="10" label="고1" />
								<form:option value="11" label="고2" />
								<form:option value="12" label="고3" />
								<form:option value="13" label="재수이상" />
							</form:select>
							<hr>
						</div>
						<div>
							성별 &nbsp;&nbsp;
							<form:label path="c_gender">남자</form:label>
							<form:radiobutton path="c_gender" value="남" checked="checked"/>
							<form:label path="c_gender">여자</form:label>
							<form:radiobutton path="c_gender" value="여"/>
							<hr>
						</div>
						<div>
							학업수준 &nbsp;&nbsp;
							<form:label path="c_level">상</form:label>
							<form:radiobutton path="c_level" checked="checked" value="상"/> &nbsp;
							<form:label path="c_level">중상</form:label>
							<form:radiobutton path="c_level" value="중상"/> &nbsp;
							<form:label path="c_level">중</form:label>
							<form:radiobutton path="c_level" value="중"/> &nbsp;
							<form:label path="c_level">중하</form:label>
							<form:radiobutton path="c_level" value="중하"/> &nbsp;
							<form:label path="c_level">하</form:label>
							<form:radiobutton path="c_level" value="하"/> &nbsp;
							<hr>
						</div>
						<div>
							<div class="text-right">
								<form:button type="submit" class="btn btn-primary">입력 완료</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>

	</section>
	<!-- modify section -->

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
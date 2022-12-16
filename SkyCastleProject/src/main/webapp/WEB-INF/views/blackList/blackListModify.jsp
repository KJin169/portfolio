<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <c:url var='root' value='/'/>   
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>::SKYCASTLE::</title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">

  <!-- ** Plugins Needed for the Project ** -->
  <!-- serachbar -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
          <li class="list-inline-item text-white h3 font-secondary nasted">고객센터</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">블랙리스트</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<section class="section bg-gray">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
       <div class="section-title text-center">
          <h2 class="text-color">블랙리스트 수정</h2>
          </div>
      </div>
    </div>

<div class="board_view">
<form:form action="${root }blackList/blackListModify_pro" method="post" modelAttribute="blModifyBean"
		enctype="multipart/form-data">
		<form:hidden path="m_memberNo" value="${m_memberNo }"/>
	    <form:hidden path="a_memberNo" value="${a_memberNo }"/>
<table>
		
		<tr>
		 <th class="th-writetitle"><form:label path="m_name">고객명</form:label></th>
		 <th class="th-border">
			<form:input path="m_name" class="write-width" readonly="true" />
			<form:errors path="m_name" style="color:red; display: flex; padding-left: 15px;"></form:errors>
		</th>
		</tr>
		
		<tr>
		 <th class="th-writetitle"><form:label path="a_name" >학원명</form:label></th>
		 <th class="th-border">
			<form:input path="a_name" class="write-width" readonly="true" />
			<form:errors path="a_name" style="color:red; display: flex; padding-left: 15px;"></form:errors>
		</th>
		</tr>
		
		<tr>
		 <th class="th-writetitle"><form:label path="black_contents">사유</form:label></th>
		 <th class="th-border">
		    <form:textarea path="black_contents" class="write-width" rows="10" style="resize:none"></form:textarea>
			<form:errors path="black_contents" style="color:red; display: flex; padding-left: 15px;"></form:errors>
			</th>
			</tr>
	
</table>
<br>
<div align="right">

<form:button type="submit" class="search-btn btn-color">수정 완료</form:button>
<input type="button" value="목록" class="search-btn btn-color" style="cursor:pointer;" onclick="location.href='${root }blackList/blackListList'"/>
</div>
</form:form>
</div>
</div>

</section>

<!-- /Board -->  

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

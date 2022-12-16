<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>

<html lang="ko">
<head>

  <!-- Basic Page Needs
	================================================== -->
  <meta charset="utf-8">
  <title> :: My Page ::</title>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
//학년 출력 변환 json
	var convertData = {
		"grade": [
			"미취학", "초1", "초2", "초3", "초4", "초5", "초6", "중1", "중2", "중3", "고1", "고2", "고3", "재수생 이상"
		]
	}
  </script>

<!-- ===============================  header  =============================== -->
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->

<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item h2 text-primary font-secondary">My page</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">학생 정보</li>
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
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/mypage_siteAsk"><h4>내 문의사항</h4></a></li>
          </ul>
        </div>
      </div>
    </div>
	<!-- student info -->
	<section class="section">
<div class="container">
<h3 class="text-center">학생 정보</h3><hr>
<div class="row justify-content-center">
<div>
	<c:forEach var="str" items="${memberChildlist}">
	<div class="text-center">
	
	<script type="text/javascript">
$(document).ready(function() {
			
			
			window.onload = convertPro();
			
			function convertPro() {
				//alert("이건 되냐?");
				
				var level = ${str.c_grade};
				//alert(convertData.grade[level]);
				
				var space = '#grade${str.c_name}';
				
				$(space).html(convertData.grade[level]);
				//$('#a_classifySpace').html(convertData.a_classify[${academyInfoBasic.a_classify }]);
				
			}
			
		});
	</script>
			<table class="center">
			<tr>
				<td class="text-left"><strong>학생이름 :</strong></td>
				<td class="text-center">${str.c_name}</td>
			</tr>
			<tr>
				<td class="text-left"><strong>학년 :</strong></td>
				<td class="text-center"><a id="grade${str.c_name}">${str.c_grade}</a></td>
			</tr>	
			<tr>
				<td class="text-left"><strong>성별 :</strong></td>
				<td class="text-center">${str.c_gender}</td>
			</tr>	
			<tr>
				<td class="text-left"><strong>학업수준 :</strong></td>
				<td class="text-center">${str.c_level}</td>
			</tr>	
			</table>	
		
	</div>
	<br><br>
	<br>
	<div class="text-center">
	<a href="${root }member/modifyChild?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}&c_name=${str.c_name}" class="btn btn-primary">자녀정보수정</a>
	<a href="${root }member/deleteChild?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}&c_name=${str.c_name}" class="btn btn-danger">자녀정보삭제</a>
	</div>
	
	<br><hr><br><br>
	</c:forEach>
	
	<a href="${root }member/insertChild?m_memberNo=${sessionScope.loginMemberBean.m_memberNo}" class="btn btn-primary">자녀정보입력</a>	
	
</div>
</div>
</div>
</section>
	<!-- / student info -->




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
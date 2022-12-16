<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var='root' value='/'/> 
<c:set var = "path" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
	================================================== -->
  <meta charset="utf-8">
  <title>:: My Page ::</title>

  <!-- Mobile Specific Metas
	================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Educenter HTML Template v1.0">

  <!-- ** Plugins Needed for the Project ** -->
  <!-- Main Stylesheet -->
  <link href="css/style.css" rel="stylesheet">
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


  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
var convertData = {
		"grade": [
			"미취학", "초1", "초2", "초3", "초4", "초5", "초6", "중1", "중2", "중3", "고1", "고2", "고3", "재수생 이상"
		],
		"a_classify": {
			"1":"종합",
			"2":"단과",
			"3":"예체능(기타)"
		}
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
          <li class="list-inline-item text-white h3 font-secondary nasted">찜 목록</li>
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
           <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}member/mypage_siteAsk"><h4>내 문의사항</h4></a></li>
          </ul>
        </div>
      </div>
    </div>
<!-- user info  -->


<!-- courses -->
<section class="section">
  <div class="container">
    <!-- course list -->
	<div class="row justify-content-center">
		<c:forEach var="fList" items="${favoritelist }">
		<script type="text/javascript">
		
		$(document).ready(function() {
			//alert("이건 되냐?");
			
			window.onload = convertPro(), getWishHeart(${fList.a_memberNo });
			
			function convertPro() {
				//alert("이건 되냐?");
				var min = ${fList.a_gradeMin };
				var max = ${fList.a_gradeMax };
				//alert(convertData.grade[min]);
				
				var space = '#gradeSpace'+${fList.a_memberNo };
				
				$(space).html(convertData.grade[min] + " ~ " + convertData.grade[max]);
				//$('#a_classifySpace').html(convertData.a_classify[${academyInfoBasic.a_classify }]);
				
			}
			
		});
		
		//찜하기 출력
		function getWishHeart(a_memberNo) {
			var wishNum = "#wish"+a_memberNo;
			//alert(wishNum);
			
			$.ajax({
				url : "${root}board/boardListWish/"+a_memberNo,
				type : "GET",
				dataType : "text",
				error : function(e) {
					alert("안됨1");
					//alert(e);
				},
				success : function(wishIs) {
					if(wishIs.trim()=="true") {
						$(wishNum).attr('class',"like-btn active");
					} else if(wishIs.trim()=="false") {
						$(wishNum).attr('class',"like-btn");
					}
				}
			});
		}
		
		
		//찜하기(찜/해제)
		function switchWishHeart(a_memberNo) {
			//alert("헤이!");
			//alert(a_memberNo);
			
			$.ajax({
				url : "${root}board/boardListWishOnOff/"+a_memberNo,
				type : "GET",
				dataType : "text",
				error : function(e) {
					alert("안됨2");
					//alert(e);
				},
				success : function(result) {
					if(result=="false") {
						alert("일반 회원으로 로그인해주세요.");
					} else if(result=="on") {
						alert("찜 등록 완료.");
					} else if(result=="off") {
						alert("찜 해제 완료.");
					} else if(result=="error") {
						alert("알 수 없는 오류");
					}
					
					getWishHeart(a_memberNo);
				}
			});
		}
		
		
		
		</script>
		<!-- course item -->
			<div class="col-lg-4 col-sm-6 mb-5">
				<div class="card p-0 border-primary rounded-0 hover-shadow">
					<c:choose>
						<c:when test="${fList.a_mainImg != null }">
							<img class="card-img-top rounded-0" src="${root }upload/${fList.a_mainImg}" />
						</c:when>
						<c:otherwise>
							<img class="card-img-top rounded-0" src="images/courses/course-1.jpg" alt="이미지 없음">
						</c:otherwise>
					</c:choose>
					<div class="card-body">
						<ul class="list-inline mb-2">
							<li class="list-inline-item"><i
					         class="ti-calendar mr-1 text-color"></i>${fList.a_location }
								&nbsp;<i class="text-color"id="gradeSpace${fList.a_memberNo }" style="
    font-style: inherit;
">
									${fList.a_gradeMin } ~ ${fList.a_gradeMax }
									<input type="hidden" id="gradeMin" value="${fList.a_gradeMin }">
									<input type="hidden" id="gradeMax" value="${fList.a_gradeMax }">
								</i>
						</li>
						</ul>
						
							<h4 class="card-title">${fList.a_name }</h4>
						
						<p class="card-text mb-4">
							<c:choose>
								<c:when test="${fn:length(fList.a_introduce) <= 50}">
									${gList.a_introduce }
								</c:when>
								<c:when test="${fn:length(fList.a_introduce) > 50}">
									${fn:substring(fList.a_introduce, 0, 49)}...
								</c:when>
							</c:choose>
						</p>
						<a href="${root }board/gBoardRead?a_memberNo=${fList.a_memberNo }" class="btn btn-primary btn-sm">상세 보기</a>
	   				<!--  like button  -->
						<a class="like-btn" id="wish${fList.a_memberNo }" onclick="switchWishHeart(${fList.a_memberNo })">
							<svg class="like_icon" width="44" height="39" viewBox="0 0 44 39" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M13 2C6.925 2 2 6.925 2 13C2 24 15 34 22 36.326C29 34 42 24 42 13C42 6.925 37.075 2 31 2C27.28 2 23.99 3.847 22 6.674C20.9857
								5.22921 19.6382 4.05009 18.0715 3.23649C16.5049 2.42289 14.7653 1.99875 13 2Z"/>
							</svg>
						</a>
					<!--  /like button  -->
	     				</div>
	 			 	</div>
			</div>
		</c:forEach>
	</div>
	<!-- /course list -->
  </div>
</section>
<!-- /courses -->


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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>Educenter - Education HTML Template</title>

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

<!-- review Stylesheet -->
<link href="css/gBoardRead.css" rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">


</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
   
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
   
   window.onload = convertPro(), getWishHeart(${academyInfoBasic.a_memberNo});
   
   function convertPro() {
      $('#gradeSpace').html(convertData.grade[${academyInfoBasic.a_gradeMin }] + " ~ " + convertData.grade[${academyInfoBasic.a_gradeMax }]);
      $('#a_classifySpace').html(convertData.a_classify[${academyInfoBasic.a_classify }]);
      //alert("이건 되냐?");
      //alert(convertData.a_classify[${academyInfoBasic.a_classify }]);
      
   }
});

//찜하기 출력
function getWishHeart(a_memberNo) {
	//var wishNum = "#wish"+a_memberNo;
	//alert(wishNum);
	
	$.ajax({
		url : "boardListWish/"+a_memberNo,
		type : "GET",
		dataType : "text",
		error : function(e) {
			alert("안됨1");
			//alert(e);
		},
		success : function(wishIs) {
			if(wishIs.trim()=="true") {
				$('#wish').attr('class',"like-btn active");
			} else if(wishIs.trim()=="false") {
				$('#wish').attr('class',"like-btn");
			}
		}
	});
}


//찜하기(찜/해제)
function switchWishHeart(a_memberNo) {
	//alert("헤이!");
	//alert(a_memberNo);
	
	$.ajax({
		url : "boardListWishOnOff/"+a_memberNo,
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

//리뷰 작성
function reviewWrite() {
	//alert("일단 되긴 함?");
	
	
	$.ajax({
		url : "academyReviewWrite",
		type : "post",
		dataType : "text",
		data : {
			"a_memberNo" : ${academyInfoBasic.a_memberNo},
			"r_contents" : $("textarea[name=r_contents]").val(),
			"r_score" : $("input:radio[name=r_score]:checked").val()
		},
		error : function(e) {
			alert("안됨3");
		},
		success : function(result) {
			if(result=="false") {
				alert("리뷰는 일반 회원으로 로그인 시에만 작성할 수 있습니다.");
			} else if(result=="true") {
				//alert("작성 성공 테스트");
				location.reload();
			} else if(result=="noScore") {
				alert("리뷰점수를 입력해주세요.");
			}
		}
		
	});
}

//리뷰 삭제
function reviewRemove(r_no, r_writerNo) {
	//alert("일단 되긴 함?2");
	if(confirm("삭제 하시겠습니까?")){
	
		$.ajax({
			url : "academyReviewRemove",
			type : "post",
			dataType : "text",
			data : {
				"a_memberNo" : ${academyInfoBasic.a_memberNo},
				"r_no" : r_no,
				"r_writerNo" : r_writerNo
			},
			error : function(e) {
				
				alert("안됨4");
				
			},
			success : function(result) {
				if(result=="false") {
					alert("리뷰는 일반 회원으로 로그인 시에만 작성할 수 있습니다.");
				} else if(result=="selfDel") {
					alert("리뷰가 삭제되었습니다.");
					location.reload();
				} else if(result=="adminDel") {
					alert("관리자권한으로 리뷰가 삭제되었습니다.");
					location.reload();
				} else if(result=="unmatched") {
					alert("권한이 없습니다.");
				}
			}
			
		});
	} else {
		return false;
	}
}

//리뷰 중복 체크
function reduplication() {
	alert("리뷰는 하나만 작성할 수 있습니다.\n새로 작성하기를 원하시면 기존의 리뷰를 삭제해주세요.");
}


</script>
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
					<li class="list-inline-item text-white h3 font-secondary nasted">학원</li>
					<li class="list-inline-item text-white h3 font-secondary nasted">학원 상세페이지</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- /page title -->

<!-- section -->
<section class="section-sm">
	<div class="container">
		<div class="row">
			<div class="col-12 mb-4">
				<!-- course thumb -->
				<c:choose>
					<c:when test="${academyInfoBasic.a_mainImg != null }">
						<img class="card-img-top rounded-0"
							src="${root }upload/${academyInfoBasic.a_mainImg}" />
					</c:when>
					<c:otherwise>
						<img class="card-img-top rounded-0"
							src="images/courses/course-1.jpg" alt="이미지 없음">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	<!-- course info -->
	 <div class="row align-items-center mb-5">
      <div class="col-xl-3 order-1 col-sm-6 mb-4 mb-xl-0">
        <h2>${academyInfoBasic.a_name }</h2>
      </div>
      <div class="col-xl-6 order-sm-3 order-xl-2 col-12 order-2">
        <ul class="list-inline text-xl-center">
          <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
            <img class="icon-width" src="images/icon/icons4.png" style="width: 40px;">
              <div class="text-left">
                <h6 class="mb-0">지역</h6>
                <p class="mb-0">${academyInfoBasic.a_location }</p>
              </div>
            </div>
          </li>
          <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
             <img class="icon-width" src="images/icon/icons2.png" style="width: 40px;">
              <div class="text-left">
                <h6 class="mb-0">전화번호</h6>
                <p class="mb-0">${academyInfoBasic.a_tele }</p>
              </div>
            </div>
          </li>
          
         
          <li class="list-inline-item mr-4 mb-3 mb-sm-0">
            <div class="d-flex align-items-center">
              <img class="icon-width" src="images/icon/icons5.png" style="width: 40px;">
              <div class="text-left">
                <h6 class="mb-0">학원분류</h6>
               <p class="mb-0" id="a_classifySpace">${academyInfoBasic.a_classify}</p>
              </div>
            </div>
          </li>
        </ul>
      </div>

			<div class="col-xl-3 text-sm-right text-left order-sm-2 order-3 order-xl-3 col-sm-6 mb-4 mb-xl-0">
		<!--  like button  -->
				<c:if test="${sessionScope.loginAcademyMemberBean == null }">
					<a class="like-btn" id="wish" onclick="switchWishHeart(${academyInfoBasic.a_memberNo })">
						<svg class="like_icon" width="44" height="39" viewBox="0 0 44 39" fill="none" xmlns="http://www.w3.org/2000/svg">
				            <path d="M13 2C6.925 2 2 6.925 2 13C2 24 15 34 22 36.326C29 34 42 24 42 13C42 6.925 37.075 2 31 2C27.28 2 23.99 3.847 22 6.674C20.9857 
				            5.22921 19.6382 4.05009 18.0715 3.23649C16.5049 2.42289 14.7653 1.99875 13 2Z" />
				        </svg>
					</a>
				</c:if>
		<!--  /like button  -->
				<!-- <a href="course-single.html" class="btn btn-primary">상담예약</a> -->
			</div>
		<!-- border -->
			<div class="col-12 mt-4 order-4">
				<div class="border-bottom border-primary"></div>
			</div>
		</div>

		<!-- scroll -->
		<div>
			<ul class="list">
				<li><a href="#scroll1" class="scroll_move">학원소개</a>
				<li>
				<li><a href="#scroll2" class="scroll_move">강사소개</a>
				<li>
				<li><a href="#scroll3" class="scroll_move">리뷰</a>
				<li>
					<!-- <li><a href="#scroll4" class="scroll_move">scroll4</a><li> -->
			</ul>
		</div>
		<div class="listbox">

			<!-- /scroll -->

			<!-- course details -->

			<div class="row">
				<div class="col-12 mb-4">
					<div class="scroll1" id="scroll1"></div>
					<h3>학원소개</h3>

					<p>${academyInfoBasic.a_introduce }</p>
					<c:choose>
						<c:when test="${academyInfoBasic.a_mainImg != null }">
							<img src="${root }upload/${academyInfoBasic.a_file}" />
						</c:when>
					</c:choose>
				</div>
				<%-- <div class="col-12 mb-4">
					<h3 class="mb-3">과목</h3>
					<div class="col-12 px-0">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-styled">
									<c:forEach var="sub" items="${academyInfoSubject }">
										<li>${sub.a_subject }</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div> --%>
				<div class="col-12 mb-4">
					<h3 class="mb-3">상세주소</h3>
					<div class="col-12 px-0">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-styled">
									<li>${academyInfoBasic.a_location } / ${academyInfoBasic.a_locationDetail }
										<div id="map" style="width: 100%; height: 350px;"></div>
										<input type="hidden" id="loc" value="${academyInfoBasic.a_location } ${academyInfoBasic.a_name }">
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 mb-4">
					<h3 class="mb-3">수업 학년</h3>
					<div class="col-12 px-0">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-styled">
									<li id="gradeSpace">${academyInfoBasic.a_gradeMin }~${academyInfoBasic.a_gradeMax }</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 mb-4">
					<h3 class="mb-3">학원 운영 시간</h3>
					<div class="col-12 px-0">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-styled">
									<li>${academyInfoBasic.a_openTime }~${academyInfoBasic.a_closeTime }</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 mb-4">
					<h3 class="mb-3">셔틀 유무</h3>
					<div class="col-12 px-0">
						<div class="row">
							<div class="col-md-6">
								<ul class="list-styled">
									<li>${academyInfoBasic.a_shuttle }</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- /section -->

<!-- teachers carousel -->
<section class="section-sm">
	<div class="scroll2" id="scroll2"></div>
	<div class="container">

	<h2>강사진</h2>
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
				<%int i = 0;%>
				<c:forEach items="${academyInfoTeacher}"><%i++;%>
			<li data-target="#carousel-example-multi" data-slide-to=<%=i%>></li>
				</c:forEach>
		</ol>
	<!--/.Indicators-->
	
		<div class="carousel-inner v-2" role="listbox">
			<div class="carousel-item active">
				<div class="col-12 col-md-4">
					<div class="card mb-2">
						<img class="card-img-top" src="images/logo.png" alt="logo" alt="Card image cap">
						<div class="card-body">
							<p>
								<br> <br> <br> <br>
							</p>
							<h4 class="card-title font-weight-bold">마음에 드는 강사에게 리뷰를 남겨주세요.</h4>
							<p class="card-text"></p>
							<!-- <a class="btn btn-primary btn-md btn-rounded" href="gBoardRead_teacher">Button</a> -->
							<p>
								<br> <br> <br>
							</p>
						</div>
					</div>
				</div>
			</div>
			<c:forEach var="ait" items="${academyInfoTeacher}">
			<div class="carousel-item">
				<div class="col-12 col-md-4">
					<div class="card mb-2">
						<c:choose>
							<c:when test="${ait.t_file != null }">
								<img class="card-img-top rounded-0" src="${root }upload/${ait.t_file}" />
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (34).jpg" alt="Card image cap">
							</c:otherwise>
						</c:choose>
						<div class="card-body">
							<h4 class="card-title font-weight-bold">${ait.t_name }</h4>
							<p class="card-text" style="font-weight: bold">${ait.t_subject }</p>
							<p class="card-text">
								<c:choose>
									<c:when test="${fn:length(ait.t_contents) <= 100}">
				             			${ait.t_contents }
				             		</c:when>
									<c:when test="${fn:length(ait.t_contents) > 100}">
										${fn:substring(ait.t_contents, 0, 99)}...
									</c:when>
								</c:choose>
							</p>
							<a class="btn btn-primary btn-md btn-rounded" href="gBoardRead_teacher?a_memberNo=${ait.a_memberNo}&t_name=${ait.t_name}">상세보기</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	</div>
</section>
<!-- /teachers carousel -->
<!-- comment -->
<div class="container">
<div class="scroll3" id="scroll3"></div>
	<div class="be-comment-block">
	
		<c:if test="${sessionScope.loginAcademyMemberBean == null }">
			<form id="comment-form" method="post" class="form-block">
				<h4 class="mb-4">리뷰남기기</h4>
					<div class="row">
					<div class="star-rating" style="padding-left: 2%;padding-top:1%">
						<input id="5-stars" name="r_score" type="radio" value="5">
						<label for="5-stars" class="star">★</label>
						<input id="4-stars" name="r_score" type="radio" value="4">
						<label for="4-stars" class="star">★</label>
						<input id="3-stars" name="r_score" type="radio" value="3">
						<label for="3-stars" class="star">★</label>
						<input id="2-stars" name="r_score" type="radio" value="2">
						<label for="2-stars" class="star">★</label>
						<input id="1-star" name="r_score" type="radio" value="1">
						<label for="1-star" class="star">★</label>
					</div>
					<div class="col-xs-12 col-sm-6" style="max-width: 40%;">
						<div class="form-group fl_icon">
							<div class="icon">
								<i class="fa fa-user"></i>
							</div>
							<input class="form-input" type="text" placeholder="${sessionScope.loginMemberBean.m_id }" readonly="readonly">
						</div>
					</div>
					<div class="form-group" style="width: 597px;margin-left: 1%;">
						<textarea id="r_contents" name="r_contents" style="resize: none;width: 140%;" placeholder="학원에 대한 리뷰를 남겨주세요." class="form-group" rows="5" cols="30"></textarea>
					</div>
					<button id="reviewSubmit" onclick="reviewWrite()" style="height: 105px;left: 24%;" type="button" class="btn btn-primary pull-right">댓글 쓰기</button>
				</div>
			</form>
		</c:if>
	<script type="text/javascript">
		var count = 0;
		var total = 0.0;
		
		$(window).on("load", function() {
			setTimeout(function() {
				if(count!=0) {
					var avg = Math.round(total/count * 100) / 100
					$('#rCount').html(count);
					$('#rAvg').html(avg);
				}
				//alert(count+"끝");
			},100);
		});
	</script>
		<hr>
		<h1 class="comments-title">
			Comments (<span id="rCount">0</span>) | 평점 : <span id="rAvg">0.0</span>
		</h1>
		<c:forEach var="air" items="${academyInfoReview}">
		<div class="be-comment">
			<div class="be-img-comment">
				<img src="images/anon.png" alt="댓글이미지" class="be-ava-comment" style="margin-top: 40%">
			</div>
			<div class="be-comment-content">
				<span class="be-comment-name"> ${air.r_writerId }
					<a class="rating-group" id="scoreStar${air.r_writerNo }">
						<input disabled="disabled" class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
						<label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
						<input disabled="disabled" class="rating__input" id="rating3-1" value="1" type="radio">
						<label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
						<input disabled="disabled" class="rating__input" id="rating3-2" value="2" type="radio">
						<label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
						<input disabled="disabled" class="rating__input" id="rating3-3" value="3" type="radio">
						<label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
						<input disabled="disabled" class="rating__input" id="rating3-4" value="4" type="radio">
						<label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
						<input disabled="disabled" class="rating__input" id="rating3-5" value="5" type="radio">
					</a>
				</span>
				<span class="be-comment-time">
					<i class="fa fa-clock-o"></i><fmt:formatDate value="${air.r_writeTime }" pattern="yy/MM/dd hh:mm" />
				</span>
				<p class="be-comment-text">${air.r_contents }</p>
				<p align="right">
				<c:if test="${air.r_writerNo == sessionScope.loginMemberBean.m_memberNo || Integer.toString(sessionScope.loginMemberBean.m_memberNo).length() == 4}">
					<button onclick="reviewRemove('${air.r_no }', '${air.r_writerNo }')" class="del-btn">삭제하기</button>
				</c:if>
				</p>
			</div>
		</div>
	<script type="text/javascript">
		$(window).on("load", function() {
			//alert(${air.r_score });
			var space = '#scoreStar' + ${air.r_writerNo };
			var ckeckVal = '#rating3-' + ${air.r_score };
			$(space).find(ckeckVal).attr('checked','checked');
			
			count++;
			total +=${air.r_score };
		
		});
	</script>
	<script type="text/javascript">
		$(window).on("load", function() {
			if(${air.r_writerNo} == ${sessionScope.loginMemberBean.m_memberNo}) {
				//alert("있음");
				//$('#reviewSubmit').removeAttr('onclick');
				$('#reviewSubmit').attr('onclick','reduplication()');
			}
		});
	</script>
		
	
		</c:forEach>
	</div>
</div>

	<!-- /comment -->

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
	<script src="plugins/google-map/gmap.js"></script>

	<!-- Main Script  카카오지도-->
	<script src="js/script.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b91d7ac694b55d24d6b56c18b966b4cf&libraries=services"></script>
	<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
var loc = document.getElementById('loc').value;
ps.keywordSearch(loc, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
</body>
</html>
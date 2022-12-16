<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>gBoardRead_teacher</title>

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

<!-- review Stylesheet -->
<link href="css/gBoardRead.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
 
//리뷰 작성
function reviewWriteT() {
	//alert("일단 되긴 함?");
	
	
	$.ajax({
		url : "teacherReviewWrite",
		type : "post",
		dataType : "text",
		data : {
			"a_memberNo" : ${teacherInfo.a_memberNo},
			"t_name" : '${teacherInfo.t_name}',
			"t_reContents" : $("textarea[name=t_reContents]").val(),
			"t_score" : $("input:radio[name=t_score]:checked").val()
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
function reviewRemoveT(t_reNo, t_reWriterNo) {
	//alert("일단 되긴 함?2");
	if(confirm("삭제 하시겠습니까?")){
	
		$.ajax({
			url : "teacherReviewRemove",
			type : "post",
			dataType : "text",
			data : {
				"a_memberNo" : ${teacherInfo.a_memberNo},
				"t_name" : '${teacherInfo.t_name}',
				"t_reNo" : t_reNo,
				"t_reWriterNo" : t_reWriterNo
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
   <c:import url="/WEB-INF/views/include/header.jsp"/>
<!-- ===============================  header  =============================== -->

<!-- page title -->
<section class="page-title-section overlay" data-background="images/backgrounds/page-title.jpg">
  <div class="container">
    <div class="row">
      <div class="col-md-8">
        <ul class="list-inline custom-breadcrumb mb-2">
          <li class="list-inline-item h2 text-primary font-secondary">Home</li>
          <li class="list-inline-item text-white h3 font-secondary nasted">강사 상세페이지</li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- /page title -->

<!-- teacher details -->
<section class="section">
  <div class="container">
    <div class="row">
      <div class="col-md-5 mb-5">
      	<c:choose>
			<c:when test="${teacherInfo.t_file != null }">
				<img class="img-fluid w-100" src="${root }upload/${teacherInfo.t_file}" />
			</c:when>
			<c:otherwise>
				<img class="img-fluid w-100" src="images/teachers/teacher-1.png" alt="이미지 없음">
			</c:otherwise>
		</c:choose>
        	<!-- <img class="img-fluid w-100" src="images/teachers/teacher-1.png" alt="teacher"> -->
      </div>
      <div class="col-md-6 mb-5">
        <h3>${teacherInfo.t_name }</h3>
        <h6 class="text-color">${teacherInfo.t_subject }</h6>
        <br>
        <h4 class="mb-4">소속 학원</h4>
        <p class="mb-5"><a href="gBoardRead?a_memberNo=${teacherInfo.a_memberNo }">${teacherInfo.a_name }</a></p>
        <br>
        <h4 class="mb-4">담당 과목</h4>
        <p class="mb-5">${teacherInfo.t_subject }</p>
        <br>
        <h4 class="mb-4">한줄 소개</h4>
        <p class="mb-5">${teacherInfo.t_contents }</p>
        <!-- <div class="row">
          <div class="col-md-6">
            <h4 class="mb-4">담당 과목</h4>
            <ul class="list-unstyled">
              <li class="mb-3">국어</li>
              <li class="mb-3">논술</li>
            </ul>
          </div>
        </div> -->
      </div>
    </div>
  </div>
</section>
<!-- /teacher details -->

<!-- comment -->
<div class="container">
	<div class="be-comment-block">
		<c:if test="${sessionScope.loginAcademyMemberBean == null }">
			<form id="comment-form" method="post" class="form-block">
				<h4 class="mb-4">리뷰남기기</h4>
					<div class="row">
					<div class="star-rating" style="padding-left: 2%;padding-top:1%">
						<input id="5-stars" name="t_score" type="radio" value="5">
						<label for="5-stars" class="star">★</label>
						<input id="4-stars" name="t_score" type="radio" value="4">
						<label for="4-stars" class="star">★</label>
						<input id="3-stars" name="t_score" type="radio" value="3">
						<label for="3-stars" class="star">★</label>
						<input id="2-stars" name="t_score" type="radio" value="2">
						<label for="2-stars" class="star">★</label>
						<input id="1-star" name="t_score" type="radio" value="1">
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
						<textarea id="t_reContents" name="t_reContents" style="resize: none;width: 140%;" placeholder="강사에 대한 리뷰를 남겨주세요." class="form-group" rows="5" cols="30"></textarea>
					</div>
					<button id="reviewSubmit" onclick="reviewWriteT()" style="height: 105px;left: 24%;" type="button" class="btn btn-primary pull-right">댓글 쓰기</button>
				</div>
			</form>
		</c:if>
		<hr>
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
		<h1 class="comments-title">
			Comments (<span id="rCount">0</span>) | 평점 : <span id="rAvg">0.0</span>
		</h1>
		<c:forEach var="tri" items="${teacherReviewInfo}">
		<div class="be-comment">
			<div class="be-img-comment">
				<img src="images/anon.png" alt="댓글이미지" class="be-ava-comment" style="margin-top: 40%">
			</div>
			<div class="be-comment-content">
				<span class="be-comment-name"> ${tri.t_reWriterId }
					<a class="rating-group" id="scoreStar${tri.t_reWriterNo }">
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
					<i class="fa fa-clock-o"></i><fmt:formatDate value="${tri.t_reWriteTime }" pattern="yy/MM/dd hh:mm" />
				</span>
				<p class="be-comment-text">${tri.t_reContents }</p>
				<p align="right">
				<c:if test="${tri.t_reWriterNo == sessionScope.loginMemberBean.m_memberNo || Integer.toString(sessionScope.loginMemberBean.m_memberNo).length() == 4}">
					<button onclick="reviewRemoveT('${tri.t_reNo }', '${tri.t_reWriterNo }')" class="del-btn">삭제하기</button>
				</c:if>
				</p>
			</div>
		</div>
	<script type="text/javascript">
		$(window).on("load", function() {
			//alert(${air.r_score });
			var space = '#scoreStar' + ${tri.t_reWriterNo };
			var ckeckVal = '#rating3-' + ${tri.t_score };
			$(space).find(ckeckVal).attr('checked','checked');
			
			
			
			count++;
			total +=${tri.t_score };
		});
	</script>
	<script type="text/javascript">
		$(window).on("load", function() {
			if(${tri.t_reWriterNo} == ${sessionScope.loginMemberBean.m_memberNo}) {
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU"></script>
<script src="plugins/google-map/gmap.js"></script>

<!-- Main Script -->
<script src="js/script.js"></script>

</body>
</html>
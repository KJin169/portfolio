<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> :: My Academy Page ::</title>
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
<script type="text/javascript">
/* 회원가입 유효성 검사 (학원) */
function Validation2(){


// password 유효성 검사 (특수문자 없이 8~16글자)
var a_pw_RegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;


// 세부주소 유효성 검사
var a_locationDetail_RegExp = /^[a-zA-Z0-9가-힣\s]{60}$/;

// 전화번호 유효성 검사
var a_tele_RegExp = /^[0-9]{10,11}$/;


var a_objPw = document.getElementById("a_pw"); // 비밀번호
var a_objLocationDetail = document.getElementById("a_locationDetail"); // 상세주소
var a_objTele = document.getElementById("a_tele"); // 학원 전화번호


// ============== PASSWORD 유효성검사 ============== //
if(a_objPw.value=='') {
	alert("비밀번호를 입력해주세요.");
	return false;
}
else if(!a_pw_RegExp.test(a_objPw.value)) {
	alert("비밀번호는 특수문자 포함(?!@$%^&*-) 숫자포함 영어 대소문자로 8~15자를 입력해주세요.");
	return false;
}
// ================================================ //

// ================ 상세주소 유효성 검사 ================ //
else if(a_objLocationDetail.value=='') {
	alert("상세주소를 입력해주세요.");
	return false;
}
else if(a_locationDetail_RegExp.test(a_objLocationDetail.value)) {
	alert("상세주소 형식이 올바르지 않습니다. 특수문자를 제외하고 입력해주세요.");
	return false;
}
// ================================================= //

// ============== 전화번호 유효성 검사 ============== //
else if(a_objTele.value=='') {
	alert("연락처를 입력해주세요.");
	return false;
}
else if(!a_tele_RegExp.test(a_objTele.value)) {
	alert("연락처 형식이 올바르지 않습니다. 숫자만 입력해주세요. 10, 11자의 숫자만 입력해주세요.");
	return false;
}
// ============================================= //
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
          <li class="list-inline-item text-white h3 font-secondary nasted">학원 정보 수정</li>
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
           <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/my_academypage"><h4>학원 정보</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyinfo"><h4>학원 소개</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyteacher"><h4>학원 강사 조회</h4></a></li>
			<li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academypay"><h4>결제 내역 조회</h4></a></li>     
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/mypage_siteAcaAsk"><h4>내 문의사항</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root}academymember/academyBlacklist"><h4>블랙리스트 등록 조회</h4></a></li>
          </ul>
        </div>
      </div>
    </div>

	<!-- academy member modify -->
	<section class="section bg-gray">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="text-center">학원 정보 수정</h3>
					<hr>
				</div>
			</div>
			<div class="row justify-content-center">
			<div class="col-lg-8 mb-5 mb-lg-0">
					<form:form action="${root}academymember/modify_pro" method="post"
						modelAttribute="modifyAcademyMemberBean" onsubmit="return Validation2();">
						<form:hidden path="a_memberNo" />
						<div>
							<form:label path="a_id"><strong>아이디 :&nbsp;&nbsp;&nbsp;</strong></form:label>
							<form:input class="form-control mb-3" path="a_id" readonly="true"/><hr>
						</div>
						<div>
							<form:label path="a_name"><strong>이름 :</strong></form:label>
							<form:input path="a_name" class="form-control mb-3" readonly="true"/><hr>
						</div>
						<div>
							<form:label path="a_pw">비밀번호 변경</form:label>
							<form:input class="form-control mb-3" type="password" path="a_pw" placeholder="비밀번호"/>
							<form:errors path="a_pw" style="color:red"></form:errors><hr>
						</div>
							<form:label path="a_location">지역(동까지)</form:label>
     	 				<div>
      						<select tabindex="0" id="sido" name="sido"><option value="">지역 선택</option></select>
							<select tabindex="0" id="sigugun" name="sigugun"><option value="">구-시선택</option></select>
							<select tabindex="0" id="dong" name="dong"><option value="">구-시선택</option></select>
		 					<form:input class="form-control mb-3" type="hidden" path="a_location" value=""></form:input><hr>
						</div>
						<div>
							<form:label path="a_locationDetail"><strong>상세주소</strong></form:label>
							<form:input path="a_locationDetail" class="form-control mb-3"/><hr>
						</div>
						<div>
							<form:label path="a_tele"><strong>학원대표전화번호</strong></form:label>
							<form:input path="a_tele" class="form-control mb-3"/><hr>
						</div>
						<div>
						<form:label path="a_classify">학원분류</form:label> &nbsp;&nbsp;
							<form:select path="a_classify" >
								<form:option value="1" label="종합" />
								<form:option value="2" label="단과" />
								<form:option value="3" label="예체능(기타)" />
							</form:select><hr>
						</div>
						<div class="text-center">
							<form:button type="submit" class="btn btn-primary">정보수정</form:button>
						</div>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
						      <script type="application/javascript"
								src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
						      <script type="text/javascript">
						      	jQuery(document).ready(function () {
						    		//sido option 추가
						    		jQuery.each(hangjungdong.sido, function (idx, code) {
						    			//append를 이용하여 option 하위에 붙여넣음
						    			jQuery('#sido').append(fn_option(code.sido, code.codeNm));
						    		});
						
						    		//sido 변경시 시군구 option 추가
						    		jQuery('#sido').change(function () {
						    			/* //시도 히든 값
						    			if($('#sido option:selected').val()=="") {
						    				$('#sido_text').val("");
						    			}else {
						    				$('#sido_text').val($('#sido option:selected').text());
						    			}
						    			$('#sigugun_text').val(""); */
						    			
						    			jQuery('#sigugun').show();
						    			jQuery('#sigugun').empty();
						    			jQuery('#sigugun').append(fn_option('', '선택')); //
						    			jQuery.each(hangjungdong.sigugun, function (idx, code) {
						    				if (jQuery('#sido > option:selected').val() == code.sido)
						    					jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
						    			});
						
						    			//세종특별자치시 예외처리
						    			//옵션값을 읽어 비교
						    			if (jQuery('#sido option:selected').val() == '36') {
						    				jQuery('#sigugun').hide();
						    				//index를 이용해서 selected 속성(attr)추가
						    				//기본 선택 옵션이 최상위로 index 0을 가짐
						    				jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
						    				//trigger를 이용해 change 실행
						    				jQuery('#sigugun').trigger('change');
						    			}
						    		});
						
						    		//시군구 변경시 행정동 옵션추가
						    		jQuery('#sigugun').change(function () {
						    			/* //시군구 히든 값
						    			if($('#sigugun option:selected').val()=="") {
						    				$('#sigugun_text').val("");
						    			}else {
						    				$('#sigugun_text').val($('#sigugun option:selected').text());
						    			} */
						    			
						    			
						    			
						    			//option 제거
						    			jQuery('#dong').empty();
						    			jQuery.each(hangjungdong.dong, function (idx, code) {
						    				if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
						    					jQuery('#dong').append(fn_option(code.dong, code.codeNm));
						    			});
						    			//option의 맨앞에 추가
						    			jQuery('#dong').prepend(fn_option('', '선택'));
						    			//option중 선택을 기본으로 선택
						    			jQuery('#dong option:eq("")').attr('selected', 'selected');
						    			
						    		});
						    		
						    		
						    		jQuery('#dong').change(function () {
						    			var sido = jQuery('#sido option:selected');
						    			var sigugun = jQuery('#sigugun option:selected');
						    			var dong = jQuery('#dong option:selected');
						
						    			var dongName = sido.text() + ' ' + sigugun.text() + ' ' + dong.text(); // 시도/시군구/읍면동 이름
						    			jQuery('#a_location').val(dongName);
						
						    			/* var dongCode = sido.val() + sigugun.val() + dong.val() + '00'; // 읍면동코드
						    			jQuery('#dongCode').text(dongCode); */
						    			//동네예보 URL
						    			//var url = 'https://www.weather.go.kr/weather/process/timeseries-dfs-body-ajax.jsp?myPointCode=' + dongCode + '&unit=K';
						    			//iframe으로 결과 보기
						    			//fn_iframe(url);
						    		});
						    		
						    	});
						
						    	function fn_option(code, name) {
						    		return '<option value="' + code + '">' + name + '</option>';
						    	}
						    	/* function fn_iframe(url) {
						    		jQuery('#iframe').attr('src', url);
						    	} */
						      </script>
					</form:form>
				</div>
			</div>
			</div>
	</section>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="ko">
<!-- Main Stylesheet -->
  <link href="css/main.css" rel="stylesheet">
<script type="text/javascript">
function Validation() {

//id 유효성 검사 (최소 4글자 ~ 최대 20글자 한글 X)
var m_id_RegExp = /^[a-zA-Z0-9]{4,20}$/;

// kakao id 유효성 검사 ( &&& 필요 없으면 지우셔도 됩니다 &&& )
// var kakao_id_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 

// password 유효성 검사 (특수문자 없이 8~16글자)
var m_pw_RegExp = /^[a-zA-Z#?!@$%^&*-]{8,15}$/;

// 이름 유효성 검사 (한글만)
var m_name_RegExp = /^[가-힣]{2,10}$/;

// 생년월일 유효성 검사 (6자리 숫자)
var m_birth_RegExp = /^[0-9]{6}$/;

// 전화번호 유효성 검사 (01011112222 형식으로 "-" 빼고 입력)
var m_tele_RegExp = /^[0-9]{10,11}$/;

// 이메일 유효성 검사 (asdF0123(대소문자, 숫자) @naver.com 형식)
var m_email_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 





/* var m_objKakaoId */
var m_objId = document.getElementById("m_id"); // 아이디
var m_objPw = document.getElementById("m_pw"); // 비밀번호
var m_objName = document.getElementById("m_name"); // 이름
var m_objBirth = document.getElementById("m_birth"); // 생년월일
var m_objTele = document.getElementById("m_tele"); // 전화번호 
var m_objEmail = document.getElementById("m_email"); // 이메일

// ================ ID 유효성검사 ================ //
if(m_objId.value=='') {
	alert("아이디를 입력해주세요.");
	return false;
}	
else if(!m_id_RegExp.test(m_objId.value)) {
	alert("아이디는 영문 대소문자와 숫자로만 입력해 주세요.");
	return false;
}	
// ============================================== //

// ============== PASSWORD 유효성검사 ============== //
else if(m_objPw.value=='') {
	alert("비밀번호를 입력해주세요.");
	return false;
}
else if(!m_pw_RegExp.test(m_objPw.value)) {
	alert("비밀번호는 특수문자 없이 대소문자로 8~15자를 입력해주세요.");
	return false;
}
else if(m_objPw.value == m_objId.value) {
	alert("비밀번호는 아이디와 동일할 수 없습니다.");
	return false;
}
// ============================================== //

// ================ 이름 유효성 검사 ================ //
else if(m_objName.value=='') { 
	alert("이름을 입력해주세요.");
	return false;
}
else if(!m_name_RegExp.test(m_objName.value)) { 
	alert("이름의 형식이 올바르지 않습니다.");
	return false;
}
// ============================================= //

// ============== 생년월일 유효성 검사 ============== //
else if(m_objBirth.value=='') {
	alert("생년월일을 입력해주세요.");
	return false;
}
else if(!m_birth_RegExp.test(m_objBirth.value)) { 
	alert("생년월일의 형식이 올바르지 않습니다. 숫자 6글자로 입력해주세요.");
	return false;
}	
// ============== 전화번호 유효성 검사 ============== //
else if(m_objTele.value=='') {
	alert("연락처를 입력해주세요.");
	return false;
}
else if(!m_tele_RegExp.test(m_objTele.value)) {
	alert("형식이 올바르지 않습니다. 10, 11자의 숫자만 입력해주세요.");
	return false;
}
// ============================================= //

// ==============  이메일 유효성 검사  ============== //
else if(m_objEmail.value=='') {
	alert("이메일을 입력해주세요.");
	return false;
}
else if(!m_email_RegExp.test(m_objEmail.value)) {
	alert("형식이 올바르지 않습니다. 이메일을 확인해주세요.");
	return false;
} else {
	//$('#m_userjoin').submit();
}



}

//================================================================================================
</script>

 <main class="main">
  <section class="home">
    <h1>Welcome to the <span>SKYCASTLE</span></h1>
    <button id="sign-up" class="btn">일반 회원가입</button>
    <button id="sign-in" class="btn">학원 회원가입</button>
  </section>

  <section class="sign-up">
    <article class="signup-left">
      <a href="${root}index"><img src="images/logo.png" alt="logo"></a>
      <div class="wc_message">
        <h3>지금바로 가입하세요!</h3>
      </div>
      <div class="btn-back">
        <i class="fas fa-2x fa-angle-left angle-left-color"></i>
        BACK
      </div>
    </article>

<article class="form-area" style="position: absolute;top: 17%;left: 40%;width: 20%;height: 70%;padding: 20px 0px;
																			background: white;box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 10px;
																			border-radius: 10px;z-index: 2;opacity: 1;transition: opacity 0.5s ease-in 0.2s;">
      <!-- Form area Sign Up -->
      <div class="organize-form form-area-signup" style="opacity: 1;">
        <h2>회원가입</h2>
        <form:form class="form" action="${root }member/join_pro" onsubmit="return Validation();" method="post" modelAttribute="joinMemberBean">
            <form:label path="m_id">ID</form:label>
          <div class="form-field">
            <form:input type="text" path="m_id"/>
			<form:errors path="m_id" style="color:red"/>
          </div>

            <form:label path="m_pw">Password</form:label>
          <div class="form-field">
            <form:input type="password" path="m_pw"/>
			<form:errors path="m_pw" style="color:red"/>
          </div>

            <form:label path="m_name">이름</form:label>
          <div class="form-field">
            <form:input type="text" path="m_name"/>
			<form:errors path="m_name" style="color:red"/>
          </div>
          
            <form:label path="m_birth">생년월일</form:label><br>
          <div class="form-field">
            <form:input type="text" path="m_birth" placeholder="6자리 입력"/>
			<form:errors path="m_birth" style="color:red"/>
          </div><br>
            <form:label path="m_birth">성별</form:label><br>
          <div class="form-field">
                   <form:select path="m_gender" style="padding:2%">
            <form:option value="1" label="남 자"/>
            <form:option value="2" label="여 자"/>
         </form:select>
		</div><br>
            <form:label path="m_tele">전화번호</form:label><br>
          <div class="form-field">
            <form:input type="tele" path="m_tele" placeholder="-빼고 입력" />
			<form:errors path="m_tele" style="color:red"/>
          </div>
          
            <form:label path="m_email">이메일</form:label>
          <div class="form-field">
            <form:input type="email" path="m_email"/>
			<form:errors path="m_email" style="color:red"/>
          </div>
          <form:hidden path="m_classify" value="100"/>
          <form:button class="btn-sign" type="submit">회원가입 완료</form:button>
        </form:form>
       
      </div>
<script type="text/javascript">
/* 회원가입 유효성 검사 (학원) */
function Validation2(){

// id 유효성 검사 (최소 4글자 ~ 최대 20글자 한글 X)
var a_id_RegExp = /^[a-zA-Z0-9]{4,20}$/;

// password 유효성 검사 (특수문자 없이 8~16글자)
var a_pw_RegExp = /^[a-zA-Z#?!@$%^&*-]{8,15}$/;

// 이름 유효성 검사 (한글만)
var a_name_RegExp = /^[가-힣]{2,10}$/;

// 사업자 등록번호 유효성 검사
var a_CRN_RegExp = /^[0-9]{10}$/;

// 지역 유효성 검사 
// var a_location_RegExp = /^[가-힣]{30}$/;

// 세부주소 유효성 검사
var a_locationDetail_RegExp = /^[a-zA-Z0-9가-힣]{60}$/;

// 전화번호 유효성 검사
var a_tele_RegExp = /^[0-9]{11}$/;

var a_objId = document.getElementById("a_id"); // 아이디
var a_objPw = document.getElementById("a_pw"); // 비밀번호
var a_objName = document.getElementById("a_name"); // 이름
var a_objCRN = document.getElementById("a_CRN"); // 사업자등록번호
var a_objLocationDetail = document.getElementById("a_locationDetail"); // 상세주소
var a_objTele = document.getElementById("a_tele"); // 학원 전화번호

// ================= ID 유효성검사 ================= //
if(a_objId.value=='') {
	alert("아이디를 입력해주세요.");
	return false;
}	
else if(!a_id_RegExp.test(a_objId.value)) {
	alert("아이디는 영문 대소문자와 숫자로만 입력해 주세요.");
	return false;	
}
// ============================================== //

// ============== PASSWORD 유효성검사 ============== //
else if(a_objPw.value=='') {
	alert("비밀번호를 입력해주세요.");
	return false;
}
else if(!a_pw_RegExp.test(a_objPw.value)) {
	alert("비밀번호는 특수문자 없이 대소문자로 8~16자를 입력해주세요.");
	return false;
}
else if(a_objPw.value == a_objId.value) {
	alert("비밀번호는 아이디와 동일할 수 없습니다.");
	return false;
}
// ================================================ //

// ================= 이름 유효성 검사 ================= //
else if(a_objName.value=='') { 
	alert("이름을 입력해주세요.");
	return false;
}
else if(!a_name_RegExp.test(a_objName.value)) { 
	alert("형식이 올바르지 않습니다.");
	return false;
}
// ================================================ //

// ============== 사업자등록번호 유효성 검사 ============== //
else if(a_objCRN.value=='') {
	alert("사업자등록번호를 입력해주세요.");
	return false;
}
else if(!a_CRN_RegExp.test(a_objCRN.value)) {
	alert("형식이 올바르지 않습니다.");
	return false;
}


// ================ 상세주소 유효성 검사 ================ //
else if(a_objLocationDetail.value=='') {
	alert("상세주소를 입력해주세요.");
	return false;
}
else if(a_locationDetail_RegExp.test(a_objLocationDetail.value)) {
	alert("형식이 올바르지 않습니다. 특수문자를 제외하고 입력해주세요.");
	return false;
}
// ================================================= //

// ============== 전화번호 유효성 검사 ============== //
else if(a_objTele.value=='') {
	alert("연락처를 입력해주세요.");
	return false;
}
else if(!a_tele_RegExp.test(a_objTele.value)) {
	alert("형식이 올바르지 않습니다. 숫자만 입력해주세요.");
	return false;
}
// ============================================= //
}

</script>
       <div class="organize-form form-area-signin">
         <h2>학원 회원가입</h2>
       <form:form class="form" action="${root}academymember/join_pro" onsubmit="return Validation2();" method="post" modelAttribute="joinAcademyMemberBean">
         <form:label path="a_id">아이디</form:label>
      <div class="form-field">
         <form:input path="a_id"/>
         <form:errors path="a_id"></form:errors>
      </div>
         <form:label path="a_pw">비밀번호</form:label>
      <div class="form-field">
         <form:input path="a_pw"/>
         <form:errors path="a_pw"></form:errors>
      </div>
         <form:label path="a_name">이름</form:label>
      <div class="form-field">
         <form:input path="a_name"/>
         <form:errors path="a_name"/>
      </div>
         <form:label path="a_CRN">사업자등록번호</form:label>
      <div class="form-field">
         <form:input path="a_CRN"/>
         <form:errors path="a_CRN"/>
      </div>
      <br>
      <form:label path="a_location">지역(동까지)</form:label>
      <div class="form-field">
      		<select tabindex="0" id="sido" name="sido" style="padding:2%"><option value="">지역 선택</option></select>
			<select tabindex="0" id="sigugun" name="sigugun" style="padding:2%"><option value="">구-시선택</option></select>
			<select tabindex="0" id="dong" name="dong" style="padding:2%"><option value="">구-시선택</option></select>
		 <form:input type="hidden" path="a_location" value=""></form:input>
         <!--<form:label path="a_location">지역(동까지)</form:label>
         <form:input path="a_location"/>
         <form:errors path="a_location"/>-->
      </div>
      <hr>
      <br>
         <form:label path="a_locationDetail">상세주소</form:label>
      <div class="form-field">
         <form:input path="a_locationDetail"/>
         <form:errors path="a_locationDetail"/>
      </div>
         <form:label path="a_tele">학원대표전화번호</form:label>
      <div class="form-field">
         <form:input path="a_tele"/>
         <form:errors path="a_tele"/>
      </div>
      	<form:label path="a_classify">학원분류</form:label>
      <div class="form-field">
         <form:select path="a_classify" style="padding:2%">
            <form:option value="1" label="종합"/>
            <form:option value="2" label="단과"/>
            <form:option value="3" label="예체능(기타)"/>
         </form:select>
      </div>
   
         <form:button class="btn-sign" type="submit">회원가입 완료</form:button>
      
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
       
    </article>

    <article class="signup-right">
      <i class="fas fa-2x fa-bars bars-style"></i>

    </article>
  </section>
</main>

<!-- Main Script -->
<script src="js/form.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var='root' value='/' />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="ko">
<head>
<style>
.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}
</style>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	//학년 출력 변환 json
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
	
	$(document).ready(function () {
		//sido option 추가
		jQuery.each(convertData.grade, function (idx, grd) {
			//append를 이용하여 option 하위에 붙여넣음
			jQuery('#gradeSelect').append(gr_option(idx, grd));
		});
	});
	
	function gr_option(idx, grade) {
		return '<option value="' + idx + '">' + grade + '</option>';
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
               </ul>
          
            </div>
         </div>
      </div>
   </section>
   <!-- /page title -->
   
<!-- SEARCH BAR -->  

<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<section class="section bg-gray" style="padding-top: 4%;padding-bottom: 0px;">
	<div class="s002">
				
				<form action="gBoardList" method="get">
				<div class="inner-form">
          		<div class="input-field first-wrap" style="background: white;">
            	<div class="icon-wrap">
              		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                 	</svg>
            	</div>
					<select class="nice-select" tabindex="0" id="sido" name="sido">
					<option value="">지역 선택</option>
					</select>
					
					<input type="hidden" name="sido_text" id="sido_text" value="">
					<select class="nice-select" tabindex="0" id="sigugun" name="sigugun"><option value="">구-시선택</option></select>
					<input type="hidden" name="sigugun_text" id="sigugun_text" value="">
					<select class="nice-select" tabindex="0" id="gradeSelect" name="gradeSelect">
				      <option value="" selected>학년 선택</option>
				    </select>
				    <input class="nice-select" tabindex="0" type="text" id="acaName" name="acaName" 
				    placeholder="검색하고자 하는 과목명 또는 학원 이름을 입력해주세요." style="border-radius: 6px;margin-top: 4.1px;">
					<input type="hidden" name="a_classify" value="<%=request.getParameter("a_classify") %>">
					<button class="btn" type="submit" style="color: wheat;font-size: 16px;background: #7c7c7c;left: 2.5%;padding-top: 1.3%;padding-bottom: 1.3%;margin-left: 86%;position: absolute;">
					SEARCH</button>
			    </div></div>
			    </form>
			    </div>
			
	
<!--  주소 API -->	
<script>
jQuery(document).ready(function () {
	//sido option 추가
	jQuery.each(hangjungdong.sido, function (idx, code) {
		//append를 이용하여 option 하위에 붙여넣음
		jQuery('#sido').append(fn_option(code.sido, code.codeNm));
	});

	//sido 변경시 시군구 option 추가
	jQuery('#sido').change(function () {
		//시도 히든 값
		if($('#sido option:selected').val()=="") {
			$('#sido_text').val("");
		}else {
			$('#sido_text').val($('#sido option:selected').text());
		}
		$('#sigugun_text').val("");
		
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
		//시군구 히든 값
		if($('#sigugun option:selected').val()=="") {
			$('#sigugun_text').val("");
		}else {
			$('#sigugun_text').val($('#sigugun option:selected').text());
		}
		
		
		/*
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
		*/
	});
	
	/*
	jQuery('#dong').change(function () {
		var sido = jQuery('#sido option:selected');
		var sigugun = jQuery('#sigugun option:selected');
		var dong = jQuery('#dong option:selected');

		var dongName = sido.text() + '/' + sigugun.text() + '/' + dong.text(); // 시도/시군구/읍면동 이름
		jQuery('#dongName').text(dongName);

		var dongCode = sido.val() + sigugun.val() + dong.val() + '00'; // 읍면동코드
		jQuery('#dongCode').text(dongCode);
		//동네예보 URL
		var url = 'https://www.weather.go.kr/weather/process/timeseries-dfs-body-ajax.jsp?myPointCode=' + dongCode + '&unit=K';
		//iframe으로 결과 보기
		fn_iframe(url);
	});
	*/
	
	//검색 값 유지
	setTimeout(function() {
		if('<%=request.getParameter("acaName")%>'!='null') {
			$('#acaName').val('<%=request.getParameter("acaName")%>');
		}
		$('#sido').val(<%=request.getParameter("sido")%>).trigger('change');
		$('#sigugun').val(<%=request.getParameter("sigugun")%>).trigger('change');
		$('#gradeSelect').val(<%=request.getParameter("gradeSelect")%>).trigger('change');
		
	},100);
	
});

function fn_option(code, name) {
	return '<option value="' + code + '">' + name + '</option>';
}
function fn_iframe(url) {
	jQuery('#iframe').attr('src', url);
}
</script>

<!--  /주소 API -->	


		</div>
</section>
<!-- /SEARCH BAR --> 
   
   
<!-- courses -->
<section class="section" style="padding-top: 0px;padding-right: 20px;">
   <div class="container">
		<div style="width: 106.5%;margin-left: -2.4%;margin-bottom: 5%;margin-top: 1;">
			<div class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								<%if(request.getParameter("sido_text")==null && request.getParameter("sigugun_text") == null) {
									if(request.getParameter("acaName")=="" || request.getParameter("acaName")==null) {%>
										<!-- 키워드 :  --><input type="hidden" value="학원" id="keyword" size="15">
									<%} else { %>
										<input type="hidden" value="<%=request.getParameter("acaName") %>" id="keyword" size="15">
									<%} %>
								<%} else { 
									if(request.getParameter("acaName")=="" || request.getParameter("acaName")==null) {%>
										<input type="hidden" value="<%=request.getParameter("sido_text")%> <%=request.getParameter("sigugun_text")%> 학원" id="keyword" size="15">
									<%} else { %>
										<input type="hidden" value="<%=request.getParameter("sido_text")%> <%=request.getParameter("sigugun_text")%> <%=request.getParameter("acaName") %>" id="keyword" size="15">
									<%} %>
								<%} %>
						      <!-- <button type="submit">검색하기</button> -->
						   </form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
	<!-- course list -->
	<div class="row justify-content-center">
		<c:forEach var="gList" items="${gBoardList }">
		<script type="text/javascript">
		
		$(document).ready(function() {
			
			
			window.onload = convertPro(), getWishHeart(${gList.a_memberNo });
			
			function convertPro() {
				//alert("이건 되냐?");
				var min = ${gList.a_gradeMin };
				var max = ${gList.a_gradeMax };
				//alert(convertData.grade[min]);
				
				var space = '#gradeSpace'+${gList.a_memberNo };
				
				$(space).html(convertData.grade[min] + " ~ " + convertData.grade[max]);
				//$('#a_classifySpace').html(convertData.a_classify[${academyInfoBasic.a_classify }]);
				
			}
			
		});
		
		//찜하기 출력
		function getWishHeart(a_memberNo) {
			var wishNum = "#wish"+a_memberNo;
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
		
		
		
		</script>
		<!-- course item -->
			<div class="col-lg-4 col-sm-6 mb-5">
				<div class="card p-0 border-primary rounded-0 hover-shadow">
					<c:choose>
						<c:when test="${gList.a_mainImg != null }">
							<img class="card-img-top rounded-0" src="${root }upload/${gList.a_mainImg}" />
						</c:when>
						<c:otherwise>
							<img class="card-img-top rounded-0" src="images/courses/course-1.jpg" alt="이미지 없음">
						</c:otherwise>
					</c:choose>
					<div class="card-body">
						<ul class="list-inline mb-2">
							<li class="list-inline-item"><i
					         class="ti-calendar mr-1 text-color"></i>${gList.a_location }</li>
							
								<i class="text-color" id="gradeSpace${gList.a_memberNo }" style="
    font-style: inherit;
">
									${gList.a_gradeMin } ~ ${gList.a_gradeMax }
									<input type="hidden" id="gradeMin" value="${gList.a_gradeMin }">
									<input type="hidden" id="gradeMax" value="${gList.a_gradeMax }">
								</i>
						</ul>
						<a href="gBoardRead?a_memberNo=${gList.a_memberNo }">
							<h4>${gList.a_name }</h4>
						</a>
						<p class="card-text mb-4">
							<c:choose>
								<c:when test="${fn:length(gList.a_introduce) <= 50}">
									${gList.a_introduce }
								</c:when>
								<c:when test="${fn:length(gList.a_introduce) > 50}">
									${fn:substring(gList.a_introduce, 0, 49)}...
								</c:when>
							</c:choose>
						</p>
						<a href="gBoardRead?a_memberNo=${gList.a_memberNo }" class="btn btn-primary btn-sm">상세 보기</a>
	   				<!--  like button  -->
					   	<c:if test="${sessionScope.loginAcademyMemberBean == null }">
							<a class="like-btn" id="wish${gList.a_memberNo }" onclick="switchWishHeart(${gList.a_memberNo })">
								<svg class="like_icon" width="44" height="39" viewBox="0 0 44 39" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M13 2C6.925 2 2 6.925 2 13C2 24 15 34 22 36.326C29 34 42 24 42 13C42 6.925 37.075 2 31 2C27.28 2 23.99 3.847 22 6.674C20.9857
									5.22921 19.6382 4.05009 18.0715 3.23649C16.5049 2.42289 14.7653 1.99875 13 2Z"/>
								</svg>
							</a>
						</c:if>
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
<%--  <c:import url="/WEB-INF/views/include/footer.jsp"/> --%>
   <!-- ===============================  footer  =============================== -->


   <!-- jQuery -->
   <script src="plugins/jQuery/jquery.min.js"></script>
   <!-- Bootstrap JS -->
   <script src="plugins/bootstrap/bootstrap.min.js"></script>
   <!-- slick slider -->
   <script src="plugins/slick/slick.min.js"></script>
	<!-- 서치폼 -->
	<link href="css/searchForm.css" rel="stylesheet" />
	<!-- 셀렉트 -->
	<link rel="stylesheet" href="css/nice-select.css">
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
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d81ea354be70f85e597a099eaf8f3e3a&libraries=services"></script>
   <script>
      // 마커를 담을 배열입니다
      var markers = [];

      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
         level : 3
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 장소 검색 객체를 생성합니다
      var ps = new kakao.maps.services.Places();

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
         zIndex : 1
      });

      // 키워드로 장소를 검색합니다
      searchPlaces();

      // 키워드 검색을 요청하는 함수입니다
      function searchPlaces() {

         var keyword = document.getElementById('keyword').value;

         if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
         }

         // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
         ps.keywordSearch(keyword, placesSearchCB);
      }

      // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
      function placesSearchCB(data, status, pagination) {
         if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

         } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

         } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

         }
      }

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {

         var listEl = document.getElementById('placesList'), menuEl = document
               .getElementById('menu_wrap'), fragment = document
               .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

         // 검색 결과 목록에 추가된 항목들을 제거합니다
         removeAllChildNods(listEl);

         // 지도에 표시되고 있는 마커를 제거합니다
         removeMarker();

         for (var i = 0; i < places.length; i++) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y,
                  places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
                  i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
               kakao.maps.event.addListener(marker, 'mouseover',
                     function() {
                        displayInfowindow(marker, title);
                     });

               kakao.maps.event.addListener(marker, 'mouseout',
                     function() {
                        infowindow.close();
                     });

               itemEl.onmouseover = function() {
                  displayInfowindow(marker, title);
               };

               itemEl.onmouseout = function() {
                  infowindow.close();
               };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
         }

         // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
         listEl.appendChild(fragment);
         menuEl.scrollTop = 0;

         // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
         map.setBounds(bounds);
      }

      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(index, places) {

         var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
               + (index + 1)
               + '"></span>'
               + '<div class="info">'
               + '   <h5>' + places.place_name + '</h5>';

         if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>'
                  + '   <span class="jibun gray">' + places.address_name
                  + '</span>';
         } else {
            itemStr += '    <span>' + places.address_name + '</span>';
         }

         itemStr += '  <span class="tel">' + places.phone + '</span>'
               + '</div>';

         el.innerHTML = itemStr;
         el.className = 'item';

         return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, idx, title) {
         var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
         imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
         imgOptions = {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset : new kakao.maps.Point(13, 37)
         // 마커 좌표에 일치시킬 이미지 내에서의 좌표
         }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
               imgOptions), marker = new kakao.maps.Marker({
            position : position, // 마커의 위치
            image : markerImage
         });

         marker.setMap(map); // 지도 위에 마커를 표출합니다
         markers.push(marker); // 배열에 생성된 마커를 추가합니다

         return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
         }
         markers = [];
      }

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
         var paginationEl = document.getElementById('pagination'), fragment = document
               .createDocumentFragment(), i;

         // 기존에 추가된 페이지번호를 삭제합니다
         while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild(paginationEl.lastChild);
         }

         for (i = 1; i <= pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i === pagination.current) {
               el.className = 'on';
            } else {
               el.onclick = (function(i) {
                  return function() {
                     pagination.gotoPage(i);
                  }
               })(i);
            }

            fragment.appendChild(el);
         }
         paginationEl.appendChild(fragment);
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
         var content = '<div style="padding:5px;z-index:1;">' + title
               + '</div>';

         infowindow.setContent(content);
         infowindow.open(map, marker);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
         while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
         }
      }
   </script>
</body>
</html>
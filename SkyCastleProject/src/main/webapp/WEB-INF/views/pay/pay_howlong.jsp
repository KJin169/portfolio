<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url var='root' value='/' />
<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>noticeRead</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<fmt:parseDate value="${today}" var="registered"
	pattern="yyyy.MM.dd HH:mm:ss" />
<fmt:formatDate value="${rsp.merchant_uid}" pattern="yyyyMMdd" />

<!-- 1개월 멤버십 -->
<script>
	var IMP = window.IMP; 
	IMP.init("imp71151373");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
	today = new Date();
	
	function requestPay1() {
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid: new Date(),
	        name : 'SkyCastle 1개월 멤버십',
	        amount : 100,
	        buyer_email : '1',
	        buyer_name : '',
	        buyer_tel : '',
	        buyer_addr : '',
	        buyer_postcode : ''
	    }, function (rsp) { // callback
	        if (rsp.success) {
	        	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        result ='0';
		        
		        var sdata = new Object();
		        sdata.a_memberNo = ${sessionScope.loginAcademyMemberBean.a_memberNo}
		        sdata.a_payStart = rsp.merchant_uid
		        sdata.a_payEnd = rsp.merchant_uid
		        sdata.amount = rsp.paid_amount
		        
		         $.ajax({ 
		            url: "${root}pay/send.do", 
		            type: "POST",
		            //dataType: "JSON",
		            contentType: "application/json; charset=utf-8",
		            data: JSON.stringify(sdata),
		            success : function() {	            	
		            },
		       		error : function(request,status,error) {
		       			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       		}
		        }) 
	        } else {
	        	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result ='1';
	        }
	        if(result=='0') {
		    	location.href= "${root }index";
		    	
		    	
		    }
		    alert(msg);
	    });
	}
</script>
<!-- 6개월 멤버십 -->
<script>
	var IMP = window.IMP; 
	IMP.init("imp71151373");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
	today = new Date();
	
	function requestPay6() {
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid: new Date(),
	        name : 'SkyCastle 6개월 멤버십',
	        amount : 500,
	        buyer_email : '1',
	        buyer_name : '',
	        buyer_tel : '',
	        buyer_addr : '',
	        buyer_postcode : ''
	    }, function (rsp) { // callback
	        if (rsp.success) {
	        	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        result ='0';
		        
		        var sdata = new Object();
		        sdata.a_memberNo = ${sessionScope.loginAcademyMemberBean.a_memberNo}
		        sdata.a_payStart = rsp.merchant_uid
		        sdata.a_payEnd = rsp.merchant_uid
		        sdata.amount = rsp.paid_amount
		        
		         $.ajax({ 
		            url: "${root}pay/send.do", 
		            type: "POST",
		            //dataType: "JSON",
		            contentType: "application/json; charset=utf-8",
		            data: JSON.stringify(sdata),
		            success : function() {	            	
		            },
		       		error : function(request,status,error) {
		       			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       		}
		        }) 
	        } else {
	        	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result ='1';
	        }
	        if(result=='0') {
		    	location.href= "${root }index";
		    	
		    	
		    }
		    alert(msg);
	    });
	}
</script>
<!-- 12개월 멤버십 -->
<script>
	var IMP = window.IMP; 
	IMP.init("imp71151373");
	//SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
	today = new Date();
	
	function requestPay12() {
	    IMP.request_pay({
	        pg : 'html5_inicis',
	        pay_method : 'card',
	        merchant_uid: new Date(),
	        name : 'SkyCastle 1년 멤버십',
	        amount : 900,
	        buyer_email : '1',
	        buyer_name : '',
	        buyer_tel : '',
	        buyer_addr : '',
	        buyer_postcode : ''
	    }, function (rsp) { // callback
	        if (rsp.success) {
	        	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        result ='0';
		        
		        var sdata = new Object();
		        sdata.a_memberNo = ${sessionScope.loginAcademyMemberBean.a_memberNo}
		        sdata.a_payStart = rsp.merchant_uid
		        sdata.a_payEnd = rsp.merchant_uid
		        sdata.amount = rsp.paid_amount
		        
		         $.ajax({ 
		            url: "${root}pay/send.do", 
		            type: "POST",
		            //dataType: "JSON",
		            contentType: "application/json; charset=utf-8",
		            data: JSON.stringify(sdata),
		            success : function() {	            	
		            },
		       		error : function(request,status,error) {
		       			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       		}
		        }) 
	        } else {
	        	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        result ='1';
	        }
	        if(result=='0') {
		    	location.href= "${root }index";
		    	
		    	
		    }
		    alert(msg);
	    });

	}
</script>
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
<!-- serachbar -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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

<!-- pricing table  -->
<link href="css/pricing table.css" rel="stylesheet">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

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
						 <li class="list-inline-item h2 text-primary font-secondary">Home</li>
						<li class="list-inline-item text-white h3 font-secondary nasted">멤버십</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="container" style="margin-left:17em; margin-top: 5%; margin-bottom: 6%;">
		<div class="row white" style="float: right;">
			<div class="block" style="width:900px">

				<div class="col-xs-12 col-sm-6 col-md-3">
					<ul class="pricing p-green">
						<li><img src="http://bread.pp.ua/n/settings_g.svg" alt="">
							<big>Start</big></li>
						<li style="height:176px;text-align:center;padding-top:80px">조회</li>
						<li>
							<h3>₩0</h3> <span>free trial</span><br>
							<span style="color:white"><b> sale</b></span>
						</li>
						<li>
							<button disabled="disabled">Join Us</button>
						</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-3">
					<ul class="pricing p-yel">
						<li><img src="http://bread.pp.ua/n/settings_y.svg" alt="">
							<big>1 </big> MONTH</li>
						<li>배너 및 게시판</li>
						<li>학부모와 매칭</li>
						<li>학원 정보 등록</li>
						<li>블랙리스트 조회</li>
						<li>
							<h3>₩100</h3> <span>1 month</span><br>
							<span style="color:white"><b> sale</b></span>
						</li>
						<li>
							<button onclick="requestPay1()">1 month</button>
						</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-3">
					<ul class="pricing p-red">
						<li><img src="http://bread.pp.ua/n/settings_r.svg" alt="">
							<big>6 </big> MONTH</li>
						<li>배너 및 게시판</li>
						<li>학부모와 매칭</li>
						<li>학원 정보 등록</li>
						<li>블랙리스트 조회</li>
						<li>
							<h3>₩500</h3> <span>6 month</span><br>
							<span style="color:red"><b>16.6% sale</b></span>
						</li>
						<li>
							<button onclick="requestPay6()">6 month</button>
						</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-3">
					<ul class="pricing p-blue">
						<li><img src="http://bread.pp.ua/n/settings_b.svg" alt="">
							<big>1 </big> YEAR</li>
						<li>배너 및 게시판</li>
						<li>학부모와 매칭</li>
						<li>학원 정보 등록</li>
						<li>블랙리스트 조회</li>
						<li>
							<h3>₩900</h3> <span>1 year</span><br>
							<span style="color:red"><b>25% sale</b></span>
						</li>
						<li>
							<button onclick="requestPay12()">1 year</button>
						</li>
					</ul>
				</div>


			</div>
			<!-- /block -->
		</div>
		<!-- /row -->
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
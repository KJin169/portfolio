<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<c:url var='root' value='/'/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- footer -->
<footer class="">
<!-- copyright -->
  <div class="copyright py-4 bg-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-5 text-sm-left text-center">
        <!-- logo -->
          <a class="logo-footer" href="index"><img class="img-fluid mb-4" src="images/logo.png" alt="logo"></a>
          <ul class="list-inline">
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root }board/about"><h4>회사 소개</h4></a></li>
            <li class="list-inline-item"><a class="d-inline-block p-2" href="${root }faq/faqBoard"><h4>FAQ</h4></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- footer content -->
  <div class="footer bg-footer section border-bottom">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-sm-7 mb-5 mb-lg-0">
         
          <ul class="list-unstyled">
            <li class="mb-2">주소: 서울특별시 관악구 남부순환로 1637 건중빌딩</li>
            <li class="mb-2">Tel: 02-1234-5678</li>
            <li class="mb-2">E-mail: skycastle@naver.com</li>
            <li class="mb-2">사업자등록번호: 123-45-67890</li>
            <li class="mb-2">문의가능시간: 9AM-6PM</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- /footer -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : 관리자 admin01 : </title>
</head>
<body>
	<h2>  : 관리자 admin01 의 문의 사항 목록 : </h2>

	<a href="${root}serviceBoard/siteAskList">회원 문의사항</a>
	<a href="${root}serviceBoard/siteAcaAskList">학원 문의사항</a>			
	<hr>
			
	<a href="${root}member/mypageAdmin">관리자 마이페이지</a>
	<a href="${root}index">돌아가기</a>
</body>
</html>
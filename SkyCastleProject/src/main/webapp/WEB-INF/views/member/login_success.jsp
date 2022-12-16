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
<h2>로그인 성공</h2>
<h2>${sessionScope.loginMemberBean.m_id }</h2>
<h2>${sessionScope.loginMemberBean.m_pw }</h2>
<a href="${root }member/mypage?m_memberNo=${sessionScope.loginMemberBean.m_memberNo }">my page</a>
<a href="${root }member/logout">로그아웃</a>
<a href="${root }faq/faqlist">faqlist</a>
<a href="${root }member/mypageAdmin?m_memberNo=${sessionScope.loginMemberBean.m_memberNo }">관리자 마이페이지</a>
</body>
</html>
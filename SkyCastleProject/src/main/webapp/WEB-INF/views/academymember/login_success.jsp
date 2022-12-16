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
로그인 성공

<a href="${root}academymember/modify">회원정보수정</a>
<a href="${root}academymember/delete">회원정보삭제</a>
<a href="${root}academymember/logout">로그아웃</a>
</body>
</html>
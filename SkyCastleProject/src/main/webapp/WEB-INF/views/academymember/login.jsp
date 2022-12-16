<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="${root}academymember/login_pro" method="post" modelAttribute="loginAcademyMemberBean">
		<div>
			<form:label path="a_id">아이디</form:label>
			<form:input path="a_id"/>
			<form:errors path="a_id"/>
		</div>
		<div>
			<form:label path="a_pw">비밀번호</form:label>
			<form:input type="password" path="a_pw"  />
			<form:errors path="a_pw"/>
		</div>
		<div>
			<form:button>로그인</form:button>
		</div>
	</form:form>
</body>
</html>
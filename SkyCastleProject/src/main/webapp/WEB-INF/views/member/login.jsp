<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var='root' value='/'/>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="${root}login_pro" method="post" modelAttribute="loginMemberBean">
		<div>
			<form:label path="m_id">아이디</form:label>
			<form:input path="m_id"/>
			<form:errors path="m_id" style="color:red"/>
		</div>
		<div>
			<form:label path="m_pw">pw</form:label>
			<form:input type="password" path="m_pw"  />
			<form:errors path="m_pw" style="color:red"/>
		</div>
		<div>
			<form:button type="submit" class="btn btn-primary">로그인</form:button>
		</div>
	</form:form>
</body>
</html>
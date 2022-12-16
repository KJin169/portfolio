<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>joinForm</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
	rel="stylesheet">
<!--Stylesheet-->
<style media="screen">

.mainJoinForm {
	margin-top: 120px;
}


*, *:before, *:after {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background-color: #080710;
}

.background {
	width: 430px;
	height: 520px;
	position: absolute;
	transform: translate(-50%, -50%);
	left: 50%;
	top: 50%;
}

.background .shape {
	height: 200px;
	width: 200px;
	position: absolute;
	border-radius: 50%;
}

.shape:first-child {
	background: linear-gradient(#1845ad, #23a2f6);
	left: -80px;
	top: -80px;
}

.shape:last-child {
	background: linear-gradient(to right, #ff512f, #f09819);
	right: -30px;
	bottom: -80px;
}

form {
	height: 1100px;
	width: 400px;
	background-color: rgba(255, 255, 255, 0.13);
	position: absolute;
	transform: translate(-50%, -50%);
	top: 60%;
	left: 50%;
	border-radius: 10px;
	backdrop-filter: blur(10px);
	border: 2px solid rgba(255, 255, 255, 0.1);
	box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
	padding: 50px 35px;
}

form * {
	font-family: 'Poppins', sans-serif;
	color: #ffffff;
	letter-spacing: 0.5px;
	outline: none;
	border: none;
}

form h3 {
	font-size: 32px;
	font-weight: 500;
	line-height: 42px;
	text-align: center;
}

label {
	display: block;
	margin-top: 30px;
	font-size: 16px;
	font-weight: 500;
}

input {
	display: block;
	height: 50px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 14px;
	font-weight: 300;
}
#tr {
	display: block;
	height: 50px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 14px;
	font-weight: 300;
}
#table {
	display: block;
	height: 110px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 12px;
	font-weight: 300;
}

::placeholder {
	color: #e5e5e5;
}

button {
	margin-top: 50px;
	width: 100%;
	background-color: #ffffff;
	color: #080710;
	padding: 15px 0;
	font-size: 18px;
	font-weight: 600;
	border-radius: 5px;
	cursor: pointer;
}

.social {
	margin-top: 30px;
	display: flex;
}

.social div {
	background: red;
	width: 150px;
	border-radius: 3px;
	padding: 5px 10px 10px 5px;
	background-color: rgba(255, 255, 255, 0.27);
	color: #eaf0fb;
	text-align: center;
}

.social div:hover {
	background-color: rgba(255, 255, 255, 0.47);
}

.social .fb {
	margin-left: 25px;
}

.social i {
	margin-right: 4px;
}

.genre{
	display:inline-block;
	width:20px;
	height:20px;
}
#checkbox{
	vertical-align: -3px;
}

</style>

</head>
<body>

	<div class="background">

	</div>
	 <form:form class="form" action="${root }member/join_pro" method="post" modelAttribute="joinMemberBean">
		<h3>Join us!</h3>

		  <form:label path="m_id">ID</form:label>
            <form:input type="text" path="m_id" value="${sessionScope.userId}" readonly="true"/>
			<form:errors path="m_id" style="color:red"/>
	
	            <form:label path="m_pw">Password</form:label>
            <form:password path="m_pw" value="00000000" readonly="true"/>
			<form:errors path="m_pw" style="color:red"/>
			
			            <form:label path="m_name">이름</form:label>
            <form:input path="m_name"/>
			<form:errors path="m_name" style="color:red"/>
			
			            <form:label path="m_birth">주민번호</form:label>
            <form:input path="m_birth" placeholder="6자리 입력"/>
			<form:errors path="m_birth" style="color:red"/>
			
			<table align="center" width="300">
			<tr><td>
			          <form:label path="m_gender">성별</form:label>
			</td></tr>
			<tr>
			<td align="center">			          
           <form:radiobutton path="m_gender" value="1" style="width:20px;height:20px;" checked="true"/>
           </td>
           <td align="center">
           <form:radiobutton path="m_gender" value="2" style="width:20px;height:20px;"/>
           </td>
           </tr>
           <tr>
           <td align="center">남자
           </td>
           <td align="center">여자
           </td>
           </tr>
           <tr><td>
           <form:errors path="m_gender" style="color:red"/>
           </td></tr>
           </table>
           
                       <form:label path="m_tele">전화번호</form:label>
            <form:input path="m_tele" placeholder="-까지 입력" />
			<form:errors path="m_tele" style="color:red"/>
			
			            <form:label path="m_email">이메일</form:label>
            <form:input path="m_email"  value="${sessionScope.userId}" readonly="true"/>
			<form:errors path="m_email" style="color:red"/>
          <form:button class="btn-sign btn-up" type="submit">회원가입 완료</form:button>
          <form:hidden path="m_classify" value="200"/>
	</form:form>	
</body>
</html>
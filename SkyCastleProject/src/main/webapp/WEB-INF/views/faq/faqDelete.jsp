<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::SKYCASTLE::</title>
</head>
<body>
<script type="text/javascript">
var send = confirm("삭제하시겠습니까?");

if(send == true) {
   location.href="${root}faq/faqDelete_pro?fb_no=${fbListBean.fb_no}"
}
else {
   history.back(-1);
}
</script>
</body>
</html>



<!-- 삭제 페이지 완료  -->
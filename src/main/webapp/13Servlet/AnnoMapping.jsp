<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnnoMapping.jsp</title>
</head>
<body>
	<h2>애너테이션으로 매핑하기</h2>
	<p>
		<!-- ${requestScope.message}이지만 EL에서 배웠듯 생략가능했다. -->
		<strong>${message }</strong>
		<br>
		<!-- 요청명을 컨텍스트루트 경로까지 포함하여 링크를 생성함. -->
		<a href="<%=request.getContextPath() %>/13Servlet/AnnoMapping.do">
			바로가기</a>
</body>
</html>
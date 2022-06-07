<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet.jsp</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 JSP에서 출력하기</h2>
	<p>
		<strong><%= request.getAttribute("message") %></strong>
		<br>
		<!-- 클라이언트로부터 요청이 들어오면 우리가 만들어 놓은 요청명을 통해 컨트롤러인
		서블릿이 요청을 받도록 매핑해 놓는다. -->
		<a href="./HelloServlet.do">바로가기</a>
	</p>
</body>
</html>
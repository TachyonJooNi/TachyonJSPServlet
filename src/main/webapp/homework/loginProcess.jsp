<%@page import="membership.MembershipDTO"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MembershipDAO dao = new MembershipDAO(application);

String userId = request.getParameter("userid");
String userPwd = request.getParameter("passwd");

MembershipDTO login = dao.memberLogin(userId, userPwd);
dao.close();

if(login.getId() != null){
	session.setAttribute("UserId", login.getId());
	session.setAttribute("UserName", login.getName());
	
	out.println("<script>");
	out.println("alert('로그인 성공');");
	out.println("location.href='memberLogin.jsp';");
	out.println("</script>");
}
else {
	out.println("<script>");
	out.println("alert('로그인 실패');");
	out.println("location.href='memberLogin.jsp';");
	out.println("</script>");
}
%>
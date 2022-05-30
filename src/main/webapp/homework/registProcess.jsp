<%@page import="membership.MembershipDTO"%>
<%@page import="membership.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MembershipDAO dao = new MembershipDAO(application);
MembershipDTO dto = new MembershipDTO();

dto.setId(request.getParameter("userid"));
dto.setPass(request.getParameter("pass1"));
dto.setName(request.getParameter("name"));
dto.setSex(request.getParameter("gender"));
dto.setBirth(request.getParameter("birthday"));
dto.setAddress('('+ request.getParameter("zipcode") + ')'
		+ request.getParameter("address1") 
		+ request.getParameter("address2"));
dto.setEmail(request.getParameter("email1") 
		+ '@' + request.getParameter("email2"));
dto.setCellphone(request.getParameter("mobile1") 
		+ request.getParameter("mobile2") 
		+ request.getParameter("mobile3"));

if(!(request.getParameter("tel1").equals("") &&
		request.getParameter("tel2").equals("") &&
		request.getParameter("tel3").equals(""))) {
	dto.setPhone(request.getParameter("tel1") 
		+ request.getParameter("tel2") 
		+ request.getParameter("tel3"));	
}
else {
	dto.setPhone(null);
}

int affected = dao.memberInsert(dto);

dao.close();

if(affected != 0){
	out.println("<script>");
	out.println("alert('회원가입 성공');");
	out.println("location.href='memberLogin.jsp';");
	out.println("</script>");
}
else {
	out.println("<script>");
	out.println("alert('회원가입 오류');");
	out.println("location.href='memberRegist.jsp';");
	out.println("</script>");
}
%>
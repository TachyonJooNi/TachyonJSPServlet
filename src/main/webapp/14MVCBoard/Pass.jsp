<!-- Write.jsp을 복사해서 이름바꾸면서 시작함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
	<script type="text/javascript">
		function validateForm(form) {
			/* --//패스워드만 사용하기 때문에 유효성 체크도 수정
			if(form.name.value == "") {
				alert("작성자를 입력하세요.");
				form.name.focus();
				return false;
			}
			if(form.title.value == "") {
				alert("제목을 입력하세요.");
				form.title.focus();
				return false;
			}
			if(form.content.value == "") {
				alert("내용을 입력하세요.");
				form.content.focus();
				return false;
			} */
			if(form.pass.value == "") {
				alert("비밀번호를 입력하세요.");
				form.pass.focus();
				return false;
			}
		}
	
	</script>
</head>
<body>
	<h2>파일 첨부형 게시판 - 패스워드검증(Pass)</h2>
	<!-- //--<form>태그의 enctype="multipart/form-data"을 지움 -->
	<form name="writeFrm" method="post" 
		action="../mvcboard/pass.do" onsubmit="return validateForm(this);">
	<!-- 
	해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은후 request영역에 저장하여
	View에서 확인할수 있지만, EL을 이용하면 해당 과정없이 param내장객체로 즉시
	값을 받아올 수 있다.
	
	※hidden박스를 사용하는 경우 웹브라우져에서는 숨김처리 되기때문에 값이 제대로
	입력되었는지 화면으로 확인할수 없다. 따라서 
	1.개발자모드(F12)를 사용하거나 
	2.웹에서 페이지소스보기를 사용하거나 
	3.type을 디버깅용으로 잠깐 수정한 후 
	값이 제대로 입력되었는지 반드시 확인해야 한다.
	-->
	<!-- //-- 넘겨받아 전송할 값들을 추가함 -->
	<!-- //-- hidden타입이 정상적인지 확인하는 꿀팁으로 타입을 hid den등으로 바꾸면
	존재하지 않는 타입이라 기본타입인 text로 바뀌기 때문에 테스트에 유용하다. -->
	<input type="hid den" name="idx" value="${param.idx }" >
	<input type="hid-den" name="mode" value="${param.mode }" >
		
	<table border="1" width="90%">
<!-- //-- 패스워드 검증에 필요없는 부분 지움
 		<tr>
			<td>작성자</td>
			<td>
				<input type="text"name="name" style="width: 150px;">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text"name="title" style="width: 90%;">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 90%; height: 100px;"></textarea>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<input type="file"name="ofile">
			</td>
		</tr> -->
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password"name="pass" style="width: 100px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">검증하기</button>
				<button type="reset">RESET</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">
					목록 바로가기</button>
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>
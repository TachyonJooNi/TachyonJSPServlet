<!-- Write.jsp 쓰기페이지를 복붙해서 수정페이지를 만들어봤다. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
	<script type="text/javascript">
		//폼에서 누락된 내용이 있는지 확인하는 함수
		function validateForm(form) {
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
			}
			/* 비밀번호 재검증을 아래에서 안하기로 했으므로 여기도 주석으로 처리 
			if(form.pass.value == "") {
				alert("비밀번호를 입력하세요.");
				form.pass.focus();
				return false;
			}
			*/
		}
	
	</script>
</head>
<body>
	<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
	<!-- //--게시물의 파일을 추가하거나 수정해야 할수있으므로 enctype="multipart/form-data"
				를 채택했고 추가적으로 hidden과 요청명을 추가, 수정하였다. -->
	<form name="writeFrm" method="post" enctype="multipart/form-data"
		action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
	
	<!-- 게시물 수정을 위해 일련번호와 기존 파일명을 hidden박스에 추가한다. -->
	<input type="hid-den" name="idx" value="${dto.idx }">
	<!-- //-- 기존의 파일명을 가져온 이유는 파일명 추가, 수정이 있는 상황이라면
				추가하거나 덮어쓰면되지만, 없는 상황이라면 기존의 파일명을 유지해야
				하기 때문에 해당 데이터를 가져다 놓았다. -->
	<!-- 기존의 원본파일명 -->
	<input type="hid-den" name="preOfile" value="${dto.ofile }">
	<!-- 기존에 서버에 저장된 파일명 -->
	<input type="hid-den" name="preSfile" value="${dto.sfile }">
	
	<!-- //--비밀번호 재검증은 정책이나 보안상상의 선택사항이다.
		패스워드는 PassController.java에서 세션영역에 저장해 놓았다.
		경로를 따서 절차를 무시하고 접근하는 경우에 세션영역에 저장된 패스워드와
		게시물에 저장된 패스워드를 비교해서 비정상적인 수정을 막는다. -->
	검증된패스워드:${pass }
	<table border="1" width="90%">
		<tr>
			<td>작성자</td>
			<td>
				<input type="text"name="name" style="width: 150px;" value="${dto.name }">
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text"name="title" style="width: 90%;"value="${dto.title }">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 90%; height: 100px;">${dto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<!-- input태그의 type속성이 file타입인 경우에는 value속성은
				의미가 없다. value는 단순히 String(문자열)이므로 이 부분은
				DB에서 처리해야 한다. 해당 <input>태그는 선택한 파일을
				서버로 전송하는 역할을 한다. -->
				<input type="file"name="ofile">
			</td>
		</tr>
		<!-- 패스워드 검증을 마친후 수정페이지로 진입하였으므로 비밀번호
		입력창은 화면에서 제거한다. -->
		<!-- //--비밀번호 재검증은 정책이나 보안상상의 선택사항이다.
				패스워드는 PassController.java에서 세션영역에 저장해 놓았다.
				경로를 따서 절차를 무시하고 접근하는 경우에 세션영역에 저장된 패스워드와
				게시물에 저장된 패스워드를 비교해서 비정상적인 수정을 막는다. -->
		<!-- 
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password"name="pass" style="width: 100px;">
			</td>
		</tr>
		 -->	
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">RESET</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">
					목록 바로가기</button>
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>
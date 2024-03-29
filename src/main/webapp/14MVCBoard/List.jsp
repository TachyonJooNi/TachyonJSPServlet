<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //--09PagingBoard.List.jsp (모델 1 페이징적용방식)과 비교하며 공부하자. -->
<!-- View를 담당할 JSP에서 JSTL을 사용하기 위한 taglib 지시어 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
    <h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="name">작성자</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>
    </table>
    </form>

    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
        </tr>
<!-- 리스트 켈렉션에 저장된 게시물이 없을때 출력부분 -->
<c:choose>
	<c:when test="${empty boardLists }">
        <tr>
            <td colspan="6" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
    </c:when>
    <c:otherwise>
    	<!-- 출력할 게시물이 있는경우 실행. 리스트 컬렉션에 저장된 게시물의
    	갯수만큼 반복하여 목록을 출력함. -->
    	<c:forEach items="${boardLists }" var="row" varStatus="loop">
        <tr align="center">
            <td>
				<!-- 
				가상번호 계산하기
				=> 게시물갯수 - (((페이지번호-1) * 페이지당 게시물수) + 해당루프의 index)
				참고로 varStatus속성의 index는 0부터 시작한다.
				
					전체게시물의 갯수가 5개일때
					1페이지의 첫번째 게시물 번호 : 5 - (((1-1) * 2) + 0) = 5
					2페이지의 첫번째 게시물 번호 : 5 - (((2-1) * 2) + 0) = 3
				-->
            	${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
            </td>
            <td align="left">
            	<!-- 제목. 클릭시 상세보기 페이지로 이동함. -->
                <a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a>
            </td> 
            <td>${row.name }</td>
            <td>${row.visitcount }</td>
            <td>${row.postdate }</td>
            <td>
            <!-- 첨부파일이 있을때만 다운로드 링크를 출력함. -->
            <c:if test="${not empty row.ofile }">
            	<a href="../mvcboard/download.do?ofile=${row.ofile }&sfile=${row.sfile }&idx=${row.idx }">
            		[Down]
            	</a>
            </c:if>
            </td>
        </tr>
        </c:forEach>
    </c:otherwise>
</c:choose>
    </table>
   
    <table border="1" width="90%">
        <tr align="center">
            <td>
                ${map.pagingImg }
            </td>
            <td width="100"><button type="button"
                onclick="location.href='../mvcboard/write.do';">글쓰기</button></td>
        </tr>
    </table>
</body>
</html>


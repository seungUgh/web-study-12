<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
 ${list }
	<div id="wrap" align ="center">
		<h1>게시글 리스트</h1>
		<table class="list">
			<tr>
				<td colspan="5" style="border:white; text-align : right" >
				<a href="boardWrite.do">게시글 등록</a>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:forEach var="board" items="${list }">
				<tr class="record">
					<td id="num">${board.num }</td>	
					<td id="title">
					<a href="boardView.do?num=${board.num}">${board.title }</a></td>	
					<td id="name">${board.name }</td>	
					<td id="date"><fmt:formatDate value="${board.writeDate}" /></td>	
					<td id="readCount">${board.readCount }</td>	
				</tr>	
			</c:forEach>
		</table>
	</div>
</body>
</html>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<div align="center">
<h1>비밀번호 확인</h1>
	<form action="boardCheckPass.do" name="frm" method="get">
		<input type="hidden" name="num" value="${param.num }">
		<table style="width: 80%">
			<tr>
				<th>비밀번호<th>
				<td>
				<input type="password" name="pass" size="20">
				</td>
			</tr>
		</table>		
	<br>
	<input type="submit" value="확 인" onclick="return PassCheck()">
	<br><br>${message }
	</form>
</div>
</body>
</html>
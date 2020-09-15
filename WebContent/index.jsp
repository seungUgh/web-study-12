<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web_study_12.ds.JndiDS"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>데이터베이스 연결 테스트</title>
	</head>
	<body>
		<c:set var="con" value="${JndiDS.getConnection()}"/>
		<c:out value="${con}"/>
	</body>
</html>

<!-- view할때 count들어가는거 호출해줘야 readCount가 올라간다!!

model들은 서블릿이아니다 command를부모로두고잇고 command상위클래스는object이기때문에
그래서 톰캣을 중지하고 다시 실행해주어야된다!!



 -->
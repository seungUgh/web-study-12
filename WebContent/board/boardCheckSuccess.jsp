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
<script type="text/javascript">
	if(window.name == "update") {
		window.opener.parent.location.href=
			"boardUpdate.do?num=${param.num}";
	}else if (window.name == 'delete') {
		alert('삭제되었습니다.');
		window.opener.parent.location.href=
			"boardDelete.do?num=${param.num}";
	}
	window.close();
</script>
</body>
</html>
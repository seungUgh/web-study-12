<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styelsheet">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#add").on('click', function(e){
		e.preventDefault();
		
		var board= {
			name:$('#name').val(),
			pass:$('#pass').val(),
			email:$('#email').val(),
			title:$('#title').val(),
			content:$('#content').val()
		};
		
		//alert(JSON.stringify(board));
		
		$.ajax({
			type:"post",
			url:"boardWrite.do",
			cache:false,
			data:JSON.stringify(board),
			success:function(data){
				alert("추가되었습니다." + data);
				window.location.href = "boardList.do"
			}
		}); 
	
	});
	$("#reset").on('click', function(e){
		e.preventDefault();
		//input
		$('input').each(function(index, value){
			$(this).val("")
		});
			$('textarea').val("");
	});
	
	
	$("#list").on('click', function(e){
		e.preventDefault();
		location.href="boardList.do"; /* redirection주소창이바뀜.. (포워딩은x) */
	});
});

</script>
</head>
<body>
<div id="wrap" align="center">
	<h1>게시글 등록</h1>
	<form name = "frm" method="post" action="boardWrite.do">
		<input type="hidden" name="command" value="board">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name" id="name"> * 필수</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" id="pass">
				 * 필수 (게시물 수정 삭제시 필요합니다.)</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" size="70" name="title" id="title"> * 필수</td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea cols="70" rows="15" name="content" id="content"></textarea></td>
			</tr>
		</table>
		<br><br>
		<button id="add">등록</button>
		<button id="reset">다시작성</button>
		<button id="list">목록</button>
	</form>
	<!--키값,세미콜론.value body가 하나라도 틀리면 무조건 get방식으로 호출된다!! 
	model쪽에서 객체화가 안된다! 그래서 받는쪽에서 계속 찍어봐야한다-->
</div>
</body>
</html>
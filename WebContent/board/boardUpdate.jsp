<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#updateBtn").on("click", function(e) {
       e.preventDefault();
       
       var board = {
             num: ${param.num},
             name: $("#name").val(),
             pass: $("#pass").val(),
             email: $("#email").val(),
             title: $("#title").val(),
             content: $("#content").val()
       };
       
       alert(JSON.stringify(board));
       
       $.ajax({
          type: "post",
          url: "boardUpdate.do",
          cache: false,
          data: JSON.stringify(board),
          complete: function(data) {
             if(data.responseText == "1") { 
                alert("성공적으로 수정되었습니다.");
                window.location.href = "boardList.do";
             }
          }
       });
    });
 });

</script>
</head>
<body>
	<div id="wrap" align="center">
		<h1>게시글 등록</h1>
		<form name="frm" method="post" action="boardWrite.do">
			<input type="hidden" name="command" value="board_write">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" id="name" name="name"
						value="${board.name }"> * 필수</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="pass" name="pass"> * 필수
						(게시물 수정 삭제시 필요합니다.)</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" name="email"
						value="${board.email }"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="70" id="title" name="title"
						value="${board.title }">* 필수</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="70" rows="15" id="content" name="content">${board.content }</textarea></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" id="updateBtn" value="수정"
				onclick="return boardCheck()"> <input type="reset"
				value="다시 작성"> <input type="button" value="목록"
				onclick="location.href='boardList.do'">
		</form>
	</div>
</body>
</html>
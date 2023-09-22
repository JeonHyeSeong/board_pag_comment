<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="/brd/edit" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>글번호</th>
				<td><input type="text" name="bno" value="${bvo.bno }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${bvo.title }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${bvo.writer }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="3" cols="30" name="content">${bvo.content }</textarea></td>
			</tr>
			<tr>
				<th>작성시간</th>
				<td>${bvo.regdate }</td>
			</tr>
			<tr>
				<th>파일</th>
				<td>
					<input type="hidden" name="image_file" value="${bvo.image_File }">
					<input type="file" name="new_file" accept="image/*">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
	<a href="/brd/pageList"><button type="button">리스트로..</button></a>
</body>
</html>
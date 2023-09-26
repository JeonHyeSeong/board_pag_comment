<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style type="text/css">
	.table{
		width: 700px;
	}
	h1{
		text-align: center;
		font-size: 40px;
		font-weight: 700;
	}
	.tacon{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<h1>게시글 수정</h1>
	<div class="tacon">
		<form action="/brd/edit" method="post" enctype="multipart/form-data">
			<table class="table table-dark table-striped table">
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
			<a href="/brd/pageList"><button type="button">리스트로..</button></a>
		</form>
	</div>
</body>
</html>
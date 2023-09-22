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
	.input{
		width: 500px;
	}
	h1{
		text-align: center;
		font-size: 40px;
		font-weight: 700;
	}
	.con{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<h1>게시글 등록</h1>
	<div class="mb-3 con">
		<form action="/brd/insert" method="post" enctype="multipart/form-data">
			<label for="exampleFormControlInput1" class="form-label">제목</label>
			<input type="text" name="title" class="form-control input" id="exampleFormControlInput1"> <br>
			<label for="exampleFormControlInput1" class="form-label">작성자</label>
			<input type="text" name="writer" class="form-control input" value="${ses.id}" readonly="readonly"> <br>
			<label for="exampleFormControlInput1" class="form-label">내용</label>
			<textarea rows="3" cols="30" name="content" class="form-control input" id="exampleFormControlTextarea1"></textarea> <br>
			<label for="exampleFormControlInput1" class="form-label">파일첨부</label>
			<input type="file" name="image_file" accept="image/*"> <br>
			<button type="submit" class="btn btn-outline-success">등록</button> 
			<a href="/index.jsp"><button type="button" class="btn btn-outline-primary">Index페이지로..</button></a>
		</form>
	</div>
</body>
</html>
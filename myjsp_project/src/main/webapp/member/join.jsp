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
	.container{
		display: flex;
		justify-content: center;
	}
	h1{
		text-align: center;
		font-size: 40px;
		font-weight: 700;
	}
</style>
</head>
<body>
	<h1>회원가입</h1>
	<div class="container">
		<form action="/mem/register" method="post">
			ID : <input type="text" name="id" class="form-control input"> <br>
			PASSWORD : <input type="text" name="pwd" class="form-control input"> <br>
			E-MAIL : <input type="text" name="email" class="form-control input"> <br>
			AGE : <input type="text" name="age" class="form-control input"> <br>
			<button type="submit">회원가입완료</button>
		</form>
	</div>
</body>
</html>
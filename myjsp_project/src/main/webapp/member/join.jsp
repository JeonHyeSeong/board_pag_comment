<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="/mem/register" method="post">
		ID : <input type="text" name="id"> <br>
		PASSWORD : <input type="text" name="pwd"> <br>
		E-MAIL : <input type="text" name="email"> <br>
		AGE : <input type="text" name="age"> <br>
		<button type="submit">회원가입완료</button>
	</form>
</body>
</html>
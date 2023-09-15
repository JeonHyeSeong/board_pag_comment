<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보수정</h1>
	<form action="/mem/edit" method="post">
		ID : <input type="text" name="id" value="${ses.id }" readonly="readonly"> <br>
		PASSWORD : <input type="text" name="pwd" value="${ses.pwd }"> <br>
		E-MAIL : <input type="text" name="email" value="${ses.email }"> <br>
		AGE : <input type="text" name="age" value="${ses.age }"> <br>
		<button type="submit">정보수정</button>
	</form>
	
	<a href="/mem/remove"><button type="button">회원탈퇴</button></a>
</body>
</html>
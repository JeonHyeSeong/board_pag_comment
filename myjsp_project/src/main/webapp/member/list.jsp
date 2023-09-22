<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원리스트</h1>
	
	<table border="1">
		<tr>
			<th>ID</th>
			<th>PWD</th>
			<th>E-MAIL</th>
			<th>AGE</th>
			<th>REG_DATE</th>
			<th>LAST_LOGIN</th>
		</tr>
		<c:forEach items="${list }" var="mvo">
			<tr>
				<td>${mvo.id }</td>
				<td>${mvo.pwd }</td>
				<td>${mvo.email }</td>
				<td>${mvo.age }</td>
				<td>${mvo.regdate }</td>
				<td>${mvo.lastlogin }</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="/index.jsp"><button type="button">index페이지로</button></a>
</body>
</html>
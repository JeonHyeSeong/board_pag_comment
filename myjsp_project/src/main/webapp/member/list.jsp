<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.btnContainer{
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
	<h1>회원리스트</h1>
	
	<div class="tacon">
		<table class="table table-dark table-striped table">
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
	</div>
	
	<div class="btnContainer">
		<a href="/index.jsp"><button type="button">index페이지로</button></a>
	</div>
	
</body>
</html>
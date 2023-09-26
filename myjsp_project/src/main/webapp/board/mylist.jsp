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
	.tacon, .in{
		display: flex;
		justify-content: center;
	}
	.ibtn{
		background-color: black;
		color: white;
		cursor: pointer;
		border-radius: 20px;
	}
</style>
</head>
<body>
	<h1>내가 쓴 글</h1>
	<div class="tacon">
		<table class="table table-dark table-striped table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list }" var="bvo">
				<c:if test="${ses.id eq bvo.writer }">
				<tr>
					<td>${bvo.bno }</td>
					<td>
					<c:if test="${bvo.image_File ne '' && bvo.image_File ne null }">
						<img src="/_fileUpload/_th_${bvo.image_File }">
					</c:if>
					${bvo.title }
					</td>
					<td>${bvo.writer }</td>
					<td>${bvo.regdate }</td>
					<td>${bvo.readcount }</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
	<div class="in">
		<a href="/index.jsp"><button type="button" class="ibtn">Index페이지로..</button></a>
	</div>
</body>
</html>
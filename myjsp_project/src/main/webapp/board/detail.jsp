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
	.tacon, .btncon{
		display: flex;
		justify-content: center;
	}
	.ibtn{
		background-color: black;
		color: white;
		cursor: pointer;
		border-radius: 20px;
		margin: 10px;
	}
</style>
</head>
<body>
	<h1>게시글 상세보기</h1>
	
	<div class="tacon">
	<c:if test="${bvo.image_File ne '' && bvo.image_File ne null }">
		<div>
			<img src="/_fileUpload/${bvo.image_File }">
		</div>
	</c:if>
	<table class="table table-dark table-striped table">
		<tr>
			<th>글번호</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>작성시간</th>
			<td>${bvo.regdate }</td>
		</tr>
		<tr>
			<th>수정시간</th>
			<td>${bvo.moddate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bvo.readcount }</td>
		</tr>
	</table>
	</div>
	
	<div class="btncon">
	<a href="/brd/modify?bno=${bvo.bno }"><button type="button" class="ibtn">수정</button></a>
	<a href="/brd/remove?bno=${bvo.bno }"><button type="button" class="ibtn">삭제</button></a>
	<a href="brd/pageList"><button type="button" class="ibtn">리스트로...</button></a>
	</div>
	
</body>
</html>
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
body{
	padding: 20px;
}
h1{
	text-align: center;
	font-size: 40px;
	font-weight: 700;
}
.sel{
	width: 300px;
}
.search{
	width: 500px;
}
.table{
	margin-top: 30px;
	width: 1000px;
}
.ibtn{
	background-color: black;
	color: white;
	cursor: pointer;
	border-radius: 20px;
}
.con{
	display : flex;
	justify-content: center;
}
.tacon{
	display: flex;
	justify-content: center;
}
.nav{
	display: flex;
	justify-content: center;
}
.in{
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<h1>게시글 리스트</h1>
	
	<div class="container-fluid con">
		<form action="/brd/pageList" method="get" class="d-flex">
			<c:set value="${ph.pgvo.type }" var="typed"></c:set>
			<select name="type" class="form-select sel">
				<option ${typed == null? 'selected' : ''}>Choose</option>
				<option value="t" ${typed eq 't'? 'selected' : ''}>Title</option>
				<option value="w" ${typed eq 'w'? 'selected' : ''}>Writer</option>
				<option value="c" ${typed eq 'c'? 'selected' : ''}>Content</option>
				<option value="tw" ${typed eq 'tw'? 'selected' : ''}>Title+Writer</option>
				<option value="tc" ${typed eq 'tc'? 'selected' : ''}>Title+Content</option>
				<option value="wc" ${typed eq 'wc'? 'selected' : ''}>Writer+Content</option>
				<option value="twc" ${typed eq 'twc'? 'selected' : ''}>Title+Writer+Content</option>
			</select>
			<input type="text" class="form-control me-2 search" name="keyword" value="${ph.pgvo.keyword }" placeholder="검색어를 입력하세요..">
			<input type="hidden" name="pageNo" value="${ph.pgvo.pageNo }">
			<input type="hidden" name="qty" value="${ph.pgvo.qty }">
			<button type="submit" class="btn btn-outline-success">검색</button>
		</form>
	</div>
	
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
				<tr>
					<td><a href="/brd/detail?bno=${bvo.bno }">${bvo.bno }</a></td>
					<td>
					<c:if test="${bvo.image_File ne '' && bvo.image_File ne null }">
						<img src="/_fileUpload/_th_${bvo.image_File }">
					</c:if>
					<a href="/brd/detail?bno=${bvo.bno }">${bvo.title }</a>
					</td>
					<td>${bvo.writer }</td>
					<td>${bvo.regdate }</td>
					<td>${bvo.readcount }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<nav aria-label="Page navigation example" class="nav">
		<ul class="pagination">
		    <c:if test="${ph.prev }">
				   <li class="page-item">
					    <a class="page-link" href="/brd/pageList?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">Previous</a>
				   </li>
			</c:if>
		    
			<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
				   <li class="page-item">
					    <a class="page-link" href="/brd/pageList?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
				   </li>
			</c:forEach>
		    
		    <c:if test="${ph.next }">
				 <li class="page-item">
				    <a class="page-link" href="/brd/pageList?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">Next</a>
				 </li>
			</c:if>
  		</ul>
	</nav>
	<div class="in">
	<a href="/index.jsp"><button type="button" class="ibtn">Index페이지로..</button></a>
	</div>
</body>
</html>
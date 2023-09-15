<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	min-width: 1050px;
	position: relative;
}

table {
	border-collapse: collapse;
	margin-top: 10px;
	margin-bottom: 5px;
}

table td {
	height: 15px;
	overflow: hidden;
	border: 1px solid black;
	border-left: none;
	border-right: none;
	padding-top: 3px;
	padding-bottom: 3px;
}

table td:nth-child(1) {
	width: 60px;
	text-align: center;
}

table td:nth-child(2) {
	width: 150px;
	text-align: center;
}

table td:nth-child(3) {
	width: 80px;
	text-align: center;
}

table td:nth-child(4) {
	width: 170px;
	text-align: center;
}

table td:nth-child(5) {
	width: 10px;
	text-align: center;
}
</style>
</head>
<body>
	<h1>게시글 리스트</h1>
	
	<div>
		<form action="/brd/pageList" method="get">
			<div>
				<c:set value="${ph.pgvo.type }" var="typed"></c:set>
				<select name="type">
					<option ${typed == null? 'selected' : ''}>Choose</option>
					<option value="t" ${typed eq 't'? 'selected' : ''}>Title</option>
					<option value="w" ${typed eq 'w'? 'selected' : ''}>Writer</option>
					<option value="c" ${typed eq 'c'? 'selected' : ''}>Content</option>
					<option value="tw" ${typed eq 'tw'? 'selected' : ''}>Title+Writer</option>
					<option value="tc" ${typed eq 'tc'? 'selected' : ''}>Title+Content</option>
					<option value="wc" ${typed eq 'wc'? 'selected' : ''}>Writer+Content</option>
					<option value="twc" ${typed eq 'twc'? 'selected' : ''}>Title+Writer+Content</option>
				</select>
				<input type="text" name="keyword" value="${ph.pgvo.keyword }" placeholder="검색어를 입력하세요..">
				<input type="hidden" name="pageNo" value="${ph.pgvo.pageNo }">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
				<button type="submit">검색</button>
			</div>
		</form>
	</div>
	
	
	
	<table border="1">
		<tr>
			<th>BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REG_DATE</th>
			<th>READCOUNT</th>
		</tr>
		<c:forEach items="${list }" var="bvo">
			<tr>
				<td><a href="/brd/detail?bno=${bvo.bno }">${bvo.bno }</a></td>
				<td><a href="/brd/detail?bno=${bvo.bno }">${bvo.title }</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate }</td>
				<td>${bvo.readcount }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		<c:if test="${ph.prev }">
			<a href="/brd/pageList?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">◁ |</a>
		</c:if>
		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
			<a href="/brd/pageList?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a>
		</c:forEach>
		<c:if test="${ph.next }">
			<a href="/brd/pageList?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">| ▷</a>
		</c:if>
	</div>
	
	<a href="/index.jsp"><button type="button">index페이지로</button></a>
	<a href="/brd/register"><button type="button">글쓰기페이지로</button></a>
</body>
</html>
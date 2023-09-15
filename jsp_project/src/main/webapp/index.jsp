<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Index Page</h1>
	<form action="/mem/login" method="post">
		ID : <input type="text" name="id">
		PWD : <input type="text" name="pwd">
		<button type="submit">Login</button>
	</form>
	
	<div>
		<c:if test="${ses.id ne null }">
			${ses.id }님 Login하였습니다. <br>
			계정생성일 : ${ses.regdate } <br>
			마지막접속 : ${ses.lastlogin } <br>
			<a href="/brd/register"><button type="button">게시글 쓰기</button></a>
			<a href="/mem/logout"><button type="button">로그아웃</button></a>
			<a href="/mem/list"><button type="button">회원리스트보기</button></a>
			<a href="/mem/modify"><button type="button">회원정보수정</button></a>
		</c:if>
	</div>
	<br>
	
	<a href="/mem/join"><button type="button">회원가입</button></a> <br>
	<a href="/brd/pageList"><button type="button">게시글 리스트</button></a>
</body>
</html>
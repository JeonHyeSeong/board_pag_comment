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
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: linear-gradient(#141e30, #243b55);
}

.login-box, .login-form {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form button {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px
}



.login-box button:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

.login-box button span {
  position: absolute;
  display: block;
}

.login-box button span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box button span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%,100% {
    top: 100%;
  }
}

.login-box button span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%,100% {
    right: 100%;
  }
}

.login-box button span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%,100% {
    bottom: 100%;
  }
}
h1{
	color: white;
	text-align: center;
	font-size: 40px;
	font-weight: 700;
}
.ses{
	color: white;
	font-weight: 700;
	font-size: 25px;
	width: 650px;
	text-align: center;
}
.lbtn{
	background-color: black;
	color: white;
	cursor: pointer;
	border-radius: 20px;
	margin-top: 15px;
}

.loginBtnContainer{
	display : flex;
	justify-content: center;
}

.loginBtnContainer>.loginBtn1{
	margin-right: 20px;
}
.loginBtn2{
	margin-left: 20px;
}

</style>
</head>
<body>
	<h1>Index Page</h1>
	
	<c:if test="${ses.id eq null }">
		<div class="login-box">
  			<h2>Login</h2>
  			<form action="/mem/login" method="post">
    			<div class="user-box">
      				<input type="text" name="id">
      				<label>ID</label>
    			</div>
    			<div class="user-box">
      				<input type="text" name="pwd">
      				<label>PASSWORD</label>
    			</div>
    			
    			<div class="loginBtnContainer">
	    		<button class="loginBtn1" type="submit">
			      <span></span>
			      <span></span>
			      <span></span>
			      <span></span>
			      Login
	    		</button>
	  			<a href="/mem/join">
		  			<button class="loginBtn2" type="button">
			  			<span></span>
					    <span></span>
					    <span></span>
					    <span></span>
		  				회원가입
		  			</button>
	  			</a>
	  			</div>
  			</form>
	  	</div>
	</c:if>
	
	<c:if test="${ses.id ne null }">
		<div class="login-form ses">
				${ses.id }님 Login하였습니다. <br>
				계정생성일 : ${ses.regdate } <br>
				마지막접속 : ${ses.lastlogin } <br>
				<a href="/brd/register"><button type="button" class="lbtn">게시글 쓰기</button></a>
				<a href="/brd/pageList"><button type="button" class="lbtn">게시글 리스트</button></a>
				<a href="/mem/logout"><button type="button" class="lbtn">로그아웃</button></a>
				<a href="/mem/list"><button type="button" class="lbtn">회원리스트보기</button></a>
				<a href="/mem/modify"><button type="button" class="lbtn">회원정보수정</button></a>
				<a href="/brd/mylist?writer=${ses.id }"><button type="button" class="lbtn">내가쓴게시글</button></a>
				<a href="/123456/123"><button type="button" class="lbtn">오류</button></a>
		</div>
	</c:if>
	
</body>
</html>
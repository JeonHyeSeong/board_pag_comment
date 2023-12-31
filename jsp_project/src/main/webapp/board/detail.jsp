<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<h1>게시글 상세보기</h1>
	<table border="1">
		<tr>
			<th>BNO</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>WRITER</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>REG_DATE</th>
			<td>${bvo.regdate }</td>
		</tr>
		<tr>
			<th>MOD_DATE</th>
			<td>${bvo.moddate }</td>
		</tr>
		<tr>
			<th>READCOUNT</th>
			<td>${bvo.readcount }</td>
		</tr>
	</table>
	
	<a href="/brd/modify?bno=${bvo.bno }"><button type="button">수정</button></a>
	<a href="/brd/remove?bno=${bvo.bno }"><button type="button">삭제</button></a>
	<a href="/brd/pageList"><button type="button">리스트로이동</button></a>
	
	<br>
	<hr>
	<div>
		Comment Line <br>
		<input type="text" id="cmtWriter" value="${ses.id }" readonly="readonly"> <br>
		<input type="text" id="cmtText" placeholder="Add Comment"> <br>
		<button type="button" id="cmtAddBtn">댓글등록</button> <br>
	</div>
	<br>
	<!-- 댓글 표시라인 -->
	<div class="accordion" id="accordionExample">
		<!-- 댓글 아이템 1개 표시 영역 -->
	  	<div class="accordion-item">
		    <h2 class="accordion-header">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        cno, writer, reg_date
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        content
		      </div>
		    </div>
  		</div>
  	</div>
  	
  	<script type="text/javascript">
  		const bnoVal = `<c:out value="${bvo.bno}" />`;
  	</script>
  	<script src="/resource/board_detail.js"></script>
  	
  	<script type="text/javascript">
  		printCommentList(bnoVal);
  	</script>
</body>
</html>
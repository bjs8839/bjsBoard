<%@page import="com.bjsboard.boardapp.service.bjsBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.bjsboard.boardapp.dao.bjsBoardDao" %>
<%@ page import="com.bjsboard.boardapp.service.bjsBoardService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/efb21057d1.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="resources/main.css?ver=5">
  
<title>bjsBoard Main</title>
</head>
<body>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
					<th>추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="bl">
					<input type="hidden" value="${bl.BOARDNUM}">
					<tr>
						<c:set var="WRITEDATE" value="${bl.WRITE_DATE}"/>
						<td>${bl.BOARDNUM}</td>
						<td><a href="boardDetailView?boardNum=${bl.BOARDNUM}">${bl.TITLE}</a></td>
						<td>${bl.WRITER}</td>
						<td>${fn:substring(WRITEDATE,0,4)}년 ${fn:substring(WRITEDATE,5,7)}월 ${fn:substring(WRITEDATE,8,10)}일 ${fn:substring(WRITEDATE,11,13)}시  ${fn:substring(WRITEDATE,14,16)}분</td>
						<td>${bl.READ_COUNT}</td>
						<td>${bl.RECOMMAND}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<i class="fas fa-pen-square fa-2x boardWriteBtn" id="boardWriteBtn"></i>
			<script>
				$("#boardWriteBtn").click(function(){
					alert("글쓰기로이동")
					location.href='boardWriteView'
				});
			</script>
	</div>
</body>
</html>
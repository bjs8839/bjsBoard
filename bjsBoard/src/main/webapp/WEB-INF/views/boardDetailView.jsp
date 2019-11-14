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
  <link rel="stylesheet" href="resources/boardDetailView.css?ver=1">
  
<title>글 상세보기</title>
</head>
<body>
	<div class="container">
		<h2>글 상세보기</h2>
		<input type="hidden" id="boardNum" value="${boardDetail.BOARDNUM}">
		<table>	
			<tr>
				<th>글제목 : ${boardDetail.TITLE} </th>
			</tr>
			<tr>
				<th>작성자 : ${boardDetail.WRITER}</th>
				<c:set var="WRITEDATE" value="${boardDetail.WRITE_DATE}"/>
				<th>작성일 : ${fn:substring(WRITEDATE,0,4)}년 ${fn:substring(WRITEDATE,5,7)}월 ${fn:substring(WRITEDATE,8,10)}일 ${fn:substring(WRITEDATE,11,13)}시  ${fn:substring(WRITEDATE,14,16)}분</th>
				<th style="position:relative; left:140%;">조회수 0</th>
				<th style="position:relative; left:145%;">추천수 ${boardDetail.RECOMMAND}</th>
			</tr>
		</table>
		<div class="panel panel-default content">
			<div class="panel-body content">${boardDetail.CONTENT}</div>
		</div>
		<div class="row">
			<div class="col-sm-offset-9 col-sm-1"><button class="btn btn-default" id="listBtn">목록</button></div>
			<div class="col-sm-1"><button class="btn btn-default" id="modifyBtn">수정</button></div>
			<div class="col-sm-1"><button class="btn btn-default" id="deleteBtn">삭제</button></div>
		</div>
		<script>
			$(function(){
				$('#listBtn').click(function(){
					location.href="/main"
				})
				$('#modifyBtn').click(function(){
					location.href="/boardModifyView?boardNum="+$('#boardNum').val()
				})
				$('#deleteBtn').click(function(){
					location.href="/boardDelete?boardNum="+$('#boardNum').val()
				})
			})
		</script>
	</div>
</body>
</html>

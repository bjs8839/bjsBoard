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
  
<title>글쓰기 화면, 닉네임, 비밀번호, 글제목, 글내용</title>
</head>
<body>
	<div class="container">
		<h2>글쓰기</h2>
		<form class="form-horizontal" action="/boardWrite">
			<div class="form-group">
				<label class="control-label col-sm-2" for="nickname">닉네임:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nickname" placeholder="닉네임을 입력하세요" name="nickname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">비밀번호:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="password" placeholder="비밀번호를 입력하세요" name="password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="title" placeholder="제목을 입력하세요" name="title">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label style="font-weight:700;"><input type="checkbox" name="remember">비밀번호 저장</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="content">글내용:</label>
				<div class="col-sm-10"></div>
				<div class="col-sm-offset-2 col-sm-10">
					<textarea class="form-control" rows="20" cols="20" placeholder="글 내용을 작성해주세요" id="content" name="content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="writeBtn" style="font-weight:700;">글 게시하기</button>
<!-- 					<script> -->
<!-- // 						$('#writeBtn').click(function(){ -->
<!-- // 							location.href="boardWrite?nickname="+$('#nickname').val()+"&password="+$('#password').val()+"&"" -->
<!-- // 						}) -->
<!-- 					</script> -->
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>
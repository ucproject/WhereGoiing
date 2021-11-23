<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form method="post" action="/userlogin">
		<div>
			memberId :
			<input type="text" name="id"> 
		</div>
		<div>
			memberPw :
			<input type="password" name="password"> 
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</body>
</html>



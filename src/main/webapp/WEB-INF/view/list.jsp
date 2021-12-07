<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Sign-in</title>
  
  
  </head>
  <body >
    <h1>로그인 됨</h1>
      
    <c:forEach var = "dto" items="${hospitalmaps}">
      ${dto.category}/ ${dto.name} / ${dto.address} / ${dto.latitude} / ${dto.longitude}
    </c:forEach>

  </body>
</html>

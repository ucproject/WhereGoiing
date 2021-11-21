<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Sign-in</title>
  
  
  </head>
  <body >
    <table width="500" cellpadding="0" cellspacing="0" border="1">
        <tr>
            <td>번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>삭제</td>
        </tr>
        <c:forEach items="${list}" var="dto">
            <tr>
                <td>${dto.id}</td>
                <td>${dto.name}</td>
                <td>ff</td>
                <td>삭제</td>
            </tr>
        </c:forEach>
    </table>

  </body>
</html>

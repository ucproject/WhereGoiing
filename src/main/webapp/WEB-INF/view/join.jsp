<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Sign-up</title>
    <jsp:include page="top.jsp" flush="false"/>

    
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form action="/createMember" method="post">
    <img class="mb-4" src="/img/whereUlsan.png" alt="" width="100%">
    <div>
      <center>
      <table>
        <tr>
          <td>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="id" >
      <label for="floatingInput">ID</label>
    </div>
  </td>
</tr>
    <tr>
      <td>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingInput" name="password">
      <label for="floatingInput">Password</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="name">
      <label for="floatingInput">Name</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="nickname">
      <label for="floatingInput">Nick name</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" name="email">
      <label for="floatingInput">Email address</label>
    </div>    
  </td>
</tr>
  <tr>
    <td>
    <button class="w-100 btn btn-lg" type="submit">Sign up</button>
  </td>
</tr>
  </table>
</center>
</div>
  </form>
</main>


    
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <title>Sign-in</title>
    <jsp:include page="top.jsp" flush="false"/>

    
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form>
    <img class="mb-4" src="/img/whereUlsan.png" alt="" width="100%">

    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" >
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingInput">
      <label for="floatingInput">Password</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput">
      <label for="floatingInput">Name</label>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput">
      <label for="floatingInput">Nick name</label>
    </div>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput">
      <label for="floatingInput">Email address</label>
    </div>
    
    
    <button class="w-100 btn btn-lg" type="submit">Sign up</button>

  </form>
</main>


    
  </body>
</html>

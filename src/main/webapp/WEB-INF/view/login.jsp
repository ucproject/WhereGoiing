<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <jsp:include page="top.jsp" flush="false"/>
  

  <body class="text-center">
    
<main class="form-signin">
  <form method="post" action="/userlogin">
    <img class="mb-4" src="/img/whereUlsan.png" alt="" width="100%">
    <center>
      <div style="padding-top: 150px;">
    <table>
      <tr>
        <td>
    <div class="form-floating">
      <input type="text" class="form-control" name="id">
      <label for="floatingInput">ID</label>
    </div>
        </td>
      </tr>
      <tr>
        <td>
    <div class="form-floating">
      <input type="password" class="form-control" name="password">
      <label for="floatingPassword">Password</label>
    </div>
    </div>
  </td>
  </tr>
  <tr>
    <td>
    <button class="w-100 btn btn-lg" type="submit" onclick="go_login">Sign in</button>
  </td>
  </tr>
  </table>
</div>
</center>
  </form>
</main>
  </body>
</html>

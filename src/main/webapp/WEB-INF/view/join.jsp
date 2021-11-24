<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <jsp:include page="top.jsp" flush="false"/>
  <body class="text-center">
    
<main class="form-signin">
  <form action="/createMember" method="post" name="joinForm" id="joinForm">
    <img class="mb-4" src="/img/whereUlsan.png" alt="" width="100%">
    <div>
      <center>
      <table>
        <tr>
          <td>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="id" required>
      <label for="floatingInput">ID</label>
    </div>
  </td>
</tr>
    <tr>
      <td>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingInput" name="password" required>
      <label for="floatingInput">Password</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="name" required>
      <label for="floatingInput">Name</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" name="nickname" required>
      <label for="floatingInput">Nick name</label>
    </div>
  </td>
</tr>
<tr>
  <td>
    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" name="email" required>
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
  <script>
    $(function(){
      $('#joinForm').on('submit', function(e){
        e.preventDefault();
        e.stopPropagation();
        $.ajax({
          type:'POST',
          url:'/createMember',
          data:$(this).serialize()
        }).done(function(rslt){
            if(rslt.code == "success"){
              location.href = '/';
            }else{
              alert(rslt.msg);
            }
        }).fail(function(err){
            alert("has a problems with communitcation");
        })
      });
    });
  </script>
</html>

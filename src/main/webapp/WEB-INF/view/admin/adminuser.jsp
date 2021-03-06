<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Board</title>
	<jsp:include page="admintop.jsp" flush="false"/>
</head>
<body>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Account</th>
									<th class="cell100 column2">Name</th>
									<th class="cell100 column3">ID</th>									
									<th class="cell100 column3">Password</th>
									<th class="cell100 column3">&nbsp;</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach items="${users}" var="dto">
								<tr class="row100 body">
									<td class="cell100 column1">${dto.number}</td>
									<td class="cell100 column2">${dto.name}</td>
									<td class="cell100 column3">${dto.id}</td>
									<td class="cell100 column3">${dto.password}</td>						
									<td><button class="w-30 btn btn-lg" type="submit">Delete</button></td>			
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<center>
							<!-- <input type="text" class="form-control" id="searchInput" > -->
							
							<!-- <button class="w-60 btn btn-lg" type="submit">Search</button> -->
							
						</center>		
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
</body>

</html>
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
									<th class="cell100 column2">ID</th>
									<th class="cell100 column3">Name</th>
									<th class="cell100 column3">Nick Name</th>	
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<tr class="row100 body">
									<td class="cell100 column1">Here</td>
									<td class="cell100 column2">Data1</td>
									<td class="cell100 column3">Input1</td>
									<td class="cell100 column3">plz</td>
									
								</tr>
							</tbody>
						</table>
						<center>
						<button class="w-60 btn btn-lg" type="submit">Search</button>
						<button class="w-60 btn btn-lg" type="submit">Update</button>
						<button class="w-60 btn btn-lg" type="submit">Delete</button>
						</center>		
					</div>
				</div>
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">location</th>
									<th class="cell100 column2">Data</th>
									<th class="cell100 column3">Input</th>	
								</tr>
							</thead>
						</table>
					</div>
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<tr class="row100 body">
									<td class="cell100 column1">Example</td>
									<td class="cell100 column2">Data1</td>
									<td class="cell100 column3">Input1</td>
									
								</tr>
							</tbody>
						</table>
						<center>
							<button class="w-60 btn btn-lg" type="submit">Search</button>
							<button class="w-60 btn btn-lg" type="submit">Add</button>
							<button class="w-60 btn btn-lg" type="submit">Update</button>
							<button class="w-60 btn btn-lg" type="submit">Delete</button>							
						</center>		
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>List</title>
</head>
<body>
	<h2>List</h2>
	<p>List of people stored in our database:</p>
	<c:choose>
		<c:when test="${fn:length(people) > 0}">	
			<table class="box">
				<tr>
					<th></th>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Date of Birth</th>
					<th>Age</th>
					<th>Email</th>
					<th>Phone</th>
				</tr>
				<c:forEach items="${people}" var="p">
					<javatime:format value="${p.dateOfBirth}" pattern="dd-MM-yyyy" var="formattedDate"/>
					<tr>
						<td><a href="/delete/${p.id}"><img src="/img/delete.png" width="20" /></a></td>
						<td>${p.id}</td>
						<td>${p.firstName}</td>
						<td>${p.lastName}</td>
						<td>${formattedDate}</td>
						<td>${p.age}</td>
						<td>${p.email}</td>
						<td>${p.phone}</td>

					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<p>No data found.</p>
		</c:otherwise>
	</c:choose>
	<p>You can add new people <a href="/create.html">here</a>.</p>
</body>
</html>
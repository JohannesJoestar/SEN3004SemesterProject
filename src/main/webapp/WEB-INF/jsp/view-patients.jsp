<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>List of patients</title>
</head>
<body>
	<h2>List of patients</h2>
	<c:choose>
		<c:when test="${fn:length(patients) > 0}">	
			<table class="bordered" border="1">
				<tr>
                    <th>ID</th>
                    <th>TID</th>
					<th>Name</th>
					<th>Surname</th>
                    <th>Date of birth</th>
                    <th>Date of first symptom</th>
                    <th>Symptoms</th>
                    <th></th>
				</tr>
				<c:forEach items="${patients}" var="p">
                    <javatime:format value="${p.dateOfBirth}" pattern="dd.MM.yyyy" var="fDateBirth"/>
                    <javatime:format value="${p.dateOfFirstSymptom}" pattern="dd.MM.yyyy" var="fDateSymptom"/>
					<tr>
                        <td>${p.ID}</td>
                        <td>${p.TID}</td>
						<td>${p.name}</td>
						<td>${p.surname}</td>
                        <td>${fDateBirth}</td>
                        <td>${fDateSymptom}</td>
                        <td>
							<c:choose>
								<c:when test="${fn:length(p.symptoms) > 0}">
									<c:forEach items="${p.symptoms}" var="symptom" varStatus="i">
										<c:choose>
											<c:when test="${i.last}">${symptom.name}</c:when>
											<c:otherwise>${symptom.name},</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</td>
						<td>
							<a href="/patient/${p.ID}/delete/"><img src="/img/delete.png" width="20" /></a>
							<a href="/patient/${p.ID}/edit/"><img src="/img/edit.png" width="20" /></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<p>There are no patients registered.</p>
		</c:otherwise>
	</c:choose>
	<p>Register a new patient <a href="/create.html">here</a>.</p>
</body>
</html>
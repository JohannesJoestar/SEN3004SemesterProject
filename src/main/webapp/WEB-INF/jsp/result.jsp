<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>
	<h2>Registry Result</h2>
	<p><spring:message code="resultMessage" /></p>
	<table>
		<tr>
			<td><spring:message code="TIDLabel" /></td>
			<td>${patient.TID}</td>
		</tr>
		<tr>
			<td><spring:message code="nameLabel" /></td>
			<td>${patient.name}</td>
		</tr>
		<tr>
			<td><spring:message code="surnameLabel" /></td>
			<td>${patient.surname}</td>
		</tr>
		<tr>
			<td><spring:message code="dateOfBirthLabel" /></td>
			<!-- <td><javatime:format value="${patient.dateOfBirth}" pattern="dd-MM-yyyy"/></td> -->
			<td><javatime:format value="${patient.dateOfBirth}" pattern="dd.MM.yyyy"/></td>
		</tr>
		<tr>
			<td><spring:message code="dateSymptomLabel" /></td>
			<td><javatime:format value="${patient.dateOfFirstSymptom}" pattern="dd.MM.yyyy"/></td>
		</tr>		
		<tr>
			<td><spring:message code="primarySymptomLabel" /></td>
			<td>
				<c:forEach items="${patient.symptoms}" var="symptom" varStatus="ID">
				<c:choose>
					<c:when test="${ID.last}"><spring:message code="${symptom.name}"/>.</c:when>
					<c:otherwise><spring:message code="${symptom.name}"/>, </c:otherwise>
				</c:choose>
			    </c:forEach>
		    </td>			
		</tr>
	</table>
	<p><a href="form.html"><spring:message code="sendNewValues" /></a></p>
	<p><a href="form?language=tr"></span>Türkçe</a> | <a href="form?language=en">English</a></p>
</body>
</html>
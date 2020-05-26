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
			<td><javatime:format value="${patient.dateOfBirth}" pattern="dd-MM-yyyy"/></td>
		</tr>
		<tr>
			<td><spring:message code="dateSymptomLabel" /></td>
			<td><javatime:format value="${patient.dateOfFirstSymptom}" pattern="dd-MM-yyyy"/></td>
		</tr>		
		<tr>
			<td><spring:message code="primarySymptomLabel" /></td>
			<td>${patient.primarySymptom}</td>
		</tr>
	</table>
	<p><a href="form?language=tr">Türkçe</a> | <a href="form?language=en">English</a></p>
</body>
</html>
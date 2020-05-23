<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<td>Turkish ID:</td>
			<td>${sampleObject.ID}</td>
		</tr>
		<tr>
			<td>First Name:</td>
			<td>${sampleObject.Name}</td>
		</tr>
		<tr>
			<td>Surname:</td>
			<td>${sampleObject.Surname}</td>
		</tr>
		<tr>
			<td>Date of Birth:</td>
			<td><javatime:format value="${sampleObject.dateField}" pattern="dd/MM/yyyy"/></td>
		</tr>
		<tr>
			<td>Date of first symptom seen:</td>
			<td><javatime:format value="${sampleObject.dateField}" pattern="dd/MM/yyyy"/></td>
		</tr>		
		<tr>
			<td>Primary symptom:</td>
			<td>${sampleObject.dropDownMenu}</td>
		</tr>
	</table>
</body>
</html>
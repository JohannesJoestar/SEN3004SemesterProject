<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title><spring:message code="resultTitle" /></title>
</head>
<body>
	<h2><spring:message code="registryResultLabel" /></h2>
	<p><spring:message code="resultMessage" /></p>
	<table>
		<tr>
			<td><spring:message code="lblTID" />:</td>
			<td>${patient.TID}</td>
		</tr>
		<tr>
			<td><spring:message code="lblName" />:</td>
			<td>${patient.name}</td>
		</tr>
		<tr>
			<td><spring:message code="lblSurname" />:</td>
			<td>${patient.surname}</td>
		</tr>
		<tr>
			<td><spring:message code="lblDateOfBirth" />:</td>
			<td><javatime:format value="${patient.dateOfBirth}" pattern="dd.MM.yyyy"/></td>
		</tr>
		<tr>
			<td><spring:message code="lblDateSymptom" />:</td>
			<td><javatime:format value="${patient.dateOfFirstSymptom}" pattern="dd.MM.yyyy"/></td>
		</tr>		
		<tr>
			<td><spring:message code="lblSymptoms" />:</td>
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
	<p><a href="/patient/register"><spring:message code="sendNewValues" /></p>
	</body>
</html>
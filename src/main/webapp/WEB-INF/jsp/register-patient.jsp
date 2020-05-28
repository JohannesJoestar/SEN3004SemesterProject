<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>COVID-19 Patient registry</title>
</head>
<body>
	<h2>
		
		<!-- Differentiate between regsitering and editing -->
		<c:choose>
			<c:when test="${patient.name == null}">
				COVID-19 Patient registry
			</c:when>
			<c:otherwise>
				Editing patient
			</c:otherwise>
		</c:choose>
	</h2>
	<form:form method="post" action="/patient/view" modelAttribute="patient">
		<form:hidden path="ID" />
		<table>
			<tr>
				<td><spring:message code="TIDLabel" /></td>
				<td><form:input path="TID" /></td>
				<td><form:errors path="TID" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="nameLabel" /></td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="surnameLabel" /></td>
				<td><form:input path="surname" /></td>
				<td><form:errors path="surname" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="dateOfBirthLabel" /></td>
				<td><form:input path="dateOfBirth" /></td>
				<td><form:errors path="dateOfBirth" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="dateSymptomLabel" /></td>
				<td><form:input path="dateOfFirstSymptom" /></td>
				<td><form:errors path="dateOfFirstSymptom" cssClass="error" /></td>
			</tr>
			<tr>
				<td><spring:message code="symptomsLabel" /></td>
				<td>				
					<c:forEach items="${allSymptoms}" var="symptom">
						<form:checkbox path="symptoms" value="${symptom}" />
						<spring:message code="${symptom.name}"/>
						<br/>
					</c:forEach>
				</td>
				<td><form:errors path="symptoms" cssClass="error" /></td>
			</tr>
			<tr>
				<spring:message code="submitButtonLabel" var="lblSubmit" />
				<td>
					<input type="submit" value="${lblSubmit}" />
					<c:choose>
						<c:when test="${patient.name != null}">
							<a href="/patient/all">Cancel</a>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
	</form:form>	
	<p>View all registered patients <a href="/patient/all">here</a>.</p>
	<p>
		<spring:message code="linklabel" var="labelLink" /><spring:message code="linklabel2" var="labelLink2" /><a href="${labelLink2}"><img src="${labelLink}" height="22" ></a>
	</p>
</body>
</html>
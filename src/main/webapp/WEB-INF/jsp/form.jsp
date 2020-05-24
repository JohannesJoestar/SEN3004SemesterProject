<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<title>COVID-19 Patient Registry</title>
</head>
<body>
	<h2>COVID-19 Patient Registry</h2>
	<form:form method="post" action="/send" modelAttribute="patient">
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
				<td><form:input path="dateOfFirstSymptoms" /></td>
				<td><form:errors path="dateOfFirstSymptoms" cssClass="error" /></td>
			</tr>
			<tr>
			<tr>
				<td><spring:message code="primarySymptomLabel" /></td>
				<td><form:select path="primarySymptom">
						<form:option value="" label="Select symptom" />
						<form:option value="fever" label="Fever" />
						<form:option value="dry_cough" label="Dry cough" />
						<form:option value="tiredness" label="Tiredness" />
						<form:option value="diarrhoea" label="Diarrhoea" />
						<form:option value="headache" label="Headache" />
						<form:option value="difficulty_breathing" label="Difficulty breathing" />
					</form:select>
				</td>
				<td><form:errors path="primarySymptom" cssClass="error" /></td>
			</tr>
			<tr>
				<spring:message code="submitButtonLabel" var="Submit" />
				<td colspan="3"><input type="submit" value="Submit" /></td>
			</tr>
		</table>
	</form:form>
	<p><a href="form.html?language=tr">Türkçe</a> | <a href="form.html?language=en">English</a></p>
</body>
</html>
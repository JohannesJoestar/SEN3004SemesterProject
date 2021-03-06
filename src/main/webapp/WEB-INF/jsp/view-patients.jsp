<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link href="/css/style.css" rel="stylesheet" type="text/css" />
<meta charset="UTF-8">

<!-- Decide which language option to show -->
<c:set value="${pageContext.response.locale == 'tr' ? 'en' : 'tr'}" var="target_locale"/>

<title><spring:message code="listOfPatientsLabel" /></title>
</head>
<body>
	<h2><spring:message code="listOfPatientsLabel" /></h2>
	<c:choose>
		<c:when test="${fn:length(patients) > 0}">	
			<table class="bordered" border="1">
				<tr>
                    <th>ID</th>
                    <th><spring:message code="lblTID" /></th>
					<th><spring:message code="lblName" /></th>
					<th><spring:message code="lblSurname" /></th>
                    <th><spring:message code="lblDateOfBirth" /></th>
                    <th><spring:message code="lblDateSymptom" /></th>
                    <th><spring:message code="lblSymptoms" /></th>
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
											<c:when test="${i.last}"><spring:message code="${symptom.name}"/></c:when>
											<c:otherwise><spring:message code="${symptom.name}"/>,</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</td>
						<td>
							<spring:message code="deleteLabel" var="lblDelete" />
							<a title="${lblDelete}" href="/patient/${p.ID}/delete/"><img src="/img/delete.png" width="20" /></a>
							<spring:message code="editLabel" var="lblEdit" />
							<a title="${lblEdit}" href="/patient/${p.ID}/edit/"><img src="/img/edit.png" width="20" /></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<p><spring:message code="noPatientsRegistered" /></p>
		</c:otherwise>
	</c:choose>
	<p><spring:message code="newPatientLabel"/><a href="/patient/register"><spring:message code="hereLabel" /></a>.</p>
	<a href="/patient/all?language=${target_locale}">
		<img src="/img/icon_${target_locale}.png" height="22" >
	</a>
</body>
</html>
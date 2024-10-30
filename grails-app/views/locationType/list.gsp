
<%@ page import="org.pih.warehouse.core.LocationType"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="custom" />
<g:set var="entityName"
	value="${g.message(code: 'locationType.label')}" />
<title><g:message code="default.list.label"
		args="[entityName]" /></title>
<!-- Specify content to overload like global navigation links, page titles, etc. -->
<content tag="pageTitle">
<g:message code="default.list.label" args="[entityName]" /></content>
</head>
<body>
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="list">

			<div class="button-bar">
				<g:link class="button icon add" action="create" controller="locationType">
					<g:message code="default.add.label" args="[g.message(code: 'locationType.label')]" />
				</g:link>
			</div>


			<div class="box">
				<h2><g:message code="default.list.label"
									   args="[entityName]" /></h2>
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="id"
								title="${g.message(code: 'default.id.label')}" />

							<g:sortableColumn property="name"
								title="${g.message(code: 'default.name.label')}" />

							<g:sortableColumn property="locationTypeCode"
											  title="${g.message(code: 'locationType.locationTypeCode.label', default: 'Location Type Code')}" />

							<g:sortableColumn property="description"
								title="${g.message(code: 'default.description.label')}" />

							<g:sortableColumn property="sortOrder"
								title="${g.message(code: 'default.sortOrder.label')}" />

							<g:sortableColumn property="dateCreated"
								title="${g.message(code: 'default.dateCreated.label')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${locationTypeInstanceList}" status="i"
							var="locationTypeInstance">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

								<td>
									<g:link action="edit" id="${locationTypeInstance.id}">
										${fieldValue(bean: locationTypeInstance, field: "id")}
									</g:link>
								</td>
								<td>
									<g:link action="edit" id="${locationTypeInstance.id}">
										${fieldValue(bean: locationTypeInstance, field: "name")}
									</g:link>
								</td>
								<td>
									${fieldValue(bean: locationTypeInstance, field: "locationTypeCode")}
								</td>
								<td>
									${fieldValue(bean: locationTypeInstance, field: "description")}
								</td>
								<td>
									${fieldValue(bean: locationTypeInstance, field: "sortOrder")}
								</td>
								<td>
								<%
								    def dateFormat = new SimpleDateFormat('yyyy-MM-dd')
								    def formattedDate = dateFormat.format(locationTypeInstance.dateCreated)
								%>
								${formattedDate}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
		<g:if test="${locationTypeInstanceTotal > 10}">
		<div class="paginateButtons">
			<g:paginate total="${locationTypeInstanceTotal}" />
		</div>
        </g:if>
	</div>
</body>
</html>

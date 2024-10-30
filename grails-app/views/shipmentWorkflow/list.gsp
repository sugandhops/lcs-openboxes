
<%@ page import="org.pih.warehouse.shipping.ShipmentWorkflow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'shipmentWorkflow.label', default: 'Shipment Workflow')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->

    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            
				<div class="button-bar">
                    <g:link class="button" action="create"><g:message code="default.list.label" args="['Shipment Workflow']"/></g:link>
                    <g:link class="button" action="create"><g:message code="default.add.label" args="['Shipment Workflow']"/></g:link>
            	</div>

                <div class="box">
                    <h2><g:message code="default.list.label" args="[entityName]" /></h2>
                    <table>
                        <thead>
                        <tr>

                            <g:sortableColumn property="name" title="${g.message(code: 'shipmentWorkflow.name.label', default: 'Name')}" />

                            <th><g:message code="shipmentWorkflow.shipmentType.label" default="Shipment Type" /></th>

                            <g:sortableColumn property="excludedFields" title="${g.message(code: 'shipmentWorkflow.excludedFields.label', default: 'Excluded Fields')}" />

                            <g:sortableColumn property="documentTemplate" title="${g.message(code: 'shipmentWorkflow.documentTemplate.label', default: 'Document Template')}" />

                            <g:sortableColumn property="dateCreated" title="${g.message(code: 'shipmentWorkflow.dateCreated.label', default: 'Date Created')}" />

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${shipmentWorkflowInstanceList}" status="i" var="shipmentWorkflowInstance">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                                <td><g:link action="edit" id="${shipmentWorkflowInstance.id}">${fieldValue(bean: shipmentWorkflowInstance, field: "name")}</g:link></td>

                                <td>${fieldValue(bean: shipmentWorkflowInstance, field: "shipmentType")}</td>

                                <td>${fieldValue(bean: shipmentWorkflowInstance, field: "excludedFields")}</td>

                                <td>${fieldValue(bean: shipmentWorkflowInstance, field: "documentTemplate")}</td>

                                <td><format:date obj="${shipmentWorkflowInstance.dateCreated}" /></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>


            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentWorkflowInstanceTotal}" />
            </div>
        </div>
    </body>
</html>

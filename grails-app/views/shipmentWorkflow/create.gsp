<%@ page import="org.pih.warehouse.shipping.ShipmentWorkflow" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'shipmentWorkflow.label', default: 'ShipmentWorkflow')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${shipmentWorkflowInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${shipmentWorkflowInstance}" as="list" />
	            </div>
            </g:hasErrors>

            <div class="button-bar">
                <g:link class="button" action="create"><g:message code="default.list.label" args="['Shipment Workflow']"/></g:link>
                <g:link class="button" action="create"><g:message code="default.add.label" args="['Shipment Workflow']"/></g:link>
            </div>

            <form method="post" action="${createLink(controller: 'shipmentWorkflow', action: 'save')}">
                <div class="box">
                    <h2><g:message code="default.create.label" args="[entityName]" /></h2>
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="shipmentWorkflow.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentWorkflowInstance, field: 'name', 'errors')}">
                                    <g:textField class="text" name="name" value="${shipmentWorkflowInstance?.name}" size="100"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shipmentType.id"><g:message code="shipmentWorkflow.shipmentType.label" default="Shipment Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentWorkflowInstance, field: 'shipmentType', 'errors')}">
                                    <g:select class="chzn-select-deselect" name="shipmentType.id" from="${org.pih.warehouse.shipping.ShipmentType.list()}" optionKey="id" value="${shipmentWorkflowInstance?.shipmentType?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="excludedFields"><g:message code="shipmentWorkflow.excludedFields.label" default="Excluded Fields" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentWorkflowInstance, field: 'excludedFields', 'errors')}">
                                    <g:textField class="text" name="excludedFields" value="${shipmentWorkflowInstance?.excludedFields}" size="100"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="documentTemplate"><g:message code="shipmentWorkflow.documentTemplate.label" default="Document Template" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentWorkflowInstance, field: 'documentTemplate', 'errors')}">
                                    <g:textField class="text" name="documentTemplate" value="${shipmentWorkflowInstance?.documentTemplate}" size="100"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="shipmentWorkflow.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentWorkflowInstance, field: 'dateCreated', 'errors')}">
                                    <%--<g:datePicker name="dateCreated" precision="minute" value="${shipmentWorkflowInstance?.dateCreated}" noSelection="['': '']" />--%>
                                    <input type="datetime-local" id="dateCreated" name="dateCreated" value="${shipmentWorkflowInstance?.dateCreated}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated"><g:message code="shipmentWorkflow.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: shipmentWorkflowInstance, field: 'lastUpdated', 'errors')}">
                                    <%--<g:datePicker name="lastUpdated" precision="minute" value="${shipmentWorkflowInstance?.lastUpdated}" noSelection="['': '']" />--%>
                                    <input type="datetime-local" id="lastUpdated" name="lastUpdated" value="${shipmentWorkflowInstance?.lastUpdated}"/>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td></td>
                                <td valign="top">
                                   <g:submitButton name="create" class="button" value="${g.message(code: 'default.button.create.label', default: 'Create')}" />

                                   <g:link action="list">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </form>
        </div>
    </body>
</html>

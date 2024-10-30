
<%@ page import="org.pih.warehouse.core.Person" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.add.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.add.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${personInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${personInstance}" as="list" />
	            </div>
            </g:hasErrors>

			<div class="buttonBar">
            	<span class="linkButton">
            		<g:link class="list" action="list"><g:message code="default.list.label" args="[g.message(code:'persons.label').toLowerCase()]"/></g:link>
            	</span>
            	<span class="linkButton">
            		<g:link class="new" action="create"><g:message code="default.add.label" args="[g.message(code:'person.label').toLowerCase()]"/></g:link>
            	</span>
           	</div>


            <g:form action="save" method="post" >
            	<fieldset>
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="active"><g:message code="user.active.label" default="Active" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'active', 'errors')}">
										<g:checkBox name="active" value="${personInstance?.active}" />
	                                </td>
	                            </tr>
								<tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="firstName"><g:message code="person.firstName.label" default="First Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'firstName', 'errors')}">
	                                    <g:textField name="firstName" value="${personInstance?.firstName}" />
	                                </td>
	                            </tr>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="lastName"><g:message code="person.lastName.label" default="Last Name" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'lastName', 'errors')}">
	                                    <g:textField name="lastName" value="${personInstance?.lastName}" />
	                                </td>
	                            </tr>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="email"><g:message code="person.email.label" default="Email" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'email', 'errors')}">
	                                    <g:textField name="email" value="${personInstance?.email}" />
	                                </td>
	                            </tr>

	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="phoneNumber"><g:message code="person.phoneNumber.label" default="Phone Number" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phoneNumber', 'errors')}">
	                                    <g:textField name="phoneNumber" value="${personInstance?.phoneNumber}" />
	                                </td>
	                            </tr>


		                        <tr class="prop">
		                        	<td valign="top" class="name"></td>
		                        	<td valign="top" clsas="value left">
						                <div class="left">
						                   <g:submitButton name="create" class="save" value="${g.message(code: 'default.button.create.label', default: 'Create')}" />
						                   &nbsp;
						                   <g:link action="list">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>

						                </div>
		                        	</td>
		                        </tr>

	                        </tbody>
	                    </table>
	                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
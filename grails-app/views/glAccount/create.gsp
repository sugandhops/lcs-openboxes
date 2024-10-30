
<%@ page import="org.pih.warehouse.core.GlAccount" %>
<%@ page import="org.pih.warehouse.core.RoleType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'glAccount.label', default: 'GL Account')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<style>
			.chosen-container > a, .chosen-drop {
				max-width: 500px;
			}
		</style>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${glAccount}">
	            <div class="errors">
	                <g:renderErrors bean="${glAccount}" as="list" />
	            </div>
            </g:hasErrors>

			<div class="button-bar">
				<g:link class="button" action="list">
                	<img src="${resource(dir: 'images/icons/silk', file: 'table.png')}" />&nbsp;
					<g:message code="default.list.label" args="['GL Account']"/>
				</g:link>
				<g:link class="button" action="create">
                	<img src="${resource(dir: 'images/icons/silk', file: 'add.png')}" />&nbsp;
					<g:message code="default.add.label" args="['GL Account']"/>
				</g:link>
			</div>

			<g:form action="save" method="post" >
				<div class="box">
					<h2><g:message code="default.create.label" args="[entityName]" /></h2>
					<table>
						<tbody>
						
							<tr class="prop">
								<td valign="middle" class="name">
									<label for="code"><g:message code="glAccount.code.label" default="Code" /></label>
								</td>
								<td valign="middle" class="value ${hasErrors(bean: glAccount, field: 'code', 'errors')}">
									<g:textField class="text" size="80" name="code" value="${glAccount?.code}" />
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="middle" class="name">
									<label for="name"><g:message code="glAccount.name.label" default="Name" /></label>
								</td>
								<td valign="middle" class="value">
									<g:textField class="text" size="80" name="name" value="${glAccount?.name}" />
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="middle" class="name">
									<label for="description"><g:message code="glAccount.description.label" default="Description" /></label>
								</td>
								<td valign="middle" class="value">
									<g:textField class="text" size="80" name="description" value="${glAccount?.description}" />
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="middle" class="name">
									<label for="glAccountType.id"><g:message code="glAccount.glAccountType.label" default="GL Account Type" /></label>
								</td>
								<td valign="middle" class="value">
									<g:selectGlAccountType name="glAccountType.id"
														  id="glAccountType.id"
														  noSelection="['':'']"
														  class="chzn-select-deselect" />
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="middle"></td>
								<td valign="middle">
									<div class="buttons left">
									   <g:submitButton name="create" class="button" value="${g.message(code: 'default.button.create.label', default: 'Create')}" />
									   <g:link action="list">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
            </g:form>
        </div>
    </body>
</html>
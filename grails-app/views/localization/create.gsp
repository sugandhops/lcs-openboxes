
<%@ page import="org.pih.warehouse.core.Localization" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'localization.label', default: 'Localization')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.create.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body"> 
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${localizationInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${localizationInstance}" as="list" />
	            </div>
            </g:hasErrors>
            <%--<g:form action="save" method="post" >--%>
            <form action="${createLink(controller: 'localization', action: 'save')}" method="post">
            	<fieldset>
	                <div class="dialog">
						<div class="box">
							<h2><g:message code="default.create.label" args="[g.message(code: 'localization.label')]"/></h2>
							<table>
								<tbody>

									<tr class="prop">
										<td valign="top" class="name">
											<label for="code"><g:message code="localization.code.label" default="Code" /></label>
										</td>
										<td valign="top" class="value ${hasErrors(bean: localizationInstance, field: 'code', 'errors')}">
											<g:textField name="code" value="${localizationInstance?.code}" class="text medium" size="80"/>
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name">
											<label for="locale"><g:message code="localization.locale.label" default="Locale" /></label>
										</td>
										<td valign="top" class="value ${hasErrors(bean: localizationInstance, field: 'locale', 'errors')}">
                                            <g:selectLocale name="locale" value="${localizationInstance?.locale}" class="chzn-select-deselect"/>
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name">
											<label for="text"><g:message code="localization.text.label" default="Text" /></label>
										</td>
										<td valign="top" class="value ${hasErrors(bean: localizationInstance, field: 'text', 'errors')}">
											<g:textField name="text" value="${localizationInstance?.text}" class="text medium" size="80"/>
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name">
											<label for="dateCreated"><g:message code="localization.dateCreated.label" default="Date Created" /></label>
										</td>
										<td valign="top" class="value ${hasErrors(bean: localizationInstance, field: 'dateCreated', 'errors')}">
											<%--<g:datePicker name="dateCreated" precision="minute" value="${localizationInstance?.dateCreated}"  />--%>
											<input type="datetime-local" name="dateCreated" value="${localizationInstance?.dateCreated?.format('yyyy-MM-dd\'T\'HH:mm')}" />
										</td>
									</tr>

									<tr class="prop">
										<td valign="top" class="name">
											<label for="lastUpdated"><g:message code="localization.lastUpdated.label" default="Last Updated" /></label>
										</td>
										<td valign="top" class="value ${hasErrors(bean: localizationInstance, field: 'lastUpdated', 'errors')}">
											<%--<g:datePicker name="lastUpdated" precision="minute" value="${localizationInstance?.lastUpdated}"  />--%>
											<input type="datetime-local" name="lastUpdated" value="${localizationInstance?.lastUpdated?.format('yyyy-MM-dd\'T\'HH:mm')}" />
										</td>
									</tr>



								</tbody>
								<tfoot>
								<tr class="prop">
									<td valign="top"></td>
									<td valign="top">
										<g:submitButton name="create" class="button" value="${g.message(code: 'default.button.create.label', default: 'Create')}" />

										<g:link action="list" class="button">${g.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
									</td>
								</tr>

								</tfoot>
							</table>
						</div>
					</div>
                </fieldset>
                </form>
            <%--</g:form>--%>
        </div>
    </body>
</html>

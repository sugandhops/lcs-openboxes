
<%@ page import="org.pih.warehouse.core.User" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="custom" />
	<title><g:message code="users.label" /></title>
</head>
<body>
    <div class="body">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>


        <div class="dialog">

            <g:render template="summary" />

            <div class="yui-gf">
                <div class="yui-u first">
                    <div class="dialog box">
                        <h2><g:message code="default.filters.label"/>
                         
                        </h2>
                        <g:form action="list" method="get">
                            <ul class="filter-list">
                                <li class="filter-list-item">
                                    <p>
                                        <label><g:message code="user.search.label"/>
                                        
                                        </label>
                                    </p>
                                    <g:textField name="q" value="${params.q }" class="text large" />
                                </li>
                                <li class="filter-list-item">
                                    <p>
                                        <label>${g.message(code:'default.status.label', default: "Status")}
                                        
                                        </label>
                                    </p>
                                    <g:select name="status" from="['':'All users', 'true':'Active users only', 'false':'Inactive users only']"
                                            value="${params.status}"
                                              class="chzn-select-deselect"
                                              optionKey="key" optionValue="value"/>

                                </li>
                                <li>
                                    <hr/>
                                </li>
                                <li class="filter-list-item right">
                                    <button type="submit" class="button icon search">${g.message(code: 'default.button.find.label')}
                                     
                                    </button>
                                </li>
                            </ul>
                        </g:form>
                    </div>


                </div>
                <div class="yui-u">

                    <div class="list box dialog">
                        <h2><g:message code="users.label"/> (${userInstanceTotal} results)
                         
                        </h2>
                        <table>
                            <thead>
                                <tr>
                                    <g:sortableColumn property="active" title="active" />
                                    <g:sortableColumn property="username" title="username" />
                                    <g:sortableColumn property="lastName" title="name" />
                                    <g:sortableColumn property="email" title="email" />
                                    <g:sortableColumn property="locale" title="locale" />
                                    <g:sortableColumn property="role" title="roles" />
                                    <g:sortableColumn property="lastLoginDate" title="lastLoginDate" />
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="${userInstanceList}" status="i" var="userInstance">
                                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                    <td>
                                        <g:if test="${userInstance?.active }">
                                            <span class="active"><g:message code="default.yes.label"/>
                                            
                                            </span></g:if>
                                        <g:else><span class="inactive"><g:message code="default.no.label"/>
                                        
                                        </span></g:else>
                                    </td>
                                    <td>
                                        <g:link action="edit" id="${userInstance.id}">
                                            <g:if test="${grailsApplication.config.openboxes.anonymize.enabled}">
                                                ${util.StringUtil.mask(userInstance?.username)}
                                            </g:if>
                                            <g:else>
                                                ${fieldValue(bean: userInstance, field: "username")}
                                            </g:else>
                                        </g:link>
                                    </td>
                                    <td>${fieldValue(bean: userInstance, field: "name")}</td>
                                    <td>
                                        <g:if test="${grailsApplication.config.openboxes.anonymize.enabled}">
                                            ${util.StringUtil.mask(userInstance?.email)}
                                        </g:if>
                                        <g:else>
                                            ${fieldValue(bean: userInstance, field: "email")}
                                        </g:else>
                                    </td>
                                    <td>${fieldValue(bean: userInstance, field: "locale.displayName")}</td>
                                    <td>${fieldValue(bean: userInstance, field: "roles")}</td>
                                    <td>
                                        ${userInstance.lastLoginDate}
                                    </td>
                                </tr>
                            </g:each>
                            <g:unless test="${userInstanceList}">
                                <tr>
                                    <td colspan="7">
                                        <p class="empty center">
                                            <g:message code="users.empty.label" default="No users returned"/>
                                        </p>
                                    </td>
                                </tr>
                            </g:unless>
                            </tbody>
                        </table>
                    </div>
                    <div class="paginateButtons">
                        <g:paginate total="${userInstanceTotal}" params="${filterParams}"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </body>
</html>

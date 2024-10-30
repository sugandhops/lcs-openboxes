
<%@ page import="org.pih.warehouse.core.GlAccountType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="custom" />
    <g:set var="entityName" value="${g.message(code: 'glAccountTypes.label', default: 'GL Account Types')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <style>
        .paginateButtons {
            border: 0;
            border-top: 2px solid lightgrey;
        }
    </style>
</head>
<body>
    <div class="body">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">

            <div class="button-bar">
                <g:link class="button" action="list">
                    <img src="${resource(dir: 'images/icons/silk', file: 'table.png')}" />&nbsp;
                    <g:message code="default.list.label" args="[entityName]"/>
                </g:link>
                <g:isUserAdmin>
                    <g:link class="button" action="create">
                        <img src="${resource(dir: 'images/icons/silk', file: 'add.png')}" />&nbsp;
                        <g:message code="default.add.label" args="[entityName]"/>
                    </g:link>
                </g:isUserAdmin>
            </div>

            <div class="box">
                <h2><g:message code="default.list.label" args="[entityName]" /></h2>
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${g.message(code: 'glAccountType.id.label', default: 'Id')}" />

                            <g:sortableColumn property="code" title="${g.message(code: 'glAccountType.code.label', default: 'Code')}" />

                            <g:sortableColumn property="name" title="${g.message(code: 'glAccountType.name.label', default: 'Name')}" />

                            <g:sortableColumn property="glAccountTypeCode" title="${g.message(code: 'glAccountType.glAccountTypeCode.label', default: 'GL Account Type Code')}" />

                            <g:sortableColumn property="dateCreated" title="${g.message(code: 'glAccountType.dateCreated.label', default: 'Date Created')}" />

                            <g:sortableColumn property="lastUpdated" title="${g.message(code: 'glAccountType.lastUpdated.label', default: 'Date Updated')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${glAccountTypes}" status="i" var="glAccountType">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="edit" id="${glAccountType.id}">${fieldValue(bean: glAccountType, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: glAccountType, field: "code")}</td>

                            <td>${fieldValue(bean: glAccountType, field: "name")}</td>

                            <td>${fieldValue(bean: glAccountType, field: "glAccountTypeCode")}</td>

                            <td><format:date obj="${glAccountType.dateCreated}" />${glAccountType.dateCreated}</td>

                            <td><format:date obj="${glAccountType.lastUpdated}" />${glAccountType.lastUpdated}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="paginateButtons">
                    <g:paginate total="${glAccountTypesTotal}" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>

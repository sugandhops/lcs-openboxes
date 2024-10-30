<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="custom" />
    <g:set var="entityName" value="${g.message(code: 'unitOfMeasureConversions.label', default: 'Uom Conversions')}" />
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

                            <g:sortableColumn property="id" title="${g.message(code: 'default.id.label', default: 'Id')}" />

                            <g:sortableColumn property="active" title="${g.message(code: 'default.active.label', default: 'active')}" />

                            <g:sortableColumn property="fromUnitOfMeasure" title="${g.message(code: 'unitOfMeasureConversion.fromUnitOfMeasure.label', default: 'fromUnitOfMeasure')}" />

                            <g:sortableColumn property="toUnitOfMeasure" title="${g.message(code: 'unitOfMeasureConversion.toUnitOfMeasure.label', default: 'toUnitOfMeasure')}" />

                            <g:sortableColumn property="conversionRate" title="${g.message(code: 'unitOfMeasureConversion.conversionRate.label', default: 'conversionRate')}" />

                            <g:sortableColumn property="dateCreated" title="${g.message(code: 'default.dateCreated.label', default: 'dateCreated')}" />

                            <g:sortableColumn property="lastUpdated" title="${g.message(code: 'default.lastUpdated.label', default: 'lastUpdated')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${unitOfMeasureConversions}" status="i" var="unitOfMeasureConversion">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:link action="edit" id="${unitOfMeasureConversion.id}">${fieldValue(bean: unitOfMeasureConversion, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: unitOfMeasureConversion, field: "active")}</td>

                            <td>${fieldValue(bean: unitOfMeasureConversion, field: "fromUnitOfMeasure")}</td>

                            <td>${fieldValue(bean: unitOfMeasureConversion, field: "toUnitOfMeasure")}</td>

                            <td>${unitOfMeasureConversion.conversionRate?.stripTrailingZeros()}</td>

                            <td><format:date obj="${unitOfMeasureConversion.dateCreated}" /></td>

                            <td><format:date obj="${unitOfMeasureConversion.lastUpdated}" /></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                <div class="paginateButtons">
                    <g:paginate total="${unitOfMeasureConversionsTotal}" />
                </div>
            </div>
        </div>
    </div>
</body>
</html>

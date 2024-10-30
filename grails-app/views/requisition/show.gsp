<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'requisition.label', default: 'Requisition').toLowerCase()}" />
        <title><g:message code="default.view.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">

                <g:render template="summary" model="[requisition:requisition]"/>

                <div class="yui-gf">
                    <div class="yui-u first">
                        <g:render template="header" model="[requisition:requisition]"/>
                    </div>
                    <div class="yui-u">
                        <div id="tabs-details">
                            <div class="box">
                                <h2><g:message code="requisition.show.label"/></h2>
                                <table>
                                    <thead>
                                        <tr class="odd">
                                            <th></th>
                                            <th></th>
                                            <th><g:message code="requisition.status.label"/></th>
                                            <th><g:message code="product.label" /></th>
                                            <th class="center"><g:message code="product.uom.label" /></th>
                                            <th class="center"><g:message code="requisitionItem.quantityRequested.label" default="Requested" /></th>
                                            <th class="center"><g:message code="requisitionItem.quantityApproved.label" /></th>
                                            <th class="center"><g:message code="requisitionItem.quantityPicked.label" default="Picked"/></th>
                                            <th class="center"><g:message code="requisitionItem.quantityRemaining.label" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:if test="${requisition?.requisitionItems?.size() == 0}">
                                            <tr class="prop odd">
                                                <td colspan="9">
                                                    <div class="empty center fade"><g:message
                                                        code="requisition.noRequisitionItems.message" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </g:if>
                                        <g:each var="requisitionItem" in="${requisition?.originalRequisitionItems.sort()}" status="i">
                                            <g:render template="showRequisitionItem" model="[i:i,requisitionItem:requisitionItem]"/>
                                        </g:each>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="9">
                                                <div class="buttons center">
                                                    <g:link controller="requisition" action="list" class="button icon arrowleft">
                                                        <g:message code="default.button.back.label"/>
                                                    </g:link>

                                                    <g:link controller="requisition" action="edit" id="${requisition.id }" class="button icon arrowright">
                                                        <g:message code="default.button.next.label"/>
                                                    </g:link>
                                                </div>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>

    </body>
</html>

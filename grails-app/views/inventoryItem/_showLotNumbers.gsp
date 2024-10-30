<%@ page import="org.pih.warehouse.inventory.LotStatusCode" %>
<%@ taglib prefix="form" uri="http://www.w3.org/1999/xhtml" %>

<style>
	.recalled { background-color: #ffcccb; }
</style>
<div id="showLotNumbers" class="box">
	<h2><g:message code="inventory.showLotNumbers.label"/></h2>
<g:form controller="inventoryItem" action="create">
	<table>
		<thead>
			<tr class="odd">
				<th class="center" style=""><g:message code="default.actions.label"/></th>
				<th><g:message code="default.lotSerialNo.label"/></th>
				<th><g:message code="default.expires.label"/></th>
			</tr>
		</thead>
		<tbody>
			<g:if test="${!commandInstance?.product?.inventoryItems}">
				<tr class="even" style="min-height: 100px;">
					<td colspan="3" style="text-align: center; vertical-align: middle">
                   <g:message code="inventory.noItemsCurrentlyInStock.message" 						   args=""/>
					</td>
				</tr>
			</g:if>
			<g:set var="count" value="${0 }"/>
			<%-- FIXME The g:isSuperuser tag becomes expensive when executed within a for loop, so we should find a better way to implement it without this hack --%>
			<g:set var="isSuperuser" value="${false}"/>
			<g:isSuperuser>
				<g:set var="isSuperuser" value="${true}"/>
			</g:isSuperuser>
			<g:each var="inventoryItem" in="${commandInstance?.product?.inventoryItems.sort { it.dateCreated }}" status="status">
				<tr class="prop ${inventoryItem?.lotStatus == LotStatusCode.RECALLED ? 'recalled' : ''}">
					<td class="middle center" nowrap="nowrap">
						<div class="action-menu">
							<button class="action-btn" type="button">
								<img src="${resource(dir: 'images/icons/silk', file: 'bullet_arrow_down.png')}" style="vertical-align: middle;"/>
							</button>
							<div class="actions left">
								<div class="action-menu-item">
									<g:link class="btn-show-dialog"
									   data-title="${g.message(code:'inventory.editItem.label')}"
									   data-url="${request.contextPath}/inventoryItem/showDialog?id=${inventoryItem?.id}&template=editItemDialog">
										<img src="${resource(dir: 'images/icons/silk', file: 'pencil.png')}"/>&nbsp;
										<g:message code="default.edit.label" args="[g.message(code:'inventoryItem.label')]"/>
									</g:link>
								</div>
								<g:isSuperuser>
									<div class="action-menu-item">
										<g:link controller="inventoryItem" action="delete" id="${inventoryItem?.id}" data-disabled="${!isSuperuser}">
											<img src="${resource(dir: 'images/icons/silk', file: 'delete.png')}"/>&nbsp;
											<g:message code="default.delete.label" args="[g.message(code:'inventoryItem.label')]"/>
										</g:link>
									</div>
									<g:if test="${inventoryItem?.lotNumber}">
										<g:if test="${inventoryItem?.lotStatus == LotStatusCode.RECALLED}">
											<div class="action-menu-item">
												<g:link controller="inventoryItem" action="revertRecall" id="${inventoryItem?.id}" data-disabled="${!isSuperuser}">
													<img src="${resource(dir: 'images/icons/silk', file: 'arrow_rotate_anticlockwise.png')}"/>&nbsp;
													<g:message code="inventoryItem.revertRecall.label"/>
												</g:link>
											</div>
										</g:if>
										<g:else>
											<div class="action-menu-item">
												<g:link controller="inventoryItem" action="recall" id="${inventoryItem?.id}" data-disabled="${!isSuperuser}">
													<img src="${resource(dir: 'images/icons/silk', file: 'arrow_undo.png')}"/>&nbsp;
													<g:message code="inventoryItem.recall.label"/>
												</g:link>
											</div>
										</g:else>
									</g:if>
								</g:isSuperuser>
							</div>
						</div>
					</td>
					<td class="middle">
					   ${inventoryItem?.lotNumber?:g.message(code:'default.label')}
					</td>
					<td class="middle">
						<g:if test="${inventoryItem?.expirationDate}">
							<format:expirationDate obj="${inventoryItem?.expirationDate}"/>
							
							${inventoryItem?.expirationDate}
						</g:if>
						<g:else>
							<span class="fade"><g:message code="default.never.label"/></span>
						</g:else>
						
					</td>
				</tr>

			</g:each>
				<g:isUserManager>
					<tr class="prop">
						<td class="middle center">
							<img src="${resource(dir: 'images/icons/silk', file: 'new_blue.png')}"/>

						</td>
						<td>
							<g:hiddenField name="product.id" value="${commandInstance?.product?.id }"/>
							<g:textField name="lotNumber" class="text lotNumber" placeholder="Enter lot number"/>
						</td>
						<td>
							<%--<g:set var="yearStart" value="${java.time.LocalDate.now().format(java.time.format.DateTimeFormatter.ofPattern('yyyy')) as int}"/>
							<g:set var="yearEnd" value="${2050}"/>
							<g:datePicker name="expirationDate" value="${new Date()}" precision="day"/>
							<g:datePicker name="expirationDate" value="${new Date()}" precision="day"/>--%>
							<input type="datetime-local" name="expirationDate" value="${new Date()}" />
							<button class="button icon add">
								<g:message code="default.button.save.label"/>
							</button>
						</td>
					</tr>
				</g:isUserManager>

		</tbody>
	</table>
</g:form>
</div>


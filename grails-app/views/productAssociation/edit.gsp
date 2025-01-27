<%@ page import="org.pih.warehouse.product.ProductAssociation" %>
<%@ page import="org.pih.warehouse.product.ProductAssociationTypeCode" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'productAssociation.label', default: 'ProductAssociation')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productAssociationInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${productAssociationInstance}" as="list" />
	            </div>
            </g:hasErrors>

			<div class="button-bar">
				<g:link class="button" action="list"><g:message code="default.list.label" args="['productAssociation']"/></g:link>
				<g:link class="button" action="create"><g:message code="default.add.label" args="['productAssociation']"/></g:link>
			</div>

			<g:form method="post" >
				<g:hiddenField id="productAssociationId" name="id" value="${productAssociationInstance?.id}" />
				<g:hiddenField name="version" value="${productAssociationInstance?.version}" />
				<div class="box">
					<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
					<table>
						<tbody>
						
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="code"><g:message code="productAssociation.code.label" default="Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'code', 'errors')}">
									<g:select class="chzn-select-deselect"
											  name="code"
											  from="${ProductAssociationTypeCode?.values()}"
											  value="${productAssociationInstance?.code}"
											  optionValue="${{ format.metadata(obj: it) }}"
									/>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="product"><g:message code="productAssociation.product.label" default="Product" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'product', 'errors')}">
									<g:autoSuggest id="product" name="product" valueId="${productAssociationInstance?.product?.id}"
												   valueName="${productAssociationInstance?.product?.name}"
												   jsonUrl="${request.contextPath }/json/findProductByName" styleClass="text" />
									%{--<g:select class="chzn-select-deselect" name="product.id" from="${Product.list()}" optionKey="id" value="${productAssociationInstance?.product?.id}"  />--}%
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="associatedProduct"><g:message code="productAssociation.associatedProduct.label" default="Associated Product" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'associatedProduct', 'errors')}">
									<g:autoSuggest id="associatedProduct" name="associatedProduct" valueId="${productAssociationInstance?.associatedProduct?.id}"
												   valueName="${productAssociationInstance?.associatedProduct?.name}" jsonUrl="${request.contextPath }/json/findProductByName" styleClass="text" />
									%{--<g:select class="chzn-select-deselect" name="associatedProduct.id" from="${Product.list()}" optionKey="id" value="${productAssociationInstance?.associatedProduct?.id}"  />--}%
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="quantity"><g:message code="productAssociation.quantity.label" default="Quantity" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'quantity', 'errors')}">
									<g:textField class="text" name="quantity" value="${fieldValue(bean: productAssociationInstance, field: 'quantity')}" />
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="comments"><g:message code="productAssociation.comments.label" default="Comments" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'comments', 'errors')}">
									<g:textArea class="text" name="comments" value="${productAssociationInstance?.comments}" />
								</td>
							</tr>

							<tr class="prop">
								<td class="name">
									<label><g:message code="productAssociation.mutualAssociation.label" default="Two-way Association"/></label>
								</td>
								<td class="value">
									<g:checkBox name="hasMutualAssociation" value="${productAssociationInstance?.mutualAssociation}"/>
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="dateCreated"><g:message code="productAssociation.dateCreated.label" default="Date Created" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'dateCreated', 'errors')}">
									<g:datePicker name="dateCreated" precision="minute" value="${productAssociationInstance?.dateCreated}"  />
								</td>
							</tr>
						
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="lastUpdated"><g:message code="productAssociation.lastUpdated.label" default="Last Updated" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productAssociationInstance, field: 'lastUpdated', 'errors')}">
									<g:datePicker name="lastUpdated" precision="minute" value="${productAssociationInstance?.lastUpdated}"  />
								</td>
							</tr>
						

						</tbody>
                        <tfoot>
                            <tr class="prop">
                                <td valign="top"></td>
                                <td valign="top left">
                                    <div class="buttons left">
                                        <g:actionSubmit class="button" action="update" value="${g.message(code: 'default.button.update.label', default: 'Update')}" />
										<g:if test="${productAssociationInstance?.mutualAssociation}">
											<button type="button"
													class="button"
													onclick="$('#product-association-delete-dialog')
															.data('productAssociationId', `${productAssociationInstance?.id}`)
															.dialog('open')">
												${g.message(code: 'default.button.delete.label', default: 'Delete')}
											</button>
										</g:if>
										<g:else>
											<g:actionSubmit class="button" action="delete" value="${g.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</g:else>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
					</table>
				</div>
            </g:form>
			<g:render template="/productAssociation/productAssociationDeleteDialog" />
		</div>
    </body>
</html>

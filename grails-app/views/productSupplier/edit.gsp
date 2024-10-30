
<%@ page import="org.pih.warehouse.product.ProductSupplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'productSupplier.label', default: 'ProductSupplier')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productSupplierInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${productSupplierInstance}" as="list" />
	            </div>
            </g:hasErrors>

			<div class="button-bar">
				<g:link class="button" action="list"><g:message code="default.list.label" args="['productSupplier']"/></g:link>
				<g:link class="button" action="create"><g:message code="default.add.label" args="['productSupplier']"/></g:link>
			</div>

			<g:form method="post" >
				<g:hiddenField name="id" value="${productSupplierInstance?.id}" />
				<g:hiddenField name="version" value="${productSupplierInstance?.version}" />
				<div class="box">
					<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
					<table>
						<tbody>
						<tr class="prop">
							<td class="name">
								<label id="activeLabel" for="active">
									<g:message code="productSupplier.active.label" />
								</label>
							</td>
							<td valign="top" class="value middle ${hasErrors(bean: productSupplierInstance, field: 'active', 'errors')}">
								<g:checkBox name="active" value="${productSupplierInstance?.active}" />
							</td>
						</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="product"><g:message code="productSupplier.product.label" default="Product" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'product', 'errors')}">
                                    <g:autoSuggest name="product" class="medium text"
                                                   placeholder="${g.message(code:'product.search.label', default: 'Choose product')}"
                                                   jsonUrl="${request.contextPath }/json/findProductByName"
                                                   valueId="${productSupplierInstance?.product?.id}"
                                                   valueName="${productSupplierInstance?.product?.name}"/>

								    <g:link controller="product" action="edit" id="${productSupplierInstance?.product?.id}" class="button">
                                        <g:message code="default.show.label" args="[g.message(code:'product.label')]"/>
                                    </g:link>
                                </td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="code"><g:message code="productSupplier.code.label" default="Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'code', 'errors')}">
									<g:textField class="text" size="80" name="code" value="${productSupplierInstance?.code}" />
								</td>
							</tr>
                            <tr class="prop">
                                <td class="name">
                                    <label for="name"><g:message code="default.name.label"/></label>
                                </td>
                                <td class="value ">
                                    <g:textField name="name" size="80" class="medium text" value="${productSupplierInstance?.name}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td class="name">
                                    <label for="name"><g:message code="productSupplier.productCode.label"/></label>
                                </td>
                                <td class="value ">
                                    <g:textArea name="productCode" class="medium text" value="${productSupplierInstance?.productCode}" />
                                </td>
                            </tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="ratingTypeCode"><g:message code="productSupplier.ratingTypeCode.label" default="Rating Type Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'ratingTypeCode', 'errors')}">
									<g:select class="chzn-select-deselect" name="ratingTypeCode"
                                              from="${org.pih.warehouse.core.RatingTypeCode?.values()}"
                                              value="${productSupplierInstance?.ratingTypeCode}" noSelection="['': '']" />
								</td>
							</tr>
							<tr class="prop">
								<td class="name">
									<label for="defaultPreferenceType"><g:message code="productSupplier.defaultPreferenceTypeCode.label"/></label>
								</td>
								<td class="value">
									<g:selectPreferenceType name="defaultPreferenceType"
															size="80"
															noSelection="['':'']"
															value="${defaultPreferenceType?.id}"
															class="chzn-select-deselect" />
								</td>
							</tr>
							<tr class="prop">
								<td class="name">
									<label for="preferenceType"><g:message code="preferenceType.label"/></label>
								</td>
								<td class="value">
									<g:selectPreferenceType name="preferenceType"
															size="80"
															noSelection="['':'']"
															value="${preferenceType?.id}"
															class="chzn-select-deselect" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="supplier"><g:message code="productSupplier.supplier.label" default="Supplier" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'supplier', 'errors')}">
                                    <g:selectOrganization name="supplier"
                                                          value="${productSupplierInstance?.supplier?.id}"
                                                          noSelection="['':'']"
                                                          roleTypes="[org.pih.warehouse.core.RoleType.ROLE_SUPPLIER]"
                                                          class="chzn-select-deselect"/>
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="supplierCode"><g:message code="productSupplier.supplierCode.label" default="Supplier Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'supplierCode', 'errors')}">
									<g:textField class="text" size="80" name="supplierCode" maxlength="255" value="${productSupplierInstance?.supplierCode}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="manufacturer"><g:message code="productSupplier.manufacturer.label" default="Manufacturer" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'manufacturer', 'errors')}">
                                    <g:selectOrganization name="manufacturer"
                                                          noSelection="['':'']"
                                                          roleTypes="[org.pih.warehouse.core.RoleType.ROLE_MANUFACTURER]"
                                                          value="${productSupplierInstance?.manufacturer?.id}"
                                                          class="chzn-select-deselect"/>

								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="manufacturerCode"><g:message code="productSupplier.manufacturerCode.label" default="Manufacturer Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'manufacturerCode', 'errors')}">
									<g:textField class="text" size="80" name="manufacturerCode" maxlength="255" value="${productSupplierInstance?.manufacturerCode}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
								  <label for="minOrderQuantity"><g:message code="productSupplier.minOrderQuantity.label" default="Min Order Quantity" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: productSupplierInstance, field: 'minOrderQuantity', 'errors')}">
									<g:textField class="text" name="minOrderQuantity" value="${fieldValue(bean: productSupplierInstance, field: 'minOrderQuantity')}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="price"><g:message code="productSupplier.contractPrice.label" default="Contract Price (each)" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: [productSupplierInstance?.contractPrice], field: 'price', 'errors')}">
									<g:textField name="price"
												 value="${g.formatNumber(number:productSupplierInstance?.contractPrice?.price, format:'###,###,##0.####') }"
												 class="text" size="50" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="toDate"><g:message code="productSupplier.contractValidUntil.label" default="Contract Valid Until" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: [productSupplierInstance?.contractPrice], field: 'toDate', 'errors')}">
									<g:jqueryDatePicker name="toDate" value="${productSupplierInstance?.contractPrice?.toDate}" autocomplete="off" format="MM/dd/yyyy"/>
								</td>
							</tr>
						</tbody>
					</table>


				</div>
				<div class="box">
					<h2>${g.message(code: 'attributes.label')}</h2>
					<table>
						<tbody>
							<g:render template="/attribute/renderFormList"
									  model="[fieldPrefix: 'productAttributes.',
											  entityTypeCodes: [org.pih.warehouse.core.EntityTypeCode.PRODUCT_SUPPLIER],
											  populatedAttributes:productSupplierInstance?.attributes]"/>
						</tbody>
					</table>
				</div>
				<div class="buttons">
					<g:actionSubmit class="button" action="update" value="${g.message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="button" action="delete" value="${g.message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
            </g:form>
        </div>
    </body>
</html>

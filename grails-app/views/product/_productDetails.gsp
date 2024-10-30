<%@ page import="org.pih.warehouse.product.ProductField" %>
<%@ page import="org.pih.warehouse.product.ProductType" %>
<g:set var="formAction"><g:if test="${productInstance?.id}">update</g:if><g:else>save</g:else></g:set>
<g:form name="productForm" action="${formAction}" onsubmit="return validateForm();">
    <g:hiddenField name="id" value="${productInstance?.id}" />
    <g:hiddenField name="version" value="${productInstance?.version}" />
    <!--  So we know which category to show on browse page after submit -->
    <g:hiddenField name="categoryId" value="${params?.category?.id }"/>

    <div class="box" >
        <h2>
            <g:message code="product.productDetails.label" default="Product details"/>
        </h2>
        <table>
            <tbody>
                <tr class="prop">
                    <td class="name">
                        <label id="activeLabel" for="active"><g:message
                                code="product.active.label" /></label>
                    </td>
                    <td class="value middle ${hasErrors(bean: productInstance, field: 'active', 'errors')} ${hasErrors(bean: productInstance, field: 'essential', 'errors')}">
                        <g:checkBox name="active" value="${productInstance?.active}" />
                    </td>
                </tr>
                <tr class="prop first">
                    <td class="name middle"><label id="productTypeLabel" for="productType.id"><g:message code="product.productType.label"/></label></td>
                    <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'productType', 'errors')}">
                        <g:select name="productType.id" id="productType" from="${ProductType.list() }" class="chzn-select-deselect"
                                  optionKey="id" optionValue="name" value="${productInstance?.productType?.id ?: ProductType.defaultProductType.list()?.first()?.id}"/>
                    </td>
                </tr>
                <g:if test="${!productInstance?.productType || productInstance?.productType?.isFieldDisplayed(ProductField.PRODUCT_CODE)}">
                    <tr class="prop first">
                        <td class="name middle"><label id="productCodeLabel" for="productCode"><g:message
                                code="product.productCode.label"/></label>

                        </td>
                        <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'productCode', 'errors')}">
                            <g:textField name="productCode" value="${productInstance?.productCode}" class="text large"
                                         placeholder="${g.message(code:'product.productCode.placeholder') }"/>
                        </td>
                    </tr>
                </g:if>
                <tr class="prop first">
                    <td class="name middle"><label id="nameLabel" for="name"><g:message
                        code="product.title.label" /></label></td>
                    <td valign="top"
                        class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
                        <g:autoSuggestString id="name" name="name" class="text large"
                            jsonUrl="${request.contextPath}/json/autoSuggest" value="${productInstance?.name}"
                            placeholder="Product title (e.g. Ibuprofen, 200 mg, tablet)"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name middle">
                      <label id="categoryLabel" for="category.id"><g:message code="product.primaryCategory.label" /></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'category', 'errors')}">
                        <g:selectCategory name="category.id" class="chzn-select-deselect" noSelection="['null':'']"
                                             value="${productInstance?.category?.id}" />
                   </td>
                </tr>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.PRODUCT_FAMILY)}">
                    <tr class="prop">
                        <td class="name middle">
                          <label id="productFamily" for="category.id"><g:message code="product.productFamily.label" /></label>
                        </td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'productFamily', 'errors')}">
                            <g:selectProductFamily name="productFamily.id" class="chzn-select-deselect" noSelection="['null':'']"
                                                 value="${productInstance?.productFamily?.id}" />
                       </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.GL_ACCOUNT)}">
                    <tr class="prop">
                        <td class="name middle"><label id="glAccountLabel" id="glAccountLabel" for="glAccount.id"><g:message code="product.glAccount.label"/></label></td>
                        <td class="value middle ${hasErrors(bean: productInstance, field: 'glAccount', 'errors')}">
                            <g:selectGlAccount name="glAccount.id"
                                               id="glAccount"
                                               value="${productInstance?.glAccount?.id}"
                                               noSelection="['null':'']"
                                               class="chzn-select-deselect" />
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.UNIT_OF_MEASURE)}">
                    <tr class="prop">
                        <td class="name middle"><label id="unitOfMeasureLabel" for="unitOfMeasure"><g:message
                            code="product.unitOfMeasure.label" /></label></td>
                        <td
                            class="value ${hasErrors(bean: productInstance, field: 'unitOfMeasure', 'errors')}">
                            <g:autoSuggestString id="unitOfMeasure" name="unitOfMeasure" class="text large"
                                jsonUrl="${request.contextPath}/json/autoSuggest"
                                value="${productInstance?.unitOfMeasure}" placeholder="e.g. each, tablet, tube, vial"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.PRICE_PER_UNIT)}">
                    <tr class="prop">
                        <td class="name middle"><label id="pricePerUnitLabel" for="pricePerUnit"><g:message
                                code="product.pricePerUnit.label"/>
                        <small class="fade">${grailsApplication.config.openboxes.locale.defaultCurrencyCode}</small>
                        </label></td>
                        <td class="value middle ${hasErrors(bean: productInstance, field: 'pricePerUnit', 'errors')}">
                            <g:hasRoleFinance onAccessDenied="${g.message(code:'errors.userNotGrantedPermission.message', args: [session.user.username])}">
                                <g:textField name="pricePerUnit" placeholder="Price per unit (${grailsApplication.config.openboxes.locale.defaultCurrencyCode})"
                                             value="${g.formatNumber(number:productInstance?.pricePerUnit, format:'###,###,##0.####') }"
                                             class="text large" />
                            </g:hasRoleFinance>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.DESCRIPTION)}">
                    <tr class="prop">
                        <td class="name top"><label id="descriptionLabel" for="description"><g:message
                            code="product.description.label" /></label></td>
                        <td
                            class="value ${hasErrors(bean: productInstance, field: 'description', 'errors')}">
                            <g:textArea name="description" value="${productInstance?.description}" class="medium text"
                                cols="80" rows="8"
                                placeholder="Detailed text description (optional)" />
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.TAGS)}">
                    <tr class="prop">
                        <td class="name">
                            <label id="tagsLabel"><g:message code="product.tags.label" default="Tags"></g:message></label>
                        </td>
                        <td class="value">
                            <g:textField id="tags1" class="tags" name="tagsToBeAdded" value="${productInstance?.tagsToString() }"/>
                            <script>
                                $(function() {
                                    $('#tags1').tagsInput({
                                        'autocomplete_url':'${createLink(controller: 'json', action: 'findTags')}',
                                        'width': 'auto',
                                        'height': '20px',
                                        'removeWithBackspace' : true
                                    });
                                });
                            </script>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.ABC_CLASS)}">
                    <tr class="prop">
                        <td class="name"><label id="abcClassLabel" for="abcClass"><g:message
                                code="product.abcClass.label" /></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'abcClass', 'errors')}">
                            <g:textField name="abcClass" value="${productInstance?.abcClass}" class="medium large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isAnyFieldDisplayed([ProductField.COLD_CHAIN, ProductField.CONTROLLED_SUBSTANCE, ProductField.HAZARDOUS_MATERIAL, ProductField.RECONDITIONED])}">
                    <tr class="prop">
                        <td class="name">
                            <label><g:message code="product.handlingRequirements.label" default="Handling requirements"></g:message></label>
                        </td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'coldChain', 'errors')} ${hasErrors(bean: productInstance, field: 'controlledSubstance', 'errors')} ${hasErrors(bean: productInstance, field: 'hazardousMaterial', 'errors')}">
                            <table>
                                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.COLD_CHAIN)}">
                                    <tr>
                                        <td>
                                            <g:checkBox name="coldChain" value="${productInstance?.coldChain}" />
                                            <label id="coldChainLabel" for="coldChain"><g:message
                                                code="product.coldChain.label" />
                                            </label>
                                        </td>
                                    </tr>
                                </g:if>
                                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.CONTROLLED_SUBSTANCE)}">
                                    <tr>
                                        <td>
                                            <g:checkBox name="controlledSubstance" value="${productInstance?.controlledSubstance}" />
                                            <label id="controlledSubstanceLabel" for="controlledSubstance"><g:message
                                                code="product.controlledSubstance.label" />
                                            </label>
                                        </td>
                                    </tr>
                                </g:if>
                                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.HAZARDOUS_MATERIAL)}">
                                    <tr>
                                        <td>
                                            <g:checkBox name="hazardousMaterial" value="${productInstance?.hazardousMaterial}" />
                                            <label id="hazardousMaterialLabel" for="hazardousMaterial"><g:message
                                                code="product.hazardousMaterial.label" />
                                            </label>
                                        </td>
                                    </tr>
                                </g:if>
                                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.RECONDITIONED)}">
                                    <tr>
                                        <td>
                                            <g:checkBox name="reconditioned" value="${productInstance?.reconditioned}" />
                                            <label id="reconditionedLabel" for="reconditioned"><g:message
                                                    code="product.reconditioned.label" default="Reconditioned"/>
                                            </label>
                                        </td>
                                    </tr>
                                </g:if>
                            </table>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isAnyFieldDisplayed([ProductField.LOT_AND_EXPIRY_CONTROL])}">
                    <tr class="prop">
                        <td class="name">
                            <label><g:message code="product.inventoryControl.label" default="Inventory control"></g:message></label>
                        </td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'lotAndExpiryControl', 'errors')}">
                            <table>
                                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.LOT_AND_EXPIRY_CONTROL)}">
                                    <tr>
                                        <td>
                                            <g:checkBox name="lotAndExpiryControl" value="${productInstance?.lotAndExpiryControl}" />
                                            <label id="lotAndExpiryControlLabel" for="lotAndExpiryControl"><g:message
                                                code="product.lotAndExpiryControl.label" /></label>
                                        </td>
                                    </tr>
                                </g:if>
                            </table>
                        </td>
                    </tr>
                </g:if>
            </tbody>
        </table>
    </div>
    <div class="box">
        <h2>${g.message(code: 'attributes.label')}</h2>
        <g:set var="showUnlinkedAttributes" value="${true}"/>
        <table>
            <tbody>
                <g:render template="/attribute/renderFormList"
                          model="[fieldPrefix: 'productAttributes.',
                                  populatedAttributes:productInstance?.attributes,
                                  entityTypeCodes: [org.pih.warehouse.core.EntityTypeCode.PRODUCT],
                                  showUnlinkedAttributes: true]"/>
            </tbody>
        </table>
    </div>
    <div class="box">
        <h2>
            ${g.message(code: 'default.other.label')}
            <span class="deprecated" onclick="javascript:alert('${g.message(code: "productSupplier.deprecation.message")}')">
                <g:message code="default.deprecated.label"/>
            </span>
        </h2>
        <table>
            <tbody>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.BRAND_NAME)}">
                    <tr class="prop">
                        <td class="name middle"><label id="brandNameLabel" for="brandName"><g:message
                                code="product.brandName.label" /></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'brandName', 'errors')}">
                            <g:autoSuggestString id="brandName" name="brandName" class="text large"
                                                 jsonUrl="${request.contextPath}/json/autoSuggest"
                                                 value="${productInstance?.brandName}"
                                                 placeholder="e.g. Advil, Tylenol"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.MANUFACTURER)}">
                    <tr class="prop">
                        <td class="name middle"><label id="manufacturerLabel" for="manufacturer"><g:message
                                code="product.manufacturer.label" /></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'manufacturer', 'errors')}">
                            <g:autoSuggestString id="manufacturer" name="manufacturer" class="text large"
                                                 jsonUrl="${request.contextPath}/json/autoSuggest"
                                                 value="${productInstance?.manufacturer}"
                                                 placeholder="e.g. Pfizer, Beckton Dickson"/>

                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.MANUFACTURER_CODE)}">
                    <tr class="prop">
                        <td class="name middle"><label id="manufacturerCodeLabel" for="manufacturerCode"><g:message
                                code="product.manufacturerCode.label"/></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'manufacturerCode', 'errors')}">
                            <g:textField name="manufacturerCode" value="${productInstance?.manufacturerCode}" class="text large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.MANUFACTURER_NAME)}">
                    <tr class="prop">
                        <td class="name middle"><label id="manufacturerNameLabel" for="manufacturerName"><g:message
                                code="product.manufacturerName.label"/></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'manufacturerName', 'errors')}">
                            <g:textField name="manufacturerName" value="${productInstance?.manufacturerName}" class="text large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.MODEL_NUMBER)}">
                    <tr class="prop">
                        <td class="name middle"><label id="modelNumberLabel" for="modelNumber"><g:message
                                code="product.modelNumber.label" /></label></td>
                        <td
                                class="value ${hasErrors(bean: productInstance, field: 'modelNumber', 'errors')}">
                            <g:textField name="modelNumber" value="${productInstance?.modelNumber}" class="text large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.VENDOR)}">
                    <tr class="prop">
                        <td class="name middle"><label id="vendorLabel" for="vendor"><g:message
                                code="product.vendor.label" /></label></td>
                        <td
                                class="value ${hasErrors(bean: productInstance, field: 'vendor', 'errors')}">
                            <g:autoSuggestString id="vendor" name="vendor" class="text large"
                                                 jsonUrl="${request.contextPath}/json/autoSuggest"
                                                 value="${productInstance?.vendor}"
                                                 placeholder="e.g. IDA, IMRES, McKesson"/>

                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.VENDOR_CODE)}">
                    <tr class="prop">
                        <td class="name middle"><label id="vendorCodeLabel" for="vendorCode"><g:message
                                code="product.vendorCode.label"/></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'vendorCode', 'errors')}">
                            <g:textField name="vendorCode" value="${productInstance?.vendorCode}" class="text large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.VENDOR_NAME)}">
                    <tr class="prop">
                        <td class="name middle fade"><label id="vendorNameLabel" for="vendorName"><g:message
                                code="product.vendorName.label"/></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'vendorName', 'errors')}">
                            <g:textField name="vendorName" value="${productInstance?.vendorName}" class="text large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.UPC)}">
                    <tr class="prop">
                        <td class="name middle"><label id="upcLabel" for="upc"><g:message
                                code="product.upc.label" /></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'upc', 'errors')}">
                            <g:textField name="upc" value="${productInstance?.upc}" class="text large"/>
                        </td>
                    </tr>
                </g:if>
                <g:if test="${!productInstance?.productType || productInstance.productType.isFieldDisplayed(ProductField.NDC)}">
                    <tr class="prop">
                        <td class="name middle"><label id="ndcLabel" for="ndc"><g:message
                                code="product.ndc.label" /></label></td>
                        <td class="value ${hasErrors(bean: productInstance, field: 'ndc', 'errors')}">
                            <g:textField name="ndc" value="${productInstance?.ndc}" class="text large"
                                         placeholder="e.g. 0573-0165"/>
                        </td>
                    </tr>
                </g:if>
            </tbody>
        </table>
    </div>
    <div class="buttons center">
        <button class="button icon approve">${g.message(code: 'default.button.save.label', default: 'Save')}</button>
        <g:if test="${productInstance?.id }">
            <g:link controller='inventoryItem' action='showStockCard' id='${productInstance?.id }' class="button icon remove">
                ${g.message(code: 'default.button.cancel.label', default: 'Cancel')}
            </g:link>
        </g:if>
        <g:else>
            <g:link controller="inventory" action="browse" class="button icon remove">
                ${g.message(code: 'default.button.cancel.label', default: 'Cancel')}
            </g:link>
        </g:else>
    </div>
</g:form>

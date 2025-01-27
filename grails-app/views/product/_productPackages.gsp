<div class="box">
    <h2>
        <g:message code="product.packages.label" default="Product packages"/>
    </h2>
    <table>
        <thead>
        <tr>
            <th>
                <g:message code="package.name.label"/>
            </th>
            <th>
                <g:message code="package.uom.label"/>
            </th>
            <th>
                <g:message code="package.description.label"/>
            </th>
            <th>
                <g:message code="productSupplier.label"/>
            </th>
            <th>
                <g:message code="package.gtin.label"/>
            </th>
            <th>
                <g:message code="package.price.label"/>
            </th>
            <th>

            </th>
        </tr>
        </thead>
        <tbody>
        <g:each var="pkg" in="${productInstance.packages }" status="status">
            <tr class="${status%2?'even':'odd'}">
                <td>
                    ${pkg?.name }
                </td>
                <td>
                    ${pkg?.uom?.name }
                </td>
                <td>
                    ${pkg?.uom?.code }/${pkg?.quantity }
                </td>
                <td>
                    <g:if test="${pkg.productSupplier}">
                        ${pkg?.productSupplier?.code}
                    </g:if>
                    <g:else>
                        ${g.message(code:'default.none.label') }
                    </g:else>
                </td>
                <td>
                    ${pkg?.gtin?:g.message(code:'default.none.label') }
                </td>
                <td>
                    <g:hasRoleFinance onAccessDenied="${g.message(code:'errors.blurred.message', args: ['0.00'])}">
                        <g:if test="${pkg?.productPrice != null}">
                            <g:formatNumber number="${pkg?.productPrice?.price}" />
                            ${grailsApplication.config.openboxes.locale.defaultCurrencyCode}
                        </g:if>
                    </g:hasRoleFinance>
                </td>
                <td class="right">
                    <a href="javascript:void(0);" dialog-id="editProductPackage-${pkg?.id }" class="open-dialog button">
                        <img src="${resource(dir:'images/icons/silk', file:'pencil.png')}" />
                        <g:message code="default.button.edit.label" />
                    </a>
                    <g:link controller="product" action="removePackage" id="${pkg.id }"
                            params="['product.id':productInstance.id]" class="button">
                        <img src="${resource(dir:'images/icons/silk', file:'delete.png')}" />
                        <g:message code="default.button.delete.label" />
                    </g:link>
                </td>

            </tr>
        </g:each>
        <g:unless test="${productInstance?.packages }">
            <tr>
                <td colspan="7">
                    <div class="empty center">
                        <g:message code="package.packageNotFound.message"/>
                    </div>
                </td>
            </tr>
        </g:unless>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="7">
                    <div class="right">
                        <a href="javascript:void(0);" class="open-dialog create button" dialog-id="uom-dialog">
                            <img src="${resource(dir:'images/icons/silk', file:'add.png')}" />&nbsp;
                            <g:message code="default.add.label" args="[g.message(code:'unitOfMeasure.label')]"/>
                        </a>
                        <a href="javascript:void(0);" class="open-dialog create button" dialog-id="uom-class-dialog">
                            <img src="${resource(dir:'images/icons/silk', file:'add.png')}" />
                            <g:message code="default.add.label" args="[g.message(code:'unitOfMeasureClass.label')]"/>
                        </a>
                    </div>
                    <div class="left">
                        <a href="javascript:void(0);" class="open-dialog create button"
                           dialog-id="product-package-dialog">
                            <img src="${resource(dir:'images/icons/silk', file:'add.png')}" />&nbsp;
                            <g:message code="default.create.label" args="[g.message(code:'productPackage.label')]"/>
                        </a>
                    </div>
                </td>
            </tr>
        </tfoot>
    </table>
</div>
<g:each var="packageInstance" in="${productInstance.packages }">
    <g:set var="dialogId" value="${'editProductPackage-' + packageInstance.id}"/>
    <div id="${dialogId}" class="dialog hidden" title="${packageInstance?.id?g.message(code:'package.edit.label'):g.message(code:'package.add.label') }">
        <g:render template="productPackageDialog" model="[dialogId:dialogId,productInstance:productInstance,packageInstance:packageInstance]"/>
    </div>
</g:each>
<div id="uom-class-dialog" class="dialog hidden" title="Add a unit of measure class">
    <g:render template="uomClassDialog" model="[productInstance:productInstance]"/>
</div>
<div id="uom-dialog" class="dialog hidden" title="Add a unit of measure">
    <g:render template="uomDialog" model="[productInstance:productInstance]"/>
</div>
<div id="product-package-dialog" class="dialog hidden" title="${packageInstance?.id?g.message(code:'package.edit.label'):g.message(code:'package.add.label') }">
    <%--<g:render template="productPackageDialog" model="[productInstance:productInstance,packageInstance:packageInstance]"/>--%>
</div>

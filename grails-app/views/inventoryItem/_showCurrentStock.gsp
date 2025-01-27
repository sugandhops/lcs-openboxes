<%@ page import="org.pih.warehouse.api.AvailableItemStatus; org.pih.warehouse.inventory.LotStatusCode" %>
<div class="box">
    <h2>
        <g:message code="inventory.currentStock.label" default="Current Stock"/>
        <small>${session.warehouse.name}</small>
    </h2>
    <table >
        <thead>
            <tr class="odd">
                <th class="left" style="">
                    <g:message code="default.actions.label" default="Actions"/>
                </th>
                <th>
                    <g:message code="inventoryItem.binLocation.label" default="Bin Location"/>
                </th>
                <th>
                    <g:message code="default.lotSerialNo.label" default="Lot/Serial No"/>
                </th>
                <th>
                    <g:message code="default.expires.label" default="Expires"/>
                </th>
                <th>
                    <g:message code="stockCard.qtyOnHand.label" default="On Hand"/>
                </th>
                <th>
                    <g:message code="stockCard.qtyAvailable.label" default="Available"/>
                </th>
                <th>
                </th>
            </tr>
        </thead>
        <tbody>
            <%-- FIXME The g:isSuperuser tag becomes expensive when executed within a for loop, so we should find a better way to implement it without this hack --%>
            <g:isSuperuser>
                <g:set var="isSuperuser" value="${true}"/>
            </g:isSuperuser>
            <g:each var="entry" in="${commandInstance.availableItems}" status="status">
                <g:set var="styleClass" value="${(status%2==0)?'even':'odd' } ${entry?.recalled ? 'recalled' : (entry?.onHold ? 'restricted' : '')}"/>
                <tr class="prop ${styleClass}" title="${entry?.inventoryItem?.lotStatus == LotStatusCode.RECALLED ? g.message(code: 'inventoryItem.recalledLot.label') : (entry?.onHold ?  g.message(code: 'inventoryItem.restrictedBin.label') : '')}">
                    <td class="middle" style="text-align: left; width: 10%" nowrap="nowrap">
                        <g:render template="actionsCurrentStock"
                                  model="[commandInstance:commandInstance,binLocation:entry.binLocation,itemInstance:entry.inventoryItem,itemQuantity:entry.quantityOnHand,isSuperuser:isSuperuser]" />
                    </td>
                    <td>
                        <div class="line">
                            <g:if test="${entry?.binLocation}">
                                <g:if test="${entry?.binLocation?.zone}">
                                    <span class="line-base" title="${entry?.binLocation?.zone?.name}">
                                        <g:link controller="location" action="edit" id="${entry.binLocation?.zone?.id}">${entry?.binLocation?.zone?.name}</g:link>
                                    </span>:&nbsp;
                                </g:if>
                                <span class="line-extension" title="${entry?.binLocation?.name}">
                                    <g:link controller="location" action="edit" id="${entry.binLocation?.id}">${entry?.binLocation?.name}</g:link>
                                </span>
                            </g:if>
                            <g:else>
                                <g:message code="default.label" default="Default"/>
                            </g:else>
                        </div>
                    </td>
                    <td>
                        ${entry?.inventoryItem?.lotNumber?:"Default"}
                    </td>
                    <td>
                        <g:expirationDate date="${entry?.inventoryItem?.expirationDate}"/>
                    </td>
                    <td>
                        ${g.formatNumber(number: entry?.quantityOnHand, format: '###,###,###') }
                        ${entry?.inventoryItem?.product?.unitOfMeasure}
                    </td>
                    <td>
                        ${g.formatNumber(number: entry?.quantityAvailable, format: '###,###,###') }
                        ${entry?.inventoryItem?.product?.unitOfMeasure}
                    </td>
                    <td>
                        <g:if test="${entry?.status == AvailableItemStatus.PICKED}">
                            <a href="javascript:void(0);" onclick="$('#showPendingOutboundTabLink').click();">
                                <g:message code="stockCard.enum.AvailableItemStatus.${entry?.status}"/>
                            </a>
                        </g:if>
                        <g:elseif test="${entry?.status && entry.status != AvailableItemStatus.AVAILABLE && entry.status != AvailableItemStatus.NOT_AVAILABLE}">
                            <g:message code="stockCard.enum.AvailableItemStatus.${entry?.status}"/>
                        </g:elseif>
                    </td>
                </tr>
            </g:each>
            <g:unless test="${commandInstance.availableItems}">
                <tr>
                    <td colspan="6">
                        <div class="fade empty center">
                            <%--<g:message "inventory.noItemsCurrentlyInStock.message"          args="[format.product(product:commandInstance?.product).decodeHTML()]"/>--%>
                        </div>
                    </td>
                </tr>
            </g:unless>
        </tbody>
        <tfoot>
            <tr class="odd" style="border-top: 1px solid lightgrey; border-bottom: 0px solid lightgrey">
                <td colspan="4" class="right">
                    <!-- This space intentially left blank -->
                </td>
                <td>
                    <div class="large">
                        <g:set var="styleClass" value="color: black;"/>
                        <g:if test="${commandInstance.totalQuantity < 0}">
                            <g:set var="styleClass" value="color: red;"/>
                        </g:if>
                        <span style="${styleClass }" id="totalQuantity">
                            ${g.formatNumber(number: commandInstance.totalQuantity, format: '###,###,###') }
                        </span>
                        <span class="">
                            <g:if test="${commandInstance?.product?.unitOfMeasure }">
                                <format:metadata obj="${commandInstance?.product?.unitOfMeasure}"/>
                            </g:if>
                            <g:else>
                                ${g.message(code:'default.each.label') }
                            </g:else>
                        </span>
                    </div>
                </td>
                <td>
                    <div class="large">
                        <g:set var="styleClass" value="color: black;"/>
                        <g:if test="${commandInstance.totalQuantityAvailableToPromise < 0}">
                            <g:set var="styleClass" value="color: red;"/>
                        </g:if>
                        <span style="${styleClass }" id="totalQuantityAvailableToPromise">
                            ${g.formatNumber(number: commandInstance.totalQuantityAvailableToPromise, format: '###,###,###') }
                        </span>
                        <span class="">
                            <g:if test="${commandInstance?.product?.unitOfMeasure }">
                                <format:metadata obj="${commandInstance?.product?.unitOfMeasure}"/>
                            </g:if>
                            <g:else>
                                ${g.message(code:'default.each.label') }
                            </g:else>
                        </span>
                    </div>
                </td>
                <td>
                    <!-- This space intentially left blank -->
                </td>
                <g:hasErrors bean="${flash.itemInstance}">
                    <td style="border: 0px;">
                        &nbsp;
                    </td>
                </g:hasErrors>
            </tr>
        </tfoot>
    </table>
</div>
<g:javascript>
    $(document).ready(function() {
        $(".trigger-change").live('change', function(event) {
            var url = $(this).data("url");
            var target = $(this).data("target");
            $.ajax({
                url: url,
                data: { "id":  $(this).val(), "name": "otherBinLocation.id", value: $(this).val()},
                cache: false,
                success: function(html) {
                    $(target).html(html)
                },
                error: function(error) {
                    $(target).html(error)
                }
            });
        });

    });
</g:javascript>


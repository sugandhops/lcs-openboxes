<div class="dialog">

	<g:form name="editInventoryItem" controller="inventoryItem" action="update" onsubmit="return validate();">
		<g:hiddenField name="id" value="${inventoryItem?.id}"/>
		<g:hiddenField name="inventory.id" value="${inventoryInstance?.id}"/>
		<g:hiddenField name="product.id" value="${inventoryItem?.product?.id}"/>
		<g:hiddenField name="lotAndExpiryControl" id="lotAndExpiryControl" value="${inventoryItem?.product?.lotAndExpiryControl}"/>
		<g:hiddenField name="inventoryItem.id" value="${inventoryItem?.id}"/>
		<g:hiddenField name="existsInOtherLocation" id="existsInOtherLocation" value="${existsInOtherLocation}"/>
		<g:isSuperuser>
			<g:set var="isSuperuser" value="${true}"/>
		</g:isSuperuser>

		<table>
			<tbody>
				<tr class="prop">
					<td valign="top" class="name"><label><g:message code="product.label" /></label></td>
					<td valign="top" class="value">
						<format:displayName product="${inventoryItem?.product}" showTooltip="${true}" />
					</td>
				</tr>
				<g:if test="${binLocation}">
					<tr class="prop">
						<td valign="top" class="name"><label><g:message code="location.binLocation.label" /></label></td>
						<td valign="top" class="value">
							${binLocation?.name}
						</td>
					</tr>
				</g:if>
				<g:if test="${isSuperuser}">
					<tr class="prop">
						<td valign="top" class="name"><label><g:message code="product.lotNumber.label"/></label></td>
						<td valign="top" class="value">
							<g:textField name="lotNumber" id="lotNumber" value="${inventoryItem?.lotNumber}" class="text lotNumber"/>
						</td>
					</tr>
				</g:if>
				<g:else>
					<g:hiddenField name="lotNumber" value="${inventoryItem?.lotNumber}"/>
					<tr class="prop">
						<td valign="top" class="name"><label><g:message code="product.lotNumber.label"/></label></td>
						<td valign="top" class="value">
							${inventoryItem?.lotNumber}
						</td>
					</tr>
				</g:else>
				<tr class="prop">
					<td valign="top" class="name"><label><g:message code="product.expirationDate.label"/></label></td>
					<td valign="top" class="">
						<%--<g:set var="currentYear" value="${new Date()[Calendar.YEAR]}"/>
						<g:set var="minimumDate" value="${grailsApplication.config.openboxes.expirationDate.minValue}"/>
						<g:jqueryDatePicker name="expirationDate" id="expirationDate" minDate="${minimumDate}" maxDate="${currentYear + 20}"
									  value="${inventoryItem?.expirationDate}" format="MM/dd/yyyy" autocomplete="off"/>--%>
					  <input type="datetime-local" name="expirationDate" value="${inventoryItem?.expirationDate}" />				  
					</td>
				</tr>
				<tr class="prop">
					<td valign="top" class="name"><label><g:message code="default.comments.label"/></label></td>
					<td valign="top" class="value">
						<g:textArea name="comments" value="${inventoryItem?.comments}" class="text medium" rows="5"/>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="center">
						<button type="submit" name="addItem" class="button">
							<img src="${resource(dir: 'images/icons/silk', file: 'accept.png')}"/> <g:message code="default.button.save.label"/>
						</button>
						<button class="btn-close-dialog button">
							<img src="${resource(dir: 'images/icons/silk', file: 'decline.png')}"/>
							<g:message code="default.button.close.label"/>
						</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</g:form>

</div>
<script>
	function validate() {
      if ($("#existsInOtherLocation").val() === "true") {
        if (!confirm('${g.message(code: 'inventoryItem.existsInOtherLocation.label', default: 'Inventory item exists in other location, do you want to continue?')}')) {
          return false;
        }
      }

      const lotAndExpiryControl = $("#lotAndExpiryControl").val();
      if (lotAndExpiryControl === "true") {
        const lotNumber = $("#lotNumber").val();
        const expirationDate = $("#expirationDate").val();
        if (!lotNumber || !expirationDate) {
          $.notify("Both lot number and expiry date are required for this item.");
          return false;
		}
      }
    }
</script>


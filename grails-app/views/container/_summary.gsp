<table>
	<tr>
		<td>
			<g:message code="shipment.numItems.label" />:
			<label> ${container?.shipmentItems?.size()?:0 }</label>
			
			<g:message code="default.weight.label" />:
			<label> 
			<g:if test="${container?.weight }">
				<g:formatNumber format="#,##0.00"
					number="${container?.weight }" />
				${container?.weightUnits}
			</g:if>
			<g:else>
				<g:formatNumber format="#,##0.00"
					number="${container?.totalWeightInPounds() ? container?.totalWeightInPounds() : 0.00 }" />
				<g:message code="default.lbs.label" />
			</g:else>
			</label>
			
			<g:message
					code="shipping.dimensions.label" />:
			<label> <g:if
				test="${container?.width ||  container?.length || container?.height}">
			
				${container.height == null ? '?' : container.height}
				${container?.volumeUnits}
				x
				${container.width == null ? '?' : container.width}
				${container?.volumeUnits}
				x
				${container.length == null ? '?' : container.length}
				${container?.volumeUnits}
			</g:if>
			<g:else>
				<g:message code="default.none.label" />
			</g:else>
			</label>
			
			<g:message
					code="shipping.recipient.label" />:
			<label>
			<g:if test="${container?.recipient }">
				${container?.recipient?.name }
			</g:if>
			<g:else>
				<g:message code="default.none.label" />
			</g:else>
			</label>
		</td>
		<td class="right">

		</td>
	
	</tr>

</table>


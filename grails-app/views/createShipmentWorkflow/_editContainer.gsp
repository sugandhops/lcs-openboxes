<script type="text/javascript">
	$(document).ready(function(){								
		$("#dlgEditContainer").dialog({ autoOpen: true, modal: true, width: '600px' });						
	});
</script>	   
	<div id="dlgEditContainer" title="${container ? g.message(code:'default.edit.label', args: [format.metadata(obj:container?.containerType).toLowerCase()]) : g.message(code: 'default.add.label', args: [format.metadata(obj:containerTypeToAdd).toLowerCase()])}" style="padding: 10px; display: none;" >
	

	<jqvalui:renderValidationScript for="org.pih.warehouse.shipping.Container" form="editContainer"/>
	<g:form name="editContainer" action="createShipment">
		
		<g:if test="${container}">
			<g:hiddenField name="container.id" value="${container?.id}"/>
		</g:if>
		<g:else>
			<g:hiddenField name="containerTypeToAddId" value="${containerTypeToAdd.id}"/>
		</g:else>
		
		<table>
			<tbody>
				<g:render template="containerFields" model="['container':container]"/>
				<tr>
					<td></td>
					<td>
						<div class="buttons left">
							<g:submitButton name="saveContainer" value="${g.message(code:'shipping.save.label')} ${container ? format.metadata(obj:container?.containerType).toLowerCase() : format.metadata(obj:containerTypeToAdd).toLowerCase()}"></g:submitButton>
							<g:if test="${container}">
								<g:submitButton name="deleteContainer" value="${g.message(code:'shipping.remove.label')} ${container ? format.metadata(obj:container?.containerType).toLowerCase() : format.metadata(obj:containerTypeToAdd).toLowerCase()}"  onclick="return confirm('${g.message(code:'shipping.confirm.deleteThis.message')} ${container ? format.metadata(obj:container?.containerType).toLowerCase() : format.metadata(obj:containerTypeToAdd).toLowerCase()}?')"></g:submitButton>
							</g:if>
							<button name="cancelDialog" type="reset" onclick="$('#dlgEditContainer').dialog('close');"><g:message code="default.button.cancel.label"/></button>
						</div>
						<div class="buttons left">
							<g:submitButton name="addBoxToContainer" value="${g.message(code:'shipping.addBoxToThis.label')} ${container ? format.metadata(obj:container?.containerType).toLowerCase() : format.metadata(obj:containerTypeToAdd).toLowerCase()}"></g:submitButton>
							<g:submitButton name="addItemToContainer" value="${g.message(code:'shipping.addItemToThis.label')} ${container ? format.metadata(obj:container?.containerType).toLowerCase() : format.metadata(obj:containerTypeToAdd).toLowerCase()}"></g:submitButton>
						</div>						
					</td>
				</tr>
			</tbody>
		</table>
	</g:form>																	
</div>		
		     


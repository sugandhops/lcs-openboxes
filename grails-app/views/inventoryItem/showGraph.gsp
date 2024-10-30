<g:applyLayout name="stockCard">

	<content tag="title">	
		<format:product product="${commandInstance?.product}"/>
	</content>

	<content tag="heading">	
		<g:message code="inventory.showConsumption.label"/>
	</content>

	<content tag="content">
		<div class="middle center">
			<g:render template="showGraph"/>
		</div>
		<div class="middle center" style="padding: 10px">
			<g:message code='default.notImplementedYet.message'/>								
		</div>
	</content>
</g:applyLayout>


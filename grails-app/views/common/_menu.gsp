<%@page import="org.pih.warehouse.core.ActivityCode"%>
<%@page import="org.pih.warehouse.shipping.Shipment"%>
<style>
	.submenuItem {
		padding-left:15px;
	}
</style>
<div id="leftnav-accordion-menu" class="accordion menu">
	<g:supports activityCode="${ActivityCode.MANAGE_INVENTORY}">
		<h6 class="menu-heading">
			<g:message code="inventory.label"  default="Inventory"/>
		</h6>
		<div class="menu-section">
			<ul>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="browse"><g:message code="inventory.browse.label"/></g:link>
					</span>
				</li>
				<li> 
					<span class="menuButton">
						<g:link controller="inventory" action="listExpiredStock"><g:message code="inventory.expiredStock.label"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="listExpiringStock"><g:message code="inventory.expiringStock.label"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="listLowStock"><g:message code="inventory.lowStock.label"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="showConsumption"><g:message code="inventory.consumption.label"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="listDailyTransactions"><g:message code="transaction.dailyTransactions.label"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="product" action="create"><g:message code="product.add.label"/></g:link>
					</span>
				</li>
			</ul>
		</div>
	</g:supports>

	<g:supports activitiesAny="[ActivityCode.PLACE_ORDER,ActivityCode.FULFILL_ORDER]">
		<h6 class="menu-heading" >
			<g:message code="orders.label"  default="Orders"/>
		</h6>
		<div class="menu-section">
			<ul>
				<li>
					<span class="menuButton">
						<g:link controller="order" action="list" params="[status:'PENDING']"><g:message code="order.list.label" default="List orders"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="order" action="listOrderItems"><g:message code="orderItem.list.label"  default="List order items"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="purchaseOrder" action="index"><g:message code="order.create.label" default="Add incoming order"/></g:link>
					</span>
				</li>
			</ul>
		</div>
	</g:supports>


	<g:supports activitiesAny="[ActivityCode.PLACE_REQUEST,ActivityCode.FULFILL_REQUEST]">
		<h6 class="menu-heading" >
			<g:message code="requests.label"  default="Requests"/>
		</h6>
		<div class="menu-section">
			<ul>
				<li>
					<span class="menuButton">
						<g:link controller="requisition" action="list" params="[requestType:'INCOMING']"><g:message code="request.listIncoming.label" /></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="requisition" action="list" params="[requestType:'OUTGOING']"><g:message code="request.listOutgoing.label" /></g:link>
					</span>
				</li>

				<li>
					<span class="menuButton">
						<g:link controller="createRequestWorkflow" action="index"><g:message code="request.create.label" default="Add new request"/></g:link>
					</span>
				</li>
			</ul>
		</div>
	</g:supports>

	<g:supports activityCode="${ActivityCode.SEND_STOCK}">
		<h6 class="menu-heading" >
			<g:message code="shipping.label"  default="Shipping"/>
		</h6>
		<div class="menu-section">
			<ul>
				<li>
					<span class="menuButton">
						<g:link controller="shipment" action="list" params="[status:'PENDING']"><g:message code="shipping.listOutgoing.label"  default="List outgoing shipments"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="createShipmentWorkflow" action="index"><g:message code="shipping.add.label" default="Add a shipment"/></g:link>
					</span>
				</li>
			</ul>
		</div>
	</g:supports>

	<g:supports activityCode="${ActivityCode.RECEIVE_STOCK}">
		<h6 class="menu-heading" >
			<g:message code="receiving.label"  default="Receiving"/>
		</h6>
		<div class="menu-section">
			<ul>
				<li>
					<span class="menuButton">
						<g:link controller="shipment" action="list" params="[type: 'incoming', status: 'PENDING']"><g:message code="shipping.listIncoming.label"  default="List incoming shipments"/></g:link>
					</span>
				</li>
			</ul>
		</div>
	</g:supports>

	<h6 class="menu-heading">
		<g:message code="administration.label"  default="Administration"/>
	</h6>
	<div class="menu-section">
		<g:supports activityCode="${ActivityCode.MANAGE_INVENTORY}">
			<span class="menu-subheading"><g:message code="inventory.label"/></span>
			<ul>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="listAllTransactions"><g:message code="transaction.list.label"/></g:link>
					</span>
				</li>
				<li>
					<span class="menuButton">
						<g:link controller="inventory" action="editTransaction"><g:message code="transaction.add.label"/></g:link>
					</span>
				</li>
			</ul>
		</g:supports>
		<span class="menu-subheading"><g:message code="report.label"/></span>
		<ul>
			<li>
				<span class="menuButton">
					<g:link controller="report" action="showTransactionReport"><g:message code="report.showTransactionReport.label"/></g:link>
				</span>
			</li>
		</ul>
		<span class="menu-subheading"><g:message code="products.label"/></span>
		<ul>
			<li>
				<span class="menuButton">
					<g:link controller="product" action="list"><g:message code="products.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="attribute" action="list"><g:message code="attribute.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="category" action="tree"><g:message code="category.productCategories.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="inventoryItem" action="importInventoryItems"><g:message code="inventory.import.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="product" action="batchEdit"><g:message code="default.batchEdit.label" args="[g.message(code:'products.label')]" default="Batch Edit Products" /></g:link>
				</span>
			</li>
		</ul>
		<span class="menu-subheading"><g:message code="locations.label"/></span>
		<ul>
			<li>
				<span class="menuButton">
					<g:link controller="locationGroup" action="list"><g:message code="location.sites.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="location" action="list"><g:message code="locations.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="shipper" action="list"><g:message code="location.shippers.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="locationType" action="list"><g:message code="location.locationTypes.label"/></g:link>
				</span>
			</li>
		</ul>
		<span class="menu-subheading"><g:message code="persons.label"/></span>
		<ul>
			<li>
				<span class="menuButton">
					<g:link controller="person" action="list"><g:message code="person.list.label"/></g:link>
				</span>
			</li>
			<li>
				<span class="menuButton">
					<g:link controller="user" action="list"><g:message code="users.label"/></g:link>
				</span>
			</li>
		</ul>
		<span class="menu-subheading"><g:message code="default.general.label"/></span>
		<ul>
			<li>
				<span class="menuButton">
					<g:link controller="admin" action="showSettings"><g:message code="default.manage.label" args="[g.message(code:'default.settings.label')]"/></g:link>
				</span>
			</li>
		</ul>
	</div>
</div>

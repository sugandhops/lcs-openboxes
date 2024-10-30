<span class="action-menu">
	<button class="action-btn">
		<img
			src="${resource(dir: 'images/icons/silk', file: 'bullet_arrow_down.png')}"
			style="vertical-align: middle" />
	</button>
	<div class="actions">
		<div class="action-menu-item">
			<g:link class="list" action="list">
				<img src="${resource(dir:'images/icons/silk',file:'table.png')}" class="middle"/>&nbsp;
				${g.message(code: 'user.list.label')}
			</g:link>
		</div>
		<div class="action-menu-item">
			<hr />
		</div>
		<g:if test="${params.action!='show'}">
			<div class="action-menu-item">
				<g:link class="edit" action="show" id="${userInstance?.id}">
					<img src="${resource(dir:'images/icons/silk',file:'user.png')}" class="middle"/>&nbsp;
					${g.message(code: 'default.show.label', args: [g.message(code:'user.label')])}
				</g:link>
			</div>
		</g:if>
		<g:if test="${params.action!='edit'}">
			<div class="action-menu-item">
				<g:link class="edit" action="edit" id="${userInstance?.id}">
					<img src="${resource(dir:'images/icons/silk',file:'pencil.png')}" class="middle"/>&nbsp;
					${g.message(code: 'default.edit.label', args: [g.message(code:'user.label')])}
				</g:link>
			</div>
		</g:if>
		<div class="action-menu-item">
			<g:link controller="user" action="changePhoto"
				id="${userInstance?.id }">
				<img src="${resource(dir:'images/icons/silk',file:'photo_add.png')}" class="middle"/>&nbsp;
				<g:message code="user.changePhoto.label" />
			</g:link>
		</div>
		<div class="action-menu-item">
			<g:link action="toggleActivation" id="${userInstance?.id}">
				<g:if test="${userInstance?.active}">
					<img src="${resource(dir:'images/icons/silk',file:'user_delete.png')}" class="middle"/>&nbsp;
					${g.message(code: 'user.deactivate.label')}
				</g:if>
				<g:else>
					<img src="${resource(dir:'images/icons/silk',file:'user_add.png')}" class="middle"/>&nbsp;
					${g.message(code: 'user.activate.label')}
				</g:else>
			</g:link>
		</div>
		<div class="action-menu-item">
			<g:link class="delete" action="delete" id="${userInstance?.id}"
					onclick="return confirm('${g.message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
				<img src="${resource(dir:'images/icons/silk',file:'delete.png')}" class="middle"/>&nbsp;
				${g.message(code: 'default.delete.label', args: [g.message(code:'user.label')])}
			</g:link>
		</div>
		<g:isUserInRole roles="[org.pih.warehouse.core.RoleType.ROLE_ADMIN]">
			<hr/>
			<div class="action-menu-item">
				<g:link action="sendTestEmail" id="${userInstance?.id }">
					<img src="${resource(dir:'images/icons/silk',file:'email.png')}" class="middle"/>&nbsp;
					<g:message code="user.sendTestEmail.label"/>
				</g:link>
			</div>
            <div class="action-menu-item">
                <g:link controller="auth" action="renderAccountCreatedEmail" id="${userInstance?.id}">
                    <img src="${resource(dir: 'images/icons/silk', file: 'email.png')}" class="middle"/>&nbsp;
                    <g:message code="user.accountCreated.label" default="Account created email"/></g:link>
            </div>
            <div class="action-menu-item">
                <g:link controller="auth" action="renderAccountConfirmedEmail" id="${userInstance?.id}">
                    <img src="${resource(dir: 'images/icons/silk', file: 'email.png')}" class="middle"/>&nbsp;
                    <g:message code="user.accountConfirmed.label" default="Account confirmed email"/></g:link>
            </div>
        </g:isUserInRole>
	</div>
</span>
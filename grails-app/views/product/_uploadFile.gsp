<div id="upload-form" class="box">
	<g:uploadForm controller="product" action="importAsCsv">
		<input name="location.id" type="hidden" value="${session.warehouse.id }"/>
		<input name="importType" type="hidden" value="product"/>
		<table>
			<tbody>
				<tr >
					<td colspan="2">
						<span class="title"><g:message code="product.import.label" default="Import products"/></span>
					</td>
				</tr>
				<tr class="prop">
					<td class="name">
						<label><g:message code="default.filename.label" default="Filename"/></label>
					</td>
					<td class="value">
						${command?.importFile?.originalFilename }
						<input name="importFile" type="file"/>

						<button type="submit" class="positive"><img src="${resource(dir:'images/icons/silk',file:'tick.png')}" alt="upload" />
							${g.message(code: 'default.button.upload.label', default: 'Upload')}</button>

							<a href="${createLink(controller: "product", action: "importAsCsv")}" class="negative">
								<g:message code="default.button.cancel.label"/>
							</a>

					</td>
				</tr>
			</tbody>
		</table>
	</g:uploadForm>
</div>

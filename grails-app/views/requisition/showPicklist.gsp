<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${g.message(code: 'request.picklist.label', default: 'Picklist')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.show.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
            
            	<fieldset>
            		<g:render template="summary" model="[requestInstance:requestInstance]"/>
            	
            	
	                <table>
	                    <tbody>
							<tr class="prop">
	                            <td valign="top" class="name"><label><g:message code="request.items.label" default="Items" /></label></td>
	                            <td valign="top" class="value">
									<g:if test="${requestInstance?.requisitionItems }">
										<table>
											<thead>
												<tr class="odd">
													<th><g:message code="default.type.label"/></th>
													<th><g:message code="product.label"/></th>
													<th><g:message code="request.qtyRequested.label"/></th>
													<th><g:message code="request.qtyFulfilled.label"/></th>
												</tr>
											</thead>									
											<tbody>
												<g:each var="requestItem" in="${requestInstance?.requisitionItems}" status="i">
													<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
														<td>
															<g:if test="${requestItem?.product }">
																<g:message code="product.label"/>
															</g:if>
															<g:elseif test="${requestItem?.category }">
																<g:message code="category.label"/>
															</g:elseif>							
															<g:else>
																<g:message code="default.unclassified.label"/>											
															</g:else>
														</td>
														<td>
															<format:metadata obj="${requestItem.displayName()}"/>
														</td>
														<td>
															${requestItem?.quantity}
														</td>
														<td>
															${requestItem?.quantityFulfilled()}
														</td>
													</tr>
												</g:each>
											</tbody>
										</table>
									</g:if>
									<g:else>
										<span class="fade"><g:message code="default.noItems.label"/></span>
									</g:else>
	                            </td>
	                        </tr>	                        
	                    
	                    </tbody>
	                </table>
               </fieldset>
            </div>
        </div>
    </body>
</html>

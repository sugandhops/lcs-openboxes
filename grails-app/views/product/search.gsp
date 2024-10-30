
<%@ page import="org.pih.warehouse.product.Product" %>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom"/>
        <g:set var="entityName" value="${g.message(code: 'products.label')}" />
        <title><g:message code="default.search.label" args="[entityName]" /></title>
		<!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.list.label" args="[entityName]" /></content>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <div>

				<div class="buttonBar">
	            	<span class="linkButton">
	            		<g:link class="list" action="list"><g:message code="default.list.label" args="[g.message(code:'product.label').toLowerCase()]"/></g:link>
	            	</span>
	            	<span class="linkButton">
	            		<g:link class="new" action="create"><g:message code="default.add.label" args="[g.message(code:'product.label').toLowerCase()]"/></g:link>
	            	</span>

            	</div>

	            <div class="dialog box">
					<g:form action="search" method="get">
						<label><g:message code="product.search.label"/></label>
						<g:textField name="q" size="45" value="${params.q }" class="text"/>
						<button type="submit"><img
							src="${resource(dir:'images/icons/silk',file:'zoom.png')}" style="vertical-align: middle;"
							alt="Save" /> ${g.message(code: 'default.button.find.label')}
						</button>
					</g:form>
				</div>
				<br/>

                <table>
                    <thead>
                        <tr>
                        	<th>Barcode</th>
                        	<th>Image</th>
                            <g:sortableColumn property="manufacturer" title="${g.message(code: 'product.manufacturer.label')}" />
                            <g:sortableColumn property="description" title="${g.message(code: 'default.description.label')}" />
                            <g:sortableColumn property="upc" title="${g.message(code: 'product.upc.label')}" />
                            <g:sortableColumn property="category" title="${g.message(code: 'category.label')}" />
                        </tr>
                    </thead>
                    <tbody>
	                    <g:each in="${products}" status="i" var="product">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	                        	<td class="center">
	                        		<g:if test="${product.upc }">
										<img src="${createLink(controller:'product',action:'barcode',params:[data:product.upc,width:100,height:10,format:'CODE_128']) }"/>
									</g:if>
	                        	</td>
	                        	<td class="center">
	                        		<img src="${product.productCode }" width="50" height="50"/>
	                        	</td>
								<td align="center">
									${product?.manufacturer }
								</td>
								<td>
									<b>${product.name }</b><br/>

									${product.description }
								</td>
								<td align="center">
									${product.upc }
								</td>
								<td align="center">
									<format:category category="${product?.category }"/>
								</td>
	                        </tr>
	                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>

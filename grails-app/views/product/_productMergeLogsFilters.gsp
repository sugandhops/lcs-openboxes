<div class="box">
    <h2><g:message code="default.filters.label"/></h2>
    <g:form id="listForm" action="productMergeLogs" method="GET">
        <g:hiddenField name="max" value="${params.max ?: 10}"/>
        <div class="filter-list">
            <div class="filter-list-item">
                <label>${g.message(code: 'productMerge.primaryProduct.label', default: "Primary Product")}</label>
                <g:textField class="text" id="primaryProductCode" name="primaryProductCode" value="${params.primaryProductCode}" style="width:100%" placeholder="Search by primary product code"/>
            </div>
            <div class="filter-list-item">
                <label>${g.message(code: 'productMerge.obsoleteProduct.label', default: "Obsolete Product")}</label>
                <g:textField class="text" id="obsoleteProductCode" name="obsoleteProductCode" value="${params.obsoleteProductCode}" style="width:100%" placeholder="Search by obsolete product code"/>
            </div>
            <div class="filter-list-item buttons center">
                <button type="submit" class="button icon search" name="search" value="true">
                    <g:message code="default.search.label"/>
                </button>
                <g:link controller="product" action="productMergeLogs" class="button icon reload">
                    <g:message code="default.button.cancel.label"/>
                </g:link>
            </div>
        </div>
    </g:form>
</div>

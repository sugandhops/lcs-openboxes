<g:form method="post" controller="json" action="saveLocation">
    <g:hiddenField name="id" value="${locationInstance?.id}" />
    <g:hiddenField name="version" value="${locationInstance?.version}" />
    <g:hiddenField name="active" value="${locationInstance?.active}" />
    <div class="dialog">
        <table>
            <tbody>
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="name"><g:message code="location.locationType.label" /></label>

                </td>
                <td valign="top" class="value">
                    <g:select name="locationType.id" from="${org.pih.g.core.LocationType.list()}"
                              optionKey="id" optionValue="${{format.metadata(obj:it)}}" value="${locationInstance?.locationType?.id}" noSelection="['null':'']" />
                </td>
            </tr>
            <tr class="prop">
                <td valign="top" class="name">
                    <label for="name"><g:message code="default.name.label" /></label>
                </td>
                <td valign="top" class="value ${hasErrors(bean: locationInstance, field: 'name', 'errors')}">
                    <g:textField name="name" value="${locationInstance?.name}" class="text" size="40"/>
                </td>
            </tr>
            <tr class="prop">

                <td valign="top">

                </td>
                <td class="value">
                    <div class="buttons left">
                        <button type="submit" class="button icon approve">
                            <g:message code="default.button.save.label"/>
                        </button>
                        &nbsp;
                        <a href="javascript:void(-1);" class="btn-close-dialog">
                            ${g.message(code: 'default.button.cancel.label')}
                        </a>
                    </div>
                </td>
            </tr>

            </tbody>
        </table>
    </div>
</g:form>

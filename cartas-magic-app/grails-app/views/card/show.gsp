<%@ page import="cartas.magic.app.Card" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>${cardInstance.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    	<tr>
	                    	<td rowspan="5">
	                            <img alt="${cardInstance.name}" src="${cardInstance.image}">
	                        </td>
	                        <td>
		                        <tr>
		                            <td valign="top" class="name"><g:message code="card.name.label" default="Name" /></td>
		                            <td valign="top" class="value">${cardInstance.name}</td>
		                        </tr>
		                        <tr>
		                            <td valign="top" class="name"><g:message code="card.manaCost.label" default="Mana Cost" /></td>
		                            <td valign="top" class="value">${cardInstance.manaCost}</td>
		                        </tr>
		                        <tr>
		                            <td valign="top" class="name"><g:message code="card.description.label" default="Description" /></td>
		                            <td valign="top" class="value">${cardInstance.description}</td>
		                        </tr>
		                        <tr>
		                            <td valign="top" class="name"><g:message code="card.price.label" default="Price" /></td>
		                            <td valign="top" class="value">$${cardInstance.price}</td>
		                        </tr>
		                    </td>
	                	</tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${cardInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

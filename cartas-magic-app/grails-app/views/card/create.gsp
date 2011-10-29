

<%@ page import="cartas.magic.app.Card" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cardInstance}">
            <div class="errors">
                <g:renderErrors bean="${cardInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="card.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${cardInstance?.name}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="manaCost"><g:message code="card.manaCost.label" default="Mana Cost" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardInstance, field: 'manaCost', 'errors')}">
                                    <g:textField name="manaCost" value="${fieldValue(bean: cardInstance, field: 'manaCost')}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="image"><g:message code="card.image.label" default="Image" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardInstance, field: 'image', 'errors')}">
                                    <g:textField name="image" value="${cardInstance?.image}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="card.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${cardInstance?.description}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="card.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: cardInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

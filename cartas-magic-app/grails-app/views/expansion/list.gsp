
<%@ page import="cartas.magic.app.Expansion" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'expansion.label', default: 'Expansion')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <g:each in="${expansions}" status="i" var="expansion">
                    <div class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    	<div style="float: left; clear: both; margin-right: 5px;">
                    		<img alt="${expansion.name}" src="${expansion.image}">
                    	</div>
                    	<span style="vertical-align: top;">
                    		<g:link action="show" id="${expansion.id}" style="vertical-align: top;">${expansion.name}</g:link>
                    	</span>
                    	<span style="vertical-align: top;">
                    		<img alt="" src="${expansion.symbol}">
                    	</span>
                    </div>
                </g:each>
            </div>
            <div class="paginateButtons" style="clear: both;">
                <g:paginate total="${expansions.size()}" />
            </div>
        </div>
    </body>
</html>


<%@ page import="cartas.magic.app.Card" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
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
                <g:each in="${cards}" status="i" var="card">
                    <div class="${(i % 2) == 0 ? 'odd' : 'even'}" style="height: 132px; width: 768px;">
                    	<div style="float: left; clear: both; margin-right: 5px;">
                    		<img alt="${card.name}" src="${card.image}" height="132px" width="95px">
                    	</div>
                    	<span style="vertical-align: top;">
                    		<g:link action="show" id="${card.id}" style="vertical-align: top;">${card.name}</g:link>
                    	</span>
                    	<span style="vertical-align: top;">
                    		<g:each in="${card.manaCost}">
                    			<img alt="" src="http://gatherer.wizards.com/Handlers/Image.ashx?size=small&name=${it}&type=symbol">
                    		</g:each>
                    	</span>
                    	<div style="vertical-align: top;">
                    		${card.description}
                    	</div>
                    </div>
                </g:each>
            </div>
            <div class="paginateButtons" style="clear: both;">
                <g:paginate total="${cards.size()}" />
            </div>
        </div>
    </body>
</html>

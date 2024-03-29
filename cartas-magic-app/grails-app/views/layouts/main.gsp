<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Cartas Magic" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="contents">
			<div id="mtgLogo">
	        	<g:link url="/cartas-magic-app/"><img src="${resource(dir:'images',file:'mtg_logo.png')}" alt="Home" border="0" /></g:link>
	        </div>
        	<g:layoutBody />
        </div>
        <div id="footer">
        	<g:render template="/common/footer" />
        </div>
    </body>
</html>
<html>
    <head>
        <title>Bienvenido!</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin: 0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height: 20px;
            margin: 0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height: 11px;
            margin: 0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <div id="adminPanel">
	                    <h1>Administradores</h1>
	                    <ul>
	                        <li><g:link controller="card" action="create">Crear carta</g:link></li>
	                        <li><g:link controller="expansion" action="create">Crear expansion</g:link></li>
	                    </ul>
                    </div>
                	<div id="userPanel">
	                    <h1>Usuarios</h1>
	                    <ul>
	                        <li><g:link controller="card" action="list">Listar cartas</g:link></li>
	                        <li><g:link controller="expansion" action="list">Listar expansiones</g:link></li>
	                    </ul>
	                </div>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Bienvenido</h1>
            <p>Bueno, a partir de aca tenemos que empezar a modificar toda la aplicacion para que sea algo entretenido de ver.
            Nos falta agregarle la funcionalidad ademas, pero por algo se empieza.</p>
        </div>
    </body>
</html>

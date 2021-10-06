<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FiveWare Inicio</title>
<link href="css/estilos.css" rel='stylesheet' />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	<header>
	<div class="contGeneral">
		<div class="circuloLogo"></div>
		<img class="logoGeneral" src="img/logo-5ware.png" alt="FiveWare" />
		<div class="usuarioActivo" ><p class="nombreUsuario">${usuario.getNombre_usuario()}</p></div>
		<div><a class="cerrarSesion" href="index.jsp">Cerrar Sesión</a></div>
		<nav class="nav">	
			<ul>
				<li class="boton_nav" ><a href="controlador?menu=Principal" target="fiveframe"><p class="texto_nav">Inicio</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Usuarios&accion=Listar" target="fiveframe"><p class="texto_nav">Usuarios</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Clientes&accion=Listar" target="fiveframe"><p class="texto_nav">Clientes</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Proveedores&accion=Listar" target="fiveframe"><p class="texto_nav">Proveedores</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Productos&accion=Listar" target="fiveframe"><p class="texto_nav">Productos</p></a></li>
				<li class="boton_nav" ><a href="#"><p class="texto_nav">Ventas</p></a></li>
				<li class="boton_nav" ><a href="#"><p class="texto_nav">Reportes</p></a></li>
			</ul>		
		</nav>
	</div>
	</header>
	<div class="m-4" style="height: 800px;">
		<iframe style="height: 100%; width: 100%; border: none" name="fiveframe" src="Presentacion.jsp"></iframe>
	</div>	
</body>
</html>
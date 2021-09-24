<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<li class="boton_nav" ><a class="select" href="inicio.jsp"><p class="texto_nav">Inicio</p></a></li>
				<li class="boton_nav" ><a href="usuarios.jsp"><p class="texto_nav">Usuarios</p></a></li>
				<li class="boton_nav" ><a href="clientes.jsp"><p class="texto_nav">Clientes</p></a></li>
				<li class="boton_nav" ><a href="proveedores.jsp"><p class="texto_nav">Proveedores</p></a></li>
				<li class="boton_nav" ><a href="productos.jsp"><p class="texto_nav">Productos</p></a></li>
				<li class="boton_nav" ><a href="ventas.jsp"><p class="texto_nav">Ventas</p></a></li>
			</ul>		
		</nav>


	</div>
	</header>
</body>
</html>
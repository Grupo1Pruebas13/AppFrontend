<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FiveWare Inicio</title>
<link href="css/estilos.css" rel='stylesheet' />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/flexslider.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
    	touch: true,
    	pauseOnAction: false,
    	pauseOnHover: false,
    });
  });
</script>
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
				<li class="boton_nav" ><a class="select" href="controlador?menu=Principal"><p class="texto_nav">Inicio</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Usuarios&accion=Listar"><p class="texto_nav">Usuarios</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Clientes&accion=Listar"><p class="texto_nav">Clientes</p></a></li>
				<li class="boton_nav" ><a href="controlador?menu=Proveedores&accion=Listar"><p class="texto_nav">Proveedores</p></a></li>
				<li class="boton_nav" ><a href="productos.jsp"><p class="texto_nav">Productos</p></a></li>
				<li class="boton_nav" ><a href="ventas.jsp"><p class="texto_nav">Ventas</p></a></li>
			</ul>		
		</nav>
	</div>
	</header>	
	
	<div class="flexslider">
	
		<ul class="slides">
		
			<li>
				<img src="img/1.jpg" alt="">
				<section class="flex-caption">
				<p>DISEÑO DE SOFTWARE A LA MEDIDA </p>
				</section>
			</li>
			<li>
				<img src="img/2.jpg" alt="">
				<section class="flex-caption">
				<p class="texto2">PROFESIONALES EN LA GESTIÓN Y DESARROLLO DE SISTEMAS DE INFORMACIÓN</p>
				</section>
			</li>
			<li>
				<img src="img/3.jpg" alt="">
				<section class="flex-caption">
				<p>DESARROLLO DE APLICACIONES MOVILES</p>
				</section>
			</li>
		
		</ul>
	
	</div>
</body>
</html>
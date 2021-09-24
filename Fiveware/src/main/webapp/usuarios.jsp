<%@page import="co.edu.unbosque.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<title>Usuarios FiveWare</title>
<link href="css/Usuarios.css" rel="stylesheet" />

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body class="bodyusuarios">
	<header>
		<div class="contGeneral">

			<div class="circuloLogo"></div>
			<img class="logoGeneral" src="img/logo-5ware.png" alt="FiveWare" />
			<div class="usuarioActivo">
				<p class="nombreUsuario">${usuario.getNombre_usuario()}</p>
			</div>
			<a class="cerrarSesion" href="index.jsp">Cerrar Sesión</a>
			<nav class="nav">
				<ul>
					<li class="boton_nav"><a class="select" href="inicio.jsp"><p
								class="texto_nav">Inicio</p></a></li>
					<li class="boton_nav"><a href="usuarios.jsp"><p
								class="texto_nav">Usuarios</p></a></li>
					<li class="boton_nav"><a href="clientes.jsp"><p
								class="texto_nav">Clientes</p></a></li>
					<li class="boton_nav"><a href="proveedores.jsp"><p
								class="texto_nav">Proveedores</p></a></li>
					<li class="boton_nav"><a href="productos.jsp"><p
								class="texto_nav">Productos</p></a></li>
					<li class="boton_nav"><a href="ventas.jsp"><p
								class="texto_nav">Ventas</p></a></li>
				</ul>
			</nav>


		</div>
	</header>

	<h1>MÓDULO USUARIOS</h1>



	<!-- prueba prueba prueba prueba -->
	<div>

		<div class="contenedorppalusuarios">
			<div>
				<!-- <img alt="FiveWare" src="img/logo5waredef.png" style="width: 50px; height: 50px"> -->
				<h5></h5>
				<h4>Desde aquí puede gestionar los usuarios:</h4>
				<form class="form-sign" method="get" action="Controlador">
					<div class="form-group">
						<div class="FormElement">
							<input type="hidden" name="menu" value="Usuarios"> <label
								for="txtcedula">Cédula:</label> <input type="text"
								id="txtcedula" name="txtCedula" class="form-control" value="" /><br />
						</div>
					</div>
					<div class="FormElement">
						<label for="txtnombre">Nombre:</label> <input type="text"
							id="txtnombre" name="txtNombre" class="form-control" value="">
					</div>
					<div class="FormElement">
						<label for="txtemail">Email:</label> <input type="text"
							id="txtemail" name="email" class="form-control" value="">
					</div>
					<div class="FormElement">
						<label for="txtusuario">Usuario:</label> <input type="text"
							id="txtusuario" name="txtUser" class="form-control" value="">
					</div>
					<div class="FormElement">
						<label for="txtpassword">Password:</label> <input type="password"
							id="txtpassword" name="txtPasswd" class="form-control" value="">
					</div>
					<div class="contenedorbtn">
						<input type="submit" class="btn BtnForm" name="accion"
							value="Crear"> <input type="submit" class="btn BtnForm"
							name="accion" value="Actualizar">
					</div>
				</form>


			</div>
			<table>
				<caption>FIVEWARE - LISTADO DE USUARIOS</caption>
				<thead>
					<tr>
						<th scope="col">Cedula</th>
						<th scope="col">Nombre</th>
						<th scope="col">Email</th>
						<th scope="col">Usuario</th>
						<th scope="col">Password</th>
						<th scope="col">ACCIÓN</th>
					</tr>
				</thead>
				<tbody>
					
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a class="BtnForm"
							href="Controlador?menu=Usuarios&accion=Cargar&id=">Editar</a>
							<a class="BtnForm"
							href="Controlador?menu=Usuarios&accion=Eliminar&id=">Eliminar</a>
						</td>
					</tr>
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
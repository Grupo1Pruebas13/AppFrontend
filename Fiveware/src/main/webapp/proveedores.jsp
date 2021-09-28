<%@page import="co.edu.unbosque.Proveedores"%>
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
<title>Proveedores FiveWare</title>
<link href="css/Proveedores.css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
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
	<h1>MÓDULO PROVEEDORES</h1>
	<div class="contenedorppalprov" style="width: 1200px;">
		<div style="width: 300px; float: left;">
			<h4>Desde aqui puede gestionar los proveedores</h4>
			<form method="get" action="controlador">
				<div class="form-group">
					<div class="FormElement">
						<input type="hidden" name="menu" value="Proveedores"> <label
							for="txtnit">NIT #:</label> <input type="text" id="txtnit"
							name="txtnit" class="form-control" value="${proveedorSeleccionado.getNitproveedor()}">
					</div>
				</div>
				<div class="FormElement">
					<label for="txtnombre">Nombre:</label> <input type="text"
						id="txtnombre" name="txtnombre" class="form-control" value="${proveedorSeleccionado.getNombre_proveedor()}">
				</div>
				<div class="FormElement">
					<label for="txtdireccion">Dirección:</label> <input type="text"
						id="txtdireccion" name="txtdireccion" class="form-control"
						value="${proveedorSeleccionado.getDireccion_proveedor()}">
				</div>
				<div class="FormElement">
					<label for="txttelefono">Teléfono:</label> <input type="text"
						id="txttelefono" name="txttelefono" class="form-control" value="${proveedorSeleccionado.getTelefono_proveedor()}">
				</div>
				<div class="FormElement">
					<label for="txtciudad">Ciudad:</label> <input type="text"
						id="txtciudad" name="txtciudad" class="form-control" value="${proveedorSeleccionado.getCiudad_proveedor()}">
				</div>
				<div class="contenedorbtn">
					<input type="submit" class="BtnForm" name="accion" value="Crear">
					<input type="submit" class="BtnForm" name="accion" value="Actualizar">
				</div>
			</form>
		</div>


		<div style="width: 900px; float: right;">
			<table style="width: 100%;">
				<caption>FIVEWARE - LISTADO DE PROVEEDORES</caption>
				<thead>
					<tr>
						<th scope="col">NIT</th>
						<th scope="col">Nombre</th>
						<th scope="col">Dirección</th>
						<th scope="col">Teléfono</th>
						<th scope="col">Ciudad</th>
						<th scope="col">ACCIÓN</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<Proveedores> lista = (ArrayList<Proveedores>) request.getAttribute("lista");
					for (Proveedores proveedor : lista) {
					%>
					<tr>
						<td><%=proveedor.getNitproveedor()%></td>
						<td><%=proveedor.getNombre_proveedor()%></td>
						<td><%=proveedor.getDireccion_proveedor()%></td>
						<td><%=proveedor.getTelefono_proveedor()%></td>
						<td><%=proveedor.getCiudad_proveedor()%></td>
						<td><a class="BtnForm" href="controlador?menu=Proveedores&accion=Cargar&id=<%=proveedor.getNitproveedor()%>">Editar</a>
							<a class="BtnForm" href="controlador?menu=Proveedores&accion=Eliminar&id=<%=proveedor.getNitproveedor()%>">Eliminar</a></td>
					</tr>
					<%}%>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</body>
</html>
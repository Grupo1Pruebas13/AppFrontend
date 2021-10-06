<%@page import="co.edu.unbosque.Productos"%>
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
<title>Productos FiveWare</title>
<link href="css/Productos.css" rel="stylesheet" />
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
					<li class="boton_nav" ><a href="controlador?menu=Principal"><p class="texto_nav">Inicio</p></a></li>
					<li class="boton_nav" ><a href="controlador?menu=Usuarios&accion=Listar"><p class="texto_nav">Usuarios</p></a></li>
					<li class="boton_nav" ><a href="controlador?menu=Clientes&accion=Listar"><p class="texto_nav">Clientes</p></a></li>
					<li class="boton_nav" ><a href="controlador?menu=Proveedores&accion=Listar"><p class="texto_nav">Proveedores</p></a></li>
					<li class="boton_nav" ><a class="select" href="controlador?menu=Productos&accion=Listar"><p class="texto_nav">Productos</p></a></li>
					<li class="boton_nav" ><a href="#"><p class="texto_nav">Ventas</p></a></li>
					<li class="boton_nav" ><a href="#"><p class="texto_nav">Reportes</p></a></li>
				</ul>
			</nav>
		</div>
	</header>
	<h1>MÓDULO PRODUCTOS</h1>
	<div class="contenedorppalproductos" style="width: 1200px;">
		<div style="width: 300px; float: left;">
			<h4>Desde aquí puede gestionar los productos:</h4>
			<form method="get" action="controlador">
				<div class="FormElement">
					<input type="hidden" name="menu" value="Productos"> <label
						for="txtcodigo">(*) Código</label> <input type="text" id="txtcodigo"
						name="txtcodigo" class="form-control"
						value="${productoSeleccionado.getCodigo_producto()}" required/>
				</div>

				<div class="FormElement">
					<label for="txtnombreprod">Nombre:</label> <input type="text"
						id="txtnombreprod" name="txtnombreprod" class="form-control"
						value="${productoSeleccionado.getNombre_producto()}">
				</div>

				<div class="FormElement">
					<label for="txtnitprov">Nit Proveedor:</label> <input type="text"
						id="txtnitprov" name="txtnitprov" class="form-control" value="${productoSeleccionado.getNitproveedor()}">
				</div>

				<div class="FormElement">
					<label for="txtprecioprod">Precio Compra:</label> <input
						type="text" id="txtprecioprod" name="txtprecioprod"
						class="form-control" value="${productoSeleccionado.getPrecio_compra()}">
				</div>

				<div class="FormElement">
					<label for="txtpreciovta">Precio Venta</label> <input type="text"
						id="txtpreciovta" name="txtpreciovta" class="form-control"
						value="${productoSeleccionado.getPrecio_venta()}">
				</div>
				<div class="FormElement">
					<label for="txtiva">Valor IVA</label> <input type="text"
						id="txtiva" name="txtiva" class="form-control" value="${productoSeleccionado.getIvacompra()}">
				</div>
				<div style="color: gray;">(*) Campo requerido para hacer busquedas</div>
				<div class="contenedorbtn">
					<input type="submit" class="BtnForm" name="accion" value="Crear">
					<input type="submit" class="BtnForm" name="accion"
						value="Actualizar"> <input type="submit" class="BtnForm"
						name="accion" value="Buscar">
				</div>
			</form>
		</div>

		<div style="width: 900px; float: right;">
			<table style="width: 100%;">
				<caption>FIVEWARE - LISTADO DE PRODUCTOS</caption>
				<thead>
					<tr>
						<th scope="col">Código</th>
						<th scope="col">Nombre</th>
						<th scope="col">NIT Proveedor</th>
						<th scope="col">Precio Compra</th>
						<th scope="col">Precio Venta</th>
						<th scope="col">Precio IVA</th>
						<th scope="col">ACCIÓN</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<Productos> lista = (ArrayList<Productos>) request.getAttribute("lista");
					for (Productos producto : lista) {
					%>
					<tr>
						<td><%=producto.getCodigo_producto()%></td>
						<td><%=producto.getNombre_producto()%></td>
						<td><%=producto.getNitproveedor()%></td>
						<td><%=producto.getPrecio_compra()%></td>
						<td><%=producto.getPrecio_venta()%></td>
						<td><%=producto.getIvacompra()%></td>
						<td><a class="BtnForm"
							href="controlador?menu=Productos&accion=Cargar&id=<%=producto.getCodigo_producto()%>">Editar</a>
							<a class="BtnForm"
							href="controlador?menu=Productos&accion=Eliminar&id=<%=producto.getCodigo_producto()%>">Eliminar</a></td>
					</tr>
					<%}%>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
</body>
</html>
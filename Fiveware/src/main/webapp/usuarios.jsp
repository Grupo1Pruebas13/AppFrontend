<%@page import="co.edu.unbosque.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<title>Usuarios FiveWare</title>
<link href="css/Usuarios.css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body class="bodyusuarios">
	<h1>MÓDULO USUARIOS</h1>
	
	<div class="contenedorppalusuarios" style="width: 1200px;">
		<div style="width: 300px; float: left;">
			<h4>Desde aquí puede gestionar los usuarios:</h4>
			<form class="form-sign" method="get" action="controlador">
				<div class="form-group">
					<div class="FormElement">
						<input type="hidden" name="menu" value="Usuarios"> <label
							for="txtcedula" >(*) Cédula:</label> <input type="text" id="txtcedula"
							name="txtCedula" class="form-control" value="${usuarioSeleccionado.getCedula_usuario()}" required/><br />
					</div>
				</div>
				<div class="FormElement">
					<label for="txtnombre">Nombre:</label> <input type="text"
						id="txtnombre" name="txtNombre" class="form-control" value="${usuarioSeleccionado.getNombre_usuario()}">
				</div>
				<div class="FormElement">
					<label for="txtemail">Email:</label> <input type="text"
						id="txtemail" name="email" class="form-control" value="${usuarioSeleccionado.getEmail_usuario()}">
				</div>
				<div class="FormElement">
					<label for="txtusuario">Usuario:</label> <input type="text"
						id="txtusuario" name="txtUser" class="form-control" value="${usuarioSeleccionado.getUsuario()}">
				</div>
				<div class="FormElement">
					<label for="txtpassword">Password:</label> <input type="password"
						id="txtpassword" name="txtPasswd" class="form-control" value="${usuarioSeleccionado.getPassword()}">
				</div>
				<div style="color: gray;">(*) Campo requerido para hacer busquedas</div>
				<div class="contenedorbtn">
					<input type="submit" class="btn BtnForm" name="accion" value="Crear"> 
					<input type="submit" class="btn BtnForm" name="accion" value="Actualizar">
					<input type="submit" class="BtnForm" name="accion" value="Buscar">
				</div>
			</form>

		</div>


		<div style="width: 900px; float: right;">
			<table style="width: 100%;">
				<caption>FIVEWARE - LISTADO DE USUARIOS</caption>
				<p style="text-align:center;font-weight: bold;color:black;">${noFind}</p>
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
					<%
					ArrayList<Usuarios> lista = (ArrayList<Usuarios>) request.getAttribute("lista");
					for (Usuarios usuario : lista) {
					%>
					<tr>
						<td><%=usuario.getCedula_usuario()%></td>
						<td><%=usuario.getNombre_usuario()%></td>
						<td><%=usuario.getEmail_usuario()%></td>
						<td><%=usuario.getUsuario()%></td>
						<td><%=usuario.getPassword()%></td>
						<td><a class="BtnForm" href="controlador?menu=Usuarios&accion=Cargar&id=<%=usuario.getCedula_usuario()%>">Editar</a> 
							<a class="BtnForm" href="controlador?menu=Usuarios&accion=Eliminar&id=<%=usuario.getCedula_usuario()%>">Eliminar</a></td>
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
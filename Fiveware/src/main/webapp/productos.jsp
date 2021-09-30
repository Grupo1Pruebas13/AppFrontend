<%@page import="co.edu.unbosque.Clientes"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<title>Clientes FiveWare</title>
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
					<li class="boton_nav"><a href="inicio.jsp"><p
								class="texto_nav">Inicio</p></a></li>
					<li class="boton_nav"><a href="usuarios.jsp"><p
								class="texto_nav">Usuarios</p></a></li>
					<li class="boton_nav"><a class="select" href="clientes.jsp"><p
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
<h1>MÓDULO PRODUCTOS</h1>
	<div>
   		<div class="contenedorppalproductos">
       		<div>
       		<h5></h5>
    		<h4></h4>
           		<form method="get" action="Controlador">
      		    	<div class="FormElement">
				         <input type="hidden" name="menu" value="Productos">
				         <label for="txtcodigo">Código</label>
				         <input type="text" id="txtcodigo" name="txtcodigo" class="form-control" value="${usuarioSeleccionado.getCodigo_producto()}">
			    	</div>
		    	
		    		<div class="FormElement">
		        		<label for="txtnombreprod">Nombre:</label>
						<input type="text" id="txtnombreprod" name="txtnombreprod" class="form-control" value="">
		        	</div>
		        	
		        	<div class="FormElement">
		         		<label for="txtnitprov">Nit Proveedor:</label>
		         		<input type="text" id="txtnitprov" name="txtnitprov" class="form-control" value="">
		        	</div>
		        	
		        	<div class="FormElement">
		         		<label for="txtprecioprod">Precio Compra:</label>
		         		<input type="text" id="txtprecioprod" name="txtprecioprod" class="form-control" value="">
                   	</div>
                   
		        	<div class="FormElement">
		        		<label for="txtpreciovta">Precio Venta</label>
		        		<input type="text" id="txtpreciovta" name="txtpreciovta" class="form-control" value="">
		        	</div>
		        	<div class="FormElement">
		        		<label for="txtiva">Valor IVA</label>
		        		<input type="text" id="txtiva" name="txtiva" class="form-control" value="">
		        	</div>
		        	<div class="contenedorbtn">
		        		<input type="submit" class="BtnForm" name="accion" value="Agregar">
		        		<input type="submit" class="BtnForm" name="accion" value="Actualizar">
		        		<input type="submit" class="BtnForm" name="accion" value="Buscar">
		        	</div>
       	 		</form>
    		</div>
  	
 
    	<table>
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
            <tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td> 
	               <a class="BtnForm" href="">Editar</a>
	               <a class="BtnForm" href="">Eliminar</a>
	               
	            </td>
            </tr>
            
        	</tbody>
    	</table>
	</div>
</div>
</body> 
</html>
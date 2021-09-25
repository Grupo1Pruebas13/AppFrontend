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
<title>Clientes FiveWare</title>
<link href="css/Clientes.css" rel="stylesheet"/>

<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body class="bodyusuarios">
	<header>
	<div class="contGeneral">

		<div class="circuloLogo"></div>
		<img class="logoGeneral" src="img/logo-5ware.png" alt="FiveWare" />
		<div class="usuarioActivo" ><p class="nombreUsuario">${usuario.getNombre_usuario()}</p></div>
		<a class="cerrarSesion" href="index.jsp">Cerrar Sesión</a>
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
<h1>MÓDULO CLIENTES</h1>
	<div>
   		<div class="contenedorppalclientes">
       		<div>
       		<h5></h5>
    		<h4></h4>
           		<form>
      		    	<div class="FormElement">
				         <input type="hidden" name="menu" value="Clientes">
				         <label for="txtcedulacliente">Cédula:</label>
				         <input type="text" id="txtcedulacliente" name="txtcedulacliente" value="">
			    	</div>
			    	
			    	<div class="FormElement">
		         		<label for="txtdireccioncliente">Dirección:</label>
		         		<input type="text" id="txtdireccioncliente" name="txtdireccioncliente" value="">
                   	</div>
                   	
                   	<div class="FormElement">
		         		<label for="txtemailcliente">Email:</label>
		         		<input type="text" id="txtemailcliente" name="txtemailcliente" value="">
		        	</div>
		    	
		    		<div class="FormElement">
		        		<label for="txtnombrecliente">Nombre:</label>
						<input type="text" id="txtnombrecliente" name="txtnombrecliente" value="">
		        	</div>
		        	
		        	<div class="FormElement">
		        		<label for="txttelefonocliente">Teléfono:</label>
						<input type="text" id="txttelefonocliente" name="txttelefonocliente" value="">
		        	</div>
		        	
		        	<div class="contenedorbtn">
		        		<input type="submit" class="BtnForm" name="accion" value="Crear">
		        		<input type="submit" class="BtnForm" name="accion" value="Actualizar">
		        	</div>
       	 		</form>
    		</div>
  	
 
    	<table>
    		<caption>FIVEWARE - LISTADO DE CLIENTES</caption>
        	<thead>
	            <tr>
	                <th scope="col">Cédula</th>
	                <th scope="col">Dirección</th>
	                <th scope="col">Email</th>
	                <th scope="col">Nombre</th>
	                <th scope="col">Teléfono</th>
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
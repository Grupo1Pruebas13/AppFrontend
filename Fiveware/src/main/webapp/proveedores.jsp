<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<title>Proveedores FiveWare</title>
<link href="css/Proveedores.css" rel="stylesheet"/>
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
	<div>
   		<div class="contenedorppalprov">
       		<div>
       		<h5></h5>
    		<h4></h4>
           		<form method="get" action="Controlador">
      		    	<div class="FormElement">
				         <input type="hidden" name="menu" value="Proveedores">
				         <label for="txtnit">NIT #:</label>
				         <input type="text" id="txtnit" name="txtnit" class="form-control" value="">
			    	</div>
		    	
		    		<div class="FormElement">
		        		<label for="txtnombre">Nombre:</label>
						<input type="text" id="txtnombre" name="txtnombre" class="form-control" value="">
		        	</div>
		        	
		        	<div class="FormElement">
		         		<label for="txtdireccion">Dirección:</label>
		         		<input type="text" id="txtdireccion" name="txtdireccion" class="form-control" value="">
		        	</div>
		        	
		        	<div class="FormElement">
		         		<label for="txttelefono">Teléfono:</label>
		         		<input type="text" id="txttelefono" name="txttelefono" class="form-control" value="">
                   	</div>
                   
		        	<div class="FormElement">
		        		<label for="txtciudad">Ciudad:</label>
		        		<input type="text" id="txtciudad" name="txtciudad" class="form-control" value="">
		        	</div>
		        	<div class="contenedorbtn">
		        		<input type="submit" class="BtnForm" name="accion" value="Agregar">
		        		<input type="submit" class="BtnForm" name="accion" value="Actualizar">
		        	</div>
       	 		</form>
    		</div>
  	
 
    	<table>
    		<caption>FIVEWARE - LISTADO DE USUARIOS</caption>
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
            
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td> 
	               <a class="BtnForm" href="">Editar</a>
	               <a class="BtnForm" href="">Eliminar</a>
	               <!-- <a class="BtnForm" href="">Activar</a>
	               <a class="BtnForm" href="">Desactivar</a>-->
	               
	            </td>
            </tr>
          
        	</tbody>
    	</table>
	</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FiveWare Usuarios</title>
<link href="css/estilos.css" rel='stylesheet' />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body>
	<div class="contGeneral">

		<div class="circuloLogo"></div>
		<img class="logoGeneral" src="img/logo-5ware.png" alt="FiveWare" />
		<div class="usuarioActivo" name="usuarioActivo"><p class="nombreUsuario">Julio Hernandez</p></div>
		<p class="cerrarSesion" name="cerrarSesion">Cerrar Sesión</p>
		<nav class="nav">	
			<ul>
				<li class="boton_nav" ><a href="inicio.jsp"><p class="texto_nav">Inicio</p></a></li>
				<li class="boton_nav" ><a class="select" href="usuarios.jsp"><p class="texto_nav">Usuarios</p></a></li>
				<li class="boton_nav" ><a href="clientes.jsp"><p class="texto_nav">Clientes</p></a></li>
				<li class="boton_nav" ><a href="proveedores.jsp"><p class="texto_nav">Proveedores</p></a></li>
				<li class="boton_nav" ><a href="productos.jsp"><p class="texto_nav">Productos</p></a></li>
				<li class="boton_nav" ><a href="ventas.jsp"><p class="texto_nav">Ventas</p></a></li>
			</ul>		
		</nav>
	</div>
	
	
	<div class="FormUsers">
        
        <form>
            <h1>FIVEWARE</h1>
            
            <h2>USUARIOS</h2>
			    <div class="contenedorppal">
			        <div>
			            
			            <div class="FormElement">
			                <label for="txtCedula">Cédula:</label>
			                <input type="text" id="txtCedula" name="txtCedula"/><br/>
			            </div>
			            <div class="FormElement">
			                <label for="txtNombre">Nombre Completo:</label>
			                <input type="text" id="txtNombre" name="txtNombre"/><br/>
			            </div>   
			            <div class="FormElement">
			                <label for="email">Correo Electrónico:</label>
			                <input type="email" id="email" name="email"/><br/>
			            </div>
			        </div>    
			        <div>
			            <div class="FormElement">
			                <label for="txtUser">Usuario:</label>
			                <input type="text" id="txtUser" name="txtUser"/><br/>
			            </div>
			            <div class="FormElement">
			                <label for="txtPasswd">Contraseña:</label>
			                <input type="password" id="txtPasswd" name="txtPasswd"/><br/>
			            </div>
			        </div>
			    </div>
			            
	            <div class="contenedorbtn">
	                <input class="BtnForm" type="submit" value="Consultar" id="BtnConsultar" name="BtnConsultar"/>
	                <input class="BtnForm" type="submit" value="Crear" id="BtnCrear" name="BtnCrear"/>
	                <input class="BtnForm" type="submit" value="Actualizar" id="BtnActualizar" name="BtnActualizar"/>
	                <input class="BtnForm" type="submit" value="Borrar" id="BtnBorrar" name="BtnBorrar"/>
	        
	            </div>

        </form>
        
    </div>
    
</body>
</html>
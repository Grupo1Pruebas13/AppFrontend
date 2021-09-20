<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FiveWare Login</title>
<link href="css/estilos.css" rel='stylesheet' />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
</head>
<body class="bodyLogin">
	<div class="caja-login">
		
		<img class="imglogin" src="img/logo5waredef.png" alt="FiveWare"/>
		<form class="form-sign" method="get" action="./FiveServlet"> <!-- todo lo que esta el en formulario pasa al demo servlet -->
			<div class="cajadatos">
				<h1>FIVEWARE</h1>
				<!--login-->
				<label for="txtusuario">Nombre de Usuario</label> 
				<input type="text" name="txtusuario" id="txtusuario" class="form-control">

				<!--passwd-->
				<label for="txtpassword">Contraseña</label> 
				<input type="password" name="txtpassword" id="txtpassword" class="form-control">
				
				<!--btn-->
				<input type="submit" name="accion" value="Ingresar" class="btn btn-primary btnlogin"><br/>
				<!--cambiar passwd o crear cuenta-->
				<a href="#">Olvidé mi contraseña</a>
			</div>
		</form>
		

	</div>
	
	
	
</body>
</html>
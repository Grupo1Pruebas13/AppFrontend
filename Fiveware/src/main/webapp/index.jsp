<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FiveWare Login</title>
<link href="css/estilos.css" rel='stylesheet' />
</head>
<body>
	<div class="caja-login">
		<div class="circulogo"></div>
		<img class="imglogin" src="img/logo-5ware.png" alt="FiveWare" />
		<form>
			<div class="cajadatos">
				<h1>FIVEWARE</h1>
				<!--login-->
				<label for="user">Nombre de Usuario</label> <input type="text"
					name="txtUser">

				<!--passwd-->
				<label for="passwd">Contraseña</label> <input type="password"
					name="txtPasswd">
				<!--btn-->
				<input class="btnlogin" type="submit" value="Ingresar">
				<!--cambiar passwd o crear cuenta-->
				<a href="#">Olvidé mi contraseña</a>
			</div>
		</form>

	</div>
</body>
</html>
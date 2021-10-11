<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<link href="css/Reportes.css" rel="stylesheet"/>
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<title>Reportes FiveWare</title>
</head>
<body>
<h1>MÓDULO REPORTES</h1>

	<div class="contenedorppal">
		<form method="get" action="Controlador">
				<label>Seleccione el tipo de reporte:</label><br><br>
					<div class="FormElement">
							<input class="BtnForm" type="hidden" name="menu" value="Reportes">
							<input class="BtnForm" type="submit" name="accion" value="ReporteUsuarios">
							<input class="BtnForm" type="submit" name="accion" value="ReporteClientes">
							<input class="BtnForm" type="submit" name="accion" value="ReporteVentas">
					</div>
		</form>
	</div>
	
				
				<div class="contenedortabla">
				<h5>Detalle del Reporte:</h5><br><br>
				<table>
				
					<thead>
					<tr>
						<th scope="col">Cedula</th>
	                	<th scope="col">Nombre</th>
	                	<th scope="col">Email</th>
	                	<th scope="col">Usuario</th>
	                </tr>
					</thead>
					<tbody>
					
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					
					</tbody>
				
				
				<thead>
					<tr>
						<th scope="col">Cédula</th>
	                	<th scope="col">Nombre</th>
	                	<th scope="col">Email</th>
	                	<th scope="col">Dirección</th>
	                	<th scope="col">Teléfono</th>
	                </tr>
					</thead>
					<tbody>
					
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					
					</tbody>
				
				
				<thead>
					<tr>
						<th scope="col">Código Venta</th>
	                	<th scope="col">Cédula Cliente</th>
	                	<th scope="col">Cedula Usuario</th>
	                	<th scope="col">Valor Venta</th>
	                	<th scope="col">Valor iva</th>
	                	<th scope="col">Valor Total</th>
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
						</tr>
					
					</tbody>
				
				
				
					
				</table>
				</div>
	
				
			
				
				
		


</body>
</html>
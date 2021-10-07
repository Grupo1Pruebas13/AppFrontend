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
<link href="css/Ventas.css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<title>Ventas FiveWare</title>
</head>
<body class="bodyVentas">

<div class="contGralVentas">

	<div class="contSuperior">
	
		<div class=supClienteProduc>
	
		<div class="contDatosCliente">
			<label class="datosCliente">Datos Clientes</label>
			<input type="hidden" name="menu" value="Ventas">
			<input type="hidden" name="UsuarioActivo" value="${usuarioSeleccionado.getCedula_usuario()}">
			<div class="cedulaBuscar">
				<input type="number" name="cedulacliente" class="inputCedula" placeholder="Cedula Cliente" value="${clienteSeleccionado.getCedula_cliente()}">
				<input type="submit" name="accion" value="Buscar" class="btnCliente"> 
			</div>
			<div class="">
				<input type="text" name="nombrecliente" class="nomCliente" placeholder="Nombre Cliente" value="${clienteSeleccionado.getNombre_cliente()}" readonly="readonly">
			</div>	
		</div>
		
		<div class="contDatosProducto">
			<label class="datosProducto">Datos del producto</label>
			<div>
				<div class="codProd">
					<input type="number" name="codigoproducto" class="inputCodigo" placeholder="Codigo Producto" value="${productoSeleccionado.getCodigo_producto()}">
					<input type="submit" name="accion" value="Buscar" class="btnProducto">
				</div>
				<div class="">
					<input type="text" name="nombreproducto" class="nomProd" placeholder="Nombre Producto" value="${productoSeleccionado.getNombre_producto()}" readonly="readonly">
				</div>	
					
			</div>
			
		</div>	
		
		</div>
			
				
		<div class="contCantValoriva">
		
			<div>
				<input type="text" name="precioproducto" class="precioProd" placeholder="$00000.00" value="${productoSeleccionado.getPrecio_venta()}" readonly="readonly">
			</div>
			<div class="">
				<input type="number" name="cantidadproducto" class="cantProd" placeholder="Cantidad" value="1">
			</div>
			<div class="">
				<input type="text" name="ivaproducto" class="ivaProd" placeholder="Valor IVA" value="${productoSeleccionado.getIva_compra()}" readonly="readonly">
			</div>
			
			<div class="btnAgregar">
				<input type="submit" name="accion" value="AGREGAR PRODUCTO" class="agregarProd"> 
			</div>
		</div>	
			
			
			
			
		
	</div>
	
	
	<div class="contInferior">
	
		<div class="titulos">
			<table class="">
				<thead class="">
				<tr>
					<th class="itemTh">#</th>
					<th class="itemTh">Código</th>
					<th class="itemTh">Producto</th>
					<th class="itemTh">Precio</th>
					<th class="itemTh">Cantidad</th>
					<th class="itemTh">IVA</th>
					<th class="itemTh">Total</th>
				</tr>
				</thead>
				<tbody>
				<!-- se da un nombre de variable para que reciba lo que trae de listaventas signo $ viene del servidor-->
				<c:forEach var="lista" items="${listaventas}">
					<tr>
						<th>${lista.getCodigo_detalle_venta()}</th>
						<td>${lista.getCodigo_producto()}</td>
						<td>${lista.getDescripcion_producto()}</td>
						<td>${lista.getPrecio_producto()}</td>
						<td>${lista.getCantidad_producto()}</td>
						<td>${lista.getValor_iva()}</td>
						<td>${lista.getValor_venta()}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
		
		<div class=contValoresFinalesFact>
			<div class="valores">
				<label class="valoresDatos">Subtotal</label><br/>
				<label  class="valoresDatos">IVA</label><br/>
				<label class="valoresDatos">Total a pagar</label><br/>
			</div>
			<div class="precios">
				<input type="text" name="txtsubtotal" class="preciosDatos" placeholder="$000.000.00" disabled="disabled" value="${totalsubtotal}">
				<input type="text" name="txttotaliva" class="preciosDatos" placeholder="$000.000.00" disabled="disabled" value="${totaliva}">
				<input type="text" name="txttotalapagarl" class="preciosDatos" placeholder="$000.000.00" disabled="disabled" value="${totalapagar}">
			</div>
			<div class="numFact">
				<label>Numero de Factura</label>
				<input class="numFactDato" type="text"name="numerofactura" value="${numerofactura}">
			</div>
		</div>
		
		<div class="">
			<a class="btnGenerar" onclick="print()" href="controlador?menu=Ventas&accion=GenerarVenta&cedulacliente=${clienteSeleccionado.getCedula_cliente()}&UsuarioActivo=${usuarioSeleccionado.getCedula_usuario()}&numerofactura=${numerofactura}">Generar Venta</a>
			<a class="btnNueva" href="controlador?menu=Ventas&accion=NuevaVenta">Nueva Venta</a>
		</div>
	</div>


</div>

</body>
</html>
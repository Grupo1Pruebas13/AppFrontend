<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1, minimum-scale=1">
<link href="css/Ventas.css" rel="stylesheet" />
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/imprimible.css">
<title>Ventas FiveWare</title>
</head>
<body class="bodyVentas">

	<div class="contGralVentas">
		<form method="get" action="controlador">
			<div class="contSuperior">

				<div class=supClienteProduc>

					<div class="contDatosCliente">
						<label class="datosCliente">Datos del cliente</label> <input
							type="hidden" name="menu" value="Ventas"> <input
							type="hidden" name="UsuarioActivo"
							value="${usuarioSeleccionado.getCedula_usuario()}">
						<div class="cedulaBuscar noPrint">
							<input type="number" name="cedulacliente" class="inputCedula"
								placeholder="Cedula Cliente"
								value="${clienteSeleccionado.getCedula_cliente()}" required> <input
								type="submit" name="accion" value="Buscar Cliente"
								class="btnCliente">
						</div>
						<div class="">
							<input type="text" name="nombrecliente" class="nomCliente"
								placeholder="Nombre Cliente"
								value="${clienteSeleccionado.getNombre_cliente() }"
								readonly="readonly">
						</div>
					</div>

					<div class="contDatosProducto noPrint">
						<label class="datosProducto">Datos del producto</label>
						<div>
							<div class="codProd">
								<input type="number" name="codigoproducto" class="inputCodigo"
									placeholder="Codigo Producto"
									value="${productoSeleccionado.getCodigo_producto()}"> <input
									type="submit" name="accion" value="Buscar Producto"
									class="btnProducto">
							</div>
							<div class="">
								<input type="text" name="nombreproducto" class="nomProd"
									placeholder="Nombre Producto"
									value="${productoSeleccionado.getNombre_producto()}"
									readonly="readonly">
							</div>
						</div>						
					</div>
				</div>
				<p class="print" Style="text-align:center; font-weight:bold;">Siempre pensando en su bienestar y con la innovación de nuestra parte <br>queremos hacer de su día a día algo único</p>
				<div class="contCantValoriva noPrint">
					<div>
						<input type="text" name="precioproducto" class="precioProd"
							placeholder="$00000.00"
							value="${productoSeleccionado.getPrecio_venta()}"
							readonly="readonly">
					</div>
					<div class="">
						<input type="number" name="cantidadproducto" class="cantProd"
							placeholder="Cantidad" value="1">
					</div>
					<div class="">
						<input type="text" name="ivaproducto" class="ivaProd"
							placeholder="Valor IVA"
							value="${productoSeleccionado.getIvacompra()}"
							readonly="readonly">
					</div>

					<div class="btnAgregar">
						<input type="submit" name="accion" value="AGREGAR PRODUCTO"
							class="agregarProd">
					</div>
				</div>
			</div>
		</form>
		<div class="contInferior">

			<div>
				<table id="tabla">
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
								<td>${lista.getCodigo_detalle_venta()}</td>
								<td>${lista.getCodigo_producto()}</td>
								<td>${lista.getDescripcion_producto()}</td>
								<td>${lista.getPrecio_producto()}</td>
								<td>${lista.getCantidad_producto()}</td>
								<td>${lista.getValoriva()}</td>
								<td>${lista.getValor_venta()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

			<div class=contValoresFinalesFact>
				<div class="valores">
					<label class="valoresDatos">Subtotal</label><br /> <label
						class="valoresDatos">IVA</label><br /> <label
						class="valoresDatos" style="font-weight:bold;">Total a pagar</label><br />
				</div>
				<div class="precios">
					<input type="text" name="txtsubtotal" class="preciosDatos"
						placeholder="$000.000.00" disabled="disabled"
						value="${totalsubtotal}"> <input type="text"
						name="txttotaliva" class="preciosDatos" placeholder="$000.000.00"
						disabled="disabled" value="${totaliva}"> <input
						type="text" name="txttotalapagarl" class="preciosDatos"
						placeholder="$000.000.00" disabled="disabled"
						value="${totalapagar}" style="font-weight:bold;font-size: larger;">
				</div>
				<div class="numFact">
					<label>Numero de Factura</label><br><input class="numFactDato"
						type="text" name="numerofactura" value="${numerofactura}">
				</div>
			</div>

			<div class="">
				<a class="btnGenerar noPrint" onclick="window.print();"
					href="controlador?menu=Ventas&accion=GenerarVenta&cedulacliente=${clienteSeleccionado.getCedula_cliente()}&UsuarioActivo=${usuarioSeleccionado1.getCedula_usuario()}&numerofactura=${numerofactura}">Generar
					Venta</a> <a class="btnNueva noPrint"
					href="controlador?menu=Ventas&accion=NuevaVenta">Nueva Venta</a>
					<p class="print" style="text-align:center;font-weight:bold;margin-top: 90px;font-size: x-large;" >Gracias por su compra</p>
			</div>			
		</div>
	</div>
</body>
</html>
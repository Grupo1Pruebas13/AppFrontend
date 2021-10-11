package co.edu.unbosque;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controlador")
public class controlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	double subtotal, totalapagar, subtotaliva, acusubtotal, subtotailiva = 0;
	long codigo_producto, codProducto, numfac = 0;
	double valor_iva, precio, iva = 0;
	int cantidad, item = 0;
	String descripcion, cedulaCliente;

	List<Detalle_Ventas> listaVentas = new ArrayList<>();
	Usuarios usuarios = new Usuarios();
	Detalle_Ventas detalle_venta = new Detalle_Ventas();

	public controlador() {
		super();
	}

	public void buscarUsuario(String id, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Usuarios> listau = UsuariosJSON.getJSON();
			int respuesta=0;
			for (Usuarios usuarios : listau) {
				if (usuarios.getCedula_usuario().equals(id)) {
					request.setAttribute("usuarioSeleccionado", usuarios);
					respuesta=1;
				}
			}
			if(respuesta==0) {
				String falla = "El numero de documento consultado no registra un usuario activo";
				request.setAttribute("noFind", falla);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void buscarCliente(String id, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Clientes> listac = ClientesJSON.getJSON();
			int respuesta=0;
			for (Clientes clientes : listac) {
				if (clientes.getCedula_cliente().equals(id)) {
					request.setAttribute("clienteSeleccionado", clientes);
				}
			}
			if(respuesta==0) {
				String falla = "El numero de documento consultado no registra un cliente activo";
				request.setAttribute("noFind", falla);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void buscarProveedor(String id, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Proveedores> listap = ProveedoresJSON.getJSON();
			int respuesta=0;
			for (Proveedores proveedores : listap) {
				if (proveedores.getNitproveedor().equals(id)) {
					request.setAttribute("proveedorSeleccionado", proveedores);
				}
			}
			if(respuesta==0) {
				String falla = "El numero de documento consultado no registra un proveedor activo";
				request.setAttribute("noFind", falla);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void buscarProducto(String id, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Productos> listapr = ProductosJSON.getJSON();
			int respuesta=0;
			for (Productos productos : listapr) {
				if (productos.getCodigo_producto().equals(id)) {
					request.setAttribute("productoSeleccionado", productos);
				}
			}
			if(respuesta==0) {
				String falla = "El codigo consultado no esta creado en la base de datos";
				request.setAttribute("noFind", falla);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void mostrarNumFactura(String numFact, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (numFact == null) {
			numFact = "1";
			numfac = Integer.parseInt(numFact);
		} else {
			numfac = Integer.parseInt(numFact) + 1;
		}
		request.setAttribute("numerofactura", numfac);
	}
	
	public void grabarDetalleVentas (Long numFact, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		for(int i=0; i<listaVentas.size();i++) {
			detalle_venta=new Detalle_Ventas();
			detalle_venta.setCodigo_detalle_venta(i+1);
			detalle_venta.setCodigo_venta(numFact);
			detalle_venta.setCodigo_producto(listaVentas.get(i).getCodigo_producto());
			detalle_venta.setCantidad_producto(listaVentas.get(i).getCantidad_producto());
			detalle_venta.setValor_venta(listaVentas.get(i).getValor_venta());
			detalle_venta.setValor_total(listaVentas.get(i).getValor_total());
			detalle_venta.setValoriva(listaVentas.get(i).getValoriva());
			
			int respuesta=0;
			try {
				respuesta=DetalleVentasJSON.postJSON(detalle_venta);
				PrintWriter write= response.getWriter();
				if(respuesta==200) {
					System.out.println("Registro grabado en detalle ventas: " + i);
					request.getRequestDispatcher("controlador?menu=Ventas&accion=default").forward(request, response);
				}else {
					write.println("Error detalles ventas: "+ respuesta);
				}
				write.close();//agrego linea
				} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");
		
		String cedula_usuario_activo = request.getParameter("UsuarioActivo");
		usuarios.setCedula_usuario(cedula_usuario_activo);
		request.setAttribute("usuarioSeleccionado1", usuarios);

		switch (menu) {
		case "Principal":
			request.getRequestDispatcher("/Presentacion.jsp").forward(request, response);
			break;

		case "Usuarios":
			if (accion.equals("Listar")) {
				try {
					ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Crear")) {
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(request.getParameter("txtCedula"));
				usuario.setNombre_usuario(request.getParameter("txtNombre"));
				usuario.setEmail_usuario(request.getParameter("email"));
				usuario.setUsuario(request.getParameter("txtUser"));
				usuario.setPassword(request.getParameter("txtPasswd"));

				int respuesta = 0;
				try {
					respuesta = UsuariosJSON.postJSON(usuario);
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Usuarios&accion=Listar").forward(request,
								response);
					} else {
						System.out.println("Error: " + respuesta);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if (accion.equals("Actualizar")) {
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(request.getParameter("txtCedula"));
				usuario.setNombre_usuario(request.getParameter("txtNombre"));
				usuario.setEmail_usuario(request.getParameter("email"));
				usuario.setUsuario(request.getParameter("txtUser"));
				usuario.setPassword(request.getParameter("txtPasswd"));

				int respuesta = 0;
				try {
					respuesta = UsuariosJSON.putJSON(usuario, Long.parseLong(usuario.getCedula_usuario()));
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Usuarios&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				String id = request.getParameter("id");
				try {
					ArrayList<Usuarios> lista1 = UsuariosJSON.getJSON();
					for (Usuarios usuarios : lista1) {
						if (usuarios.getCedula_usuario().equals(id)) {
							request.setAttribute("usuarioSeleccionado", usuarios);
							request.getRequestDispatcher("controlador?menu=Usuarios&accion=Listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = UsuariosJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Usuarios&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Buscar")) {
				String id = request.getParameter("txtCedula");
				this.buscarUsuario(id, request, response);
				request.getRequestDispatcher("controlador?menu=Usuarios&accion=Listar").forward(request, response);
			}
			request.getRequestDispatcher("/usuarios.jsp").forward(request, response);
			break;

		case "Clientes":
			if (accion.equals("Listar")) {
				try {
					ArrayList<Clientes> lista = ClientesJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Crear")) {
				Clientes cliente = new Clientes();
				cliente.setCedula_cliente(request.getParameter("txtCedula"));
				cliente.setDireccion_cliente(request.getParameter("txtdireccion"));
				cliente.setEmail_cliente(request.getParameter("email"));
				cliente.setNombre_cliente(request.getParameter("txtNombre"));
				cliente.setTelefono_cliente(request.getParameter("txttel"));

				int respuesta = 0;
				try {
					respuesta = ClientesJSON.postJSON(cliente);
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Clientes&accion=Listar").forward(request,
								response);
					} else {
						System.out.println("Error: " + respuesta);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if (accion.equals("Actualizar")) {
				Clientes cliente = new Clientes();
				cliente.setCedula_cliente(request.getParameter("txtCedula"));
				cliente.setDireccion_cliente(request.getParameter("txtdireccion"));
				cliente.setEmail_cliente(request.getParameter("email"));
				cliente.setNombre_cliente(request.getParameter("txtNombre"));
				cliente.setTelefono_cliente(request.getParameter("txttel"));

				int respuesta = 0;
				try {
					respuesta = ClientesJSON.putJSON(cliente, Long.parseLong(cliente.getCedula_cliente()));
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Clientes&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				String id = request.getParameter("id");
				try {
					ArrayList<Clientes> lista1 = ClientesJSON.getJSON();
					for (Clientes clientes : lista1) {
						if (clientes.getCedula_cliente().equals(id)) {
							request.setAttribute("clienteSeleccionado", clientes);
							request.getRequestDispatcher("controlador?menu=Clientes&accion=Listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = ClientesJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Clientes&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Buscar")) {
				String id = request.getParameter("txtCedula");
				this.buscarCliente(id, request, response);
				request.getRequestDispatcher("controlador?menu=Clientes&accion=Listar").forward(request, response);
			}
			request.getRequestDispatcher("/clientes.jsp").forward(request, response);
			break;

		case "Proveedores":
			if (accion.equals("Listar")) {
				try {
					ArrayList<Proveedores> lista = ProveedoresJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Crear")) {
				Proveedores proveedor = new Proveedores();
				proveedor.setNitproveedor(request.getParameter("txtnit"));
				proveedor.setNombre_proveedor(request.getParameter("txtnombre"));
				proveedor.setCiudad_proveedor(request.getParameter("txtciudad"));
				proveedor.setDireccion_proveedor(request.getParameter("txtdireccion"));
				proveedor.setTelefono_proveedor(request.getParameter("txttelefono"));

				int respuesta = 0;
				try {
					respuesta = ProveedoresJSON.postJSON(proveedor);
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Proveedores&accion=Listar").forward(request,
								response);
					} else {
						System.out.println("Error: " + respuesta);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if (accion.equals("Actualizar")) {
				Proveedores proveedor = new Proveedores();
				proveedor.setNitproveedor(request.getParameter("txtnit"));
				proveedor.setNombre_proveedor(request.getParameter("txtnombre"));
				proveedor.setCiudad_proveedor(request.getParameter("txtciudad"));
				proveedor.setDireccion_proveedor(request.getParameter("txtdireccion"));
				proveedor.setTelefono_proveedor(request.getParameter("txttelefono"));

				int respuesta = 0;
				try {
					respuesta = ProveedoresJSON.putJSON(proveedor, Long.parseLong(proveedor.getNitproveedor()));
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Proveedores&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				String id = request.getParameter("id");
				try {
					ArrayList<Proveedores> lista1 = ProveedoresJSON.getJSON();
					for (Proveedores proveedores : lista1) {
						if (proveedores.getNitproveedor().equals(id)) {
							request.setAttribute("proveedorSeleccionado", proveedores);
							request.getRequestDispatcher("controlador?menu=Proveedores&accion=Listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = ProveedoresJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Proveedores&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Buscar")) {
				String id = request.getParameter("txtnit");
				this.buscarProveedor(id, request, response);
				request.getRequestDispatcher("controlador?menu=Proveedores&accion=Listar").forward(request, response);
			}

			request.getRequestDispatcher("/proveedores.jsp").forward(request, response);
			break;

		case "Productos":
			if (accion.equals("Listar")) {
				try {
					ArrayList<Productos> lista = ProductosJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Crear")) {
				Productos producto = new Productos();
				producto.setCodigo_producto(request.getParameter("txtcodigo"));
				producto.setIvacompra(request.getParameter("txtiva"));
				producto.setNitproveedor(request.getParameter("txtnitprov"));
				producto.setNombre_producto(request.getParameter("txtnombreprod"));
				producto.setPrecio_compra(request.getParameter("txtprecioprod"));
				producto.setPrecio_venta(request.getParameter("txtpreciovta"));

				int respuesta = 0;
				try {
					respuesta = ProductosJSON.postJSON(producto);
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Productos&accion=Listar").forward(request,
								response);
					} else {
						System.out.println("Error: " + respuesta);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else if (accion.equals("Actualizar")) {
				Productos producto = new Productos();
				producto.setCodigo_producto(request.getParameter("txtcodigo"));
				producto.setIvacompra(request.getParameter("txtiva"));
				producto.setNitproveedor(request.getParameter("txtnitprov"));
				producto.setNombre_producto(request.getParameter("txtnombreprod"));
				producto.setPrecio_compra(request.getParameter("txtprecioprod"));
				producto.setPrecio_venta(request.getParameter("txtpreciovta"));

				int respuesta = 0;
				try {
					respuesta = ProductosJSON.putJSON(producto, Long.parseLong(producto.getCodigo_producto()));
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Productos&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Cargar")) {
				String id = request.getParameter("id");
				try {
					ArrayList<Productos> lista1 = ProductosJSON.getJSON();
					for (Productos productos : lista1) {
						if (productos.getCodigo_producto().equals(id)) {
							request.setAttribute("productoSeleccionado", productos);
							request.getRequestDispatcher("controlador?menu=Productos&accion=Listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				int respuesta = 0;
				try {
					respuesta = ProductosJSON.deleteJSON(id);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("controlador?menu=Productos&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Buscar")) {
				String id = request.getParameter("txtcodigo");
				this.buscarProducto(id, request, response);
				request.getRequestDispatcher("controlador?menu=Productos&accion=Listar").forward(request, response);
			}

			request.getRequestDispatcher("/productos.jsp").forward(request, response);
			break;

		case "Ventas":
			request.setAttribute("usuarioSeleccionado", usuarios);
			request.setAttribute("numerofactura", numfac);

			if (accion.equals("Buscar Cliente")) {
				String idcli = request.getParameter("cedulacliente");
				this.buscarCliente(idcli, request, response);
			} else if (accion.equals("Buscar Producto")) {
				String id = request.getParameter("codigoproducto");
				this.buscarProducto(id, request, response);
				String idc = request.getParameter("cedulacliente");
				this.buscarCliente(idc, request, response);
			} else if (accion.equals("AGREGAR PRODUCTO")) {
				String idc = request.getParameter("cedulacliente");
				this.buscarCliente(idc, request, response);
				
				detalle_venta = new Detalle_Ventas();
				item++;
				totalapagar = 0;
				acusubtotal=0;
				subtotaliva=0;
				
				codProducto = Integer.parseInt(request.getParameter("codigoproducto"));
				descripcion = request.getParameter("nombreproducto");
				cantidad = Integer.parseInt(request.getParameter("cantidadproducto"));
				precio = Double.parseDouble(request.getParameter("precioproducto"));
				iva = Double.parseDouble(request.getParameter("ivaproducto"));

				subtotal = (precio * cantidad);
				valor_iva = (subtotal * iva / 100);

				detalle_venta.setCodigo_detalle_venta(item);
				detalle_venta.setCodigo_producto(codProducto);
				detalle_venta.setDescripcion_producto(descripcion);
				detalle_venta.setCantidad_producto(cantidad);
				detalle_venta.setPrecio_producto(precio);
				detalle_venta.setCodigo_venta(numfac);
				detalle_venta.setValoriva(valor_iva);
				detalle_venta.setValor_venta(subtotal);
				listaVentas.add(detalle_venta);

				for (int i = 0; i < listaVentas.size(); i++) {
					acusubtotal += listaVentas.get(i).getValor_venta();
					subtotaliva += listaVentas.get(i).getValoriva();
				}
				totalapagar = acusubtotal + subtotaliva;
				detalle_venta.setValor_total(totalapagar);

				request.setAttribute("listaventas", listaVentas);
				request.setAttribute("totalsubtotal", acusubtotal);
				request.setAttribute("totaliva", subtotaliva);
				request.setAttribute("totalapagar", totalapagar);
				
			} else if (accion.equals("GenerarVenta")) {
				
				String numFact = request.getParameter("numerofactura");
				cedulaCliente = request.getParameter("cedulacliente");

				Ventas ventas = new Ventas();
				ventas.setCodigo_venta(Long.parseLong(numFact));
				ventas.setCedula_cliente(Long.parseLong(cedulaCliente));
				ventas.setCedula_usuario(Long.parseLong(usuarios.getCedula_usuario()));
				ventas.setIvaventa(subtotaliva);
				ventas.setValor_venta(acusubtotal);
				ventas.setTotal_venta(totalapagar);

				int respuesta = 0;
				try {
					respuesta = VentasJSON.postJSON(ventas);
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						System.out.println("Grabacion exitosa " + respuesta);
						this.grabarDetalleVentas(ventas.getCodigo_venta(), request, response);
					} else {
						write.println("error ventas: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				listaVentas.clear();
				item=0;
				totalapagar=0;
				acusubtotal=0;
				subtotailiva=0;
			} else {
				String factura = request.getParameter("numerofactura");
				this.mostrarNumFactura(factura, request, response);
			}			
			request.getRequestDispatcher("/ventas.jsp").forward(request, response);
			break;
			
		case "Reportes":
			int opcion=0;
			if(accion.equals("ReporteUsuarios")) {
				try {
					ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
					opcion=1;
					request.setAttribute("listaUsuarios", lista);
					request.setAttribute("opcion", opcion);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(accion.equals("ReporteClientes")) {
				try {
					ArrayList<Clientes> lista = ClientesJSON.getJSON();
					opcion=2;
					request.setAttribute("listaClientes", lista);
					request.setAttribute("opcion", opcion);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(accion.equals("ReporteVentas")) {
				try {
					ArrayList<Ventas> lista = VentasJSON.getJSON();
					opcion=3;
					request.setAttribute("listaVentas1", lista);
					request.setAttribute("opcion", opcion);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			request.getRequestDispatcher("/reportes.jsp").forward(request, response);
			break;
		}
	}
}

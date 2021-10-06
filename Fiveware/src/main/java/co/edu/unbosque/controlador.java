package co.edu.unbosque;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controlador")
public class controlador extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public controlador() {
		super();
	}
	
	public void buscarUsuario(String id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			ArrayList<Usuarios> listau=UsuariosJSON.getJSON();
			for(Usuarios usuarios: listau) {
				if(usuarios.getCedula_usuario().equals(id)) {
					request.setAttribute("usuarioSeleccionado", usuarios);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void buscarCliente(String id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			ArrayList<Clientes> listac=ClientesJSON.getJSON();
			for(Clientes clientes: listac) {
				if(clientes.getCedula_cliente().equals(id)) {
					request.setAttribute("clienteSeleccionado", clientes);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void buscarProveedor(String id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			ArrayList<Proveedores> listap=ProveedoresJSON.getJSON();
			for(Proveedores proveedores: listap) {
				if(proveedores.getNitproveedor().equals(id)) {
					request.setAttribute("proveedorSeleccionado", proveedores);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void buscarProducto(String id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			ArrayList<Productos> listapr=ProductosJSON.getJSON();
			for(Productos productos: listapr) {
				if(productos.getCodigo_producto().equals(id)) {
					request.setAttribute("productoSeleccionado", productos);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");

		switch (menu) {
		case "Principal":
			request.getRequestDispatcher("/inicio.jsp").forward(request, response);
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
					for (Usuarios usuarios:lista1) {
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
			}else if(accion.equals("Buscar")) {
				String id = request.getParameter("txtCedula");
				this.buscarUsuario(id, request, response);
				request.getRequestDispatcher("controlador?menu=Usuarios&accion=Listar").forward(request,
						response);
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
					for (Clientes clientes:lista1) {
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
			}else if(accion.equals("Buscar")) {
				String id = request.getParameter("txtCedula");
				this.buscarCliente(id, request, response);
				request.getRequestDispatcher("controlador?menu=Clientes&accion=Listar").forward(request,
						response);
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
					for (Proveedores proveedores:lista1) {
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
			}else if(accion.equals("Buscar")) {
				String id = request.getParameter("txtnit");
				this.buscarProveedor(id, request, response);
				request.getRequestDispatcher("controlador?menu=Proveedores&accion=Listar").forward(request,
						response);
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
					for (Productos productos:lista1) {
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
			}else if(accion.equals("Buscar")) {
				String id = request.getParameter("txtcodigo");
				this.buscarProducto(id, request, response);
				request.getRequestDispatcher("controlador?menu=Productos&accion=Listar").forward(request,
						response);
			}
			
			request.getRequestDispatcher("/productos.jsp").forward(request, response);
			break;
		case "Ventas":
			request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
			break;
		}
	}
}

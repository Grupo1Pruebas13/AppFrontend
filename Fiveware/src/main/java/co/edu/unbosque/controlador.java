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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

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
				Long id = Long.parseLong(request.getParameter("id"));
				try {
					ArrayList<Usuarios> lista1 = UsuariosJSON.getJSON();
					for (Usuarios usuarios:lista1) {
						System.out.println(usuarios);
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
				Long id = Long.parseLong(request.getParameter("id"));
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
			}
			request.getRequestDispatcher("/clientes.jsp").forward(request, response);
			break;
		case "Proveedores":
			request.getRequestDispatcher("/Proveedores.jsp").forward(request, response);
			break;
		case "Productos":
			request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			break;
		case "Ventas":
			request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
			break;
		}
	}
}

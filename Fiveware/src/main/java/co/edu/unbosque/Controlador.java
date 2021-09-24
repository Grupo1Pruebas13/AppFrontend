package co.edu.unbosque;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accion = request.getParameter("accion");
		if (accion.equals("Listar")) {
		     try {
		        ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
			 request.setAttribute("lista", lista);
		     } catch (Exception e) {
			 e.printStackTrace();
		     }
		  }else if (accion.equals("Crear")) {
			Usuarios usuario = new Usuarios();
			usuario.setCedula_usuario(Long.parseLong(request.getParameter("txtCedula")));
			usuario.setNombre_usuario(request.getParameter("txtNombre"));
			usuario.setEmail_usuario(request.getParameter("email"));
			usuario.setUsuario(request.getParameter("txtUser"));
			usuario.setPassword(request.getParameter("txtPasswd"));
			int respuesta = 0;
			try {
				respuesta = UsuariosJSON.postJSON(usuario);
				if (respuesta == 200) {
					request.getRequestDispatcher("/usuarios.jsp").forward(request, response);
					System.out.println("Exito" + respuesta);
				} else {
					System.out.println("Error: " + respuesta);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (accion.equals("Actualizar")) {
			Usuarios usuario = new Usuarios();
			usuario.setCedula_usuario(Long.parseLong(request.getParameter("txtCedula")));
			usuario.setNombre_usuario(request.getParameter("txtNombre"));
			usuario.setEmail_usuario(request.getParameter("email"));
			usuario.setUsuario(request.getParameter("txtUser"));
			usuario.setPassword(request.getParameter("txtPasswd"));
			int respuesta = 0;
			try {
				respuesta = UsuariosJSON.postJSON(usuario);
				if (respuesta == 200) {
					request.getRequestDispatcher("/usuarios.jsp").forward(request, response);
					System.out.println("Exito  " + respuesta);
				} else {
					System.out.println("Error: " + respuesta);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

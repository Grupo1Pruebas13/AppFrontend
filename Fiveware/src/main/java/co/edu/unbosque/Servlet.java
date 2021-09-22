package co.edu.unbosque;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FiveServlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Servlet() {
        super();
    }
    
    public void validarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
			request.setAttribute("lista", lista);
			String usua = request.getParameter("txtusuario");
			String pass = request.getParameter("txtpassword");
			int respuesta = 0;
			for (Usuarios usuario : lista) {
				if (usuario.getUsuario().equals(usua) && usuario.getPassword().equals(pass)) {
					request.setAttribute("usuario", usuario);
					request.getRequestDispatcher("/inicio.jsp").forward(request, response);
					respuesta = 1;
				}

			}

			if (respuesta == 0) {
				String message = "Credenciales incorrectas o campos vacios <br> por favor verifique o p�ngase en contacto con un administrador";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				System.out.println("No se encontraron datos");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		if (accion.equals("Ingresar")) {
			this.validarUsuarios(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		if (accion.equals("Ingresar")) {
			this.validarUsuarios(request, response);
		}
	}

}

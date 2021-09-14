package co.edu.unbosque;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("txtUser");
        String password = request.getParameter("txtPasswd");
        if (usuario != null && password != null) {
            response.getWriter().append("Bienvenido " + usuario + " a la Tienda Fourware");
        } else {
            response.getWriter().append("Complete los campos por favor");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("txtUser");
        String password = request.getParameter("txtPasswd");
        if (usuario != null && password != null) {
            response.getWriter().append("Bienvenido " + usuario + " a la Tienda Fourware");
        } else {
            response.getWriter().append("Complete los campos por favor");
        }
	}

}

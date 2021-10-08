package co.edu.unbosque;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class DetalleVentasJSON {

	private static URL url;
	private static String sitio = "http://localhost:5000/";
	
	public static int postJSON(Detalle_Ventas detalle_ventas) throws IOException {

		url = new URL(sitio + "detalle_ventas/guardar");
		HttpURLConnection http;
		http = (HttpURLConnection) url.openConnection();

		try {
			http.setRequestMethod("POST");
		} catch (ProtocolException e) {
			e.printStackTrace();
		}

		http.setDoOutput(true);
		http.setRequestProperty("Accept", "application/json");
		http.setRequestProperty("Content-Type", "application/json");

		String data = "{" 
				+ "\"codigo_detalle_venta\":\""+ String.valueOf(detalle_ventas.getCodigo_detalle_venta())
				+"\",\"cantidad_producto\": \""+String.valueOf(detalle_ventas.getCantidad_producto())
				+"\",\"codigo_producto\": \""+String.valueOf(detalle_ventas.getCodigo_producto())
				+"\",\"codigo_venta\":\""+String.valueOf(detalle_ventas.getCodigo_venta())
				+"\",\"valor_total\":\""+String.valueOf(detalle_ventas.getValor_total())
				+"\",\"valor_venta\":\""+String.valueOf(detalle_ventas.getValor_venta())
				+"\",\"valoriva\":\""+String.valueOf(detalle_ventas.getValoriva())
				+ "\"}";
		byte[] out = data.getBytes(StandardCharsets.UTF_8);
		OutputStream stream = http.getOutputStream();
		stream.write(out);

		int respuesta = http.getResponseCode();
		http.disconnect();
		return respuesta;
	}
}

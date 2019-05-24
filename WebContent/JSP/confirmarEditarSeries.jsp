<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String numSerie = request.getParameter("NumeroSerie");
	String marca = request.getParameter("marca");
	String modelo = request.getParameter("modelo");
	String año_fab = request.getParameter("año_fab");
	String user = "ConexConcesionario";
	String contra = "zubiri";
	String url = "jdbc:mysql://10.18.124.58:3306/";
	String db = "concesionario";
	String driver = "com.mysql.jdbc.Driver";
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url + db, user, contra);
		st = conn.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Editar serie</title>
<!-- https://bootswatch.com/materia/ -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="/media/open-iconic/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/heroic-features.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<h1>Editar serie</h1>
	<%
		try {
			st.executeUpdate("UPDATE serie SET marca='" + marca + "', modelo='" + modelo + "',año_fab='" + año_fab
					+ "' WHERE NumSerie='" + numSerie + "'");
	%>
	<font size="" color="green"> <%
 	out.println("Se han cambiado los valores de la serie " + numSerie + " correctamente");
 %>
	</font>
	<%
		} catch (Exception ex) {
	%>
	<font color="red"> <%
 	out.println("No se puede modificar correctamente la serie, pruebe de nuevo.");
 %>
	</font>
	<%
		}
	%>
	<br>
	<a style="font-size: 15px;" href="series.jsp"
		class="btn btn-primary btn-lg">Volver a la tabla series</a>
</body>
</html>

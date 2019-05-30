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
<link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../css/heroic-features.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="../../index.html">AJA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="../index.html">Inicio</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../Coches/coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="../Camiones/camiones.jsp">Camiones</a></li>
				<li class="nav-item"><a class="nav-link" href="series.jsp">Series</a>
				</li>
			</ul>
		</div>
	</nav>
<h1 style="margin-top:10px; margin-left:41%">Editar serie</h1>
	<%
		try {
			st.executeUpdate("UPDATE serie SET marca='" + marca + "', modelo='" + modelo + "',año_fab='" + año_fab
					+ "' WHERE NumSerie='" + numSerie + "'");
	%>
	<h4 style="color:green; margin-top:10px; margin-left:33%"> <%
 	out.println("Se han cambiado los valores de la serie " + numSerie + " correctamente");
 %>
	</h4>
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
	<a style="font-size: 15px; margin-left:39%;" href="series.jsp"
		class="btn btn-primary btn-lg">Volver a la tabla series</a>
</body>
</html>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String stringMatricula = request.getParameter("Matricula");
	String url = "jdbc:mysql://10.18.124.58:3306/";
	String db = "concesionario";
	String driver = "com.mysql.jdbc.Driver";
	try { 
		Class.forName(driver);
	} catch (Exception ex) {
		System.out.print(ex.getMessage());
	}
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<title>Compra coche</title>
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
		<a class="navbar-brand" href="../index.html">AJA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="../../index.html">Inicio <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="../Camiones/camiones.jsp">Camiones</a></li>
				<li class="nav-item"><a class="nav-link" href="../Series/series.jsp">Series</a>
				</li>
			</ul>
		</div>
	</nav>
<h1>Comprar coche</h1>
	<%
		try {
			conn = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
			st = conn.createStatement();
			String Query = "DELETE FROM vehiculos WHERE Matricula ='" + stringMatricula + "'";
			st.executeUpdate(Query);
		%>
		<font size="" color="green"> <%
 		out.println("Se ha comprado el coche correctamente");
		%>
		</font>
		<%
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		%>
		<font color="red"> <%
 		out.println("No se puede eliminar el coche correctamente, pruebe de nuevo.");
 		%>
		</font>
		<%
		}
		%>
		<br>
		<a style="font-size: 15px;" href="coches.jsp"
		class="btn btn-primary btn-lg">Volver a la tabla coches</a>
</body>
</html>

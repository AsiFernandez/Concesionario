<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String user = "ConexConcesionario";
	String contra = "zubiri";
	String url = "jdbc:mysql://10.18.124.58:3306/";
	String database = "concesionario";
	String driverDB = "com.mysql.jdbc.Driver";
	try {
		Class.forName(driverDB);
	} catch (Exception ex) {

	}
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="es">

<head>
<!-- https://bootswatch.com/materia/ -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>AJA camiones</title>
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
					href="../index.html">Inicio</a></li>
				<li class="nav-item"><a class="nav-link" href="../Coches/coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="camiones.jsp">Camiones
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="../Series/series.jsp">Series</a>
				</li>
			</ul>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">
		<br>
		<h1>Camiones</h1>
		<a href="insertCamiones.jsp" class="btn btn-primary btn-lg"
			id="insertar">Insertar camion nuevo</a>
		<table>
			<tr>
				<th>Matricula</th>
				<th>Numero de Bastidor</th>
				<th>Color</th>
				<th>Numero de Asientos</th>
				<th>Precio</th>
				<th>Numero de serie</th>
				<th>Carga</th>
				<th>Tipo de mercancia</th>
				<th>Editar camion</th>
				<th>Comprar camion</th>
			</tr>
			<%
				try {
					conn = DriverManager.getConnection(url + database, user, contra);
					st = conn.createStatement();
					String sql = "select * from vehiculos v, camion c where v.Matricula = c.Matricula";
					rs = st.executeQuery(sql);
					while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("Matricula")%></td>
				<td><%=rs.getString("numBastidor")%></td>
				<td><%=rs.getString("color")%></td>
				<td><%=rs.getString("numAsientos")%></td>
				<td><%=rs.getString("precio")%></td>
				<td><%=rs.getString("numSerie")%></td>
				<td><%=rs.getString("carga")%></td>
				<td><%=rs.getString("tipoMercancia")%></td>
				<td><a style="font-size: 15px;"
					href="editarCamiones.jsp?Matricula=<%=rs.getString("Matricula")%>"
					class="btn btn-primary btn-lg">Editar</a></td>
				<td><a style="font-size: 15px;"
					href="comprarCamiones.jsp?Matricula=<%=rs.getString("Matricula")%>"
					class="btn btn-primary btn-lg">Comprar</a></td>
			</tr>
			<%
				}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			%>
		</table>
	</div>
	<!-- /.container -->
	<!-- Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String numSerie = request.getParameter("numSerie");
	Connection con = null;
	String url = "jdbc:mysql://10.18.124.58:3306/";
	String db = "concesionario";
	String driver = "com.mysql.jdbc.Driver";
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Comprar Camion</title>
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
					href="../../index.html">Inicio <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../Coches/coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="../Camiones/camiones.jsp">Camiones</a></li>
				<li class="nav-item"><a class="nav-link" href="../Series/series.jsp">Series</a>
				</li>
			</ul>
		</div>
	</nav>
	<%
		try {
			Statement st = con.createStatement();
			String query = "SELECT * FROM serie WHERE NumSerie='"
					+ numSerie + "'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
	%>


	<table border="1" width="50%">
		<tr>
			<td width="100%"><input type="hidden" name="numSerie"
				value="<%=request.getParameter("numSerie")%>">
				<h2 align="center">Eliminar Serie</h2>
				<table border="2" width="100%" bgColor="lightgreen">
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Numero de serie:</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("NumSerie")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Marca:</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("marca")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Modelo:</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("modelo")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Año de frabricacion:</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("año_fab")%></td>
					</tr>
				</table>
				<a style="font-size: 15px;"
					href="confirmarEliminarSerie.jsp?numSerie=<%=rs.getString("NumSerie")%>"
					class="btn btn-primary btn-lg">Confirmar</a>
			</td>
		</tr>
	</table>
	<%
		}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	%>
</body>
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; AJA 2019</p>
	</div>
	<!-- /.container -->
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>
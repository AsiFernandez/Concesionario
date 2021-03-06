<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>

<!DOCTYPE html>
<html lang="es">

<head>
<!-- https://bootswatch.com/materia/ -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insertar coche</title>
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
				<li class="nav-item"><a class="nav-link" href="coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="../Camiones/camiones.jsp">Camiones</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../Series/series.jsp">Series</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content -->
	<%
		String matricula = request.getParameter("Matricula");
		Connection conn = null;
		String url = "jdbc:mysql://10.18.124.58:3306/";
		String db = "concesionario";
		String driver = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			Statement st = conn.createStatement();
			String sql = "select numSerie from serie ";
			ResultSet rs = st.executeQuery(sql);
	%>


	<div class="container">
		<h1>Insertar coche</h1>
		<form method="post" action="verificarInsertarCoche.jsp">
			<h4>Datos a insertar</h4>
			<p>Matricula:</p>
			<input name="matricula">
			<p>Numero de bastidor:</p>
			<input name="numbast">
			<p>Color:</p>
			<input name="color">
			<p>Numero de Asientos:</p>
			<input name="numAsientos">
			<p>Precio:</p>
			<input name="precio">
			<p>Numero de puertas:</p>
			<input name="puertas">
			<p>Capacidad del maletero:</p>
			<input name="maletero">
			<p>Numero de serie:</p>
			<select name="numSerie" style="width: 170px">
				<%
					while (rs.next()) {
				%>
				<option value="<%=rs.getString("numSerie")%>"><%=rs.getString("numSerie")%></option>
				<%
					}
				%>
			</select> <br> <br> <input type="submit" value="Insertar Datos"
				class="btn btn-primary btn-lg"> <br> <br>
		</form>
	</div>
	<%
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>

	<!-- /.container -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; AJA 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html"%>
<%
		String user = "ConexConcesionario";
		String contra = "zubiri";
		String url ="jdbc:mysql://10.18.124.58:3306/";
		String database = "concesionario";
		String driverDB = "com.mysql.jdbc.Driver";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName(driverDB);
			conn = DriverManager.getConnection(url+database, user, contra);
			st = conn.createStatement();
		} catch(Exception ex){
		%>
<font color="red"> 
<h2 style=" color:red">No se puede conectar con la base de datos</h2>
		
</font>
<%
		}
%>
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
					href="../index.html">Inicio <span class="sr-only">(current)</span></a>
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
	
	<!-- Page Content -->
	<div class="container">
		<h1>Insertar coche</h1>
		<%
		try {
			String numSerie = request.getParameter("numSerie");
			String matricula = request.getParameter("matricula");
			String numbast = request.getParameter("numbast");
			String color = request.getParameter("color");
		    String numAsientos = request.getParameter("numAsientos");
		    String precio = request.getParameter("precio");
		    String puertas = request.getParameter("puertas");
		    String maletero = request.getParameter("maletero");
			st.executeUpdate("insert into vehiculos(Matricula,numBastidor,color,numAsientos,precio,numSerie)values('"+matricula+"','"+numbast+"','"+color+"','"+numAsientos+"','"+precio+"','"+numSerie+"')");
			st.executeUpdate("insert into coche(Matricula,numPuertas,capacidadMaletero)values('"+matricula+"','"+puertas+"','"+maletero+"')");
		%>
		<font size="" color="green"> <%
		out.println("Se ha agregado el coche con matricula "+matricula+" correctamente");
		%>
		</font>
		<%
		} catch(Exception ex){
			System.out.println(ex.getMessage());
		%>
		<font color="red"> <h4> No se puede añadir correctamente al coche, pruebe de nuevo.</h4>
		
		</font>
		<%
		}
		%>
		<form method="post" action="index.jsp">
			<input type="button" value="Volver a la tabla coches"
				onclick="location.href='coches.jsp'">
		</form>
	</div>
	

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
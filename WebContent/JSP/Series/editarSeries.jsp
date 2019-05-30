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
<title>Editar Camion</title>
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
					href="../index.html">Inicio <span class="sr-only">(current)</span></a>
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
	<%
		try {
			Statement st = con.createStatement();
			String query = "SELECT * FROM serie WHERE NumSerie='" + numSerie + "'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
	%>


			
				<form method="POST" action="confirmarEditarSeries.jsp">
					<input type="hidden" name="NumSerie"
						value="<%=request.getParameter("NumSerie")%>">
					<h2 align="center">Editar serie</h2>
					<table  width="100%" >
						<tr>
							<td width="50%"><b>Numero de serie:</b></td>
							<td width="50%"><input type="text"
								name="NumeroSerie" value="<%=rs.getString("NumSerie")%>"
								size="15" readonly></td>
						</tr>
						<tr>
							<td width="50%" ><b>Marca del
									vehiculo:</b></td>
							<td width="50%" ><input type="text"
								name="marca" value="<%=rs.getString("marca")%>" size="15"></td>
						</tr>
						<tr>
							<td width="50%" ><b>Modelo del
									vehiculo:</b></td>
							<td width="50%" ><input type="text"
								name="modelo" value="<%=rs.getString("modelo")%>" size="15"></td>
						</tr>
						<tr>
							<td width="50%"><b>Año de
									fabricacion:</b></td>
							<td width="50%"><input type="text"
								name="año_fab" value="<%=rs.getString("año_fab")%>" size="15"></td>
						</tr>
					</table>
					<p>

						<input type="submit" value="Confirmar" name="confirmar"
							class="btn btn-primary btn-lg"> <input type="reset"
							value="Reset" name="reset" class="btn btn-primary btn-lg">
					</p>
				</form>
			

	<%
		}
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	%>
</body>


<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>
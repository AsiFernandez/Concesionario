<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String matricula = request.getParameter("Matricula");
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
					href="../index.html">Inicio</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../Coches/coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="camiones.jsp">Camiones</a></li>
				<li class="nav-item"><a class="nav-link" href="../Series/series.jsp">Series</a>
				</li>
			</ul>
		</div>
	</nav>
	<%
		try {
			Statement st = con.createStatement();
			String query = "SELECT * FROM Vehiculos v, camion c WHERE (v.Matricula = c.Matricula) and v.Matricula='"
					+ matricula + "'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
	%>


	
			<td width="100%">
				<form method="POST" action="confirmarEditarCamiones.jsp">
					<input type="hidden" name="matricula"
						value="<%=request.getParameter("matricula")%>">
					<h2 align="center" style="margin-top: 10px;">Editar camion</h2>
					<table  width="100%" >
						<tr>
							<td width="50%" ><b>Matricula:</b></td>
							<td width="50%" ><input type="text"
								name="maatricula"
								value="<%=rs.getString("matricula")%>" size="15" readonly></td>
						</tr>
						<tr>
							<td width="50%" ><b>Numero de
									Bastidor:</b></td>
							<td width="50%" ><input type="text"
								name="maatricula"
								value="<%=rs.getString("numBastidor")%>" disabled size="15"></td>
						</tr>
						<tr>
							<td width="50%" ><b>Color:</b></td>
							<td width="50%" ><input type="text"
								name="color" value="<%=rs.getString("color")%>" size="15"></td>
						</tr>
						<tr>
							<td width="50%"><b>Numero de
									Asientos:</b></td>
							<td width="50%" ><input type="text"
								name="maatricula"
								value="<%=rs.getString("numAsientos")%>" disabled size="15"></td>
						</tr>
						<tr>
							<td width="50%" ><b>Precio:</b></td>
							<td width="50%"><input type="text"
								name="maatricula" value="<%=rs.getString("precio")%>" disabled
								size="15"></td>
						</tr>
						<tr>
							<td width="50%"><b>Numero de serie:</b></td>
							<td width="50%"><input type="text"
								name="maatricula" value="<%=rs.getString("numSerie")%>" disabled
								size="15"></td>
						</tr>
						<tr>
							<td width="50%"><b>Capacidad de carga:</b></td>
							<td width="50%"><input type="text"
								name="maatricula"
								value="<%=rs.getString("carga")%>" disabled size="15"></td>
						</tr>
						<tr>
							<td width="50%"><b>Tipo de mercancia:</b></td>
							<td width="50%"><input type="text"
								name="maatricula"
								value="<%=rs.getString("tipoMercancia")%>" disabled
								size="15"></td>
						</tr>
						
					</table >
					<p>

						<input type="submit" value="Confirmar" name="confirmar"
							class="btn btn-primary btn-lg" style="margin-top:10px; margin-left:43%;"> 
						<input type="reset"	value="Reset" name="reset" class="btn btn-primary btn-lg" style="margin-top:10px;">
					</p>
				</form>
			</td>
			
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
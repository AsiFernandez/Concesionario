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
<meta charset="ISO-8859-1">
<title>Editar Coche</title>
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
	<%
		try {
			Statement st = con.createStatement();
			String query = "SELECT v.Matricula,numBastidor,color,numAsientos,precio,numserie,numPuertas,capacidadMaletero FROM Vehiculos v, coche c WHERE (v.Matricula = c.Matricula) and v.Matricula='"
					+ matricula + "'";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
	%>


	<table border="1" width="50%">
		<tr>
			<td width="100%">
				<form method="POST" action="confirmarEditarCoches.jsp">
					<input type="hidden" name="matricula"
						value="<%=request.getParameter("matricula")%>">
					<h2 align="center">COMPRAR COCHE</h2>
					<table border="2" width="100%" bgColor="lightgreen">
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Matricula:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula"
								value="<%=rs.getString("matricula")%>" size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Numero de
									Bastidor:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula"
								value="<%=rs.getString("numBastidor")%>" disabled size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Color:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="color" value="<%=rs.getString("color")%>" size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Numero de
									Asientos:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula"
								value="<%=rs.getString("numAsientos")%>" disabled size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Precio:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula" value="<%=rs.getString("precio")%>" disabled
								size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Numero de serie:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula" value="<%=rs.getString("numSerie")%>" disabled
								size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Numero de
									puertas:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula"
								value="<%=rs.getString("numPuertas")%>" disabled size="15"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Capacidad de
									maletero:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="maatricula"
								value="<%=rs.getString("capacidadMaletero")%>" disabled
								size="15"></td>
						</tr>
					</table>
					<p>

						<input type="submit" value="Confirmar" name="confirmar"
							class="btn btn-primary btn-lg"> 
						<input type="reset"	value="Reset" name="reset" class="btn btn-primary btn-lg">
					</p>
				</form>
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
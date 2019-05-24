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
<title>Comprar coche</title>
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
			<td width="100%"><input type="hidden" name="matricula"
				value="<%=request.getParameter("matricula")%>">
				<h2 align="center">Comprar coche</h2>
				<table border="2" width="100%" bgColor="lightgreen">
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Matricula</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("matricula")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Numero de
								Bastidor</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("numBastidor")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Color</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("color")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Numero de
								Asientos</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("numAsientos")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Precio</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("precio")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Numero de serie</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("numSerie")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Carga</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("numPuertas")%></td>
					</tr>
					<tr>
						<td width="50%" bgColor="lightgreen"><b>Tipo de
								Mercancia</b></td>
						<td width="50%" bgColor="lightgreen"><%=rs.getString("capacidadMaletero")%></td>
					</tr>
				</table>
				<a style="font-size: 15px;"
					href="confirmarCompraCoches.jsp?Matricula=<%=rs.getString("Matricula")%>"
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
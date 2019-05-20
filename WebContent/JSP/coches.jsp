<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html"%>
<%
		String user = "ConexConcesionario";
		String contra = "zubiri";
		String url ="jdbc:mysql://10.18.124.58:3306/";
		String database = "concesionario";
		String driverDB = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driverDB);
		} catch(Exception ex){
		
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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>AJA</title>
	<link href="/media/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/heroic-features.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="../css/style.css">
  </head>
<body>
<!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="../index.html">AJA</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../index.html">Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="coches.jsp">Coches</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="camiones.jsp">Camiones</a>
      </li>
    </ul>
  </div>
</nav>
<!-- Page Content -->
	<div class="container">
		<br>
		<h1>Coches</h1>
		<table>
			<tr>
 			   	<th>Matricula</th>
 			   	<th>Numero de Bastidor</th>
    			<th>Color</th>
    			<th>numero de Asientos</th>
    			<th>Precio</th>
    			<th>Numero de serie</th>
				<th>Numero de Puertas</th>
				<th>Capacidad del Maletero</th>
				<th>Comprar Coche</th>
 			</tr>
		<%
		try{
		conn = DriverManager.getConnection(url+database, user, contra);
		st = conn.createStatement();
		String sql = "select * from vehiculos v, coche c where v.Matricula = c.Matricula";
		rs = st.executeQuery(sql);
		while(rs.next()){
		%>
			<tr> 
				<td><%=rs.getString("Matricula")%></td>
				<td><%=rs.getInt("numBastidor")%></td>
				<td><%=rs.getString("color")%></td>
				<td><%=rs.getInt("numAsientos")%></td>
				<td><%=rs.getFloat("precio")%></td>
				<td><%=rs.getInt("numSerie")%></td>
				<td><%=rs.getString("numPuertas")%></td>
				<td><%=rs.getInt("capacidadMaletero")%></td>
				<td><a href="delete.jsp?Matricula=<%=rs.getString("Matricula") %>" class="btn btn-primary btn-lg"> Comprar Camion </a></td>
			</tr>
		<%}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		%>
		</table>
		<a href="insertar.jsp">klk</a>
    </div>
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
  
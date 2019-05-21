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
		<%
			out.println("No se puede conectar con la base de datos");
		%>
		</font>
		<%
		}
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
		<h1>Camiones</h1>
		<%
		try {
			String numSerie = request.getParameter("numSerie");
			String marca = request.getParameter("marca");
		    String modelo = request.getParameter("modelo");
		    String a�oFab = request.getParameter("a�oFab");
			String matricula = request.getParameter("matricula");
			String numbast = request.getParameter("numbast");
			String color = request.getParameter("color");
		    String numAsientos = request.getParameter("numAsientos");
		    String precio = request.getParameter("precio");
		    String carga = request.getParameter("carga");
		    String mercancia = request.getParameter("mercancia");
			st.executeUpdate("insert into serie(NumSerie,marca,modelo,a�o_fab)values('"+numSerie+"','"+marca+"','"+modelo+"','"+a�oFab+"')");
			st.executeUpdate("insert into vehiculos(Matricula,numBastidor,color,numAsientos,precio,numSerie)values('"+matricula+"','"+numbast+"','"+color+"','"+numAsientos+"','"+precio+"','"+numSerie+"')");
			st.executeUpdate("insert into camion(Matricula,carga,tipoMercancia)values('"+matricula+"','"+carga+"','"+mercancia+"')");
		%>
		<font size="" color="green">
		<%
		out.println("Se ha agregado el camion con matricula "+matricula+" correctamente");
		%>
		</font>
		<%
		} catch(Exception ex){
		%>
		<font color="red">
		<%
			out.println("No se puede a�adir correctamente al camion, pruebe de nuevo.");
		%>
		</font>
		<%
		}
		%>
		<form method="post" action="index.jsp">
			<input type="button" value="Volver" onclick="location.href='../index.html'">
		</form>
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
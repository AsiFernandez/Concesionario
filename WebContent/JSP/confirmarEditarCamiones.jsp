<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String user = "ConexConcesionario";
	String contra = "zubiri";
	String url = "jdbc:mysql://10.18.124.58:3306/";
	String db = "concesionario";
	String driver = "com.mysql.jdbc.Driver";
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url + db, user, contra);
		st = conn.createStatement();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Editar camion</title>
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
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="index.html">AJA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.html">Inicio <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="JSP/coches.jsp">Coches</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="JSP/camiones.jsp">Camiones</a></li>
				<li class="nav-item"><a class="nav-link" href="series.jsp">Series</a>
				</li>
			</ul>
		</div>
	</nav>
<h1>Editar camion</h1>
	<%
	try { 
	String matricula2 = request.getParameter("maatricula"); 
	String kolor = request.getParameter("color"); 
	st.executeUpdate("UPDATE vehiculos SET color='" + kolor + "' WHERE Matricula='" + matricula2 +	"'"); 
	%>
	<font size="" color="green"> <%out.println("Se ha cambiado el color del camion con matricula "+matricula2+" al color "+kolor+" correctamente");%>
	</font>
	<%
	} catch(Exception ex){
	%>
	<font color="red"> <%
		out.println("No se puede modificar correctamente el color del coche, pruebe de nuevo.");
	%>
	</font>
	<%
	}
	%>
	<br>
	<a style="font-size: 15px;" href="camiones.jsp"
		class="btn btn-primary btn-lg">Volver a la tabla camiones</a>
</body>
</html>

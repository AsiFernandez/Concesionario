<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String stringMatricula = request.getParameter("Matricula");
	String url = "jdbc:mysql://10.18.124.58:3306/";
	String db = "concesionario";
	String driver = "com.mysql.jdbc.Driver";
	try {
		Class.forName(driver);
	} catch (Exception ex) {
		System.out.print(ex.getMessage());
	}
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<title>Compra camion</title>
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
<h1>Comprar camion</h1>
	<%
		try {
			conn = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
			st = conn.createStatement();
			String Query = "DELETE FROM vehiculos WHERE Matricula ='"+stringMatricula+ "'";
			st.executeUpdate(Query);
			out.println("<p> Camion vendido Correctamente </p>");
			out.println("<br>");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
	<a style="font-size: 15px;" href="camiones.jsp"
		class="btn btn-primary btn-lg">Volver a la tabla camiones</a>
</body>
</html>
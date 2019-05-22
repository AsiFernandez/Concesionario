<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String matrikula = request.getParameter("matricula");
	String kolor = request.getParameter("color");
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
<meta charset="ISO-8859-1">
<title>Confirmacion editar</title>
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
			conn = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
			st = conn.createStatement();
			String Query = "UPDATE vehiculos SET color ='" + kolor + "' where Matricula ='"+matrikula+"'";
			st.executeUpdate(Query);
			out.println("<p> Coche editado correctamente. </p>");
			out.println("<br>");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
	<a style="font-size: 15px;" href="coches.jsp"
		class="btn btn-primary btn-lg">Volver</a>
</body>
</html>

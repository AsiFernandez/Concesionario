<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>

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
		out.println("<style>  p {font-family: arial;" + " color: red; font-size: 16;   }; " + "</style>");
		out.println("<style>  a,b {font-family: arial;" + " color: blue; font-size: 16;   }; " + "</style>");
	%>
	<%
		
		Connection con = null;
		String url = "jdbc:mysql://10.18.124.58:3306/";
		String db = "concesionario";
		String driver = "com.mysql.jdbc.Driver";
		String matricula2 = request.getParameter("maatricula");
		String color2 = request.getParameter("color");
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
			try {
				Statement st = con.createStatement();
				st.executeUpdate("UPDATE vehiculos SET color='" + color2 + "' WHERE Matricula='" + matricula2 + "'");
				out.println("<p> The record of " + "<b>" + color2 + "</b>" + " is successfully updated. </p>");
				out.println("<br>");
			} catch (SQLException ex) {
				System.out.print(ex.getMessage());
			}
		} catch (Exception e) {
			e.getMessage();
			
		}
	%>

	<a style="font-size: 15px;" href="coches.jsp"
		class="btn btn-primary btn-lg">Volver</a>
</body>
</html>

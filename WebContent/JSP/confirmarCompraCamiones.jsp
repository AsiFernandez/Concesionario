<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
	String matricula = request.getParameter("Matricula");
	Connection con = null;
	String url = "jdbc:mysql://10.18.124.58/";
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
<title>Confirmacion Compra</title>
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
		String matriculaS = request.getParameter("Matricula");
		int i=0;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
			try {
				Statement st = con.createStatement();
				i = st.executeUpdate("DELETE  FROM vehiculos WHERE Matricula='" + matriculaS+"'");
				con.close();
				out.println("<p> The record is successfully deleted. </p>");
				out.println("<br>");
				out.println("<a href='camiones.jsp'> RETURN TO MAIN PAGE </a>");
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		} catch (Exception e) {
			e.getMessage();
		}
	%>

</body>
</html>
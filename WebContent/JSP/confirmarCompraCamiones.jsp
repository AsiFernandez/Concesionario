<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
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
		String matricula = request.getParameter("Matricula");
		Connection con = null;
		String url = "jdbc:mysql://10.18.124.58:3306/";
		String db = "concesionario";
		String driver = "com.mysql.jdbc.Driver";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url + db, "ConexConcesionario", "zubiri");
			try {
				Statement st = con.createStatement();
				String name = request.getParameter("name");
				String Query=  "DELETE FROM vehiculos v, camion c WHERE v.numBastidor = c.numBastidor and v.numBastidor='" + matricula + "'";
				st.executeUpdate(Query);
				con.close();
				out.println("<p> The record is successfully deleted. </p>");
				out.println("<br>");
				out.println("<a href='camiones.jsp'> RETURN TO MAIN PAGE </a>");
			} catch (SQLException ex) {
				System.out.println("SQL statement is not executed!");
			}
		} catch(SQLException se) {
			   se.printStackTrace();
		} finally {
		   try {
		      if (con!=null) con.close();
		   } catch (SQLException se) {
		      se.printStackTrace();
		   }
		}
	%>

</body>
</html>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Concesionario</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<table>
  	<tr>
    	<th>Matricula</th>
    	<th>Numero de Bastidor</th>
    	<th>Color</th>
    	<th>numero de Asientos</th>
    	<th>Precio</th>
    	<th>Serie</th>
		<th>Numero de Puertas</th>
		<th>Capacidad del Maletero</th>
 	</tr>
<%
try{
	String url =" jdbc:mysql://10.18.124.58:3306/concesionario";
	Class.forName("com.jdbc.mysql.Driver");
	Connection Con = DriverManager.getConnection("url", "ConexConcesionario", "zubiri");
	Statement st = Con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM vehiculos v, coche c WHERE v.matricula = c.matricula");
	while (rs.next()) {
		String matricula = rs.getString("Matricula");
		String numBas = rs.getString("numBastidor");
%>

	<tr>
		<td bgColor="lightgreen" vAlign="top" width="110" height="19"><%=matricula%></td>
		<td bgColor="lightgreen" vAlign="top" width="224" height="19"><%=numBas%></td>
		<td bgColor="lightgreen" vAlign="top" width="230" height="19"><%=rs.getString(4)%></td>
		<td bgColor="lightgreen" vAlign="top" width="220" height="19" >
    		<a href="edit.jsp?id=<%=rs.getInt("id")%>"> Edit Record </a></td>
		<td bgColor="lightgreen" vAlign="top" width="230" height="19">
    		<a href="delete.jsp?id=<%=rs.getInt("id")%>"> Delete Record </a></td>
		</tr>
<% }
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</body>
</html>

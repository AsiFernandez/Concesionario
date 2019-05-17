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
	String url ="jdbc:mysql://10.18.124.58:3306/concesionario";
	Class.forName("com.jdbc.mysql.Driver");
	Connection Con = DriverManager.getConnection("url", "ConexConcesionario", "zubiri");
	Statement st = Con.createStatement();
	String sql = "SELECT * FROM vehiculos";
	ResultSet rs = null;
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
	</tr>
<%}

}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</body>
</html>

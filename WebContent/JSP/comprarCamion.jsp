<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String matricula =request.getParameter("Matricula");

Connection con = null;
String url = "jdbc:mysql://10.18.124.58:3306/";;
String db = "concesionario";
String driver = "com.mysql.jdbc.Driver";
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,"ConexConcesionario","zubiri");
try{
Statement st = con.createStatement();
String query = "SELECT Matricula,numBastidor,color,numAsientos,precio,numserie,carga,tipoMercancia FROM Vehiculos v INNER JOIN camiones c WHERE Matricula="+matricula;
ResultSet rs = st.executeQuery(query);
while (rs.next()) {		
%>

<table border="1" width="50%">
	<tr>
		<td width="100%">
			<form method="POST" action="update.jsp">
			<input type="hidden" name="id" value="<%=request.getParameter("matricula")%>">
			<h2 align="center">UPDATE RECORD</h2>
				<table border="2"  width="100%" bgColor="lightgreen">

					<tr>
					<td width="50%" bgColor="lightgreen"><b>Name:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="matricula" value="<%=rs.getString("matricula")%>" size="50"/> </td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>City:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="numBastidor" value="<%=rs.getString("numBastidor")%>"  size="50"></td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>Telephone:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="color" value="<%=rs.getString("color")%>"  size="15"></td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>Name:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="numAsientos" value="<%=rs.getString("numAsientos")%>" size="50"/> </td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>City:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="precio" value="<%=rs.getString("precio")%>"  size="50"></td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>Telephone:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="numSerie" value="<%=rs.getString("numSerie")%>"  size="15"></td>
					</tr>
				</table>
<p><input type="submit" value="Update" name="submit">
<input type="reset" value="Reset" name="reset"></p>

</form>
</td>
</tr>
</table>
<%

}}
catch (SQLException ex){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}

%>
</body>
</html>
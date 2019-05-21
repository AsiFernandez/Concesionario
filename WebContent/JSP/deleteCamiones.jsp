<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comprar Camion </title>
<!-- https://bootswatch.com/materia/ -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="/media/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/heroic-features.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="../css/style.css"></head>
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
String query = "SELECT Matricula,numBastidor,color,numAsientos,precio,numserie,d FROM student_info WHERE id="+matricula;
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
					<td width="50%" bgColor="lightgreen"><input type="text" name="name"
					    value="<%=rs.getString("name")%>" size="50"/> </td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>City:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="city" value="<%=rs.getString("city")%>" size="50"></td>
					</tr>
					<tr>
					<td width="50%" bgColor="lightgreen"><b>Telephone:</b></td>
					<td width="50%" bgColor="lightgreen"><input type="text" name="phone" value="<%=rs.getString("phone")%>" size="15"></td>
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
<footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; AJA 2019</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</html>
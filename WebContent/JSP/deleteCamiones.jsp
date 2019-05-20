<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comprar Camion>
<!-- https://bootswatch.com/materia/ -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>AJA</title>
	<link href="/media/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/heroic-features.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
String strId =request.getParameter("Matricula");
int id = Integer.parseInt(strId);    
    try{
    	Class.forName("com.mysql.jdbc.Driver");
  
    	Connection con = DriverManager.getConnection("jdbc:mysql://10.18.124.58/Concesionario", "ConexConcesionario", "zubiri");
    try{
    	Statement st = con.createStatement();
    	String query = "SELECT Matricula,numBastidor,color,numAsientos,precio,numserie,carga,tipoMercancia FROM vehiculos v INNER JOIN camion c where v.Matricula = c.Matricula";
    	ResultSet rs = st.executeQuery(query);
    	while(rs.next()){
    		
    		
%>

	<table border="2"  width="100%" bgColor="lightgreen">
		<form method="POST" action="ConfirmarCamion.jsp">
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Matricula:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("Matricula")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Numero de Bastidor:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("numBastidor")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Color:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("color")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Numero de Asientos:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("numAsientos")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Precio:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("precio")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Numero de Serie:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("numSerie")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Carga:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("carca")%>" size="50"/> </td>
		</tr>
		<tr>
			<td width="50%" bgColor="lightgreen"><b>Tipo de Mercancia:</b></td>
			<td width="50%" bgColor="lightgreen"><input type="text" name="name" value="<%=rs.getString("tipoMercancia")%>" size="50"/> </td>
		</tr>
	
</form>
<%}

rs.close();	
con.close();

}
catch (){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>

<footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; AJA 2019</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
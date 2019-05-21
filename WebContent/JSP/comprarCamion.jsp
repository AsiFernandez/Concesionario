<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<%
		String user = "ConexConcesionario";
		String contra = "zubiri";
		String url ="jdbc:mysql://10.18.124.58:3306/";
		String database = "concesionario";
		String driverDB = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driverDB);
		} catch(Exception ex){
		
		}
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		try{
			String matricula = request.getParameter("matricula");
			st = conn.createStatement();
			String sql = "SELECT Matricula,numBastidor,color,numAsientos,precio,numserie,carga,tipoMercancia FROM Vehiculos v INNER JOIN camiones c WHERE Matricula='"+matricula+"'";
			rs = st.executeQuery(sql);
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
								<td width="50%" bgColor="lightgreen"><b>Matricula:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="matricula" value="<%=rs.getString("matricula")%>" size="50"/> </td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Numero de Bastidor:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="numBastidor" value="<%=rs.getString("numBastidor")%>"  size="50"></td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Color:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="color" value="<%=rs.getString("color")%>"  size="15"></td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Numero de Asientos:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="numAsientos" value="<%=rs.getString("numAsientos")%>" size="50"/> </td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Precio:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="precio" value="<%=rs.getString("precio")%>"  size="50"></td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Numero de serie:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="numSerie" value="<%=rs.getString("numSerie")%>"  size="15"></td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Carga:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="precio" value="<%=rs.getString("carga")%>"  size="50"></td>
							</tr>
							<tr>
								<td width="50%" bgColor="lightgreen"><b>Tipo de Mercancia:</b></td>
								<td width="50%" bgColor="lightgreen"><input type="text" name="numSerie" value="<%=rs.getString("tipoMercancia")%>"  size="15"></td>
							</tr>
						</table>
						<input type="submit" value="Update" name="submit">
						<input type="reset" value="Reset" name="reset">
					</form>
				</td>
			</tr>
		</table>
		<%
		}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		%>
	</body>
</html>
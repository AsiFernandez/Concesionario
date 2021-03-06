<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">

<head>
<!-- https://bootswatch.com/materia/ -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insertar serie</title>
<link href="/media/open-iconic/font/css/open-iconic-bootstrap.css"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../css/heroic-features.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="../../css/style.css">
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="../index.html">AJA</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="../index.html">Inicio</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../Coches/coches.jsp">Coches</a></li>
				<li class="nav-item"><a class="nav-link" href="../Camiones/camiones.jsp">Camiones</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="series.jsp">Series</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">
		<h1>Insertar serie</h1>
		<form method="post" action="verificarInsertarSerie.jsp">
			<h4>Serie</h4>
			<p>Numero de serie:</p>
			<input name="numSerie">
			<p>Marca:</p>
			<input name="marca">
			<p>Modelo:</p>
			<input name="modelo">
			<p>A�o de fabricacion:</p>
			<input name="a�oFab"> <br> <br>
			<input type="submit" value="Insertar Datos" class="btn btn-primary btn-lg"> <br> <br>
		</form>
	</div>
	<!-- /.container -->

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
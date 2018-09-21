<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.DaoOperations"%>
<!DOCTYPE html>
<html>
<head>
<title>HelpDesk</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="icon" type="" href="" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('input#t1,input#t2').characterCounter();
	});
</script>
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="inner">
			<a href="Index.jsp" class="logo"><strong>  HELPDESK</strong> by
				MANTECH</a>
			<nav id="nav">
				<a href="Index.jsp">Home</a>
			</nav>
			<a href="#navPanel" class="navPanelToggle"><span
				class="fa fa-bars"></span></a>
		</div>
	</header>
	<!-- Banner -->
	<section id="banner">
		<div class="inner">
		<h1>Your Problem Our Solution!!!</h1>
			<div class="flex "></div>

			<div class="container">
				<div class="row">
					<div class="col-md-12 "
						style="font-family: inherit; color:maroon; font-size: 25px; text-align: center">


					</div>
					<div class="col-md-4 ">
					<marquee><big><legend style="color:white; text-align:left">CREDENTIALS</legend></big></marquee>
						<hr>
						<form role="form" method="post" action="">
							<fieldset>
								<legend style="color:white;">Log-In Here</legend>
								<div class="form-group" style="color:white; text-align:left;">
									<span class="glyphicon glyphicon-user" aria-hidden="true" style="color:white; align:left"></span>
									<label for="t1" style="color:white; text-align:left">User Name</label> <input type="text"
										class="form-control" id="t1" name="t1"
										placeholder="Enter User Name" style="color:white" required>
								</div>
								<div class="form-group" style="color:white; text-align:left;">
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true" style="color:white; text-align:left"></span>
									<label for="t2" style="color:white; text-align:left">Password</label> <input type="password"
										class="form-control" id="t2" name="t2" placeholder="Password" style="color:white"
										required>
								</div>
								<input type="submit" class="btn btn-primary" value="Login" />
								<%
									if (request.getParameter("t1") != null || request.getParameter("t2") != null) {
										String un = request.getParameter("t1");
										String pw = request.getParameter("t2");
										System.out.print("username : " + un);
										System.out.print("password : " + pw);
										DaoOperations daop = new DaoOperations();
										if (daop.isValid(un, pw)) {
											String role = daop.getRole(un);
											if (role.equalsIgnoreCase("admin")) {
												response.sendRedirect("admin.jsp");
												System.out.print("inside admin if ------->");
											}

											if (role.equalsIgnoreCase("technician")) {
												response.sendRedirect("technician.jsp");
												System.out.print("inside technician if ------->");
											}

											if (role.equalsIgnoreCase("employee")) {
												response.sendRedirect("employee.jsp");
												System.out.print("inside employee if ------->");
											}

										} else {
											%>
											<script>
											alert("Invalid Credentials--Redirected To Home Page");
											window.location = 'Index.jsp';
											</script>
											<%
										}
									}
								%>
							</fieldset>
						</form>
					</div>
					<div class="col-md-8 ">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="images\rawpixel-652547-unsplash.jpg" alt="HelpDesk1"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="images\helloquence-61189-unsplash.jpg" alt="Chicago"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="images\rawpixel-665384-unsplash.jpg" alt="New York"
										style="width: 100%;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</div>


				<footer>
					<a href="registration.jsp" class="button"><span class="icon fa-user"
						aria-hidden="true">&nbsp;Request New Account</span></a>
						<!-- Copyright -->
	<div class="footer-copyright text-center py-5" style="font-family: inherit; color:white;">© 2018 Copyright:</div>
	<!-- Copyright -->
				</footer>
			</div>
	</section>

	</div>
	
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>

</html>
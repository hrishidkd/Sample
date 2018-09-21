<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.DaoOperations"%>
<!DOCTYPE html>
<html>
<head>
<title>HelpDesk</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('input#t1,input#t2').characterCounter();
	});
</script>
<script type="text/css">
body {
   margin:0;
   padding:0;
   height:100%;
}
#footer {
   position:absolute;
   bottom:0;
   width:100%;
   height:80px;   /* Height of the footer */
   background:red;
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 "
				style="font-family: inherit; color: maroon; font-size: 35px; text-align: center">


			</div>

			<div class="col-md-4 ">
				<hr>
				<form role="form" method="post" action="">
					<fieldset>
						<legend>CREDENTIALS</legend>
						<div class="form-group">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<label for="t1">User Name</label> <input type="text"
								class="form-control" id="t1" name="t1"
								placeholder="Enter User Name" required>
						</div>
						<div class="form-group">
							<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
							<label for="t2">Password</label> <input type="password"
								class="form-control" id="t2" name="t2" placeholder="Password"
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
									response.sendRedirect("Index.jsp");
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
      <img src="D:\ProjectImg\4.jpg" alt="HelpDesk1" style="width:100%;">
    </div>

    <div class="item">
      <img src="D:\ProjectImg\5.jpg" alt="Chicago" style="width:100%;">
    </div>

    <div class="item">
      <img src="D:\ProjectImg\6.jpg" alt="New York" style="width:100%;">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
			</div>
		</div>
		
	</div>
	<!-- Copyright -->
				<div class="footer-copyright text-left py-3">© 2018 Copyright:
				</div>
				<!-- Copyright -->
</body>

</html>
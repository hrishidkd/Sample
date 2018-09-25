<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>HELPDESK</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
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
	function Validate() {
		var password = document.getElementById("t3").value;
		var confirmPassword = document.getElementById("t4").value;
		if (password != confirmPassword) {
			alert("Passwords do not match.");
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
function vphone(){
	var mphone=document.getElementById("t6").value;
	var mlen=mphone.length();
	if(mlen<10 && mlen>10){
		alert("not a valid phone number");
		return false;
	}
}
</script>
</head>
<body>
	<header id="header">
	<div class="inner">
		<a href="Index.jsp" class="logo"><strong>HELPDESK</strong> by
			MANTECH</a>
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
					style="font-family: inherit; color: maroon; font-size: 25px; text-align: center">


				</div>

				<form role="form" method="post" action="" form-align="centre" name="form1">
					<div class="container center_div">
						<big style="color: white; text-align: centre; font-size: 20px">CREDENTIALS</big>
						<fieldset>
							<legend style="color: white;">Register Here</legend>
							<div class="form-group" style="color: white; text-align: left;">
								<span class="glyphicon glyphicon-user" aria-hidden="true"
									style="color: white; align: left"></span> <label for="t1"
									style="color: white; text-align: left; font-size: 16px">Name</label>
								<input type="text" class="form-control" id="t1" name="t1"
									placeholder="Enter Name" style="color: white" required>
							</div>
							<div class="form-group" style="color: white; text-align: left;">
								<span class="glyphicon glyphicon-user" aria-hidden="true"
									style="color: white; align: left"></span> <label for="t2"
									style="color: white; text-align: left; font-size: 16px">User
									Name</label> <input type="text" class="form-control" id="t2" name="t2"
									placeholder="Enter User Name" style="color: white" required>
							</div>
							<div class="form-group" style="color: white; text-align: left;">
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"
									style="color: white; text-align: left"></span> <label for="t3"
									style="color: white; text-align: left; font-size: 16px">Password</label>
								<input type="password" class="form-control" id="t3" name="t3"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
									title="Must contain at least one number, one uppercase and lowercase letter, at least 8 and at most 20 letters"
									placeholder="Password" style="color: white" data-minlength="8"
									data-maxlength="20" required>

								<div class="form-group" style="color: white; text-align: left;">
									<span class="glyphicon glyphicon-eye-open" aria-hidden="true"
										style="color: white; text-align: left"></span> <label for="t4"
										style="color: white; text-align: left; font-size: 16px">Confirm
										Password</label> <input type="password" class="form-control" id="t4"
										name="t4" placeholder="Confirm Password" style="color: white"
										required>
								</div>
								<div class="form-group" style="color: white; text-align: left;">
									<span class="glyphicon glyphicon-envelope" aria-hidden="true"
										style="color: white; align: left"></span> <label for="t5"
										style="color: white; text-align: left; font-size: 16px">Email</label>
									<input type="email" class="form-control" id="t5" name="t5"
										placeholder="Enter Email" style="color: white" required>
								</div>
								<div class="form-group" style="color: white; text-align: left;">
									<span class="glyphicon glyphicon-earphone" aria-hidden="true"
										style="color: white; align: left"></span> <label for="t6"
										style="color: white; text-align: left; font-size: 16px">Mobile
										Number</label> <input type="number" class="form-control" id="t6"
										name="t6" placeholder="Enter Mobile Number"
										style="color: white" minlength="10"
									maxlength="10" title="please enter a valid phone no" required>
								</div>
								<input type="submit" class="btn btn-primary" value="Register Me"
									onclick="Validate() vphone()" />
						</fieldset>
					</div>
				</form>
			</div>


			<footer> <!-- Copyright -->
			<div class="footer-copyright text-center py-5"
				style="font-family: inherit; color: white;">� 2018 Copyright:</div>
			<!-- Copyright --> </footer>
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
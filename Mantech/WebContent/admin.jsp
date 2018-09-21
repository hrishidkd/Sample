<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<style type="text/css">
main {
   margin:0;
   padding:0;
   height:100%;
}
#container {
   min-height:100%;
   position:relative;
}
#header {
   background:#ff0;
   padding:10px;
}
#main {
   padding:10px;
   padding-bottom:60px;   /* Height of the footer */
}
#footer {
   position:absolute;
   bottom:0;
   width:100%;
   height:60px;   /* Height of the footer */
   background:#6cf;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-8 " style="font-family:inherit;color:maroon;font-size:35px;text-align:left">
	
	MANTECH HELPDESK
</div>
<div class="col-md-8 ">
<%
	%>
	<form action="" method="post"  role="form" >
	<table class="table">
	<tr>
		<td>UserName</td>
		<td><input type="text" name="t1" value="<%=rs.getString(3) %>" readonly="true" /></td>
	</tr>	
	<tr>
		<td>Customer ID</td>
		<td><input type="text" name="t2" value="<%=rs.getString(2) %>" /></td>
	</tr>
        <tr>
		<td>Name</td>
		<td><input type="text" name="t7" value="<%=rs.getString(7) %>" /></td>
	</tr>
	<tr>
		<td>Account Status</td>
		<td><input type="text" name="t3" value="<%=rs.getString(3) %>" /></td>
	</tr>	
	<tr>
		<td>Account Opening Date</td>
		<td><input type="text" name="t4" value="<%=rs.getString(4) %>" /></td>
	</tr>	
	<tr>
		<td>Account Type</td>
		<td><input type="text" name="t5" value="<%=rs.getString(5) %>" /></td>
	</tr>
        <tr>
		<td>Account Balance</td>
		<td><input type="text" name="t6" value="<%=rs.getString(6) %>" /></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Update" name="btn_update" class="btn btn-success" /></td>
	</tr>
	<tr>
	<td cospan="2">
	<%
	if(request.getParameter("btn_update")!=null)
	{
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1","root","");
		st=con.createStatement();
		String idd=request.getParameter("t1");
		String name=request.getParameter("t2");
                String nm=request.getParameter("t7");
		String course=request.getParameter("t3");
		String branch=request.getParameter("t4");
		String sem=request.getParameter("t5");
                String semm=request.getParameter("t6");
		String sq="update customerinfo set customerid='"+name+"',accountstatus='"+course+"',Name='"+nm+"',accopendate='"+branch+"',acctype='"+sem+"',accbalance='"+semm+"' where accountno='"+idd+"'";
		int res=st.executeUpdate(sq);
		if(res!=0)
			response.sendRedirect("aupdateinfo.jsp");
	}		
	%>
	</td>
	</tr>
	</form>			
	<%
	}catch(Exception e)
	{
		out.println(e.toString());
	}
%>
<div class="col-md-2 ">
</div>

</div>
</div>
</body>
</html>
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">

<title>Nainital Bank Ltd | home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">

<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	
	<c:import url="navbar.jsp" />
	<c:choose>
		<c:when test="${mode=='MODE_HOME' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
				    <img src="/images/logo.png" alt="Italian Trulli"
				    width="650"
                    height="150"
                    style="border: 5px solid black; vertical-align:middle; ">
					<h1>Welcome to Nainital Bank Ltd</h1>
					<h3>One Stop Solution For All Your Banking Related Problems</h3>
				</div>
			</div>
			<br>
			<hr>
			<!--img src="/images/002.jpg" alt="E-Complaints" width="650"
				height="300"
				style="border: 5px solid black; vertical-align:middle; "-->
			<br>
			<hr>
			<div class="w3-content w3-container w3-padding-30" id="about">
				<h3 class="jumbotron text-center">ABOUT US</h3>
				<h4 class="jumbotron text-center">E-Complaints is a facility
					provided by Nainital Bank Ltd for customers to log their complaints
					online regarding their queries related banking and online
					transactions. It ensures comfortably with the customers and build a
					trust relationship with the banking facilities and amenities. We
					make sure to answer all your queries in the stipulated time, we
					request you to kindly register yourself first in this portal to
					file a compliant.</h4>

			</div>
		</c:when>

		<c:when test="${mode=='MODE_REGISTER' }">
			<div class="container text-center">
				<h3>New Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								id="username" placeholder="Enter your username" min=8 max=8
								required value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								id="firstname" placeholder="Enter your firstname" required
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								id="lastname" placeholder="Enter your lastname" required
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mobile No. </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="mobileno"
								pattern="[7-9]{1}[0-9]{9}" max=10 maxlength="10" id="mobileno"
								placeholder="Use numbers only" style="color: black;" required
								value="${user.mobileno }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Email ID </label>
						<div class="col-md-3">
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="Enter your email" required
								value="${user.emailid }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
			<div class="form-group ">
            						<input type="submit" class="btn btn-primary" value="Register" />
            					</div>
            				</form>
            			</div>
		</c:when>
		<c:when test="${mode=='ALL_USERS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Users</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>UserName</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Mobile No.</th>
								<th>Email ID</th>
								<th>Edit</th>
								<th>Delete</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.firstname}</td>
									<td>${user.lastname}</td>
									<td>${user.mobileno}</td>
									<td>${user.emailid}</td>


									<td><a href="/edit-user?id=${user.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="/delete-user?id=${user.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								id="username" placeholder="Enter your username" required
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								id="firstname" placeholder="Enter your firstname" required
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								id="lastname" placeholder="Enter your lastname" required
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mobile No. </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="Mobileno"
								pattern="[7-9]{1}[0-9]{9}" max=10 maxlength="10" id="Mobileno"
								placeholder="Use Numbers only" style="color: black;" required
								value="${user.mobileno }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Email ID</label>
						<div class="col-md-3">
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="Enter your email" required
								value="${user.emailid }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								id="password" required value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>User Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-user">
					<c:if test="${not empty error }">
						<div class="alert alert-danger">
							<c:out value="${error }"></c:out>
						</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								id="User Name" placeholder="Enter your username Here" required
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="Password"
								id="Password" required value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="Submit" class="btn btn-primary" value="Login" />
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>
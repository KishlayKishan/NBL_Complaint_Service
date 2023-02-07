<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>Nainital Bank Ltd | Complaints</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">

</head>

<body>
	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/welcome" class="navbar-brand">Nainital Bank Ltd</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/show-complaints">All Complaints</a></li>
					<li><a href="/adminRegistration">Admin Registration</a></li>
					<li><a href="/logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode=='MODE_HOME' }">
			<div class="container" id="homediv">
				<div class="jumbotron text-center">
					<h1>Welcome to Nainital Bank Ltd</h1>
					<br>
					<h3>Admin Panel</h3>
				</div>
			</div>
			<div class="container text-centered">
				<div class="alert alert-success">
					<h3>Follow all the Standard Procedures!</h3>
					<h4>Accomplish Rectification Of Complaints As Soon As Possible</h4>
					<br> <a href="/get-form">Click Here To Register a new
						Admin</a>
				</div>
			</div>
			<br>
			<div class="container text-centered">
				<div class="alert alert-success">
				<h3>Objectives</h3>
					<h4>Assign Priority to Complaint -Set- [Low, Medium, High] as per the sincerity of the issue filled!</h4>
					<h4>Set the Status of the complaint -Set- [Open/Closed] after solving the query raised.</h4>
					<br>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_REGISTER' }">
			<div class="container text-center">
				<h3>Admin Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-admin">
					<input type="hidden" name="id" value="${admin.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								id="username" placeholder="Enter your username" min=8 max=8
								required value="${admin.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								id="firstname" placeholder="Enter your firstname"
								required="required" value="${admin.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								id="lastname" placeholder="Enter your lastname"
								required="required" value="${admin.lastname }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Branch Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="branchname"
								id="branchname" placeholder="Enter your branchname"
								required="required" value="${admin.branchname }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Location</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="location"
								id="location" placeholder="Enter your Branch location"
								required="required" value="${admin.location }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mobile No. </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="mobileno"
								pattern="[7-9]{1}[0-9]{9}" max=10 maxlength="10" id="mobileno"
								placeholder="Use numbers only" style="color: black;"
								required="required" value="${admin.mobileno }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Email ID </label>
						<div class="col-md-3">
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="Enter your email" required="required"
								value="${admin.emailid }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${admin.password }" />
						</div>
					</div>

					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_LOGIN' }">
			<div class="container text-center">
				<h3>Admin Login</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="/login-admin">
					<c:if test="${not empty error }">
						<div class="alert alert-danger">
							<c:out value="${error }"></c:out>
						</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								id="username" placeholder="Enter your username"
								required="required" value="${admin.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="********" required="required"
								value="${admin.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Login" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='ALL_COMPLAINTS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Complaints</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email ID</th>
								<th>Account No</th>
								<th>Category</th>
								<th>Sub Category</th>
								<th>Details</th>
								<th>Priority</th>
								<th>Status</th>
								<th>Edit</th>
								<th>Delete</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="complaint" items="${complaints }">
								<tr>
									<td>${complaint.id}</td>
									<td>${complaint.firstname}</td>
									<td>${complaint.lastname}</td>
									<td>${complaint.emailid}</td>
									<td>${complaint.accountno}</td>
									<td>${complaint.category}</td>
									<td>${complaint.subcategory}</td>
									<td>${complaint.details}</td>
									<td>${complaint.priority}</td>
									<td>${complaint.status}</td>



									<td><a href="/edit-status?id=${complaint.id }"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="/delete-complaint?id=${complaint.id }"><span
											class="glyphicon glyphicon-trash"></span></a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</c:when>

	</c:choose>

</body>
</html>

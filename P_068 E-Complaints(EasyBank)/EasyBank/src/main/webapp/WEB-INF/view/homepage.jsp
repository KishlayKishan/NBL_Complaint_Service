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
					<li><a href="/checkStatus">Check Status</a></li>
					<li><a href="/contact">Contact Us</a></li>
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
					<h3>You Successfully Logged In</h3>
				</div>
			</div>
			<div class="container text-centered">
				<div class="alert alert-success">
					<h3>We are here to assist you!</h3>
					<br>
					<h4>Please complete the form below for your complaints.</h4>
					<br> <a href="/get-form">Click Here To Open</a>
				</div>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_FORM' }">
			<div class="container text-center">
				<h3>Complaint Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-complaint">
					<input type="hidden" name="id" value="${complaint.id }" />
					<!-- <div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									id="username" placeholder="Enter your username" min=8 max=8
									required value="${user.username }" />
							</div>
						</div> -->
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								id="firstname" placeholder="Enter your firstname"
								required="required" value="${complaint.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								id="lastname" placeholder="Enter your lastname"
								required="required" value="${complaint.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Mobile No. </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="mobileno"
								pattern="[7-9]{1}[0-9]{9}" max=10 maxlength="10" id="mobileno"
								placeholder="Use numbers only" style="color: black;"
								required="required" value="${complaint.mobileno }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Email ID </label>
						<div class="col-md-3">
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="Enter your email" required="required"
								value="${complaint.emailid }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Account No</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="accountno"
								id="accountno" placeholder="Enter account no" maxlength="12"
								pattern="[0-9]{12}" required="required"
								value="${complaint.accountno }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Category</label>
						<div class="col-md-7">
							<select input type="text" class="form-control" name="category"
								id="category" placeholder="Enter nature of complaint"
								required="required" value="${complaint.category }">
								<option value="Card Dispute">Card Dispute</option>
								<option value="Stop Payment of Cheque">Stop Payment of
									Cheque</option>
								<option value="Online Banking">Online Banking</option>
								<option value="Activate SMS Alert">Activate SMS Alert</option>
								<option value="Statement Request">Statement Request</option>
							</select>

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Sub Category</label>
						<div class="col-md-7">
							<select input type="text" class="form-control" name="subcategory"
								id="subcategory" placeholder="Optional" required="required"
								value="${complaint.subcategory }">
								<option value="Card Block">Card Block</option>
								<option value="Fraud/Report Unauthorized Transactions">Fraud/Report
									Unauthorized Transactions</option>
								<option value="Hotlist/Re-isssue/Upgrade">Hotlist/Re-isssue/Upgrade</option>
								<option value="Check Related Errors">Check Related
									Errors</option>
								<option value="Optional">Optional</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Details of the
							Complaint</label>
						<div class="col-md-7">
							<textarea input type="text" class="form-control" name="details"
								id="details" placeholder="Describe Your Complaint in Brief ?"
								cols="40" rows="4" required="required" value="${complaint.details }">
							</textarea>
						</div>
					</div>



					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Send" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='MODE_UPDATE' }">
			<div class="container text-center">
				<h3>Update User</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-complaint">
					<input type="hidden" name="id" value="${complaint.id }" />
					<!-- <div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									id="username" placeholder="Enter your username" min=8 max=8
									required value="${user.username }" />
							</div>
						</div> -->
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								id="firstname" placeholder="Enter your firstname"
								required="required" value="${complaint.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								id="lastname" placeholder="Enter your lastname"
								required="required" value="${complaint.lastname }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Email ID </label>
						<div class="col-md-3">
							<input type="email" class="form-control" name="emailid"
								id="emailid" placeholder="Enter your email" required="required"
								value="${complaint.emailid }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Account No</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="accountno"
								id="accountno" placeholder="Enter account no"
								required="required" value="${complaint.accountno }" />
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Category</label>
						<div class="col-md-7">
							<select input type="text" class="form-control" name="category"
								id="category" placeholder="Enter nature of complaint"
								required="required" value="${complaint.category }">
								<option value="Card Dispute">Card Dispute</option>
								<option value="Stop Payment of Cheque">Stop Payment of
									Cheque</option>
								<option value="Online Banking">Online Banking</option>
								<option value="Activate SMS Alert">Activate SMS Alert</option>
								<option value="Statement Request">Statement Request</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Sub Category</label>
						<div class="col-md-7">
							<select input type="text" class="form-control" name="subcategory"
								id="subcategory" placeholder="Optional" required="required"
								value="${complaint.subcategory }">
								<option value="Card Block">Card Block</option>
								<option value="Fraud/Report Unauthorized Transactions">Fraud/Report
									Unauthorized Transactions</option>
								<option value="Hotlist/Re-isssue/Upgrade">Hotlist/Re-isssue/Upgrade</option>
								<option value="Check Related Errors">Check Related
									Errors</option>
								<option value="Optional">Optional</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Details of the
							Complaint</label>
						<div class="col-md-7">
							<textarea input type="text" class="form-control" name="details"
								id="details" placeholder="Describe Your Complaint in Brief ?"
								cols="40" rows="4" required="required" value="${complaint.details }">
							</textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Set Priority</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="priority"
								id="priority" placeholder="low" required="required"
								value="${complaint.priority }">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Set Status</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="status" id="status"
								placeholder="Open" required="required"
								value="${complaint.status }">
						</div>
					</div>

					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Update" />
					</div>
				</form>
			</div>
		</c:when>

		<c:when test="${mode=='CHECKSTATUS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>All Complaint Status</h3>
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

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</c:when>

		<c:when test="${mode=='CONTACT_US'}">
			<div class="container text-center" id="tasksDiv">
				<div class="jumbotron text-center">
					<h3>Contact Us</h3>
					<hr>
					<br>
					<h4>Email: asupport@easybankltd.com</h4>
					<br>
					<h4>Contact Number: 1800 180 4031</h4>
					<br>
					<h4>
						Address: The Nainital Bank Limited,
						Seven Oaks Building, Mallital,
						NainitalUttarakhand - 263001
					</h4>
					<br>
				</div>
			</div>
		</c:when>


	</c:choose>
</body>
</html>
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<c:import url="navbar.jsp" />
	<!-- ${sessionScope.user_role} -->
	<c:choose>
		<c:when test="${mode=='MODE_HOME'}">
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
						<label class="control-label col-md-3">Account Type</label>
						<div class="col-md-7">
							<select class="form-control" name="accountType"
								id="accountType" placeholder="Choose Account Type"
								required="required" value="${complaint.accountType}">
								<option value="X">X</option>
								<option value="Y">Y</option>
								<option value="Z">Z</option>
							</select>
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
                                           	<label class="control-label col-md-3">Branch</label>
                                			<div class="col-md-7">
                                            <input type="text" class="form-control" name="Branch"
                                                 id="Branch" placeholder="Enter your Branch" required="required"
                                                 value="${complaint.branch }" />
                                                </div>
                                     </div>

					<div class="form-group">
						<label class="control-label col-md-3">Category</label>
						<div class="col-md-7">
							<select input type="text" class="form-control" name="category"
								id="category" placeholder="Enter nature of complaint"
								required="required" value="${complaint.category }"
								<option value=><option/>
								<option value="1 Mobile Banking Transactions">1 Mobile Banking Transactions</option>
								<option value="2 Internet Banking Transactions">2 Internet Banking Transactions</option>
								<option value="3 RTGS Transactions">3 RTGS Transactions</option>
								<option value="4 NON ADHERENCE TO BCSBI CODES">4 NON ADHERENCE TO BCSBI CODES</option>
								<option value="5 Cards Transactions at POS/online transactions">5 Cards Transactions at POS/online transactions</option>
								<option value="6 REMITTANCE">6 REMITTANCE</option>
								<option value="7 ATM/Debit Cards">7 ATM/Debit Cards</option>
								<option value="8 Credit Cards">8 Credit Cards</option>
								<option value="9 Other Payment Systems">9 Other Payment Systems</option>
								<option value="10 Loan and Advances">10 Loan and Advances</option>
								<option value="11 Loan and Advances: Type of Complain">11 Loan and Advances: Type of Complain</option>
								<option value="12 Deposit Accounts">12 Deposit Accounts</option>
								<option value="13 Prepaid Instruments">13 Prepaid Instruments</option>
								<option value="14 CHARGES WITHOUT PRIOR NOTICE">14 CHARGES WITHOUT PRIOR NOTICE</option>
								<option value="15 PENSION">15 PENSION</option>
								<option value="16 FAILURE ON COMMITMENTS">16 FAILURE ON COMMITMENTS</option>
								<option value="17 RECOVERY AGENT">17 RECOVERY AGENT</option>
								<option value="18 Direct Sales Agents">18 Direct Sales Agents</option>
								<option value="19 NOTES AND COINS">19 NOTES AND COINS</option>
								<option value="20 NON ADHERENCE TO FAIR PRACTICES CODE">20 NON ADHERENCE TO FAIR PRACTICES CODE</option>
								<option value="21 NON ADHERENCE TO BCSBI CODES">21 NON ADHERENCE TO BCSBI CODES</option>
								<option value="22 Tariff Schedule and Service Charges">22 Tariff Schedule and Service Charges</option>
								<option value="23 Staff Behaviour">23 Staff Behaviour</option>
								<option value="24 Behaviour of Business Correspondents">24 Behaviour of Business Correspondents Transactions</option>
								<option value="25 Misselling of third party products (Insurance / MF etc.)">25 Misselling of third party products (Insurance / MF etc.)</option>
								<option value="26 Third party service complaints Transactions">26 Third party service complaints</option>
								<option value="27 Account opening related complaints Transactions">27 Account opening related complaints Transactions</option>
								<option value="28 Others Transactions">28 Others Transactions</option>
					</select>

						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Sub Category</label>
						<div class="col-md-7">
							<select input type="text" class="form-control" name="subcategory"
								id="subcategory" placeholder="Optional" required="required"
								value="${complaint.subcategory }">
							    <option value="1.1 Registration issues">1.1 Registration issues</option>
								<option value="1.2 MMID related issues">1.2 MMID related issues</option>
								<option value="1.3 Login issues">1.3 Login issues</option>
								<option value="1.4 Bill Payment related">1.4 Bill Payment related</option>
								<option value="1.5 Fund transfer related">1.5 Fund transfer related</option>
								<option value="1.6 Other banking requests">1.6 Other banking requests</option>
                                <option value="1.7 MPIN/OTP related">1.7 MPIN/OTP related</option>
                                <option value="1.8 Mobile Banking requests (non financial)">1.8 Mobile Banking requests (non financial)</option>
                                <option value="1.9 Others">1.9 Others</option>
                                <option value=><option/>

                                <option value="2.1 Registration issues">2.1 Registration issues</option>
                                <option value="2.2 Online Banking Profile">2.2 Online Banking Profile</option>
                                <option value="2.3 Online Banking Requests (non financial)">2.3 Online Banking Requests (non financial)</option>
                                <option value="2.4 Online Bill Payment">2.4 Online Bill Payment</option>
                                <option value="2.5 Online Payment Transfer">2.5 Online Payment Transfer</option>
                                <option value="2.6 SMS related issues">2.6 SMS related issues</option>
                                <option value="2.7 Login issues">2.7 Login issues</option>
                                <option value="2.8 OTP related issues">2.8 OTP related issues</option>
                                <option value="2.9 Others">2.9 Others</option>
                                <option value=><option/>

                                <option value="3.1 Amount debited but not credited to beneficiary:">3.1 Amount debited but not credited to beneficiary</option>
                                <option value="3.2 Errors in details of remitter/beneficiary">3.2 Errors in details of remitter/beneficiary</option>
                                <option value="3.3 Excess amount remitted">3.3 Excess amount remitted</option>
                                <option value="3.4 Interest on delayed payment">3.4 Interest on delayed payment</option>
                                <option value="3.5 Remittance charges are high">3.5 Remittance charges are high</option>
                                <option value="3.6 RTGS transactions through INB/MBS">3.6 RTGS transactions through INB/MBS</option>
                                <option value="3.7 Others">3.7 Others</option>
                                <option value=><option/>

                                <option value="4.1 Amount debited but not credited to beneficiary">4.1 Amount debited but not credited to beneficiary	</option>
                                <option value="4.2 Errors in details of remitter/beneficiary">4.2 Errors in details of remitter/beneficiary	</option>
                                <option value="4.3 Excess amount remitted">4.3 Excess amount remitted</option>
                                <option value="4.4 Interest on delayed payment">4.4 Interest on delayed payment</option>
                                <option value="4.5 Remittance charges are high">4.5 Remittance charges are high</option>
                                <option value="4.6 NEFT transactions through INB/MBS">4.6 NEFT transactions through INB/MBS</option>
                                <option value="4.7 Others">4.7 Others</option>
                                <option value=><option/>

                                <option value="	5.1 OTP related	">	5.1 OTP related	</option>
                                <option value="	5.2 Transaction not processed	">	5.2 Transaction not processed	</option>
                                <option value="	5.3 Payment Gateway related	">	5.3 Payment Gateway related	</option>
                                <option value="	5.4 POS related - Issuer	">	5.4 POS related - Issuer	</option>
                                <option value="	5.5 POS related - Acquirer	">	5.5 POS related - Acquirer	</option>
                                <option value="	5.6 Non financial transaction	">	5.6 Non financial transaction	</option>
                                <option value="	5.7 Others	">	5.7 Others	</option>
                                <option value=><option/>

                                <option value="	6.1 Delays in payment	">	6.1 Delays in payment	</option>
                                <option value="	6.2 Collection of Cheques, delays	">	6.2 Collection of Cheques, delays	</option>
                                <option value="	6.3 wrong credits in transfer of funds	">	6.3 Wrong credits in transfer of funds	</option>
                                <option value=><option/>

                                <option value="	7.1 NON/SHORT DISPENSATION OF CASH	">	7.1 NON/SHORT DISPENSATION OF CASH	</option>
                                <option value="	7.2 FRAUDULENT TRANSACTION	">	7.2 FRAUDULENT TRANSACTION	</option>
                                <option value="	7.3 OTHERS	">	7.3 OTHERS	</option>
                                <option value=><option/>
                                <option value="	OTHERS___">	OTHERS___:	</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Details of the
							Complaint</label>
						<div class="col-md-7">
							<textarea input type="text" class="form-control" name="details"
								id="details" placeholder="Describe Your Complaint in Brief ?"
								cols="40" rows="4" required="required" value="${complaint.details }"></textarea>
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Send" />
					</div>
				</form>
			</div>

		</c:when>
		<c:when test="${mode=='MODE_SHOW_USER_COMPLAINT' }">
			<div class="container text-center">
				<h3>Complaint Details</h3>
				<hr>
				<c:set var="complaint" value="${complaints}"/> 
				<form class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-md-3">Complaint ID</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="id" value="${complaint.id}"  disabled/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Details of the Complaint</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="details"
								cols="40" rows="4" value="${complaint.details}" disabled>
							</input>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Complaint status as per date</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="status"
								cols="40" rows="4" value="${complaint.status}" disabled>
							</input>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Complaint Priority</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="priority"
								cols="40" rows="4" value="${complaint.priority}" disabled>
							</input>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Assigned To</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="assignto"
								cols="40" rows="4" value="${complaint.assignto}" disabled>
							</input>
						</div>
					</div>
					<div  class="form-group">
						<label class="control-label col-md-3">Complain History</label>
						<ul class="list-group col-md-7 complain-history" style="margin-left: 1em;" aria-label="byrk-arial">
							<c:forEach var="ch" items="${complaint_history}">  
							<li class="list-group-item">
								<div class="history-node">
									<div class="history-header">
										<b>${ch.name}</b>
									</div>
									<div class="history-body">
										<h4>${ch.feedback}</h4>
									</div>
									<div class="history-footer">
										<span>LastModified By: <b>${ch.name}</b> | LastModified On: <b>${ch.lastModifiedByDateTime}</b></span>
									</div>
								</div>
							</li>
							</c:forEach>
						  </ul>
					</div>
				<c:if test="${complaint.step == 'ADMIN_ROLLBACK_TO_USER' }">
					<form class="form-horizontal" method="POST" action="user-update-complaint">
						<input type="hidden" name="id" value="${complaint.id}" />
						<div class="form-group">
							<label class="control-label col-md-3">Deatils</label>
							<div class="col-md-7">
								<textarea  type="text" class="form-control" name="details"
									id="details" placeholder="Details..."
									cols="40" rows="5"
									required="required">
									${complaint.details}</textarea>
							</div>
						</div>
						
						<div class="form-group ">
							<input type="submit" class="btn btn-primary" formmethod="POST" formaction="/user-update-complaint" value="Submit" />
							<input type="submit" formnovalidate class="btn btn-primary" formmethod="POST" formaction="/request-to-close?id=${complaint.id}" value="Request to close" />
						</div>	
					</form>
				</c:if>
					
				</form>
			</div>

		</c:when>
		
		<c:when test="${mode=='CHECKSTATUS'}">
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
								<th>Branch</th>
								<th>Category</th>
								<th>Sub Category</th>
								<th>Details</th>
								<th>assignto</th>
								<th>Priority</th>
								<th>Status</th>
								<th>lastUpdateDate</th>
								<th>Edit/View</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="complaint" items="${complaints}">
								<tr>
									<td>${complaint.id}</td>
									<td>${complaint.firstname}</td>
									<td>${complaint.lastname}</td>
									<td>${complaint.emailid}</td>
									<td>${complaint.accountno}</td>
									<td>${complaint.branch}</td>
									<td>${complaint.category}</td>
									<td>${complaint.subcategory}</td>
									<td>${complaint.details}</td>
									<td>${complaint.assignto}</td>
									<td>${complaint.priority}</td>
									<td>${complaint.status}</td>
									<td>${complaint.lastUpdateDate}</td>
									<td><a href="/getStatus?id=${complaint.id}">Procced</a></td>
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
					<h4>Email: asupport@nainitalbankltd.com</h4>
					<br>
					<h4>Contact Number: 1800 180 4031</h4>
					<br>
					<h4>
						Address: Head Office-(The Nainital Bank Limited,
						Seven Oaks Building, Mallital,
						NainitalUttarakhand - 263001)
					</h4>
					<h4> Ph:-05942-239280 </h4>
					<br>
				</div>
			</div>
		</c:when>
	</c:choose>
</body>
</html>
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
                            <label class="control-label col-md-3">Date</label>
                            <div class="col-md-7">
                             <input type="date" class="form-control" name="date"
                             id="Date" placeholder="__/__/____"
                             value="${complaint.date}">
                         </div>
                     </div>

					<div class="form-group">
						<label class="control-label col-md-3">Account Type</label>
						<div class="col-md-7">
							<select class="form-control" name="accountType"
								id="accountType" placeholder="Choose Account Type"
								required="required" value="${complaint.accountType}">
								<option value="Savings Account" ${complaint.accountType == 'Savings Account' ? 'selected=\"selected\"' : ''}>Savings Account</option>
                                								<option value="Current Account" ${complaint.accountType == 'Current Account' ? 'selected=\"selected\"' : ''}>Current Account</option>
                                								<option value="Fixed Deposit Account(FD)" ${complaint.accountType == 'Fixed Deposit Account(FD)' ? 'selected=\"selected\"' : ''}>Fixed Deposit Account(FD)</option>
                                								<option value="Recurring Deposit Account(RD)" ${complaint.accountType == 'Recurring Deposit Account(RD)' ? 'selected=\"selected\"' : ''}>Recurring Deposit Account(RD)</option>
                                								<option value="Loan Account" ${complaint.accountType == 'Loan Account' ? 'selected=\"selected\"' : ''}>Loan Account</option>
                                                                <option value="Cash Credit Account(CC)" ${complaint.accountType == 'Cash Credit Account(CC)' ? 'selected=\"selected\"' : ''}>Cash Credit Account(CC)</option>
                                                                <option value="Over Draft Account(OD)" ${complaint.accountType == 'Over Draft Account(OD)' ? 'selected=\"selected\"' : ''}>Over Draft Account(OD)</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Account No</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="accountno"
								id="accountno" placeholder="Enter account no" maxlength="16"
								 required="required"
								value="${complaint.accountno }" />
						</div>
					</div>

					<div class="form-group">
                                           	<label class="control-label col-md-3">Branch</label>
                                			<div class="col-md-7">
                                            <select class="form-control" name="Branch"
                                                 id="Branch" placeholder="Select your Branch" required="required"
                                                 value="${complaint.branch }">
                                                 <option value="001-MALL ROAD NAINITAL-[001]"> 001-MALL ROAD NAINITAL-[001] </option>
                                                                                                         <option value="002-ALMORA-[002]"> 002-ALMORA-[002] </option>
                                                                                                         <option value="003-HALDWANI-[003]"> 003-HALDWANI-[003] </option>
                                                                                                         <option value="004-RANIKHET-[004]"> 004-RANIKHET-[004] </option>
                                                                                                         <option value="005-RAMNAGAR-[005]"> 005-RAMNAGAR-[005] </option>
                                                                                                         <option value="006-KASHIPUR-[006]"> 006-KASHIPUR-[006] </option>
                                                                                                         <option value="007-PITHORAGARH-[007]"> 007-PITHORAGARH-[007] </option>
                                                                                                         <option value="008-KICHHA-[008]"> 008-KICHHA-[008] </option>
                                                                                                         <option value="009-BAZPUR-[009]"> 009-BAZPUR-[009] </option>
                                                                                                         <option value="010-BHIMTAL-[010]"> 010-BHIMTAL-[010] </option>
                                                                                                         <option value="011-RAMGARH-[011]"> 011-RAMGARH-[011] </option>
                                                                                                         <option value="012-BAGESHWAR-[012]"> 012-BAGESHWAR-[012] </option>
                                                                                                         <option value="013-LOHAGHAT-[013]"> 013-LOHAGHAT-[013] </option>
                                                                                                         <option value="014-KILAKHERA-[014]"> 014-KILAKHERA-[014] </option>
                                                                                                         <option value="015-CHAMPAWAT-[015]"> 015-CHAMPAWAT-[015] </option>
                                                                                                         <option value="016-LALKUAN-[016]"> 016-LALKUAN-[016] </option>
                                                                                                         <option value="017-T N ROAD LUCKNOW-[017]"> 017-T N ROAD LUCKNOW-[017] </option>
                                                                                                         <option value="018-BAHERI-[018]"> 018-BAHERI-[018] </option>
                                                                                                         <option value="019-BAILPARAO-[019]"> 019-BAILPARAO-[019] </option>
                                                                                                         <option value="020-SHAHJAHANPUR-[020]"> 020-SHAHJAHANPUR-[020] </option>
                                                                                                         <option value="021-PILIBHIT-[021]"> 021-PILIBHIT-[021] </option>
                                                                                                         <option value="022-BAREILLY-[022]"> 022-BAREILLY-[022] </option>
                                                                                                         <option value="023-KANPUR-[023]"> 023-KANPUR-[023] </option>
                                                                                                         <option value="024-NAGLA-[024]"> 024-NAGLA-[024] </option>
                                                                                                         <option value="025-SITAPUR-[025]"> 025-SITAPUR-[025] </option>
                                                                                                         <option value="026-GHAZIABAD-[026]"> 026-GHAZIABAD-[026] </option>
                                                                                                         <option value="027-MEERUT-[027]"> 027-MEERUT-[027] </option>
                                                                                                         <option value="028-PAHARPANI-[028]"> 028-PAHARPANI-[028] </option>
                                                                                                         <option value="029-BARA-[029]"> 029-BARA-[029] </option>
                                                                                                         <option value="030-DEVIDHURA-[030]"> 030-DEVIDHURA-[030] </option>
                                                                                                         <option value="031-MORADABAD-[031]"> 031-MORADABAD-[031] </option>
                                                                                                         <option value="032-P K ROAD-NEW DELHI-[032]"> 032-P K ROAD-NEW DELHI-[032] </option>
                                                                                                         <option value="033-MUZAFFAR NAGAR-[033]"> 033-MUZAFFAR NAGAR-[033] </option>
                                                                                                         <option value="034-RANIBAGH-[034]"> 034-RANIBAGH-[034] </option>
                                                                                                         <option value="035-BANLEKH-[035]"> 035-BANLEKH-[035] </option>
                                                                                                         <option value="036-RAMPUR-[036]"> 036-RAMPUR-[036] </option>
                                                                                                         <option value="037-TALLITAL  NAINITAL-[037]"> 037-TALLITAL  NAINITAL-[037] </option>
                                                                                                         <option value="038-LAJPAT NAGAR-[038]"> 038-LAJPAT NAGAR-[038] </option>
                                                                                                         <option value="039-SHALIMAR BAGH-DELHI-[039]"> 039-SHALIMAR BAGH-DELHI-[039] </option>
                                                                                                         <option value="040-TILAK NAGAR-DELHI-[040]"> 040-TILAK NAGAR-DELHI-[040] </option>
                                                                                                         <option value="041-MAHANAGAR LUCKNOW-[041]"> 041-MAHANAGAR LUCKNOW-[041] </option>
                                                                                                         <option value="042-CHAUMEL-[042]"> 042-CHAUMEL-[042] </option>
                                                                                                         <option value="043-BHINGRARA-[043]"> 043-BHINGRARA-[043] </option>
                                                                                                         <option value="044-SRIPURBICHWA-[044]"> 044-SRIPURBICHWA-[044] </option>
                                                                                                         <option value="045-RUDRAPUR-[045]"> 045-RUDRAPUR-[045] </option>
                                                                                                         <option value="046-JASPUR-[046]"> 046-JASPUR-[046] </option>
                                                                                                         <option value="047-PATPARGANJ DELHI-[047]"> 047-PATPARGANJ DELHI-[047] </option>
                                                                                                         <option value="048-BULANDSHAHAR-[048]"> 048-BULANDSHAHAR-[048] </option>
                                                                                                         <option value="049-PITAMPURA-NEW DELHI-[049]"> 049-PITAMPURA-NEW DELHI-[049] </option>
                                                                                                         <option value="050-K D ROAD HALDWANI-[050]"> 050-K D ROAD HALDWANI-[050] </option>
                                                                                                         <option value="051-GURGAON-[051]"> 051-GURGAON-[051] </option>
                                                                                                         <option value="052-GADARPUR-[052]"> 052-GADARPUR-[052] </option>
                                                                                                         <option value="053-IP EXTENTION-DELHI-[053]"> 053-IP EXTENTION-DELHI-[053] </option>
                                                                                                         <option value="054-VAISHALI GHAZIABAD-[054]"> 054-VAISHALI GHAZIABAD-[054] </option>
                                                                                                         <option value="055-KOTDWAR-[055]"> 055-KOTDWAR-[055] </option>
                                                                                                         <option value="056-MBPGCOLLEGE HALDWANI-[056]"> 056-MBPGCOLLEGE HALDWANI-[056] </option>
                                                                                                         <option value="057-DEHRADUN-[057]"> 057-DEHRADUN-[057] </option>
                                                                                                         <option value="058-ASHIANA-LUCKNOW-[058]"> 058-ASHIANA-LUCKNOW-[058] </option>
                                                                                                         <option value="059-PAPPANKALA NEW DELHI-[059]"> 059-PAPPANKALA NEW DELHI-[059] </option>
                                                                                                         <option value="060-SAHARANPUR-[060]"> 060-SAHARANPUR-[060] </option>
                                                                                                         <option value="061-NAJIBABAD-[061]"> 061-NAJIBABAD-[061] </option>
                                                                                                         <option value="062-PANIPAT-[062]"> 062-PANIPAT-[062] </option>
                                                                                                         <option value="063-SECTOR 50 NOIDA-[063]"> 063-SECTOR 50 NOIDA-[063] </option>
                                                                                                         <option value="064-FARIDABAD-[064]"> 064-FARIDABAD-[064] </option>
                                                                                                         <option value="065-VIKAS MARG-NEW DELHI-[065]"> 065-VIKAS MARG-NEW DELHI-[065] </option>
                                                                                                         <option value="066-NEWASHOK NAGAR-DELHI-[066]"> 066-NEWASHOK NAGAR-DELHI-[066] </option>
                                                                                                         <option value="067-HARIDWAR-[067]"> 067-HARIDWAR-[067] </option>
                                                                                                         <option value="068-NADAN MAHAL LUCKNOW-[068]"> 068-NADAN MAHAL LUCKNOW-[068] </option>
                                                                                                         <option value="069-JAIPUR - BANI PARK -[069]"> 069-JAIPUR - BANI PARK -[069] </option>
                                                                                                         <option value="070-NOIDA SECTOR 18-[070]"> 070-NOIDA SECTOR 18-[070] </option>
                                                                                                         <option value="071-RAMPUR ROAD HALDWANI-[071]"> 071-RAMPUR ROAD HALDWANI-[071] </option>
                                                                                                         <option value="072-AGRA-[072]"> 072-AGRA-[072] </option>
                                                                                                         <option value="073-ROHINI -NEW DELHI-[073]"> 073-ROHINI -NEW DELHI-[073] </option>
                                                                                                         <option value="075-PRABHAT NGR BAREILLY-[075]"> 075-PRABHAT NGR BAREILLY-[075] </option>
                                                                                                         <option value="076-ROHTAK ROAD DELHI-[076]"> 076-ROHTAK ROAD DELHI-[076] </option>
                                                                                                         <option value="077-ROORKEE-[077]"> 077-ROORKEE-[077] </option>
                                                                                                         <option value="078-VIKASNAGAR-DEHRADUN-[078]"> 078-VIKASNAGAR-DEHRADUN-[078] </option>
                                                                                                         <option value="079-GOMTI NAGAR-LUCKNOW-[079]"> 079-GOMTI NAGAR-LUCKNOW-[079] </option>
                                                                                                         <option value="080-Service Branch"> service branch </option>
                                                                                                         <option value="081-BILASPUR RAMPUR-[081]"> 081-BILASPUR RAMPUR-[081] </option>
                                                                                                         <option value="082-LOWER MALL RD-ALMORA-[082]"> 082-LOWER MALL RD-ALMORA-[082] </option>
                                                                                                         <option value="083-SRI NAGAR-[083]"> 083-SRI NAGAR-[083] </option>
                                                                                                         <option value="084-BHOOR MOH KHATIMA-[084]"> 084-BHOOR MOH KHATIMA-[084] </option>
                                                                                                         <option value="085-DHARCHULA-[085]"> 085-DHARCHULA-[085] </option>
                                                                                                         <option value="086-JOSHIMATH-[086]"> 086-JOSHIMATH-[086] </option>
                                                                                                         <option value="087-KARNAPRAYAG-[087]"> 087-KARNAPRAYAG-[087] </option>
                                                                                                         <option value="088-NEW TEHRI-[088]"> 088-NEW TEHRI-[088] </option>
                                                                                                         <option value="089-KAPKOT-[089]"> 089-KAPKOT-[089] </option>
                                                                                                         <option value="090-BHOWALI-[090]"> 090-BHOWALI-[090] </option>
                                                                                                         <option value="091-SIDCUL PANTNAGAR-[091]"> 091-SIDCUL PANTNAGAR-[091] </option>
                                                                                                         <option value="092-Doiwala-[092]"> 092-Doiwala-[092] </option>
                                                                                                         <option value="093-RUDRAPRAYAG-[093]"> 093-RUDRAPRAYAG-[093] </option>
                                                                                                         <option value="094-SITARGANJ-[094]"> 094-SITARGANJ-[094] </option>
                                                                                                         <option value="095-TANAKPUR-[095]"> 095-TANAKPUR-[095] </option>
                                                                                                         <option value="096-DWARAHAT-[096]"> 096-DWARAHAT-[096] </option>
                                                                                                         <option value="097-JWALAPUR HARIDWAR-[097]"> 097-JWALAPUR HARIDWAR-[097] </option>
                                                                                                         <option value="098-PAURI GARHWAL-[098]"> 098-PAURI GARHWAL-[098] </option>
                                                                                                         <option value="099-RISHIKESH-[099]"> 099-RISHIKESH-[099] </option>
                                                                                                         <option value="100-HARIDWAR RD DEHRADUN-[100]"> 100-HARIDWAR RD DEHRADUN-[100] </option>
                                                                                                         <option value="101-SAHARANPUR ROAD DDN-[101]"> 101-SAHARANPUR ROAD DDN-[101] </option>
                                                                                                         <option value="102-MUSSORIE-[102]"> 102-MUSSORIE-[102] </option>
                                                                                                         <option value="103-Arjunpur Haldwani-[103]"> 103-Arjunpur Haldwani-[103] </option>
                                                                                                         <option value="104-MAHESHPURA BAZPUR -[104]"> 104-MAHESHPURA BAZPUR -[104] </option>
                                                                                                         <option value="105-SURHERA DELHI -[105]"> 105-SURHERA DELHI -[105] </option>
                                                                                                         <option value="106-FARIDPUR BAREILLY-[106]"> 106-FARIDPUR BAREILLY-[106] </option>
                                                                                                         <option value="107-KOTPUTLI JAIPUR-[107]"> 107-KOTPUTLI JAIPUR-[107] </option>
                                                                                                         <option value="108-LOHARIYASAL HALDWANI-[108]"> 108-LOHARIYASAL HALDWANI-[108] </option>
                                                                                                         <option value="109-BARRA KANPUR-[109]"> 109-BARRA KANPUR-[109] </option>
                                                                                                         <option value="110-DWARKA NEW DELHI -[110]"> 110-DWARKA NEW DELHI -[110] </option>
                                                                                                         <option value="111-KAMALUAGANJA-[111]"> 111-KAMALUAGANJA-[111] </option>
                                                                                                         <option value="112-I I M ROAD-LUCKNOW-[112]"> 112-I I M ROAD-LUCKNOW-[112] </option>
                                                                                                         <option value="113-VASANT VIHAR DDN-[113]"> 113-VASANT VIHAR DDN-[113] </option>
                                                                                                         <option value="114-DILSHAD GARDEN-[114]"> 114-DILSHAD GARDEN-[114] </option>
                                                                                                         <option value="115-AMBALA-[115]"> 115-AMBALA-[115] </option>
                                                                                                         <option value="116-KARNAL-[116]"> 116-KARNAL-[116] </option>
                                                                                                         <option value="117-BARHANI BAZPUR-[117]"> 117-BARHANI BAZPUR-[117] </option>
                                                                                                         <option value="118-CHAKRATA RD DEHRADUN-[118]"> 118-CHAKRATA RD DEHRADUN-[118] </option>
                                                                                                         <option value="119-BIJNOR-[119]"> 119-BIJNOR-[119] </option>
                                                                                                         <option value="120-GREATER NOIDA-[120]"> 120-GREATER NOIDA-[120] </option>
                                                                                                         <option value="121-JAGATPUR GAULAPAR-[121]"> 121-JAGATPUR GAULAPAR-[121] </option>
                                                                                                         <option value="122-TAPOVAN - RISHIKESH"> 122-TAPOVAN - RISHIKESH </option>
                                                                                                         <option value="123-DHAMPUR BIJNOR-[123]"> 123-DHAMPUR BIJNOR-[123] </option>
                                                                                                         <option value="124-DAMUADHUNGA HALDWANI-[124]"> 124-DAMUADHUNGA HALDWANI-[124] </option>
                                                                                                         <option value="125-RAJA PARK JAIPUR-[125]"> 125-RAJA PARK JAIPUR-[125] </option>
                                                                                                         <option value="126-SANJAY NAGAR GHAZIABAD-[126]"> 126-SANJAY NAGAR GHAZIABAD-[126] </option>
                                                                                                         <option value="127-BANBASA CHAMPAWAT"> 127-BANBASA CHAMPAWAT </option>
                                                                                                         <option value="128-PUROLA UTTARKASHI"> 128-PUROLA UTTARKASHI </option>
                                                                                                         <option value="129-MORADABAD ROAD KASHIPUR-[129]"> 129-MORADABAD ROAD KASHIPUR-[129] </option>
                                                                                                         <option value="130-KANKAR KHERA MEERUT-[130]"> 130-KANKAR KHERA MEERUT-[130] </option>
                                                                                                         <option value="131-KANTH ROAD MORADABAD-[131]"> 131-KANTH ROAD MORADABAD-[131] </option>
                                                                                                         <option value="132-BALLABHGARH-FARIDABAD-[132]"> 132-BALLABHGARH-FARIDABAD-[132] </option>
                                                                                                         <option value="133-SOHNA ROAD-GURUGRAM-[133]"> 133-SOHNA ROAD-GURUGRAM-[133] </option>
                                                                                                         <option value="134-BHURARANI-RUDRAPUR-[134]"> 134-BHURARANI-RUDRAPUR-[134] </option>
                                                                                                         <option value="135-NAGINA-BIJNOR-[135]"> 135-NAGINA-BIJNOR-[135] </option>
                                                                                                         <option value="136-VIKRAMPUR-BAZPUR-[136]"> 136-VIKRAMPUR-BAZPUR-[136] </option>
                                                                                                         <option value="137-SHIMLA PISTORE-RUDRAPUR-[137]"> 137-SHIMLA PISTORE-RUDRAPUR-[137] </option>
                                                                                                         <option value="138-SATWAN BUJURG-SHAHJAHANPUR-[138]"> 138-SATWAN BUJURG-SHAHJAHANPUR-[138] </option>
                                                                                                         <option value="139-DINESHPUR-RUDRAPUR-[139]"> 139-DINESHPUR-RUDRAPUR-[139] </option>
                                                                                                         <option value="140-NANAKMATTA-RUDRAPUR-[140]"> 140-NANAKMATTA-RUDRAPUR-[140] </option>
                                                                                                         <option value="141-PAWAN VIHAR-BAREILLY"> 141-PAWAN VIHAR-BAREILLY </option>
                                                                                                         <option value="142-CANAL ROAD DEHRADUN-[142]"> 142-CANAL ROAD DEHRADUN-[142] </option>
                                                                                                         <option value="143-PERUMADARA RAMNAGAR"> 143-PERUMADARA RAMNAGAR </option>
                                                                                                         <option value="144-UDAYLALPUR HALDWANI"> 144-UDAYLALPUR HALDWANI </option>
                                                                                                         <option value="145-SAHASTRADHARA ROAD DEHRADUN"> 145-SAHASTRADHARA ROAD DEHRADUN </option>
                                                                                                         <option value="146-JAIL ROAD HALDWANI"> 146-JAIL ROAD HALDWANI </option>
                                                                                                         <option value="147-DANPUR RUDRAPUR"> 147-DANPUR RUDRAPUR </option>
                                                                                                         <option value="148-GOVINDPURAM,GHAZIABAD"> 148-GOVINDPURAM,GHAZIABAD </option>
                                                                                                         <option value="149-BHANIYAWALA,DEHRADUN"> 149-BHANIYAWALA,DEHRADUN </option>
                                                                                                         <option value="150-BHAUWALA DEHRADUN"> 150-BHAUWALA DEHRADUN </option>
                                                                                                         <option value="151-CHIDDERWALA DEHRADUN"> 151-CHIDDERWALA DEHRADUN </option>
                                                                                                         <option value="152-NATHUAWALA,DEHRADUN"> 152-NATHUAWALA,DEHRADUN </option>
                                                                                                         <option value="153-JHAJRA,SUDDHOWALA,DEHRADUN"> 153-JHAJRA,SUDDHOWALA,DEHRADUN </option>
                                                                                                         <option value="154-THAKURDWARA,MORADABAD"> 154-THAKURDWARA,MORADABAD </option>
                                                                                                         <option value="155-RAJESHWARIPURAM JOGIWALA DDN"> 155-RAJESHWARIPURAM JOGIWALA DDN </option>
                                                                                                         <option value="156-TALLI BAMORI HALDWANI"> 156-TALLI BAMORI HALDWANI </option>
                                                                                                         <option value="157-BHARATPUR KUNDA JASPUR"> 157-BHARATPUR KUNDA JASPUR </option>
                                                                                                         <option value="158-PRATAPPUR KASHIPUR"> 158-PRATAPPUR KASHIPUR </option>
                                                                                                         <option value="159-SHYAMPUR KANGRI HARIDWAR"> 159-SHYAMPUR KANGRI HARIDWAR </option>
                                                                                                         <option value="160-BERIA DAULAT BAZPUR"> 160-BERIA DAULAT BAZPUR </option>
                                                                                                         <option value="161-SECTOR-14 ROHTAK"> 161-SECTOR-14 ROHTAK </option>
                                                                                                         <option value="afzalgarh, Bijnore"> afzalgarh, Bijnore </option>
                                                                                                         <option value="163-RAJPUR JASPUR"> 163-RAJPUR JASPUR </option>
                                                                                                         <option value="164-SAKENIYA GADARPUR"> 164-SAKENIYA GADARPUR </option>
                                                                                                         <option value="165-RANIPUR NAJIBABAD-[165]"> 165-RANIPUR NAJIBABAD-[165] </option>
                                                                                                         <option value="166- DALIGANJ LUCKNOW-[166]"> 166- DALIGANJ LUCKNOW-[166] </option>
                                                                                                         <option value="167- VIKAS NAGAR LUCKNOW-[167]"> 167- VIKAS NAGAR LUCKNOW-[167] </option>
                                                                                                         <option value="168-GANGAPUR ROAD, RUDRAPUR-[168]"> 168-GANGAPUR ROAD, RUDRAPUR-[168] </option>
                                                                                                         <option value="169-LONI, GHAZIABAD-[169]"> 169-LONI, GHAZIABAD-[169] </option>
                                                              </select>
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
								cols="100" rows="5" required="required" value="${complaint.details }"></textarea>
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
								cols="100" rows="5" value="${complaint.details}" disabled>
							</input>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Complaint status as per date</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="status"
								cols="100" rows="5" value="${complaint.status}" disabled>
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
							<label class="control-label col-md-3">Details</label>
							<div class="col-md-7">
								<textarea  type="text" class="form-control" name="details"
									id="details" placeholder="Details..."
									cols="100" rows="5"
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
								<th>Date</th>
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
									<td>${complaint.date}</td>
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
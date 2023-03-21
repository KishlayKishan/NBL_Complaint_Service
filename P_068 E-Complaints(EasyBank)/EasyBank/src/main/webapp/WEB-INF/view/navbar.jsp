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
    
    <c:if test="${sessionScope.user_role==null}">
        <div role="navigation">
            <div class="navbar navbar-inverse">
                <a href="/welcome" class="navbar-brand">Nainital Bank Ltd</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">

                        <li><a href="/login">User Login</a></li>
                        <li><a href="/register">User Registration</a></li> 
                        <li><a href="/admin">Admin Login</a></li>
                        <li><a href="/adminRegistration">Admin Registration</a></li>
                        <li><a href="/superAdminLogin">Super Admin Login</a></li>
                        <li><a href="/superAdminRegistration">Super Admin Registration</a></li>

                    </ul>
                </div>
            </div>
        </div>
    </c:if>
<c:set var="userRole" value="${sessionScope.user_role}" />
<c:if test="${userRole == 'USER'}">	
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="/home" class="navbar-brand">Nainital Bank Ltd</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/checkStatus">Check Status</a></li>
                <li><a href="/contact">Contact Us</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
            <span class="navbar-text">
                | <i>${sessionScope.user_name} (${userRole})</i>
            </span>
        </div>
    </div>
</div>
</c:if>
<c:if test="${userRole == 'ADMIN'}">	
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="/show-complaints" class="navbar-brand">Nainital Bank Ltd</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/show-complaints">All Complaints</a></li>
                <li><a href="/show-users">All Users</a></li>
                <li><a href="/adminRegistration">Admin Registration</a></li>
                <li><a href="/superAdminRegistration">Super Admin Registration</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
            <span class="navbar-text">
                | <i>${sessionScope.user_name} (${userRole})</i>
            </span>
        </div>
    </div>
</div>
</c:if>
<c:if test="${userRole == 'SUPER_ADMIN'}">	
<div role="navigation">
    <div class="navbar navbar-inverse">
        <a href="/show-complaints" class="navbar-brand">Nainital Bank Ltd</a>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="/show-complaints">All Complaints</a></li>
                <li><a href="/contact">Contact Us</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
            <span class="navbar-text">
               | <i>${sessionScope.user_name} (${userRole})</i>
            </span>
        </div>
    </div>
</div>
</c:if>
</body>
</html>
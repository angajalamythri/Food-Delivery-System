<%@ page import="com.food.model.User" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', sans-serif;
}

body{
    background:#f4f6f9;
}

.navbar{
    background:#28a745;
    padding:15px 30px;
    text-align:right;
}

.navbar a{
    color:white;
    text-decoration:none;
    margin-left:20px;
    font-weight:bold;
}

.navbar a:hover{
    text-decoration:underline;
}

.profile-container{
    display:flex;
    justify-content:center;
    margin-top:50px;
}

.profile-card{
    width:550px;
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0 5px 20px rgba(0,0,0,0.15);
    text-align:center;
}

.avatar{
    width:120px;
    height:120px;
    background:#28a745;
    color:white;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:48px;
    font-weight:bold;
    margin:0 auto 20px auto;
}

h1{
    color:#333;
    margin-bottom:25px;
}

.info-box{
    background:#f8f9fa;
    padding:15px;
    margin-bottom:15px;
    border-radius:10px;
    text-align:left;
    border-left:5px solid #28a745;
}

.label{
    font-weight:bold;
    color:#555;
}

.value{
    color:#222;
}

.button{
    display:inline-block;
    margin-top:20px;
    background:#ff6b35;
    color:white;
    padding:12px 20px;
    text-decoration:none;
    border-radius:8px;
    transition:0.3s;
}

.button:hover{
    background:#e85a24;
}

</style>

</head>

<body>

<%

User user =
(User)session.getAttribute("loggedUser");

if(user == null){

    response.sendRedirect("login.jsp");
    return;
}

%>

<div class="navbar">

    <a href="restaurants">
        Home
    </a>

    <a href="orders">
        My Orders
    </a>

    <a href="logout">
        Logout
    </a>

</div>

<div class="profile-container">

<div class="profile-card">

<div class="avatar">

<%=user.getUsername().substring(0,1).toUpperCase()%>

</div>

<h1>

My Profile

</h1>

<div class="info-box">

<span class="label">
User ID :
</span>

<span class="value">
<%=user.getUserId()%>
</span>

</div>

<div class="info-box">

<span class="label">
Username :
</span>

<span class="value">
<%=user.getUsername()%>
</span>

</div>

<div class="info-box">

<span class="label">
Email :
</span>

<span class="value">
<%=user.getEmail()%>
</span>

</div>

<div class="info-box">

<span class="label">
Role :
</span>

<span class="value">
<%=user.getRole()%>
</span>

</div>

<div class="info-box">

<span class="label">
Address :
</span>

<span class="value">
<%=user.getAddress()%>
</span>

</div>

<%
if(user.getCreatedDate() != null){
%>

<div class="info-box">

<span class="label">
Created Date :
</span>

<span class="value">
<%=user.getCreatedDate()%>
</span>

</div>

<%
}
%>

<%
if(user.getLastLoginDate() != null){
%>

<div class="info-box">

<span class="label">
Last Login :
</span>

<span class="value">
<%=user.getLastLoginDate()%>
</span>

</div>

<%
}
%>

<a class="button"
href="restaurants">

Back To Home

</a>

<a class="button"
href="editProfile.jsp">

Edit Profile

</a>
</div>

</div>

</body>

</html>
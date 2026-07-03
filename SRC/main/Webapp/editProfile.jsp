<%@ page import="com.food.model.User" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

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

.container{
    display:flex;
    justify-content:center;
    margin-top:50px;
}

.card{
    width:500px;
    background:white;
    padding:30px;
    border-radius:20px;
    box-shadow:0 5px 20px rgba(0,0,0,0.15);
}

h1{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:bold;
    color:#555;
}

input[type=text],
input[type=email],
input[type=password],
textarea{

    width:100%;
    padding:12px;
    margin-bottom:20px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
}

textarea{
    resize:none;
}

.updateBtn{

    width:100%;
    padding:12px;

    border:none;

    background:#ff6b35;

    color:white;

    font-size:16px;

    border-radius:8px;

    cursor:pointer;

    transition:0.3s;
}

.updateBtn:hover{

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

<a href="profile.jsp">

My Profile

</a>

<a href="orders">

My Orders

</a>

<a href="logout">

Logout

</a>

</div>

<div class="container">

<div class="card">

<h1>

Edit Profile

</h1>

<form action="updateProfile"
method="post">

<label>

Username

</label>

<input
type="text"
value="<%=user.getUsername()%>"
readonly>

<label>

Email

</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

<label>

Address

</label>

<textarea
name="address"
rows="4"
required><%=user.getAddress()%></textarea>

<label>

New Password

</label>

<input
type="password"
name="password"
value="<%=user.getPassword()%>"
required>

<input
class="updateBtn"
type="submit"
value="Update Profile">

</form>

</div>

</div>

</body>

</html>
<%@ page language="java"
contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login | Gourmet Haven</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    height:100vh;

    background:
    linear-gradient(
    rgba(20,20,20,0.55),
    rgba(20,20,20,0.55)),
    url("images/bg-food.jpg");

    background-size:cover;
    background-position:center;

    display:flex;
    justify-content:center;
    align-items:center;

    font-family:Georgia, "Times New Roman", serif;
}

.container{

    width:430px;

    padding:50px 45px;

    background:rgba(248,245,238,0.95);

    border:1px solid rgba(183,153,88,0.35);

    border-radius:18px;

    box-shadow:
    0 20px 45px rgba(0,0,0,0.25);

    text-align:center;
}

.logo{

    font-size:14px;

    letter-spacing:4px;

    color:#7a6a42;

    margin-bottom:12px;

    text-transform:uppercase;
}

h2{

    color:#1f3527;

    font-size:36px;

    font-weight:normal;

    margin-bottom:10px;
}

.subtitle{

    color:#6c6c6c;

    font-size:15px;

    margin-bottom:35px;

    line-height:1.6;
}

label{

    display:block;

    text-align:left;

    margin-bottom:8px;

    color:#243b2d;

    font-size:15px;

    font-weight:bold;
}

input[type=text],
input[type=password]{

    width:100%;

    padding:14px;

    margin-bottom:22px;

    border:1px solid #d4c9ae;

    border-radius:10px;

    background:#fffdf8;

    font-size:15px;

    outline:none;

    transition:0.3s;
}

input[type=text]:focus,
input[type=password]:focus{

    border-color:#8b6f3d;

    box-shadow:
    0 0 0 3px rgba(139,111,61,0.15);
}

input[type=submit]{

    width:100%;

    padding:14px;

    border:none;

    border-radius:10px;

    background:#1f3527;

    color:#f8f5ee;

    font-size:16px;

    font-weight:bold;

    letter-spacing:1px;

    cursor:pointer;

    transition:0.3s;
}

input[type=submit]:hover{

    background:#2f4d3b;

    transform:translateY(-2px);
}

.divider{

    width:70px;

    height:2px;

    background:#b79958;

    margin:20px auto 30px auto;
}

.register-link{

    margin-top:25px;

    color:#555;

    font-size:15px;
}

.register-link a{

    color:#8b6f3d;

    text-decoration:none;

    font-weight:bold;
}

.register-link a:hover{

    text-decoration:underline;
}

.footer-text{

    margin-top:25px;

    font-size:12px;

    letter-spacing:2px;

    color:#8b8b8b;

    text-transform:uppercase;
}

</style>

</head>

<body>

<div class="container">

<div class="logo">

EST. 2026

</div>

<h2>

Welcome Back

</h2>

<div class="divider"></div>

<p class="subtitle">

Sign in to continue your culinary journey
and enjoy handcrafted dining experiences.

</p>

<form action="login" method="post">

<label>

Username

</label>

<input
type="text"
name="username"
required>

<label>

Password

</label>

<input
type="password"
name="password"
required>

<input
type="submit"
value="SIGN IN">

</form>

<div class="register-link">

New User?

<a href="register.jsp">

Create Account

</a>

</div>

<div class="footer-text">

prasu118

</div>

</div>

</body>

</html>
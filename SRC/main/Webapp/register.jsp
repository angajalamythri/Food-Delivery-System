<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Join Gourmet Haven</title>

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
	rgba(15,15,15,0.55),
	rgba(15,15,15,0.55)),
	url("images/bg-food.jpg");

	background-size:cover;
	background-position:center;

	display:flex;
	justify-content:center;
	align-items:center;

	font-family:Georgia, "Times New Roman", serif;
}

.container{

	width:500px;

	padding:50px;

	background:rgba(248,245,238,0.97);

	border-radius:20px;

	border:1px solid rgba(183,153,88,0.35);

	box-shadow:
	0 20px 50px rgba(0,0,0,0.25);

	text-align:center;
}

.logo{

	font-size:13px;

	letter-spacing:4px;

	color:#8b6f3d;

	text-transform:uppercase;

	margin-bottom:12px;
}

h2{

	color:#1f3527;

	font-size:38px;

	font-weight:normal;

	margin-bottom:12px;
}

.divider{

	width:80px;

	height:2px;

	background:#b79958;

	margin:18px auto 25px auto;
}

.subtitle{

	color:#666;

	font-size:15px;

	line-height:1.6;

	margin-bottom:35px;
}

label{

	display:block;

	text-align:left;

	color:#243b2d;

	font-weight:bold;

	margin-bottom:8px;

	font-size:15px;
}

input[type=text],
input[type=password],
input[type=email],
textarea{

	width:100%;

	padding:14px;

	margin-bottom:22px;

	border:1px solid #d9ccb1;

	border-radius:10px;

	background:#fffdf8;

	font-size:15px;

	font-family:inherit;

	outline:none;

	transition:0.3s;
}

textarea{

	height:100px;

	resize:none;
}

input:focus,
textarea:focus{

	border-color:#8b6f3d;

	box-shadow:
	0 0 0 3px rgba(139,111,61,0.15);
}

input[type=submit]{

	width:100%;

	padding:15px;

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

	background:#2d4737;

	transform:translateY(-2px);
}

.login-link{

	margin-top:25px;

	font-size:15px;

	color:#555;
}

.login-link a{

	text-decoration:none;

	color:#8b6f3d;

	font-weight:bold;
}

.login-link a:hover{

	text-decoration:underline;
}

.footer{

	margin-top:25px;

	font-size:12px;

	letter-spacing:2px;

	text-transform:uppercase;

	color:#8c8c8c;
}

</style>

</head>

<body>

	<div class="container">

		<div class="logo">
			Est. 2025
		</div>

		<h2>
			Create Account
		</h2>

		<div class="divider"></div>

		<p class="subtitle">
			Become a member of Gourmet Haven and discover
			exceptional dining experiences curated with elegance.
		</p>

		<form action="register" method="post">

			<label>Username</label>

			<input type="text" name="username" required>

			<label>Password</label>

			<input type="password" name="password" required>

			<label>Email Address</label>

			<input type="email" name="email" required>

			<label>Address</label>

			<textarea name="address" placeholder="Enter your address here..." required></textarea>

			<input type="submit" value="Join The Club">

		</form>

		<div class="login-link">

			Already a member?

			<a href="login.jsp">
				Sign In
			</a>

		</div>

		<div class="footer">

			prasu1118

		</div>

	</div>

</body>

</html>
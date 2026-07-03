
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Delivery App</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    height:100vh;
    background:
    linear-gradient(
    rgba(0,0,0,0.5),
    rgba(0,0,0,0.5)),
    url("images/bg-food.jpg");

    background-size:cover;
    background-position:center;

    display:flex;
    justify-content:center;
    align-items:center;
}

.container{

    text-align:center;
    color:white;
}

h1{

    font-size:60px;
    margin-bottom:20px;
}

p{

    font-size:22px;
    margin-bottom:40px;
}

.btn{

    display:inline-block;

    text-decoration:none;

    padding:15px 35px;

    margin:10px;

    border-radius:30px;

    font-size:18px;

    font-weight:bold;

    transition:0.3s;
}

.login{

    background:#fc8019;
    color:white;
}

.login:hover{

    background:#e76f00;
}

.register{

    background:white;
    color:#fc8019;
}

.register:hover{

    background:#f5f5f5;
}

.logo{

    font-size:70px;
    margin-bottom:15px;
}

</style>

</head>

<body>

<div class="container">

<div class="logo">

🍕🍔🍟

</div>

<h1>

Food Delivery App

</h1>

<p>

Order your favorite food anytime, anywhere

</p>

<a
class="btn login"
href="login.jsp">

Login

</a>

<a
class="btn register"
href="register.jsp">

Register

</a>

</div>

</body>

</html>
```

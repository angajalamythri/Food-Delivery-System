<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Menu" %>
<%@ page import="com.food.model.Review" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Menu</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

*{
margin:0;
padding:0;
box-sizing:border-box;
}

body{
font-family:'Poppins',sans-serif;
background:linear-gradient(135deg,#fff7f0,#fffaf7);
min-height:100vh;
}

.navbar{
background:linear-gradient(135deg,#ff6b35,#ff9f43);
padding:18px 50px;
display:flex;
justify-content:flex-end;
align-items:center;
gap:30px;
box-shadow:0 5px 20px rgba(0,0,0,.15);
position:sticky;
top:0;
z-index:1000;
}

.navbar a{
color:white;
text-decoration:none;
font-size:16px;
font-weight:600;
transition:.3s;
}

.navbar a:hover{
transform:translateY(-3px);
opacity:.9;
}

.container{
width:95%;
margin:auto;
padding-bottom:50px;
}

h1{
text-align:center;
margin:30px 0;
font-size:42px;
font-weight:700;
background:linear-gradient(90deg,#ff6b35,#ff9f43);
-webkit-background-clip:text;
-webkit-text-fill-color:transparent;
}

.rating-box{
background:white;
max-width:500px;
margin:25px auto;
padding:25px;
border-radius:20px;
text-align:center;
box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.avg-rating{
font-size:42px;
font-weight:700;
color:#ff9800;
}

.card{
width:320px;
display:inline-block;
vertical-align:top;
margin:18px;
background:white;
border-radius:25px;
overflow:hidden;
box-shadow:0 15px 35px rgba(0,0,0,.12);
transition:.5s;
animation:fadeUp .8s ease;
}

.card:hover{
transform:translateY(-12px) scale(1.03);
box-shadow:0 25px 50px rgba(0,0,0,.20);
}

.card img{
width:100%;
height:240px;
object-fit:cover;
transition:.7s;
}

.card:hover img{
transform:scale(1.12);
}

.card h2{
padding:15px 15px 0;
font-size:24px;
color:#2d3436;
}

.card p{
padding:0 15px;
color:#636e72;
line-height:1.6;
}

.price{
font-size:28px;
font-weight:700;
color:#27ae60;
margin-top:10px;
}

.quantity{
width:80px;
padding:10px;
border:1px solid #ddd;
border-radius:10px;
font-size:15px;
}

form{
padding:15px;
}

.button{
width:100%;
padding:14px;
border:none;
border-radius:12px;
background:linear-gradient(135deg,#ff6b35,#ff9f43);
color:white;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:.4s;
}

.button:hover{
transform:scale(1.05);
box-shadow:0 10px 25px rgba(255,107,53,.4);
}

.review-section{
margin-top:60px;
}

.review-card{
background:white;
padding:20px;
margin:15px auto;
max-width:800px;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.08);
transition:.3s;
}

.review-card:hover{
transform:translateY(-5px);
}

.review-rating{
font-size:18px;
font-weight:600;
color:#ff9800;
}

.review-comment{
margin-top:10px;
color:#555;
line-height:1.6;
}

@keyframes fadeUp{

from{
opacity:0;
transform:translateY(40px);
}

to{
opacity:1;
transform:translateY(0);
}

}

::-webkit-scrollbar{
width:10px;
}

::-webkit-scrollbar-thumb{
background:#ff9f43;
border-radius:10px;
}

</style>

</head>

<body>
<div class="navbar">

<a href="cart.jsp"
style="color:white;text-decoration:none;margin-right:20px;">

Cart

</a>

<a href="logout"
style="color:white;text-decoration:none;">

Logout

</a>

</div>
<div class="container">

<h1>Restaurant Menu</h1>


<%
Double avgRating =
(Double)request.getAttribute(
        "avgRating");
%>

<div class="rating-box">

<h2>Customer Rating</h2>

<div class="avg-rating">

Average Rating = <%=avgRating%>

</div>

</div>

<%

List<Menu> menuList =
(List<Menu>)
request.getAttribute(
        "menuList");

if(menuList != null){

for(Menu menu : menuList){
%>

<div class="card">

<img
src="<%=request.getContextPath()%>/images/menu/<%=menu.getImagePath()%>"
alt="Menu Item">

<h2>
<%=menu.getItemName()%>
</h2>

<p>

Price :

&#8377; <%=menu.getPrice()%>

</p>

<form action="cart"
method="post">

<input
type="hidden"
name="menuId"
value="<%=menu.getMenuId()%>">

<input
type="number"
name="quantity"
value="1"
min="1">

<br><br>

<input
class="button"
type="submit"
value="Add To Cart">

</form>

</div>

<%
}
}
%>

<div style="
display:flex;
flex-wrap:wrap;
justify-content:center;
gap:10px;">

<div class="review-section">

<h1>Customer Reviews</h1>
<p>
Reviews Object =
<%=request.getAttribute("reviews")%>
</p>

<p>
Average Rating =
<%=request.getAttribute("avgRating")%>
</p>

<%

List<Review> reviews =
(List<Review>)
request.getAttribute(
        "reviews");

if(reviews != null &&
   !reviews.isEmpty()){

for(Review review : reviews){

%>

<div class="review-card">

<div class="review-rating">

<%=review.getRating()%>/5 Stars

</div>

<div class="review-comment">

<%=review.getComment()%>

</div>

</div>

<%
}
}
else{
%>

<div class="review-card">

No reviews yet.
Be the first customer to review!

</div>

<%
}
%>
</div>
</div>

</div>

</body>
</html>
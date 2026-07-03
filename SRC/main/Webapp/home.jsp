<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.food.model.Restaurant" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Vintage Bites</title>

<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:'Playfair Display', serif;
    background:linear-gradient(135deg,#fdf6ec,#f5e6d3);
    color:#3e2c23;
    min-height:100vh;
}

/* NAVBAR */

.navbar{
    background:rgba(94,64,46,0.95);
    color:white;
    padding:18px 50px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
    position:sticky;
    top:0;
    z-index:100;
}

.navbar h2{
    font-size:30px;
    letter-spacing:2px;
}

.nav-links a{
    color:#f7e7ce;
    text-decoration:none;
    margin-left:25px;
    font-weight:600;
    transition:0.3s;
}

.nav-links a:hover{
    color:#ffd699;
}

/* HERO SECTION */

.hero{
    text-align:center;
    padding:50px 20px 20px;
}

.hero h1{
    font-size:50px;
    color:#5a3d2b;
    margin-bottom:10px;
}

.hero p{
    font-size:18px;
    color:#7a5a45;
    font-style:italic;
}

/* SEARCH */

.search-box{
    text-align:center;
    margin:35px 0;
}

.search-box form{
    display:inline-flex;
    background:white;
    border-radius:50px;
    overflow:hidden;
    box-shadow:0 8px 25px rgba(0,0,0,0.12);
}

.search-box input[type=text]{
    width:350px;
    padding:15px 20px;
    border:none;
    outline:none;
    font-size:15px;
}

.search-box input[type=submit]{
    padding:15px 25px;
    border:none;
    background:#6f4e37;
    color:white;
    cursor:pointer;
    transition:0.3s;
    font-weight:bold;
}

.search-box input[type=submit]:hover{
    background:#4b2e1f;
}

/* CONTAINER */

.container{
    width:92%;
    margin:auto;
    padding-bottom:40px;
}

.heading{
    text-align:center;
    margin-bottom:35px;
    color:#5a3d2b;
    font-size:40px;
}

/* CARDS */

.restaurant-container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
    gap:30px;
}

.card{
    background:white;
    border-radius:20px;
    overflow:hidden;
    box-shadow:
        0 10px 25px rgba(0,0,0,0.08),
        0 4px 10px rgba(0,0,0,0.05);
    transition:all 0.4s ease;
    animation:fadeUp 0.8s ease;
}

.card:hover{
    transform:translateY(-10px);
    box-shadow:0 20px 40px rgba(0,0,0,0.15);
}

.card img{
    width:100%;
    height:220px;
    object-fit:cover;
    transition:0.5s;
}

.card:hover img{
    transform:scale(1.05);
}

.card-content{
    padding:20px;
}

.card-content h2{
    color:#5c4033;
    margin-bottom:12px;
}

.cuisine-tag{
    display:inline-block;
    background:#f7e7ce;
    color:#6f4e37;
    padding:6px 12px;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
    margin-bottom:12px;
}

.card-content p{
    margin:8px 0;
    color:#666;
}

.rating{
    display:inline-block;
    background:#f7d794;
    color:#5c4033;
    padding:6px 12px;
    border-radius:20px;
    font-weight:bold;
    margin-top:10px;
}

.button{
    display:inline-block;
    margin-top:18px;
    background:#6f4e37;
    color:white;
    text-decoration:none;
    padding:12px 20px;
    border-radius:30px;
    transition:0.3s;
    font-weight:bold;
}

.button:hover{
    background:#4b2e1f;
}

@keyframes fadeUp{
    from{
        opacity:0;
        transform:translateY(30px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

footer{
    text-align:center;
    padding:20px;
    color:#7a5a45;
    margin-top:30px;
}

::-webkit-scrollbar{
    width:10px;
}

::-webkit-scrollbar-thumb{
    background:#8b6b4f;
    border-radius:10px;
}

</style>

</head>

<body>

<div class="navbar">

    <h2>🍽 Andhra Bites</h2>

    <div class="nav-links">

        <a href="profile.jsp">My Profile</a>

        <a href="orders">My Orders</a>

        <a href="logout">Logout</a>

    </div>

</div>

<div class="hero">

    <h1>Discover Delicious Food</h1>

    <p>"Good food is the ingredient that binds us together."</p>

</div>

<div class="search-box">

    <form action="restaurants" method="get">

        <input
            type="text"
            name="keyword"
            placeholder="Search your favorite restaurant...">

        <input
            type="submit"
            value="Search">

    </form>

</div>

<div class="container">

    <h1 class="heading">Available Restaurants</h1>

    <div class="restaurant-container">

    <%
        List<Restaurant> restaurants =
        (List<Restaurant>) request.getAttribute("restaurants");

        if(restaurants != null){

            for(Restaurant r : restaurants){
    %>

        <div class="card">

            <img
src="<%=request.getContextPath()%>/images/restaurants/<%=r.getImagePath()%>"
alt="<%=r.getName()%>">

            <div class="card-content">

                <h2><%=r.getName()%></h2>

                <span class="cuisine-tag">
                    <%=r.getCuisineType()%>
                </span>

                <p>
                    ⏱ Delivery Time:
                    <%=r.getDeliveryTime()%> mins
                </p>

                <div class="rating">
                    ⭐ <%=r.getRating()%>
                </div>

                <p>
                    📍 <%=r.getAddress()%>
                </p>

                <a class="button"
                href="<%=request.getContextPath()%>/menu?restaurantId=<%=r.getRestaurantId()%>">

                    View Menu

                </a>

            </div>

        </div>

    <%
            }
        }
    %>

    </div>

</div>

<footer>
    Made  for food lovers
</footer>

</body>
</html>

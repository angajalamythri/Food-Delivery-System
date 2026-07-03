<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User" %>
<%
User user =
(User)session.getAttribute("loggedUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px;
}

.checkout-container{
    width:100%;
    max-width:900px;
}

.logout{
    text-align:right;
    margin-bottom:15px;
}

.logout a{
    color:white;
    text-decoration:none;
    background:#ef4444;
    padding:10px 18px;
    border-radius:10px;
}

.checkout-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,0.1);
    border-radius:25px;
    padding:35px;
    color:white;
    box-shadow:0 10px 40px rgba(0,0,0,.4);
}

.title{
    text-align:center;
    margin-bottom:30px;
}

.title h1{
    font-size:40px;
}

.title p{
    color:#cbd5e1;
    margin-top:10px;
}

.checkout-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:25px;
}

.section{
    background:rgba(255,255,255,0.05);
    border-radius:18px;
    padding:20px;
}

.section h3{
    margin-bottom:15px;
    color:#a78bfa;
}

.address-box{
    color:#d1d5db;
    line-height:1.8;
}

.payment-select{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#1e1b4b;
    color:white;
    font-size:16px;
}

.summary-item{
    display:flex;
    justify-content:space-between;
    margin-bottom:12px;
    color:#d1d5db;
}

.total{
    border-top:1px solid rgba(255,255,255,.2);
    padding-top:15px;
    margin-top:15px;
    font-size:22px;
    font-weight:bold;
    color:#22c55e;
}

.place-order{
    width:100%;
    margin-top:30px;
    padding:16px;
    border:none;
    border-radius:14px;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    color:white;
    background:linear-gradient(135deg,#8b5cf6,#6d28d9);
    transition:.3s;
}

.place-order:hover{
    transform:translateY(-3px);
    box-shadow:0 0 25px rgba(139,92,246,.5);
}

.secure{
    text-align:center;
    margin-top:15px;
    color:#cbd5e1;
}

@media(max-width:768px){
    .checkout-grid{
        grid-template-columns:1fr;
    }

    .title h1{
        font-size:30px;
    }

    .checkout-card{
        padding:20px;
    }
}
</style>
</head>

<body>

<div class="checkout-container">

    <div class="logout">
        <a href="logout">Logout</a>
    </div>

    <div class="checkout-card">

        <div class="title">
            <h1>🛒 Checkout</h1>
            <p>Review your order and complete payment</p>
        </div>

        <form action="checkout" method="post">

            <div class="checkout-grid">

                <div class="section">

    <h3>📍 Delivery Address</h3>

    <textarea
        name="deliveryAddress"
        rows="5"
        required
        style="
        width:100%;
        padding:12px;
        border:none;
        border-radius:10px;
        background:#1e1b4b;
        color:white;
        font-size:15px;"><%=user != null ? user.getAddress() : ""%></textarea>

    <br><br>

    <div class="address-box">
        Estimated Time: 25 - 35 mins<br>
        Safe & Contactless Delivery
    </div>

</div>

                <div class="section">
                    <h3>💰 Order Summary</h3>

                    <div class="summary-item">
                        <span>Food Items</span>
                        <span>Included</span>
                    </div>

                    <div class="summary-item">
                        <span>Delivery Fee</span>
                        <span>₹40</span>
                    </div>

                    <div class="summary-item">
                        <span>Taxes</span>
                        <span>Included</span>
                    </div>

                    <div class="total">
                        Ready To Place Order
                    </div>
                </div>

            </div>

            <div class="section" style="margin-top:25px;">
                <h3>💳 Payment Method</h3>

                <select name="paymentMethod" class="payment-select">
                    <option value="COD">Cash On Delivery</option>
                    <option value="UPI">UPI Payment</option>
                    <option value="CARD">Credit / Debit Card</option>
                </select>
            </div>

            <button type="submit" class="place-order">
                🚀 Place Order
            </button>

            <div class="secure">
                🔒 Secure Checkout Protected
            </div>

        </form>

    </div>

</div>

</body>
</html>
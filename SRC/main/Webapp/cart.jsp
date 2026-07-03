<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>
<%@ page import="java.util.Collection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Premium Cart</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI',sans-serif;}
body{
 background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);
 min-height:100vh;padding:40px;color:white;
}
.cart-container{
 max-width:950px;margin:auto;
 background:rgba(255,255,255,.08);
 backdrop-filter:blur(15px);
 border:1px solid rgba(255,255,255,.1);
 border-radius:25px;padding:30px;
 box-shadow:0 10px 40px rgba(0,0,0,.4);
}
.logout{text-align:right;margin-bottom:20px;}
.logout a{background:#ef4444;color:#fff;text-decoration:none;padding:10px 18px;border-radius:10px;}
h1{text-align:center;margin-bottom:25px;font-size:38px;}
table{width:100%;border-collapse:collapse;}
th{background:#8b5cf6;padding:16px;}
td{padding:16px;text-align:center;border-bottom:1px solid rgba(255,255,255,.08);}
tr:hover{background:rgba(255,255,255,.05);}
.qtyBtn{background:#3b82f6;color:white;text-decoration:none;padding:6px 12px;border-radius:8px;}
.removeBtn{background:#ef4444;color:white;text-decoration:none;padding:8px 14px;border-radius:8px;}
.totalRow{background:rgba(139,92,246,.15);font-weight:bold;}
.action-buttons{text-align:center;margin-top:30px;}
.button{
 display:inline-block;margin:6px;padding:12px 22px;
 background:#8b5cf6;color:white;text-decoration:none;border-radius:12px;
}
.empty-cart{text-align:center;padding:40px;}
</style>
</head>
<body>

<div class="cart-container">

<div class="logout">
<a href="logout">Logout</a>
</div>

<h1>🛒 Your Cart</h1>

<%
Cart cart=(Cart)session.getAttribute("cart");

if(cart!=null && !cart.getItems().isEmpty()){

Collection<CartItem> items=cart.getItems();
%>

<table>
<tr>
<th>Item</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
<th>Action</th>
</tr>

<%
for(CartItem item:items){
%>

<tr>
<td><%=item.getItemName()%></td>
<td>₹<%=item.getPrice()%></td>

<td>
<a class="qtyBtn" href="updateCart?menuId=<%=item.getMenuId()%>&quantity=<%=item.getQuantity()-1%>">−</a>
&nbsp;<strong><%=item.getQuantity()%></strong>&nbsp;
<a class="qtyBtn" href="updateCart?menuId=<%=item.getMenuId()%>&quantity=<%=item.getQuantity()+1%>">+</a>
</td>

<td>₹<%=item.getTotalPrice()%></td>

<td>
<a class="removeBtn" href="removeItem?menuId=<%=item.getMenuId()%>">Remove</a>
</td>
</tr>

<%
}
%>

<tr class="totalRow">
<td colspan="4">Grand Total</td>
<td>₹<%=cart.getTotalAmount()%></td>
</tr>

</table>

<div class="action-buttons">
<a class="button" href="restaurants">🍔 Continue Shopping</a>
<a class="button" href="checkout.jsp">🚀 Checkout</a>
<a class="button" href="clearCart">🗑 Clear Cart</a>
</div>

<%
}else{
%>

<div class="empty-cart">
<h2>🛒 Your Cart Is Empty</h2>
<br>
<a class="button" href="restaurants">🍔 Go To Restaurants</a>
</div>

<%
}
%>

</div>
</body>
</html>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderTable"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Orders</title>

<style>

table{

    width:90%;
    margin:auto;
    border-collapse:collapse;
}

th,td{

    border:1px solid black;
    padding:10px;
    text-align:center;
}

select{

    padding:5px;
}

button{

    padding:8px;
    background:green;
    color:white;
}

</style>

</head>

<body>

<h1 align="center">

Admin Order Management

</h1>

<table>

<tr>

<th>Order ID</th>
<th>User ID</th>
<th>Total</th>
<th>Status</th>
<th>Update</th>

</tr>

<%

List<OrderTable> orders =
(List<OrderTable>)
request.getAttribute("orders");

if(orders != null){

for(OrderTable o : orders){

%>

<tr>

<td>
<%=o.getOrderId()%>
</td>

<td>
<%=o.getUserId()%>
</td>

<td>
&#8377;<%=o.getTotalAmount()%>
</td>

<td>
<%=o.getStatus()%>
</td>

<td>

<form action="updateStatus"
method="post">

<input type="hidden"
name="orderId"
value="<%=o.getOrderId()%>">

<select name="status">

<option value="PENDING"
<%=o.getStatus().equals("PENDING") ?
"selected" : ""%>>
PENDING
</option>

<option value="CONFIRMED"
<%=o.getStatus().equals("CONFIRMED") ?
"selected" : ""%>>
CONFIRMED
</option>

<option value="PREPARING"
<%=o.getStatus().equals("PREPARING") ?
"selected" : ""%>>
PREPARING
</option>

<option value="OUT_FOR_DELIVERY"
<%=o.getStatus().equals("OUT_FOR_DELIVERY") ?
"selected" : ""%>>
OUT FOR DELIVERY
</option>

<option value="DELIVERED"
<%=o.getStatus().equals("DELIVERED") ?
"selected" : ""%>>
DELIVERED
</option>

</select>

<button type="submit">

Update

</button>

</form>

</td>

</tr>

<%

}
}

%>

</table>

</body>

</html>
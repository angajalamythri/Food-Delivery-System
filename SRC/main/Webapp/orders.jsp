<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderTable"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body{
    background: linear-gradient(135deg,#f5f7fa,#c3cfe2);
    min-height:100vh;
    padding:40px;
}
@media(max-width:768px){

    body{
        padding:15px;
    }

    table{
        display:block;
        overflow-x:auto;
        white-space:nowrap;
    }

    .dashboard-header{
        flex-direction:column;
        gap:15px;
    }

    .order-count{
        width:70px;
        height:70px;
    }

    .container{
        padding:20px;
    }
}

.top-bar{
    display:flex;
    justify-content:flex-end;
    margin-bottom:20px;
}

.logout-btn{
    text-decoration:none;
    background:#ff4d4d;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    font-weight:600;
    transition:0.3s;
}

.logout-btn:hover{
    background:#e60000;
}

.container{
    max-width:1100px;
    margin:auto;
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
}

h1{
    text-align:center;
    margin-bottom:25px;
    color:#333;
}

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:15px;
}

thead{
    background:linear-gradient(90deg,#667eea,#764ba2);
    color:white;
}

th{
    padding:15px;
    text-align:center;
}

td{
    padding:15px;
    text-align:center;
    border-bottom:1px solid #eee;
}

tbody tr{
    transition:0.3s;
}

tbody tr:hover{
    background:#f8f9ff;
    transform:scale(1.01);
}

.price{
    font-weight:bold;
    color:#28a745;
}

.status{
    padding:6px 14px;
    border-radius:20px;
    color:white;
    font-size:13px;
    font-weight:600;
}
.dashboard-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
    flex-wrap:wrap;
}

.dashboard-header h1{
    margin:0;
    color:#333;
}

.dashboard-header p{
    color:#777;
    margin-top:5px;
}

.order-count{
    width:90px;
    height:90px;
    border-radius:50%;
    background:linear-gradient(135deg,#667eea,#764ba2);
    color:white;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    font-weight:bold;
}

.order-count span{
    font-size:24px;
}

.delivered{
    background:#28a745;
}

.pending{
    background:#ff9800;
}

.cancelled{
    background:#dc3545;
}

.processing{
    background:#2196f3;
}

.details-btn{
    text-decoration:none;
    background:#667eea;
    color:white;
    padding:8px 15px;
    border-radius:8px;
    font-size:14px;
    transition:0.3s;
}
.container{
    animation:fadeIn .6s ease-in-out;
}

@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(20px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.details-btn{
    display:inline-block;
    background:linear-gradient(45deg,#667eea,#764ba2);
    color:white;
    padding:10px 18px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
    transition:all .3s ease;
}

.details-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 6px 15px rgba(102,126,234,.4);
}
.details-btn:hover{
    background:#4f63d2;
}

.no-orders{
    text-align:center;
    padding:40px;
    font-size:18px;
    color:#777;
}
</style>

</head>
<body>

<div class="top-bar">
    <a href="logout" class="logout-btn">Logout</a>
</div>

<div class="container">

    <h1>🛒 My Order History</h1>

    <%
    List<OrderTable> orders =
        (List<OrderTable>) request.getAttribute("orders");
    %>

    <% if(orders != null && !orders.isEmpty()) { %>

    <table>

        <thead>
            <tr>
                <th>Order ID</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Payment</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

        <% for(OrderTable o : orders){ %>

            <tr>

                <td>#<%=o.getOrderId()%></td>

                <td class="price">
                    ₹<%=o.getTotalAmount()%>
                </td>

                <td>
                    <%
                    String status = o.getStatus().toLowerCase();
                    String cssClass = "processing";

                    if(status.equals("delivered"))
                        cssClass = "delivered";
                    else if(status.equals("pending"))
                        cssClass = "pending";
                    else if(status.equals("cancelled"))
                        cssClass = "cancelled";
                    %>

                    <span class="status <%=cssClass%>">
                        <%=o.getStatus()%>
                    </span>
                </td>

                <td>
                    <%=o.getPaymentMethod()%>
                </td>

                <td>
                    <a class="details-btn"
                       href="orderDetails?orderId=<%=o.getOrderId()%>">
                        View Details
                    </a>
                </td>

            </tr>

        <% } %>

        </tbody>

    </table>

    <% } else { %>

        <div class="no-orders">
            📦 No orders found yet.
        </div>

    <% } %>

</div>

</body>
</html>
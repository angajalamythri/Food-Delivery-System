<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderItem"%>
<%@ page import="com.food.model.OrderTable"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	min-height: 100vh;
	background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
	padding: 30px;
	color: white;
}

.container {
	max-width: 1000px;
	margin: auto;
}

.order-box {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(15px);
	border: 1px solid rgba(255, 255, 255, 0.1);
	border-radius: 25px;
	padding: 30px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, .4);
}

.header {
	text-align: center;
	margin-bottom: 30px;
}

.header h1 {
	font-size: 40px;
	color: #fff;
}

.order-id {
	display: inline-block;
	margin-top: 10px;
	background: #8b5cf6;
	padding: 10px 20px;
	border-radius: 30px;
	font-weight: bold;
}

.summary {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	gap: 20px;
	margin-bottom: 35px;
}

.summary-card {
	flex: 1;
	min-width: 180px;
	background: rgba(255, 255, 255, 0.06);
	padding: 20px;
	border-radius: 15px;
	text-align: center;
	transition: .3s;
}

.summary-card:hover {
	transform: translateY(-5px);
}

.summary-card h3 {
	color: #a78bfa;
	margin-bottom: 10px;
}

.items-grid {
	display: grid;
	gap: 20px;
}

.item-card {
	background: rgba(255, 255, 255, 0.08);
	border-radius: 18px;
	padding: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: .3s;
	border: 1px solid rgba(255, 255, 255, 0.08);
}

.item-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 0 25px rgba(139, 92, 246, .5);
}

.food-icon {
	width: 65px;
	height: 65px;
	border-radius: 50%;
	background: #8b5cf6;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 28px;
}

.item-left {
	display: flex;
	align-items: center;
	gap: 15px;
}

.item-name {
	font-size: 18px;
	font-weight: 600;
}

.qty {
	color: #bbb;
	margin-top: 5px;
}

.price {
	font-size: 22px;
	font-weight: bold;
	color: #22c55e;
}

.total-section {
	margin-top: 30px;
	background: linear-gradient(135deg, #8b5cf6, #6d28d9);
	padding: 25px;
	border-radius: 20px;
	text-align: center;
}

.total-section h2 {
	margin-bottom: 10px;
}

.total-price {
	font-size: 38px;
	font-weight: bold;
}

.back-btn {
	display: inline-block;
	margin-top: 25px;
	text-decoration: none;
	color: white;
	background: #8b5cf6;
	padding: 12px 24px;
	border-radius: 12px;
	transition: .3s;
}

.back-btn:hover {
	background: #7c3aed;
}

.center {
	text-align: center;
}

@media ( max-width :768px) {
	.item-card {
		flex-direction: column;
		gap: 15px;
		text-align: center;
	}
	.item-left {
		flex-direction: column;
	}
	.summary {
		flex-direction: column;
	}
	.header h1 {
		font-size: 28px;
	}
}

.tracker {
	display: flex;
	justify-content: space-between;
	margin: 30px 0;
	flex-wrap: wrap;
}

.step {
	flex: 1;
	min-width: 120px;
	text-align: center;
}

.circle {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	margin: auto;
	line-height: 45px;
	font-weight: bold;
	background: #555;
	color: white;
}

.active .circle {
	background: #22c55e;
}

.step-label {
	margin-top: 10px;
	font-size: 14px;
}
</style>

</head>

<body>

	<%
List<OrderItem> items =
(List<OrderItem>)request.getAttribute("orderItems");
OrderTable order =
(OrderTable)request.getAttribute(
        "order");

double grandTotal = 0;

if(items != null){
    for(OrderItem item : items){
        grandTotal += item.getItemTotal();
    }
}
%>

	<div class="container">

		<div class="order-box">

			<div class="header">

				<h1>🍔 Order Details</h1>

				<div class="order-id">
					Order #<%=request.getAttribute("orderId")%>
				</div>

			</div>
			<div class="summary">

				<div class="summary-card">
					<h3>Items</h3>
					<p><%=items != null ? items.size() : 0%></p>
				</div>

				<div class="summary-card">
					<h3>Status</h3>
					<p>
						<%=order != null ?
            order.getStatus() :
            "Unknown"%>
					</p>
				</div>

				<div class="summary-card">
					<h3>Total</h3>
					<p>
						₹<%=grandTotal%></p>
				</div>

				<div class="summary-card">
					<h3>Address</h3>
					<p>
						<%=order != null ?
            order.getDeliveryAddress() :
            "Not Available"%>
					</p>
				</div>

			</div>

			<%
String status = order.getStatus();

int stage = 1;

if(status.equals("CONFIRMED"))
    stage = 2;

else if(status.equals("PREPARING"))
    stage = 3;

else if(status.equals("OUT_FOR_DELIVERY"))
    stage = 4;

else if(status.equals("DELIVERED"))
    stage = 5;
%>

			<div class="tracker">

				<div class="step <%=stage >= 1 ? "active" : ""%>">
					<div class="circle">✓</div>
					<div class="step-label">Pending</div>
				</div>

				<div class="step <%=stage >= 2 ? "active" : ""%>">
					<div class="circle">✓</div>
					<div class="step-label">Confirmed</div>
				</div>

				<div class="step <%=stage >= 3 ? "active" : ""%>">
					<div class="circle">✓</div>
					<div class="step-label">Preparing</div>
				</div>

				<div class="step <%=stage >= 4 ? "active" : ""%>">
					<div class="circle">✓</div>
					<div class="step-label">Out For Delivery</div>
				</div>

				<div class="step <%=stage >= 5 ? "active" : ""%>">
					<div class="circle">✓</div>
					<div class="step-label">Delivered</div>
				</div>

			</div>

			<div class="items-grid">

				<%
            if(items != null){

            for(OrderItem item : items){
            %>

				<div class="item-card">

					<div class="item-left">

						<div class="food-icon">🍕</div>

						<div>

							<div class="item-name">
								<%=item.getItemName()%>
							</div>

							<div class="qty">
								Quantity :
								<%=item.getQuantity()%>
							</div>

						</div>

					</div>

					<div class="price">
						₹<%=item.getItemTotal()%>
					</div>

				</div>

				<%
            }
            }
            %>

			</div>

			<div class="total-section">

				<h2>Grand Total</h2>

				<div class="total-price">
					₹<%=grandTotal%>
				</div>

			</div>

			<%
if(order != null &&
   "DELIVERED".equals(order.getStatus())){
%>

			<div class="total-section">

				<h2>Rate Your Experience</h2>

				<form action="review" method="post">

					<input type="hidden" name="restaurantId"
						value="<%=order.getRestaurantId()%>"> <br> <label>Rating</label>

					<br>
					<br> <select name="rating"
						style="padding: 10px; border-radius: 10px; width: 200px;">

						<option value="5">5 Stars</option>

						<option value="4">4 Stars</option>

						<option value="3">3 Stars</option>

						<option value="2">2 Stars</option>

						<option value="1">1 Star</option>

					</select> <br>
					<br>

					<textarea name="comment" rows="4" cols="40"
						placeholder="Write your review..."
						style="padding: 10px; border-radius: 10px;"></textarea>

					<br>
					<br>

					<button type="submit" class="back-btn">Submit Review</button>

				</form>

			</div>

			<%
}
%>

			<div class="center">

				<a href="orders" class="back-btn"> ← Back To Orders </a>

			</div>

		</div>

	</div>

</body>

</html>
# 🍽️ Food - Online Food Ordering System

## 📖 About the Project

Food Application is a Java-based food ordering web application inspired by popular food delivery platforms such as **Swiggy** and **Zomato**. The application enables users to browse restaurants, explore menus, add items to a shopping cart, place orders, manage their profiles, and submit reviews through a modern, responsive interface.

The project follows the **MVC (Model-View-Controller)** architecture using Java Servlets, JSP, JDBC, and MySQL, making it a strong demonstration of Java Full Stack development principles.

---

## 🚀 Features

### 👤 User Features

* User Registration
* Secure Login & Logout
* Session Management
* Edit Profile
* Browse Restaurants
* Restaurant Search
* View Restaurant Menus
* Add Items to Cart
* Update Cart Quantity
* Remove Cart Items
* Checkout & Place Orders
* Order History
* Customer Reviews & Ratings

---

### 👨‍💼 Admin Features

* Admin Dashboard
* Manage Orders
* Update Order Status
* View Customers
* Manage Restaurants
* Monitor Reviews

---

## 🏗 Architecture

The project follows the **MVC Design Pattern**.

```
Client (Browser)
        │
        ▼
JSP Pages (View)
        │
        ▼
Servlets (Controller)
        │
        ▼
DAO Layer
        │
        ▼
DAO Implementation
        │
        ▼
MySQL Database
```

---

# 🛠 Technology Stack

| Category              | Technologies            |
| --------------------- | ----------------------- |
| Language              | Java 17                 |
| Backend               | Servlets, JSP           |
| Database              | MySQL                   |
| Database Connectivity | JDBC                    |
| Server                | Apache Tomcat 10        |
| Frontend              | HTML5, CSS3, JavaScript |
| IDE                   | Eclipse IDE             |
| Version Control       | Git & GitHub            |

---

# 📁 Project Structure

```
food
│
├── src/main/java
│
│── com.food.dao
│     ├── UserDAO
│     ├── RestaurantDAO
│     ├── MenuDAO
│     ├── OrderDAO
│     ├── OrderItemDAO
│     └── ReviewDAO
│
│── com.food.daoimpl
│     ├── UserDAOImpl
│     ├── RestaurantDAOImpl
│     ├── MenuDAOImpl
│     ├── OrderDAOImpl
│     ├── OrderItemDAOImpl
│     └── ReviewDAOImpl
│
│── com.food.model
│     ├── User
│     ├── Restaurant
│     ├── Menu
│     ├── Cart
│     ├── CartItem
│     ├── Order
│     ├── OrderItem
│     └── Review
│
│── com.food.servlet
│     ├── LoginServlet
│     ├── RegisterServlet
│     ├── RestaurantServlet
│     ├── MenuServlet
│     ├── CartServlet
│     ├── CheckoutServlet
│     ├── ReviewServlet
│     ├── AdminDashboardServlet
│     ├── AdminOrdersServlet
│     └── ...
│
│── com.food.util
│     └── DBConnection
│
└── src/main/webapp
      ├── images
      │      ├── menu
      │      └── restaurants
      │
      ├── login.jsp
      ├── register.jsp
      ├── home.jsp
      ├── menu.jsp
      ├── cart.jsp
      ├── checkout.jsp
      ├── profile.jsp
      ├── orders.jsp
      ├── adminDashboard.jsp
      └── adminOrders.jsp
```

---

# 💾 Database Setup

Create the database.

```sql
CREATE DATABASE food_express;
```

Import the provided SQL file.

```
food_express.sql
```

---

# ⚙ Configure Database

Open

```
DBConnection.java
```

Update your database credentials.

```java
private static final String URL =
"jdbc:mysql://localhost:3306/food_express";

private static final String USERNAME =
"root";

private static final String PASSWORD =
"your_password";
```

---

# 📦 Required Software

* Java JDK 17+
* Eclipse IDE
* Apache Tomcat 10
* MySQL Server
* MySQL Workbench

---

# 📚 Required Libraries

Add the MySQL JDBC Driver.

```
mysql-connector-j-9.x.x.jar
```

---

# ▶️ Installation Guide

### 1 Clone Repository

```bash
git clone https://github.com/Prasu1118/OnlyFood.git
```

### 2 Open Eclipse

Import the project as an Existing Dynamic Web Project.

### 3 Configure Apache Tomcat

Add Tomcat Runtime.

### 4 Configure MySQL

Create the database and import the SQL file.

### 5 Add JDBC Driver

Place the MySQL Connector JAR into the project libraries.

### 6 Update DBConnection.java

Enter your MySQL username and password.

### 7 Run Project

Run on Apache Tomcat.

Open

```
http://localhost:8080/OnlyFood
```

---

# 📸 Application Screenshots

Add screenshots like these inside a **screenshots** folder.

```
screenshots/
│── home.png
│── restaurants.png
│── menu.png
│── cart.png
│── checkout.png
│── profile.png
│── orders.png
│── admin-dashboard.png
```

---

# ✨ Highlights

* MVC Architecture
* Layered Project Structure
* Responsive UI
* Secure Session Management
* JDBC Connectivity
* Dynamic Restaurant Search
* Shopping Cart
* Order Processing
* Customer Reviews
* Admin Dashboard
* Modern Food Delivery UI
* Clean Object-Oriented Design

---

# 🔮 Future Improvements

* Online Payment Gateway
* Email Notifications
* OTP Verification
* Delivery Tracking
* AI-Based Food Recommendation
* REST API
* Spring Boot Migration
* Spring Security
* Docker Deployment
* Cloud Hosting

---

# 👨‍💻 Developer

**Nethi Prasanna Kumar**

Java Full Stack Developer

* 📧 Email: [angajalamythri@gmail.com](mailto:angajalamythri@gmail.com)
* 💼 LinkedIn: https://www.linkedin.com/in/angajala-mythri-a31245343.
* 💻 GitHub:https://github.com/angajalamythri
---

# 🌟 Support

If you found this project useful, please consider giving it a **⭐ Star** on GitHub.

It helps others discover the project and motivates future improvements.

---

## 📄 License

This project was developed for educational purposes, portfolio demonstration, and Java Full Stack learning.

---

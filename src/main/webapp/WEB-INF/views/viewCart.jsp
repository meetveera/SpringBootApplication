<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Cart</title>
<style>
h1{
	display: block;
  font-family: sans-serif;
  font-size: 115%;
}
	.flat-table {
  display: block;
  font-family: sans-serif;
  -webkit-font-smoothing: antialiased;
  font-size: 100%;
  overflow: auto;
  width: auto;
  }
  
  th {
    background-color: rgb(112, 196, 105);
    color: white;
    font-weight: normal;
    padding: 10px 10px;
    text-align: center;
  }
  td {
    background-color: rgb(238, 238, 238);
    color: rgb(111, 111, 111);
    padding: 10px 10px;
  }

body {
        	 background-image : url("https://i2.cdn.turner.com/money/dam/assets/160829123506-airfare-financing-540x304.jpg");
       /*  background-image : url("C:/Users/meetv/Documents/workspace-sts-3.9.8.RELEASE/Final_Project/flight-tracker.jpg"); */
				background-size: 1300px 800px;
				background-repeat: no-repeat;
        font-family: 'Ubuntu', sans-serif;
    }
    
</style>
</head>
<body>
        <c:choose>
            <c:when test="${!empty sessionScope.username}">
                <jsp:include page="menu.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="menu2.jsp"/>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${!empty sessionScope.cart}">
                <h3>Your cart contents</h3>
                <table class="flat-table">
                    <tr>
                        <th>Flight Number</th>
		                <th>Flight Name</th>
		                <th>Airplane Id</th>
		                <th>Price</th>
		                <th>Departure time</th>
		                <th>Destination arrival time </th>
                    </tr>
                    <c:forEach var="flight" items="${sessionScope.cart}">
                <tr>
                    <td>${flight.flight_id}</td>
                    <td>${flight.flight_name}</td>
                    <td>${flight.airplane_id}</td>
                    <td>$${flight.amount}</td>
                    <td>${flight.deptTime}</td>
                    <td>${flight.arrivalTime}</td>
                    <td><a href="removeFromCart.htm?action=remove&id=${flight.flight_id}"> [Remove from cart]</a></td>
                </tr>   
            </c:forEach>
                    <tr><td></td><td></td></tr>
                    <tr>
                        <td>Total</td>
                        <td>${sessionScope.total}</td>
                    </tr>
                </table>
                <br><br>
                <a href="passenger1.htm"> Proceed to enter details and Payment>></a>
            </c:when>
            <c:otherwise>
                <h3>Oops.. your cart is empty</h3>
                <p><a href="index.htm">Return to main page</a></p>
            </c:otherwise>
        </c:choose>

</body>
</html>
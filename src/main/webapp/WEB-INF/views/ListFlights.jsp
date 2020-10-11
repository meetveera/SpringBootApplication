<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Flights</title>
<style>

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
  .add {
  padding: 10px;
  &:before, &:after {
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    border-style: solid;
    border-color: $hover;
  }
  &:before {
    border-width: 2px 0 2px 0;
    transform:  scaleX(0);
  }
  &:after {
    border-width: 0 2px 0 2px;
    transform:  scaleY(0);
  }
  &:hover:before, &:hover:after {
    transform:  scale(1, 1);
  }
}
.button{
	display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: sky;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover{
	background-color: #3e8e41
}

.button:active{
	background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
body{
			
			 background-image : url("https://i2.cdn.turner.com/money/dam/assets/160829123506-airfare-financing-540x304.jpg");
       /*  background-image : url("C:/Users/meetv/Documents/workspace-sts-3.9.8.RELEASE/Final_Project/flight-tracker.jpg"); */
				background-size: 1300px 800px;
				background-repeat: no-repeat;
        font-family: 'Ubuntu', sans-serif;
			}


</style>
</head>
<body>
 <jsp:include page="menu.jsp"/>
 <h2><a class="add" href="addflights.htm"><button class="button"> Add flight </button></a></h2>


 <h2 style="text-align:center">List of flights are:</h2>
  <form action="updateFlights.htm" method="get">
<table class="flat-table">
<tr>
					<th>Flight Id </th>
					<th>Airplane Id</th>
					<th>From</th>
					<th>Dest</th>
					<th>Departure Time</th>
					<th>Arrival Time</th>
					<th>Travel Class</th>
					<th>Total Seats</th>
					<th>Amount</th>
					<th>Departure Date</th>
					<th>Arrival Date</th>
					<th></th>
					<th></th>
</tr>

<c:forEach var="flight" items="${sessionScope.listOfFlights}">
<tr>
					<td>${flight.flight_id}</td>
                    <td>${flight.airplane_id}</td>
                    <td>${flight.from}</td>
                    <td>${flight.dest}</td>
                    <td>${flight.deptTime}</td>
                    <td>${flight.arrivalTime}</td>
                    <td>${flight.travelClass}</td>
                    <td>${flight.totalSeats}</td>
                    <td>${flight.amount}</td>
                    <td>${flight.deptDate}</td>
                    <td>${flight.arrDate}</td>
                    <td><a style="text-decoration: none" href="updateFlights.htm?id=${flight.flight_id}&action=update">Update Flight</a></td>
                    <td><a style="text-decoration: none" href="deleteFlights.htm?id=${flight.flight_id}">Delete Flight</a></td>
</tr>
</c:forEach>
</table>
</form>
</body>
</html>
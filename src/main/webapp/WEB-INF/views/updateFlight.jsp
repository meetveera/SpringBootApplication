<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Flight</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <script>
 $(document).ready(function(){
	    $("#txtFromDate").datepicker({
	        numberOfMonths: 2,
	        minDate: 0,
	        onSelect: function(selected) {
	          $("#txtToDate").datepicker("option","minDate", selected)
	        }
	    });
	    $("#txtToDate").datepicker({ 
	        numberOfMonths: 2,
	        onSelect: function(selected) {
	           $("#txtFromDate").datepicker("option","maxDate", selected)
	        }
	    });  
	});

</script>
<style>
	body{
			
			 background-image : url("https://i2.cdn.turner.com/money/dam/assets/160829123506-airfare-financing-540x304.jpg");
       /*  background-image : url("C:/Users/meetv/Documents/workspace-sts-3.9.8.RELEASE/Final_Project/flight-tracker.jpg"); */
				background-size: 1300px 800px;
				background-repeat: no-repeat;
        font-family: 'Ubuntu', sans-serif;
			}
			input[type=text], select {
  width: auto;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
div {
  border-radius: 5px;
  
  padding: 20px;
}
</style>
</head>
<body>
<h1 style="text-align:center">Update the Flight details</h1>
<form:form action="updateFlight.htm" commandName="fd" method="post">
<table>
<tr>
<td>Flight ID</td>
<td><form:input type="text" path="flight_id" value="${requestScope.flight.flight_id}" size="30"/><font color="red"><form:errors path="flight_name"/></font></td>

<td>Flight Name</td>
<td><form:input type="text" path="flight_name" value="${requestScope.flight.flight_name}" size="30"/><font color="red"><form:errors path="flight_name"/></font></td>
<td>Airplane Id</td>
<td><form:input type="text" path="airplane_id" value="${requestScope.flight.airplane_id}" size="30"/><font color="red"><form:errors path="airplane_id"/></font></td>
</tr>
<tr>
<td>From</td>
<td><form:input type="text" path="from" value="${requestScope.flight.from}" size="30"/><font color="red"><form:errors path="from"/></font></td>

<td>Destination</td>
<td><form:input type="text" path="dest" value="${requestScope.flight.dest}" size="30"/><font color="red"><form:errors path="dest"/></font></td>
</tr>
<tr>
<td>Departure Time</td>
<td><form:input type="text" path="deptTime" value="${requestScope.flight.deptTime}" size="30"/><font color="red"><form:errors path="deptTime"/></font></td>

<td>Arrival Time</td>
<td><form:input type="text" path="arrivalTime" value="${requestScope.flight.arrivalTime}" size="30"/><font color="red"><form:errors path="arrivalTime"/></font></td>
</tr>
<tr>
<td>Travel Class</td>
<td><form:input type="text" path="travelClass" value="${requestScope.flight.travelClass}" size="30"/><font color="red"><form:errors path="travelClass"/></font></td>
</tr>
<tr>
<td>Total Seats</td>
<td><form:input type="text" path="totalSeats" value="${requestScope.flight.totalSeats}" size="30" readonly="true"/><font color="red"><form:errors path="totalSeats"/></font></td>
<td>Available Seats</td>
<td><form:input type="text" path="availableSeats" value="${requestScope.flight.availableSeats}" size="30"/><font color="red"><form:errors path="availableSeats"/></font></td>
</tr>
<tr>
<td>Amount</td>
<td><form:input type="text" path="amount" value="${requestScope.flight.amount}" size="30"/><font color="red"><form:errors path="amount"/></font></td>
</tr>
<tr>
<td>Departure Date</td>
<td><form:input type="text" path="deptDate" id="txtFromDate" value="${requestScope.flight.deptDate}" size="30"/><font color="red"><form:errors path="deptDate"/></font></td>
<td>Arrival Date</td>
<td><form:input type="text" path="arrDate" id="txtToDate" value="${requestScope.flight.arrDate}" size="30"/><font color="red"><form:errors path="arrDate"/></font></td>

</tr>

<tr>
    <td colspan="2"><input type="submit" value="Update flight to database" /></td>
</tr>

</table>



</form:form>
<a href="adminHome.htm">Go Back to Menu Page</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Airplane</title>
<style>
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
  width: auto;
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
<div>
<form:form action="addAirplane.htm" commandName="airplane" method="post">
<h1 style="text-align:center">Please enter the details</h1><br><br>

<label>Airline Name:</label> <form:input type="text" path="airlineName" name="airlineName" size="30" required="required"/><br><br>

<label>Owner:       </label> <form:input type="text" path="owner" name="owner" size="30" required="required" /><br><br>

			  <input type="submit" value="Add Airplane" />
</form:form>
</div>
</body>
</html>
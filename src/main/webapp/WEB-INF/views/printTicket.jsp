<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Printout</title>
<style>
body{
			
			 background-image : url("https://i2.cdn.turner.com/money/dam/assets/160829123506-airfare-financing-540x304.jpg");
       /*  background-image : url("C:/Users/meetv/Documents/workspace-sts-3.9.8.RELEASE/Final_Project/flight-tracker.jpg"); */
				background-size: 1300px 800px;
				background-repeat: no-repeat;
        font-family: 'Ubuntu', sans-serif;
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
</style>
</head>
<body>
<div align="center">
<br><br><br><br><br><br>
<a href="downloadTicket.pdf"><button class="button">Download Ticket PDF</button></a><br><br><br>
<a href="emailTicket.htm"> <button class="button">Send Email Confirmation</button></a><br><br><br>
<a href="deleteTicket.htm"><button class="button">Delete Ticket</button></a><br><br><br>
</div>
</body>
</html>
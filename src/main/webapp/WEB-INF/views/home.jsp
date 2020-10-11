<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Booking Service</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script>
 $(document).ready(function(){
	    $("#txtFromDate").datepicker({
	        numberOfMonths: 2,
	        minDate: 0
	    });
	});

        //AJAX
        var xmlHttp;
        xmlHttp = GetXmlHttpObject();
        function names1()
        {
        	if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }
            var destCities = document.getElementById("dest").value;   
            var query = "fromCities="+destCities;
            

            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    
                   var dataList = document.getElementById('json-datalist1');
                    var json = JSON.parse(xmlHttp.responseText);
                    for(var i=0;i<json.list.length;i++)
                    	{
                    	
                    	var option = document.createElement("option");
                    	option.value=json.list[i].cityname;
                    	option.textContent = name;
                    	dataList.appendChild(option);
                    	}
                   
                }
            };
        	
            xmlHttp.open("POST", "fromCitieslist.htm", true);
            xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttp.send(query);
           return false;
        }
        
        function names() {
           if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }
            var fromCities = document.getElementById("from").value;   
            var query = "fromCities="+fromCities;
            

            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    
                   var dataList = document.getElementById('json-datalist');
                    var json = JSON.parse(xmlHttp.responseText);
                    for(var i=0;i<json.list.length;i++)
                    	{
                    	
                    	var option = document.createElement("option");
                    	option.value=json.list[i].cityname;
                    	option.textContent = name;
                    	dataList.appendChild(option);
                    	}
                   
                }
            };
            xmlHttp.open("POST", "fromCitieslist.htm", true);
            xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttp.send(query);
           return false;
        }
        
         function GetXmlHttpObject()
        {
            var xmlHttp = null;
            try
            {
                // Firefox, Opera 8.0+, Safari
                xmlHttp = new XMLHttpRequest();
            } catch (e)
            {
                // Internet Explorer
                try
                {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e)
                {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttp;
        }
        
        
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
/* div {
  border-radius: 5px;
  
  padding: 20px;
} */
/*  table{
	left: 300px;
	position : absolute;
}  */
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
 
<marquee><h1>Welcome to Airline Booking Services</h1></marquee>
<form:form action="listflights.htm" commandName="flightDetails" method="post">

<table>
<tr>
    <td>From:</td>
    <td><form:input type="text" path="from" size="30" id="from" list="json-datalist" onkeyup="return names()" required="required"/> <font color="red"><form:errors path="from"/></font></td>
	<datalist id="json-datalist"></datalist>
</tr>

<tr>
    <td>Dest:</td>
    <td><form:input type="text" path="dest" id="dest" list="json-datalist1" onkeyup="return names1()" size="30" required="required"/> <font color="red"><form:errors path="dest"/></font></td>
	<datalist id="json-datalist1"></datalist>
</tr>

<tr>
    <td>Departure Date:</td>
    <td><form:input type="text" path="deptDate" id="txtFromDate" size="30" required="required"/> <font color="red"><form:errors path="deptDate"/></font></td>
</tr>

<!-- <tr> -->
<!--     <td>Return Date:</td> -->
<%--     <td><form:input type="date" path="arrDate" id="txtToDate" size="30" /> <font color="red"><form:errors path="arrDate"/></font></td> --%>
<!-- </tr> -->

<tr>
    <td>Travel Class:</td>
    <td><form:radiobutton value="Economy" name="travelClass" path="travelClass" checked="checked"/>Economy
    	<form:radiobutton value="Business" name="travelClass" path="travelClass" />Business Class
     </td>
</tr>


<tr>
    <td colspan="2"><input type="submit" value="Search flights" /></td>
</tr>
</table>

</form:form>
 
    
    
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        <style>
        	body {
        	 background-image : url("https://i2.cdn.turner.com/money/dam/assets/160829123506-airfare-financing-540x304.jpg");
       /*  background-image : url("C:/Users/meetv/Documents/workspace-sts-3.9.8.RELEASE/Final_Project/flight-tracker.jpg"); */
				background-size: 1300px 800px;
				background-repeat: no-repeat;
        font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
        height: 400px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 40px;
        color: #8C55AA;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form1 {
        padding-top: 40px;
    }
    
    .pass {
            width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    .forgot {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        padding-top: 15px;
    }
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        text-decoration: none
    }
        	
        </style>
    </head>
    <body>
    <script>

    	function registerUser(){
    		var isValid = true;
    		var node = document.getElementById("error");
    		
    		var txtContent = node.textContent;
    		
    		
    		if(txtContent=="Username already exists")
    			{
    			isValid = false;
    			document.getElementById("duplicateuser").innerHTML= "";
    			alert("Please enter unique username");
    			}
    		return isValid;
    		
    	}
        //AJAX

        var xmlHttp;
        xmlHttp = GetXmlHttpObject();
        function checkUser() {
           if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }
            var username = document.getElementById("username").value;
            var query = "action=ajaxCheck&username="+username;

            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    //alert(xmlHttp.responseText);
                    var json = JSON.parse(xmlHttp.responseText);
                    document.getElementById("error").innerHTML="";
                    document.getElementById("error").innerHTML = json.message;
                    
                }
            };
            xmlHttp.open("POST", "signup.htm", true);
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
        <div class="main">
         <p class="sign" align="center">Sign up</p>
        <form:form action="signup.htm?action=signup" onSubmit =" return registerUser()" commandName="users" method="post" class="form1">
            
            <form:input class="un " type="text" path="username" id="username" onblur="return checkUser()" align="center" placeholder="Username" required="required" />
            <div id="error" style="color:red"></div>
            <form:input class="pass" type="password" path="password" align="center" placeholder="Password" required="required"/></p>
            <input type="submit" value="Sign Up" class="submit" align="center"/>
            <div id="duplicateuser"></div>
            <p class="forgot" align="center"><a href="index.htm">Go Back to Main Page</p>
        </form:form>
    </body>
</html>

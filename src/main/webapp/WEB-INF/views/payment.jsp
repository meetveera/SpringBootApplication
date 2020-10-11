<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,100' rel='stylesheet' type='text/css'>
<style>
	* {
    box-sizing: border-box;
	}
 
body,html {
    height: 100%;
    min-height: 100%;
}
 
body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    background-color: #e7e7e7;
    background-image : url("https://i2.cdn.turner.com/money/dam/assets/160829123506-airfare-financing-540x304.jpg");
       /*  background-image : url("C:/Users/meetv/Documents/workspace-sts-3.9.8.RELEASE/Final_Project/flight-tracker.jpg"); */
				background-size: 1300px 800px;
				background-repeat: no-repeat;
}

.credit-card {
    width: 360px;
    height: 400px;
    margin: 60px auto 0;
    border: 1px solid #ddd;
    border-radius: 6px;
    background-color: #fff;
    box-shadow: 1px 2px 3px 0 rgba(0,0,0,.10);
}
.form-header {
    height: 60px;
    padding: 20px 30px 0;
    border-bottom: 1px solid #e1e8ee;
}
 
.form-body {
    height: 340px;
    padding: 30px 30px 20px;
}
.title {
    font-size: 18px;
    margin: 0;
    color: #5e6977;
}
.card-number, .cvv-input input, .month select, .year select {
    font-size: 14px;
    font-weight: 100;
    line-height: 14px;
}
 
.card-number, .month select, .year select {
    font-size: 14px;
    font-weight: 100;
    line-height: 14px;
}
 
.card-number, .cvv-details, .cvv-input input, .month select, .year select {
    opacity: .7;
    color: #86939e;
}
.card-number {
    width: 100%;
    margin-bottom: 20px;
    padding-left: 20px;
    border: 2px solid #e1e8ee;
    border-radius: 6px;
}
.month select, .year select {
    width: 145px;
    margin-bottom: 20px;
    padding-left: 20px;
    border: 2px solid #e1e8ee;
    border-radius: 6px;
    background: url('caret.png') no-repeat;
    background-position: 85% 50%;
    -moz-appearance: none;
    -webkit-appearance: none;
}
 
.month select {
    float: left;
}
 
.year select {
    float: right;
    }
    
.cvv-input input {
    float: left;
    width: 145px;
    padding-left: 20px;
    border: 2px solid #e1e8ee;
    border-radius: 6px;
    background: #fff;
}
 
.cvv-details {
    font-size: 12px;
    font-weight: 300;
    line-height: 16px;
    float: right;
    margin-bottom: 20px;
}
 
.cvv-details p {
    margin-top: 6px;
}
.paypal-btn,
.proceed-btn {
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    border-color: transparent;
    border-radius: 6px;
}
 
.proceed-btn{
    margin-bottom: 10px;
    background: #7dc855;
}
 
.proceed-btn a {
    text-decoration: none;
}
 
.proceed-btn a {
    color: #fff;
}
 
</style>

</head>
<body>
	<jsp:include page="menu.jsp"/> 
	<form class ="credit-card" action="payment.htm" method="post">
	<!-- <pre> -->
	<div class="form-header">
		<h4 class="title">Credit Card details</h4>
	</div>
	<div class="form-body">
	
		<input type="text" name="creditCardNumber" class="card-number" placeholder="Card Number" value='${cookie.ccn.value}' required />
		<input type="text" name="bankName" class="card-number" placeholder="Bank Name" required />
		<input type="text" name="fullName" class="card-number" placeholder="Name as on Card" required/>
		<div class="date-field">
      		<div class="month">
        		<select name="expiration_month" required>
          			  <option value="january">January</option>
			          <option value="february">February</option>
			          <option value="march">March</option>
			          <option value="april">April</option>
			          <option value="may">May</option>
			          <option value="june">June</option>
			          <option value="july">July</option>
			          <option value="august">August</option>
			          <option value="september">September</option>
			          <option value="october">October</option>
			          <option value="november">November</option>
			          <option value="december">December</option>
        		</select>
     		 </div>
     		 <div class="year">
        		<select name="expiration_year" required>
			          <option value="2016">2016</option>
			          <option value="2017">2017</option>
			          <option value="2018">2018</option>
			          <option value="2019">2019</option>
			          <option value="2020">2020</option>
			          <option value="2021">2021</option>
			          <option value="2022">2022</option>
			          <option value="2023">2023</option>
			          <option value="2024">2024</option>
        		</select>
     		 </div>
    	</div>
    	<div class="card-verification">
      		<div class="cvv-input">
        		<input type="text" placeholder="CVV" required />
     		</div>
      		<div class="cvv-details">
        		<p>3 or 4 digits usually found <br> on the signature strip</p>
      		</div>
    	</div>
	
	<input type="submit" value="Book Ticket" class="proceed-btn"/>
	</div>
<!-- </pre> -->
</form>
</body>
</html>
<style>
.login {
 background:url('https://dh3vbjnk0bnfa.cloudfront.net/static/centralauth/images/btn-login.png') no-repeat 5px 5px #484B4F;
  width: 100px;
  cursor:pointer;
  border-radius:50px;
  padding:10px 20px 10px 0;
  color:White;
  font-size:14px;
  text-align:left;
  color:white;
  text-indent:40px;
  display:inline-block;
  float: right;
  margin:0 auto;
 
  /* Animations: */
  -webkit-transition-timing-function: ease-in-out;
  -webkit-transition-duration: .4s;
  -webkit-transition-property: all;
  
  -moz-transition-timing-function: ease-in-out;
  -moz-transition-duration: .4s;
  -moz-transition-property: all;
}

.login:hover {
  background-image: url('https://dh3vbjnk0bnfa.cloudfront.net/static/centralauth/images/btn-login-hover.png');
  background-position: 65px 5px;
  text-indent: 20px;  
}
	
</style>


<div>
    <h3 style="display:inline; left: 930px; top:13px;position: absolute" >Hi ${sessionScope.username}</h3> 
    <a class="login" href="logout.htm?action=logout">Logout</a> 
    <a class="login" href="viewCart.htm?action=viewcart">Cart</a>
</div>
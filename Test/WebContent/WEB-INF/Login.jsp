<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<html><body>
<div id="fixedheader" style="background-color:black;color:white;padding:20px;"><strong><center>${hmsg}</center></strong>  </div>

<%
       String msg=(String)request.getAttribute("msg");
       if(msg!=null)
       {
       %>
       <script type="text/javascript">
       alert('<%=msg%>');
       </script>
       <%} %>
       
<center>
<pre>
<form action="./check" method="post">
<div container {
    position: fixed;
    width: 340px;
    height: 280px;
    top: 50%;
    left: 50%;
    margin-top: -140px;
    margin-left: -170px;
	style="background-color:#ADD8E6;
	 width:350px;
    height: 280px;
    border-radius: 3px;
    border: 1px solid #ccc;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .1);" >   
 <center><h1>Login</h1></center>
       
  <strong>UserName</strong>     <input type="text" name="uid" />

  <strong>Password</strong>     <input type = "password" name = "password" />

<input type="submit" value="Login"style="background-color:#778899;color:white;padding:7px;" />

</div>
</form>
</pre>
</center>


<div id="fixedfooter" style="background-color:black;color:white;padding:20px;"></div>
</body>
</html>
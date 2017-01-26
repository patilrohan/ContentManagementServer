<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<style>
div.container {
    width: 100%;
    color: black;
    
}

header {
    padding: 1em;
    color: white;
    background-color: black;
    
   
}

 footer {
    padding: 1em;
    color: white;
    background-color: black;
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none
    size=;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 7.5em;
    overflow: hidden;
}
</style>
</head>
<body>

<div class="container">

<header>
   <div align="center" > ${hmsg} </div>       <div align="right" ><a href="./home"><font size="3" color="white">HOME</font></a> | <a href="./logout"><font size="3" color="white">Logout</font></a>  </div>                                   
</header>

<!DOCTYPE html>
<html>

<div align="center"></div>
<head>
<title>Save Article</title>
</head>
<body>
<center>
<div id="global">
    <h4>Edit Article</h4>
       <br/><br/>
       <%
       String msg=(String)request.getAttribute("msg");
       if(msg!=null)
       {
       %>
       <script type="text/javascript">
       alert('<%=msg%>');
       </script>
       <%} %>
       
       
       
       <table border="1">
 <tr><th>Article ID</th><th>ArticleName</th><th>Description</th><th></th><th></th></tr>
 <%@page import="java.util.ArrayList,beans.Product,java.io.File" %>
 <%	ArrayList<Product> ar=(ArrayList<Product>)request.getAttribute("List"); 
   for(Product p:ar)
   {
    %>
       <form action="./udArticles" method="post"><tr><td><input type="text" name="aid" value="<%=p.getAid()%>" readonly/></td><td><input type="text" name="aname" value="<%=p.getName()%>"/></td><td><input type="text" name="descr" value="<%=p.getDescription()%>"/></td><td><input type="submit" value="Update" name="action"/></td><td><input type="submit" value="Delete" name="action"/></td></tr></form>
    <%
    }
   %>   
       </table>
        <br/><br/><br/><br/>
       
      
      
      
      
      
        
</div>
</center>
<div id="fixedfooter" style="background-color:black;color:white;padding:20px;"></div>
</body>
</html>
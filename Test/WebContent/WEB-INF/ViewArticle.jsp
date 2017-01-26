<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

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
<header>
   <div align="center" > ${hmsg} </div>                                          
</header>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Articles</title>
</head>
<body>
<h1><center>View Articles</center></h1>
<hr/>
 <%
       String msg=(String)request.getAttribute("smsg");
       if(msg!=null)
       {
       %>
       <script type="text/javascript">
       alert('<%=msg%>');
       </script>
       <%} %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList,beans.Product,java.io.File" %>
<%	ArrayList<Product> ar=(ArrayList<Product>)request.getAttribute("List"); 
for(Product p:ar)
{
%>
<center>
<form action="./insertcomment" method="post">
<table border="1" width="70%">
<tr><td>Article ID</td><td><%=p.getAid() %><input type="hidden" name="aid" value="<%=p.getAid() %>"></td></tr>
<tr><td>Name</td><td><%=p.getName() %></td></tr>
<tr><td>Description</td><td><%=p.getDescription()%></td></tr>
<tr><td>Documents</td><td><%
File upDir = new File(request.getServletContext().getRealPath("/document"));
String fdoc[]=upDir.list();
for(String s:fdoc)
{   
	if(s.startsWith(p.getAid()+"") )
	out.println("<a href=./downloaddocument?dname="+s+">"+s+"</a><br/>");
   
	   	
	}
%></td></tr>
<tr><td>Images</td><td><%
File upDir1 = new File(request.getServletContext().getRealPath("/image"));
String fimg[]=upDir1.list();
for(String s:fimg)
{   
	if(s.startsWith(p.getAid()+""))
	{//out.println(s);
	%>
	 <img width="100" src="<c:url value="/image/"/><%=s%>"/>
	<%
	}
	
		
	}
%></td></tr>
<tr><td>Comments:</td><td><a href="./viewallcomments?aid=<%=p.getAid()%>">View Comment of this Article</a></td></tr>
<tr><td>Add Comments-</td><td><textarea name="descrip" rows="6" cols="150"></textarea><input type="submit" value="send" /></td></tr>
</table>
</form>
<br/>
</center>
<%} %>

</body>
</html>
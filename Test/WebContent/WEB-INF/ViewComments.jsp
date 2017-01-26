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
 <div align="left"> <a href="./viewarticle">View Article</a></div>  <div align="center" > ${hmsg} </div>                                          
</header>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Comments</title>
</head>
<body>
<h1><center>View Comments</center></h1>
<hr/>
<center><h2>${smsg}</h2></center>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList,beans.CommentBean,java.io.File" %>
<%	 ArrayList<CommentBean> ar=(ArrayList<CommentBean>)request.getAttribute("List"); 
if(ar!=null && !(ar.isEmpty()))
{
int aid=(ar.get(0).getAid());
%>
<center>
<table border="1" width="70%">
<tr><td>Article ID</td><td><%=aid %></td></tr>
<tr><td>Comments:</td><td></td></tr>
<% 
for(CommentBean p:ar)
{
%>
<tr><td></td><td><%=p.getDescrip() %></td></tr>
<%}}
else
{
	%>
<center><h1>NO Comment yet....</h1></center>
<% }
%>
</table>
</center>

</body>
</html>
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

<div align="center"><font size="3" color="red">${msg}</font></div>
<head>
<title>Save Article</title>
</head>
<body>
<center>
<div id="global">
    <h4>The Article has been saved.</h4>
       <br/><br/>
        <b>Article ID:</b> ${product.aid}<br/>
        <b>Article Name:</b> ${product.name}<br/>
        <b>Description:</b> ${product.description}<br/>
        <br/><br/><br/>
        <p><b>Following documents are uploaded successfully.</b></p>
         <ol>
        <c:forEach items="${product.documents}" var="doc">
            <li>${doc.originalFilename}
            </li>
        </c:forEach>
        </ol>
        <br/>
        <hr/>
        <br/>
        <p>Following images are uploaded successfully.</p>
        
        <ol>
        <c:forEach items="${product.images}" var="image">
            <li>${image.originalFilename}
            <img width="100" src="<c:url value="/image/"/>${product.aid}_${image.originalFilename}"/>
            </li>
        </c:forEach>
        </ol>
        
        
</div>
</center>
<div id="fixedfooter" style="background-color:black;color:white;padding:20px;"></div>
</body>
</html>
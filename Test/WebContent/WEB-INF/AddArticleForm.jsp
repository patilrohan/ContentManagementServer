<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!DOCTYPE html>
<html>
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

<head>
<title>Add Article Form</title>
</head>
<body>

<br/><br/><br/>
<center>
    <div id="global">
        <form:form commandName="product" action="save-product" method="post" enctype="multipart/form-data">
            
                 <p>
                    <label for="name">Article ID: </label>
                    <form:input id="aid" path="aid" cssErrorClass="error"  value="${aid}" readonly="readonly"/>
                    <form:errors path="name" cssClass="error" />
                </p>
               
                <p>
                    <label for="name">Article Name: </label>
                    <form:input id="name" path="name" cssErrorClass="error" />
                    <form:errors path="name" cssClass="error" />
                </p>
                <p>
                    <label for="description">Description: </label>
                    <form:input id="description" path="description" />
                </p>
                <p>
                    <label for="image">Documents: </label> 
                    <input type="file" name="documents" multiple="multiple"/>
                </p>
                 <p>
                    <label for="image">Article Images: </label> 
                    <input type="file" name="images" multiple="multiple"/>
                </p>
                <p id="buttons">
                    <input id="reset" type="reset" tabindex="4"> 
                    <input id="submit" type="submit" tabindex="5" value="Add Article">
                </p>
          
        </form:form>
    </div></center>
    
<div id="fixedfooter" style="background-color:black;color:white;padding:20px;"></div>
</body>
</html>

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

   
 
<nav><pre>
  <ul>
    <li><a href="./create">Create Article</a></li>
    
    <li><a href="./editarticle">Edit All Article</a></li>
    
    </ul></pre>
</nav>

<article>

  <h1><img src="<%=request.getContextPath() %>/images/admin.jpg"  align=right height="250" width="300" /> Welcome Admin </h1>
  
</article>


<footer><strong>${fmsg}</strong></footer>

</div>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>

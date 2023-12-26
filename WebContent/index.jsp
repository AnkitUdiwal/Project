<html>  
<head>  
<script>  
var request;  
function sendInfo()  
{  
var v=document.getElementById("t1").value;  
var url="add.jsp?cols="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try  
{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}  
catch(e)  
{  
alert("Unable to connect to server");  
}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('dd').innerHTML=val;  
}  
}  
  
</script>  
</head>  
<body>  
      
<form action="AddData.jsp">
Enter Table Name<input type="text" name="tname" />  <br>

No of Cols<input type="number" name="t1" id="t1" onkeyup="sendInfo()">  <br>
<div id="dd"></div> <br>
<input type="submit" value="Add Operation" >  
</form>  
  
 <form action="tableServlet" method="get">
        <input type="submit" value="Show all tables"/>
    </form>
</body>  
</html>  
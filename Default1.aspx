<!DOCTYPE html>
<html lang="en">
<head>
<title>DNP cric</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  background-color:transparent;
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
  font-family:'Product Sans'
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}


/* Style the footer */
footer {
  background-color:transparent;
  padding: 10px;
  text-align: center;
  color: white;
}


}
</style>
    <script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
</head>
<body background="cric.png">



<header>
  <h2>DNP cric</h2>
</header>


    <div class="topnav" id="myTopnav">
  <a href="Index.aspx" class="active">Home</a>
  <a href="Contact">Contact</a>
  <a href="About.html">About Me</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>



<%@ Page Language="VB" %>
<%
    Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
    Dim wc As New Net.WebClient()
    wc.Headers.add("apikey", " ")

    Dim cricketMatches As Object
    cricketMatches = Me.Cache.Get("matches")
    If cricketMatches Is Nothing Then
        cricketMatches = serializer.DeserializeObject(wc.DownloadString("http://cricapi.com/api/cricket/?rnd=" & Rnd()))
        Me.Cache.Add("matches", cricketMatches, Nothing, Now.AddMinutes(3 + Int(Rnd() * 4)), Cache.NoSlidingExpiration, CacheItemPriority.Normal, Nothing)
    End If


    For Each oo As Object In cricketMatches("data")
%>
	<h4><%=oo("title") %>&nbsp;</h4>
<% Next %>
        



<footer>
  <p style="font-family:'Product Sans'">DNP cric</p>
    <p style="font-family:'Product Sans'">All Rights Reserved to DNP cric 2019</p>
</footer>

</body>
</html>

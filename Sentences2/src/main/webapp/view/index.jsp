<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LzL的截句本-索引</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
	body{background-image:url(bg_full.jpg); background-repeat:no-repeat;}
	#head{margin-top:10px;}
	#page{margin-top:150px; font-family:Microsoft YaHei;}
	#title_frame{position: relative; height:60px; width:320px; padding-left:3%;}
	#title{position:absolute; padding-top:6px; padding-left:16px; font-family:STKaiti;}
	#r1{padding-top:20px;}
	button{height:40px; width:100px; background-color:rgba(255,255,255,0.5);}
	#welcome{padding-top:40px; font-family:STKaiti;}
</style>

</head>	
<body>
<div class="container">
	  	<div id="head" class="col-4 offset-4 text-center">
	  		<div id="title_frame" class="" >
		    	<div id="title" class="text-center" >
		    		<h1 class="font-weight-bold">梁哲浪的截句本</h1>
		    	</div>
		    	<img src="title_frame.png"/>
		    </div>
		    
		</div>
	    
	   <div id="page" class="col-6 offset-3 text-center"> 
		   <div id="menu" class="">
		    	<div class="row">
		    		<div class="col-3 offset-3"><button id="note" class="btn btn-outline-dark ">✍</button></div>
					<div class="col-3"><button id="sentence" class="btn btn-outline-dark">📃</button></div>
		    	</div>
		    	
		    	<div class="row" id="r1">
		    		<div class="col-3 offset-3"><button id="reading" class="btn btn-outline-dark">📖</button></div>
					<div class="col-3"><button id="cancel"  class="btn btn-outline-dark" disabled="disabled">👋</button></div>
		    	</div>
		    </div>
		    
		    <div id="welcome" class="text-center"><h4>梦为努力浇了水&nbsp 爱在背后往前推<!-- Hello, the only ${uid}. --> </h4></div>
	    </div>
	    
	    
	</div>
	
	
	
	
	
	<script>
		$(document).ready(function(){
		  $("button").click(function(){
			  window.location.href = "${pageContext.request.contextPath}/"+$(this).attr("id");
		  });
		});
	</script>
</body>
</html>
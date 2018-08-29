<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LzL的截句本-索引</title>


<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="url.js"></script>
<script src="index_script.js"></script>
<script src="head_html.js"></script>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="bg.css?v=10">
<link rel="stylesheet" href="head.css">
<link rel="stylesheet" href="mybutton.css">

<style>
	#page{margin-top:20%; font-family:Microsoft YaHei;}
	#r1{padding-top:20px;}
	#welcome{padding-top:20%; font-family:STKaiti;}
</style>

</head>	
<body>
<div class="container">
	  	<div id="head" class="row">
	  		<div id="title_frame" class="col-6 offset-3" >
		    	<div id="title" class="text-center" >
		    		<h1 class="font-weight-bold">梁哲浪的截句本</h1>
		    	</div>
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
		    
		    <div id="welcome" class="text-center"><h4 class="font-weight-bold">梦为努力浇了水&nbsp 爱在背后往前推<!-- Hello, the only ${uid}. --> </h4></div>
	    </div>
	</div>
	
</body>
</html>
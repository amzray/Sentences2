<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LzL的截句本-未登录</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
	body{background-image:url(bg_full.jpg); background-repeat:no-repeat;}
	#head{margin-top:10px;}
	#page{margin-top:210px; font-family:Microsoft YaHei;}
	#title_frame{position: relative; height:60px; width:320px; padding-left:3%;}
	#title{position: absolute; padding-top:6px; padding-left:16px; font-family:STKaiti;}
	#prompt{height:20px;}
	#test{display:none;}
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
		   <div id="prompt" class="">
		    	<h5>未登录！<span id="sec"></span>秒后跳转到登录界面……</h5>
		    </div>
	    </div>
	
	<script>
		var seconds =1;
		$(document).ready(function(){
			$("#sec").html(seconds);
			setInterval(function(){
				seconds--;
				if(seconds==0){
					window.location.replace("${pageContext.request.contextPath}/login");
				}else{
					$("#sec").html(seconds);
				}
			},1000);
		});
		
	</script>
	
</body>
</html>
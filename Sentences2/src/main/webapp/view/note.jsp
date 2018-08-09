<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LzL的截句本-落笔</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
	body{background-image:url(bg_full.jpg); background-repeat:no-repeat;}
	#head{margin-top:10px;}
	#page{margin-top:10px; font-family:Microsoft YaHei;}
	#title_frame{position: relative; height:60px; width:320px; padding-left:3%;}
	#title{position: absolute; padding-top:6px; padding-left:16px; font-family:STKaiti;}
	#page_frame{position: relative; height:700px; width:500px; margin-left:5px;}
	#form{position: absolute; margin:20px; }
	#prompt{margin-top:5px; color:red}
	button{height:40px; width:100px; background-color:rgba(255,255,255,0.5);}
	input[type=text]{text-size:16px; height:30px; background-color:rgba(255,255,255,0.5);}
	label{height:24px; width:50px; text-align:center;}
	select{height:30px; width:100px; background-color:rgba(255,255,255,0.5)}
	textarea{width:660px; text-size:16px; background-color:rgba(255,255,255,0.5);}
	textarea[name=text]{height:175px; margin-top:5px;}
	textarea[name=reflection]{height:70px;}
	.text1{width:270px;}
	.text2{width:610px;}
	.row1{margin-top:10px;}
	.row2{margin-top:5px;}
	.row2{margin-top:2px;}
	.td1{margin-left:15px;}
	.btn2{margin-left:8px;}
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
	    
	   <div id="page" class="col-8 offset-2 text-center">
	   	 <div id="page_frame" class="" >
	   	 	<div id="form" class="">
		    	<form id="noteform" action="${pageContext.request.contextPath}/note" method="POST" accept-charset="utf-8">
					<div class="row">
						<div class="col-3 text-left"><div id="prompt" class=""></div></div>
						<div id="selects" class="col-8 offset-1 text-right">
							<span class="col-6 "><label for="lang">语言：</label><select id="lang"  name="languageId"></select></span>
							<span class="col-6"><label for="type">体裁：</label><select id="type" name="typeId"></select></span>
						</div>
					</div>
					<div>
						<div id="text"><textarea name="text" placeholder="句子"></textarea></div>
					</div>
					<div class="row1">
						<span id="author"><label for="author">作者：</label><input class="text1" type="text" name="author"/></span>
						<span id="works" class="td1"><label for="works">出处：</label><input class="text1" type="text" name="works"/></span>
					</div>
					<div class="row2">
						<span id="speaker"><label for="speaker">歌者：</label><input class="text1" type="text" name="speaker" /></span>
						<span id="location" class="td1"><label for="location">段落：</label><input class="text1" type="text" name="location"/></span>
					</div>
					<div class="row2">
						<div id="reflection"><textarea name="reflection" placeholder="心得"></textarea></div>
					</div>
					<div class="row1">
						<div id="labels"><label for="type">标签：</label><input class="text2" type="text" name="labels" /></div>
					</div>
					<div class="row1 text-center">
						<span class="btn1"><button type="submit" class="btn btn-outline-dark">▶️</button></span>
						<span class="btn2"><button type="reset" class="btn btn-outline-dark">⏪</button></span>
						<span class="btn2"><button id="return" type="button" class="btn btn-outline-dark">👋</button></span>
					</div>
				</form>
		    </div>
		    <img src="page_frame.png"/>
	   	 </div>
	   </div>
	    
	    <div id="status" class="text-hide">${status}</div>
	    <div id="langsjson" class="text-hide">${langs}</div>
	    <div id="typesjson" class="text-hide">${types}</div>
	</div>
	
	<script>
	$(document).ready(function(){
		$("#noteform").submit(function(ev){
			if($("#sentence").children(":first").val()==""){
				ev.preventDefault();
				$("#prompt").text("句子不能为空!");
			}
		});
		
		var s = $("#status").text();
		//数据库操作成功，影响了1行
		if(s==1){
			$("#prompt").text("提交成功！");
		}
		
		$("#return").click(function(){
			window.location.href = "${pageContext.request.contextPath}/index";
		});
		
		var types = JSON.parse($("#typesjson").text());
		var tstr ="";
		for(var i=0; i<types.length; i++){
			tstr += ("<option value='"+types[i].id+"'>"+ types[i].name +"</option>");
		}
		$("#type").html(tstr);
		$("#type").children(":first").attr("selected","selected");
		
		var langs = JSON.parse($("#langsjson").text());
		var lstr ="";
		for(var i=0; i<langs.length; i++){
			lstr += ("<option value='"+langs[i].id+"'>"+ langs[i].name+"</option>");
		}
		$("#lang").html(lstr);
		$("#lang").children(":first").attr("selected","selected");
	});
	</script>
</body>
</html>
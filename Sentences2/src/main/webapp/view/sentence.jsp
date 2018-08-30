<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LzL的截句本-句子</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<script src="url.js"></script>
<script src="renderSelect.js"></script>
<script src="sentence_script.js?v=2"></script>

<link rel="stylesheet" href="bg.css?v=10">
<link rel="stylesheet" href="head.css">
<link rel="stylesheet" href="mybutton.css">
<link rel="stylesheet" href="form.css">
<link rel="stylesheet" href="content.css">
<link rel="stylesheet" href="page.css">

<style>
	
	
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
	    
	<div id="page" class="col-8 offset-2 text-center">
		<div id="content"></div>
		<div id="updatemenu">
		   	<div class="col-1 offset-11 text-right"><label id="trigger" class="icon">○</label></div>
		   	<form id="updateform" action="${pageContext.request.contextPath}/update" method="POST">
		   		<input id="sid" type="hidden" name="id" />
		   		<div class="row">
						<div class="col-4 text-left"><div id="prompt" class="">更新成功!</div></div>
						<div class="col-8 text-right">
							<span class="col-6 "><label for="lang">语言：</label><select id="lang"  name="languageId"></select></span>
							<span class="col-6"><label for="type">体裁：</label><select id="type" name="typeId"></select></span>
						</div>
					</div>
					<div class="row row1">
						<div id="text" class="col-12"><textarea name="text" placeholder="句子"></textarea></div>
					</div>
					<div class="row row1">
						<div id="author" class="col-6"><label for="author">作者：</label><input class="text1" type="text" name="author"/></div>
						<div id="works" class="col-6" ><label for="works">出处：</label><input class="text1" type="text" name="works"/></div>
					</div>
					<div class="row row1">
						<div id="speaker" class="col-6" ><label for="speaker">歌者：</label><input class="text1" type="text" name="speaker" /></div>
						<div id="location" class="col-6" ><label for="location">段落：</label><input class="text1" type="text" name="location"/></div>
					</div>
					<div class="row row1">
						<div id="reflection" class="col-12"><textarea name="reflection" placeholder="心得"></textarea></div>
					</div>
					<div class="row row1">
						<div id="labels" class="col-12"><label for="type">标签：</label><input class="text2" type="text" name="labels" /></div>
					</div>
				<div class="row1 text-center">
					<span class="btn3"><button type="submit" class="btn btn-outline-dark">▶️</button></span>
				</div>
	   		</form>
		</div>
	</div>
		<div id="options"class="row text-center">
			<div class="col-8 offset-2">
				<span id="random"class="col-3"><button type="button" class="btn btn-outline-dark">🔀</button></span>
				<span id="delete"class="col-3"><button type="button" class="btn btn-outline-dark">🗑</button></span>
		  		<span id="top"class="col-3 " ><button type="button" class="btn btn-outline-dark">🔝</button></span>
				<span id="return"class="col-3"><button type="button" class="btn btn-outline-dark">👋</button></span>
			</div>
		</div>
	
  	<div id="queryStatus" class="text-hide">${queryStatus}</div>
  	<div id="updateStatus" class="text-hide">${updateStatus}</div>
   	<div id="langsjson" class="text-hide">${langs}</div>
  	<div id="typesjson" class="text-hide">${types}</div>
	<div id="test"></div>
		
</div>
	
</body>
</html>
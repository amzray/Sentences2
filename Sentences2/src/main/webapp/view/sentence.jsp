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


<style>
	body{background-image:url(bg_full.jpg); background-repeat:no-repeat;}
	#head{margin-top:10px;}
	#page{margin-top:10px; font-family:Microsoft YaHei; border:5px double grey;}
	#title_frame{position: relative; height:60px; width:320px; padding-left:3%;}
	#title{position: absolute; padding-top:6px; padding-left:16px; font-family:STKaiti;}
	#page_frame{position: relative; height:700px; width:1000px; margin-left:5px;}
	#list{position: absolute; margin:20px; }
	#prompt{margin-left:5px; color:red; display:none}
	#pageSelect{padding-top:10px; padding-bottom:10px;}
	#lang{margin-right:5px; }
	select{height:30px; width:100px; background-color:rgba(255,255,255,0.5)}
	input[type=text]{text-size:16px; height:30px; background-color:rgba(255,255,255,0.5);}
	#menu{text-size:16px; padding-left-right:20px;  padding-top:8px; padding-bottom:10px;border-top:2px solid grey;}
	#updateform{display:none;}
	.inputtext1{width:260px;}
	.inputtext2{width:300px;}
	.inputtext3{width:295px;}
	button{height:40px; background-color:rgba(255,255,255,0.5); text-align:center}
	label{height:24px; width:50px; text-align:center;}
	.btn1>button{width:40px; font-size:13px}
	.btn2>button{width:80px;}
	.btn3>button{width:100px;}
	#content{font-family:STKaiti;font-weight:bold;}
	.sentence{margin:30px 30px 40px;}
	.text{font-size:24px}
	.signature{font-size:20px}
	.icon{height:16px; width:16px; font-size:16px; padding-left:15px}
	textarea{width:660px; text-size:16px; background-color:rgba(255,255,255,0.5);}
	textarea[name=text]{height:175px; margin-top:5px;}
	textarea[name=reflection]{height:70px;}
	.text1{width:270px;}
	.text2{width:610px;}
	.row1{margin-top:10px;}
	.row2{margin-top:5px;}
	.row2{margin-top:2px;}
	.td1{margin-left:15px;}
	
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
		<div id="content"></div>
		<div id="menu">
		   	<div class="col-1 offset-11"><label id="trigger" class="icon">○</label></div>
		   	<form id="updateform" action="${pageContext.request.contextPath}/update" method="POST">
		   		<input id="sid" type="hidden" name="id" />
		   		<div class="row">
					<div class="col-3 text-left"><div id="prompt">更新成功！</div></div>
					<div id="selects" class="col-8 offset-1 text-center">
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
					<span class="btn3"><button type="submit" class="btn btn-outline-dark">▶️</button></span>
				</div>
	   		</form>
		</div>
	</div>
		
	<div id="pageSelect"class="text-center">
		<span id="return"class="btn2"><button type="button" class="btn btn-outline-dark">👋</button></span>
		<span id="delete"class="btn2"><button type="button" class="btn btn-outline-dark">❌</button></span>
  		<span id="top"class="btn2"><button type="button" class="btn btn-outline-dark">🔝</button></span>
  	</div>
  	<div id="queryStatus" class="text-hide">${queryStatus}</div>
  	<div id="updateStatus" class="text-hide">${updateStatus}</div>
   	<div id="langsjson" class="text-hide">${langs}</div>
  	<div id="typesjson" class="text-hide">${types}</div>
	<div id="test"></div>
		
</div>
	
	<script>
		//定义一个获取URL中请求参数的方法
		(function ($) {
		  $.getUrlParam = function (name) {
		   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		   var r = window.location.search.substr(1).match(reg);
		   if (r != null) return unescape(r[2]); return null;
		  }
		 })(jQuery);
		
		//渲染语言类型和体裁类型的下拉框
		function renderSelect(){
			var types = JSON.parse($("#typesjson").text());
			var tstr ="";
			for(var i=0; i<types.length; i++){
				tstr += ("<option value='"+types[i].id+"'>"+ types[i].name +"</option>");
			}
			$("#type").html(tstr);
			
			var langs = JSON.parse($("#langsjson").text());
			var lstr ="";
			for(var i=0; i<langs.length; i++){
				lstr += ("<option value='"+langs[i].id+"'>"+ langs[i].name+"</option>");
			}
			$("#lang").html(lstr);
		}
		
		
		//渲染内容
		function renderContent(result){
			var str = "";
			var author;
			var works;
			var dash;
			
			author = (result.author==null)?"":result.author;
			works = (result.works==null||result.works=="")?"":("《"+result.works+"》");
			dash = (author==""&&works=="")?"":"——";
			
			str+=("<div id='"+ result.id +"' class='sentence'><div class='text text-left'>"+result.text.replace(/\r\n/g,"<br/>").replace(" ", "&nbsp")+"</div><div class='signature text-right'><span class='dash'>"+dash+"</span><span class='author'>"+author+"</span><span class='works'>"+works+"</span></div></div>");

			$("#content").html(str);
		}
		
		//渲染查询为空信息
		function renderErrorContent(){
			var str = "";
			var author = "管理员";
			var dash = "——";
			var text = "(抱歉！查无此句)"
			str+=("<div class='sentence'><div class='text text-left'>"+text+"</div><div class='signature text-right'><span class='dash'>"+dash+"</span><span class='author'>"+author+"</span><span class='works'></span></div></div>");

			$("#content").html(str);
		}
		
		//渲染表单
		function renderForm(result){
			//ID
			$("#sid").val(result.id);
			//渲染下拉框选项
			renderSelect();
			
			//下拉框
			$("#lang").children("option[value='"+result.languageId+"']").attr("selected","selected");
			$("#type").children("option[value='"+result.typeId+"']").attr("selected","selected");
			//文本
			$("#text").children("textarea").val(result.text);
			//作者
			$("#author").children("input").val(result.author);
			//出处
			$("#works").children("input").val(result.works);
			//歌者
			$("#speaker").children("input").val(result.speaker);
			//段落
			$("#location").children("input").val(result.location);
			//心得
			$("#reflection").children("textarea").val(result.reflection);
			//标签
			$("#labels").children("input").val(result.labels);
			
			
			//查询表单打开/关闭动画
			$("#trigger").click(function(){
				$("#prompt").hide();
				$("#updateform").slideToggle("middle");
				
			});
		}
	
		//异步查询句子并渲染
		function renderPage(urlstr){
			$.ajax({url:urlstr,
	  			cache:false,
	  			success:function(result){
	  				//查询成功
	  				if(result!=null){
	  					//渲染内容
		  				renderContent(result);
		  				//渲染更新表单，启用打开表单的动画
		  				renderForm(result);
	  				}else{//查询失败
	  					//渲染错误信息
	  					renderErrorContent();
	  					//禁用删除按钮
	  					$("#delete").children("button").hide();
	  					$("#top").children("button").hide();
	  				}
		  		},error:function(){
		  		}
		  	});
		}
		
		
		
		$(document).ready(function(){
			if($.getUrlParam("updateStatus")==1){
				$("#updateform").show();
				$("#prompt").show();
				
			}
			//返回上一页按钮
			$("#return").children("button").click(function(){
				window.history.back();
			});
			//返回顶部按钮
			$("#top").children("button").click(function(){
				$(window).scrollTop(0);
			});
			
			var str1 = "${pageContext.request.contextPath}/ss?sid="+$.getUrlParam("sid");
			//异步获取内容页面
		  	renderPage(str1);
			
		  //删除按钮
			$("#delete").children("button").click(function(){
				if(confirm("确定要删除这条句子吗？")){
					$.ajax({url:"${pageContext.request.contextPath}/delete?sid="+$.getUrlParam("sid"),
			  			cache:false,
			  			success:function(result){
			  				if(result==1){
				  				window.location.href = "${pageContext.request.contextPath}/reading";
			  				}else{
			  					alert("意外！删除失败");
			  				}
				  		}
				  	});
				}
			});
		});
	</script>
	
</body>
</html>
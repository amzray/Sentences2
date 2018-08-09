<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LzL的截句本-阅览</title>

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
	body{background-image:url(bg_full.jpg); background-size:cover}
	#head{margin-top:10px;}
	#page{margin-top:10px; font-family:Microsoft YaHei; border:5px double grey;}
	#title_frame{position: relative; height:60px; width:320px; padding-left:3%;}
	#title{position: absolute; padding-top:6px; padding-left:16px; font-family:STKaiti;}
	#page_frame{position: relative; height:700px; width:1000px; margin-left:5px;}
	#list{position: absolute; margin:20px; }
	#prompt{margin-top:5px; color:red}
	#pageSelect{padding-top:15px; padding-bottom:10px;}
	#lang{margin-right:13px; }
	select{ height:30px; width:100px; background-color:rgba(255,255,255,0.5)}
	input[type=text]{text-size:16px; height:30px; background-color:rgba(255,255,255,0.5);}
	#menu{text-size:16px; padding-left-right:20px;  padding-top:10px; padding-bottom:8px;border-bottom:2px solid grey;}
	#readingform{display:none;}
	.inputtext1{width:260px;}
	.inputtext2{width:300px;}
	.inputtext3{width:295px;}
	button{height:40px;  background-color:rgba(255,255,255,0.5); text-align:center}
	label{height:24px; width:50px; text-align:center;}
	.btn1>button{width:40px; font-size:13px}
	.btn2>button{width:80px;}
	.btn3>button{width:100px;}
	.td1{margin-left:5px;}
	#content{font-family:STKaiti;font-weight:bold;}
	.sentence{margin:40px 30px 0px;}
	.text{font-size:24px}
	.row1{margin-top:5px}
	.row2{margin-top:5px}
	.row3{margin-top:15px;margin-bottom:5px;}
	.signature{font-size:20px}
	.icon{height:16px; width:16px; font-size:16px;}
	#trigger{padding-left:15px}
	a{color:black}
	a:hover {color: black}
	a:active {color: black}
	.etc{padding-left:10px; padding-right:10px; font-size:24px;}
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
		   	<div id="menu">
		   		<div class="col-1 offset-11"><label id="trigger" class="icon">○</label></div>
		   		<form id="readingform" action="${pageContext.request.contextPath}/reading" method="GET" accept-charset="utf-8">
		   			<input  type="hidden" name="currPage" value="1"/>
					<div class="text-left">
						<div class="row1">
							<span id="author" class="td1"><label for="author">作者：</label><input class="inputtext1" type="text" name="author"/></span>
							<span id="works" class="td1"><label for="works">出处：</label><input class="inputtext2" type="text" name="works"/></span>
						</div>
						<div class="row2">
							<span id="text" class="td1"><label>文本：</label><input class="inputtext3" type="text" name="text"/></span>
			   				<span class="td1"><label for="lang">语言：</label><select id="lang" name="languageId"></select></span>
							<span class="td2"><label for="type">体裁：</label><select id="type" name="typeId"></select></span>
						</div>
						<div class="row3 text-center">
							<span class="btn2"><button type="submit" class="btn btn-outline-dark">🔎</button></span>
							<span class="btn2"><button type="reset" class="btn btn-outline-dark">⏪</button></span>
						</div>
					</div>
		   		</form>
		   	</div>
		   	<div id="content"></div>
		</div>
		<div id="pageSelect"class="text-center">
			<span id="return"class="btn3"><button type="button" class="btn btn-outline-dark">👋</button></span>
			<span id="pagePre"class="btn2"><button type="button" class="btn btn-outline-dark">◀️</button></span>
	   		<span id="pageNums"></span>
	   		<span id="pageNext"class="btn2"><button type="button" class="btn btn-outline-dark">▶️</button></span>
   			<span id="top"class="btn2"><button type="button" class="btn btn-outline-dark">🔝</button></span>
   		</div>
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
			tstr += ("<option value='0' selected='selected'>(不限)</option>");
			for(var i=0; i<types.length; i++){
				tstr += ("<option value='"+types[i].id+"'>"+ types[i].name +"</option>");
			}
			$("#type").html(tstr);
			
			var langs = JSON.parse($("#langsjson").text());
			var lstr ="";
			lstr += ("<option value='0' selected='selected'>(不限)</option>");
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
			for(var i = 0; i<result.pageSize; i++){
				author = (result.list[i].author==null)?"":result.list[i].author;
				works = (result.list[i].works==null||result.list[i].works=="")?"":("《"+result.list[i].works+"》");
				dash = (author==""&&works=="")?"":"——";
				str+=("<div id='"+ result.list[i].id +"' class='sentence'><div class='text text-left'><a href='${pageContext.request.contextPath}/sentence?sid="+result.list[i].id+"'>"+result.list[i].text.replace(/\r\n/g,"<br/>").replace(" ", "&nbsp")+"</a></div><div class='signature text-right'><span class='dash'>"+dash+"</span><span class='author'>"+author+"</span><span class='works'>"+works+"</span></div></div><br/>");
			}
			$("#content").html(str);
		}
		
		
		
		function renderPageSelect(result){
			var str = "";
			//生成首页按钮
			if(result.startPage>1){
				str += ("<span id='p"+1+"' class='btn1'><button type='button' class='btn btn-outline-dark'>"+1+"</button></span>");
				//生成省略号
				if(result.startPage>2){
					str += ("<span class='etc'>...</span>");
				}
			}
			//生成页码按钮组
			
			for(var i = result.startPage; i<=result.endPage; i++){
				str += ("<span id='p"+i+"' class='btn1'><button type='button' class='btn btn-outline-dark'>"+i+"</button></span>");
			}
			//
			//生成尾页按钮
			if(result.endPage<result.totalPage){
				//生成省略号
				if(result.endPage<result.totalPage-1){
					str += ("<span class='etc'>...</span>");
				}
				str += ("<span id='p"+result.totalPage+"' class='btn1'><button type='button' class='btn btn-outline-dark'>"+result.totalPage+"</button></span>");
				
				
			}
			
			$("#pageNums").html(str);
			//禁用并高亮当前页的按钮
			$("#p"+result.currPage).children("button").attr("class", "btn btn-dark");
			$("#p"+result.currPage).children("button").attr("disabled","true");
			//判断是否有上一页/下一页，禁用相应的按钮
			if(result.currPage==1){
				$("#pagePre").children("button").attr("disabled","true");
			}
			if(result.currPage==result.totalPage){
				$("#pageNext").children("button").attr("disabled","true");
			}
		}
		
		//设置按钮的跳转目标
		function setBtnsTarget(result){
			//获取当前URL
			
			//根据跳转到的页面重新设置URL的currPage参数
			//数字
			$(".btn1").children("button").click(function(){
				var url = window.location.href;
				window.location.href = url.replace(/currPage=\d*/, ("currPage="+ $(this).text()));
			});
			//上一页
			$("#pagePre").children("button").click(function(){
				var url = window.location.href;
				window.location.href = url.replace(/currPage=\d*/, ("currPage="+(result.currPage-1)));
			});
			//下一页
			$("#pageNext").children("button").click(function(){
				var url = window.location.href;
				window.location.href = url.replace(/currPage=\d*/, ("currPage="+(result.currPage+1)));
			});
			
			
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
	
		function renderPage(urlstr){
			
			//根据条件添加参数
			if($.getUrlParam("author")!=null){
				urlstr += "&author=" + $.getUrlParam("author");
			}
			if($.getUrlParam("works")!=null){
				urlstr += "&works=" + $.getUrlParam("works");
			}
			if($.getUrlParam("text")!=null){
				urlstr += "&text=" + $.getUrlParam("text");
			}
			if($.getUrlParam("languageId")!=null){
				urlstr += "&languageId=" + $.getUrlParam("languageId");
			}
			if($.getUrlParam("typeId")!=null){
				urlstr += "&typeId=" + $.getUrlParam("typeId");
			}
			//异步请求并渲染
			$.ajax({url:urlstr,
	  			cache:false,
	  			success:function(result){
	  				if(result.totalRecord!=0){
	  					//渲染内容
	  					renderContent(result);
	  					//渲染页码选单
						renderPageSelect(result);
	  					//设置按钮的跳转链接
	  					setBtnsTarget(result);
	  				}else{
	  					renderErrorContent();
	  					//禁用删除按钮
	  					$("#pagePre").children("button").hide();
	  					$("#pageNext").children("button").hide();
	  					$("#top").children("button").hide();
	  				}
	  				
		  		},error:function(){
		  		}
		  	});
		}
		
		$(document).ready(function(){
			//渲染下拉框
			renderSelect();
			//查询表单打开/关闭动画
			$("#trigger").click(function(){
				$("#readingform").slideToggle("middle");
			});
			//返回扉页按钮
			$("#return").children("button").click(function(){
				window.location.href =  "${pageContext.request.contextPath}/index";
			});
			//返回顶部按钮
			$("#top").children("button").click(function(){
				$(window).scrollTop(0);
			});
			
			
			var str1 = "${pageContext.request.contextPath}/rp?currPage="+$.getUrlParam("currPage");
			//异步获取内容页面
		  	renderPage(str1);
			
			
		  
		});
	</script>
</body>
</html>
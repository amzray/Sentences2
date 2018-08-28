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
				str += ("<span id='p"+1+"' class='btnjump'><button type='button' class='btn btn-outline-dark'>"+1+"</button></span>");
				//生成省略号
				if(result.startPage>2){
					str += ("<span class='etc'>...</span>");
				}
			}
			//生成页码按钮组
			
			for(var i = result.startPage; i<=result.endPage; i++){
				str += ("<span id='p"+i+"' class='btnjump'><button type='button' class='btn btn-outline-dark'>"+i+"</button></span>");
			}
			//
			//生成尾页按钮
			if(result.endPage<result.totalPage){
				//生成省略号
				if(result.endPage<result.totalPage-1){
					str += ("<span class='etc'>...</span>");
				}
				str += ("<span id='p"+result.totalPage+"' class='btnjump'><button type='button' class='btn btn-outline-dark'>"+result.totalPage+"</button></span>");
				
				
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
			$(".btnjump").children("button").click(function(){
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
			//隐藏查询菜单
			$("#searchform").hide();
			//渲染下拉框
			renderSelect();
			//查询表单打开/关闭动画
			$("#trigger").click(function(){
				$("#searchform").slideToggle("middle");
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
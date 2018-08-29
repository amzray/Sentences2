		
		
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
				$("#updateform").slideToggle("middle");
				$("#prompt").hide();
				
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
			var str1 = getContextPath()+"/ss?sid="+$.getUrlParam("sid");
			//异步获取内容页面
		  	renderPage(str1);
			
			if($.getUrlParam("updateStatus")==1){
				$("#updateform").show();
				$("#prompt").show();
				
			}else{
				$("#updateform").hide();
				$("#prompt").hide();
			}
			
			
		  //删除按钮
			$("#delete").children("button").click(function(){
				if(confirm("确定要删除这条句子吗？")){
					$.ajax({url:"${pageContext.request.contextPath}/delete?sid="+$.getUrlParam("sid"),
			  			cache:false,
			  			success:function(result){
			  				if(result==1){
				  				location.href = "reading";
			  				}else{
			  					alert("意外！删除失败");
			  				}
				  		}
				  	});
				}
			});
			
			//随机按钮
			$("#random").children("button").click(function(){
				location.href = "sentence";
			});
			
			//返回上一页按钮
			$("#return").children("button").click(function(){
				window.history.back();
			});
			//返回顶部按钮
			$("#top").children("button").click(function(){
				$(window).scrollTop(0);
			});
		});
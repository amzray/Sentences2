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
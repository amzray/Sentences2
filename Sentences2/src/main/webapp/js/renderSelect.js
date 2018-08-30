
	
	//渲染语言类型和体裁类型的下拉框
	function renderSelect(){
		var types = JSON.parse($("#typesjson").text());
		var tstr ="";
		for(var i=0; i<types.length; i++){
			tstr += ("<option value='"+types[i].id+"'>"+ types[i].name +"</option>");
		}
		$("#type").html(tstr);
		//默认选中
		$("#type").children(":first").attr("selected","selected");
		var langs = JSON.parse($("#langsjson").text());
		var lstr ="";
		for(var i=0; i<langs.length; i++){
			lstr += ("<option value='"+langs[i].id+"'>"+ langs[i].name+"</option>");
		}
		$("#lang").html(lstr);
		//默认选中
		$("#lang").children(":first").attr("selected","selected");
	}
	
	//渲染语言类型和体裁类型的下拉框
	function renderSelectForSearch(){
		renderSelect();
		var unlimited = ("<option value='0' selected='selected'>(不限)</option>");
		$(unlimited).prependTo("#type");
		$(unlimited).prependTo("#lang");
	}
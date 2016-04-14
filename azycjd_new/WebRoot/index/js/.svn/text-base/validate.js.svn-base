//url--请求路劲  inputId--下拉框id  valueType--0：显示id 1：显示文字
var loadSelectData=[
	{url:'anzhifenjuan/lineNewchapter.do',inputId:'fenJuanIdInput',valueField:'id',displayField:'juanName'}
];
var is_out_select=true;
$(function(){
	$(".txtCss,.pwTxtCss").click(function(){
		removeSelect();//移除所有下拉列表框
	});
	
	$(".formCss").click(function(){
		if(is_out_select){
			removeSelect();//移除所有下拉列表框
		}
	});
	
	$(".selectDivCss,.selectTxtCss").hover(function(){
		is_out_select=false;
	},function(){
		is_out_select=true;
	});
	
	$(".txtCss,.pwTxtCss").each(function(){
		if($(this)[0].id!=""){
			for(var i=0;i<validate.length;i++){
				var t=validate[i];
				if($(this)[0].id==t.inputId){
					
					if(t.errorInfo!=''&&t.regExp!=''){//如果需要验证
						//离开验证
						$(this).blur(function(){
							var d=getJsonObject($(this)[0].id);
							var reg=new RegExp("^"+d.regExp+"$");
							$("#"+$(this)[0].id+"ErrorDiv").remove();//先移除
							if(!reg.test($(this).val())){
								$("<div class='errorDivInfo' id='"+$(this)[0].id+"ErrorDiv'></div>").html(d.errorInfo).appendTo($($(this)[0].parentNode));
							}
							//如果有非空提示
							if(d.blankWord!=''&&$(this).val()==''){
								$(this).css("color","#c5c9cb");
								$(this).val(d.blankWord);
							}
						});
						
						$(this).focus(function(){
							var d=getJsonObject($(this)[0].id);
							$(this).css("color","#292a2a");
							if(d.blankWord!=''&&$(this).val()==d.blankWord){
								$(this).val('');
							}
						});
					}
					
					if(t.blankWord!=''){
						$(this).val(t.blankWord).css("color","#c5c9cb");
					}
				}
			}
		}
	});
	
	$(".selectTxtCss").each(function(){
		$(this)[0].readOnly=true;
		$(this).click(function(){//定义单击事件
			selectClick($(this)[0]);
		});
		
		var con=false;
		var url="";
		var valueField="";
		var displayField="";
		for(var i=0;i<loadSelectData.length;i++){
			var tmp=loadSelectData[i];
			if(tmp.inputId==$(this)[0].id){//需要加载数据
				con=true;
				url=tmp.url;
				if(tmp.inputId=="fenJuanIdInput"){
					url+='?novelId='+questNovelId;
				}
				valueField=tmp.valueField;
				displayField=tmp.displayField;
				break;
			}
		}
		if(con&&url!=""){
			$.post(path+"/"+url,{
				inputId:$(this)[0].id,
				valueField:valueField,
				displayField:displayField
			},function(res){
				var json=eval('(' + res + ')'); 
				var d={};
				d.inputId=json.inputId;
				var data=[];
				for(var i=0;i<json.data.length;i++){
					var ts=(json.data)[i];
					var tp={};
					tp.value=ts[""+json.valueField+""];
					tp.display=ts[""+json.displayField+""];
					data[data.length]=tp;
				}
				d.data=data;
				selectData[selectData.length]=d;
				setSelectInitV($("#"+json.inputId)[0]);//设置下拉框的初始值
			});
			
		}else{
			setSelectInitV($(this)[0]);//设置下拉框的初始值
		}
		
	});

	$(".txtUploadCss").each(function(){
		$(this)[0].readOnly=true;
		$(this).hover(function(){
			if($(this).val()!=""&&$(this)[0].id!=""&&$(this)[0].id!=null){
				//$("<div id='"+$(this)[0].id+"ImgLook' class='imgLook'></div>").css("margin-left",($(this).width()+240)+"px").html("<img src='"+$(this).val()+"' />").appendTo($($(this)[0].parentNode));
			}
		},function(){
			//$("#"+$(this)[0].id+"ImgLook").remove();
		});
	});
	
});

function getJsonObject(id){
	for(var i=0;i<validate.length;i++){
		var t=validate[i];
		if(t.inputId==id){
			return t;
		}
	}
}

function selectClick(obj){
	if($("#"+obj.id+"Select").length!=0){
		$("#"+obj.id+"Select").remove();
		return;
	}
	removeSelect();//移除所有下拉列表框
	for(var i=0;i<selectData.length;i++){
		var t=selectData[i];
		if(obj.id==t.inputId){
			var tmp=t.data;
			var options="";
			var hiddenId=obj.id.substring(0,obj.id.length-5);//获得隐藏组件
			for(var k=0;k<tmp.length;k++){
				var s=tmp[k];
				if($("#"+hiddenId).length!=0&&$("#"+hiddenId).val()!=""&&$("#"+hiddenId).val()==s.value){
					options+="<div class='selectedOption' onclick=\"chooseValue('"+s.value+"','"+s.display+"','"+obj.id+"Select','"+obj.id+"')\">"+s.display+"</div>";
				}else{
					options+="<div onclick=\"chooseValue('"+s.value+"','"+s.display+"','"+obj.id+"Select','"+obj.id+"')\">"+s.display+"</div>";
				}
				
			}
			if(obj.id=="projectTypetwo"){
				$("<div class='selectDivCss' id='"+obj.id+"Select'></div>").css("margin-left","312px").width($(obj).width()+13).html(options).appendTo($(obj.parentNode));
			}else{
				$("<div class='selectDivCss' id='"+obj.id+"Select'></div>").width($(obj).width()+13).html(options).appendTo($(obj.parentNode));
			}
			
		}
	}
}

function removeSelect(){
	$(".selectDivCss").each(function(){
		$(this).remove();
	});
}

function chooseValue(value,display,selectId,id){
	var hiddenId=id.substring(0,id.length-5);
	$("#"+hiddenId).remove();//先移除隐藏组件
	$("<input id='"+hiddenId+"' name='"+hiddenId+"' type='hidden'>").val(value).appendTo($($("#"+id)[0].parentNode));
	$("#"+id).val(display);
	$("#"+selectId).remove();//移除下拉列表框
}

function setSelectInitV(obj){ 
	var hiddenId=obj.id.substring(0,obj.id.length-5);//获得隐藏组件
	if(obj.value==""){
		$("<input id='"+hiddenId+"' name='"+hiddenId+"' type='hidden'>").val("").appendTo($($("#"+obj.id)[0].parentNode));//如果之前没有设置值，默认为空字符
	}else{
		$("<input id='"+hiddenId+"' name='"+hiddenId+"' type='hidden'>").val(obj.value).appendTo($($("#"+obj.id)[0].parentNode));//如果之前有设置值，则将该值赋给隐藏组件
		for(var i=0;i<selectData.length;i++){
			var t=selectData[i];
			if(obj.id==t.inputId){
				var tmp=t.data;
				for(var k=0;k<tmp.length;k++){
					var s=tmp[k];
					if(obj.value==s.value){
						obj.value=s.display;
						break;
					}
				}
			}
		}
	}
}
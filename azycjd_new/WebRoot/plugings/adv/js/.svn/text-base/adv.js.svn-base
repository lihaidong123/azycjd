// JavaScript Document
var imgArr=new Array();
var messArr=new Array("","","","");
var delays=500;//默认滑动时间
var moveBgCss="#1a9cda";//数字div移上去背景颜色
var moveFontCss="#FFFFFF";//数字div移上去文字颜色
var bgCss="#ade0f8";//数字div移开背景颜色
var fontCss="#663300";//数字div移开文字颜色
var m=4;//默认显示数字个数
var wid=window.screen.width;//默认宽度
var hei=312;//默认高度
var borderCss="#CC0000";//边框颜色
var showInfoCss="#CC0000";//信息显示字体颜色

function setVa(obj){
	if(obj){
		if(obj.delaysN){
			delays=obj.delaysN;
		}
		if(obj.showInfoCssN){
			showInfoCss=obj.showInfoCssN;
		}
		if(obj.moveBgCssN){
			moveBgCss=obj.moveBgCssN;
		}
		if(obj.moveFontCssN){
			moveFontCss=obj.moveFontCssN;
		}
		if(obj.bgCssN){
			bgCss=obj.bgCssN;
		}
		if(obj.fontCssN){
			fontCss=obj.fontCssN;
		}
		if(obj.num){
			m=obj.num;
		}
		if(obj.widN){
			wid=obj.widN;
		}
		if(obj.heiN){
			hei=obj.heiN;
		}
		if(obj.borderCssN){
			borderCss=obj.borderCssN;
		}
	}
}

$(function(){
	$("#advDivBigSmall div").hover(function(){
		try{
			clearInterval(pic_ds_timer);
			pic_ds_index=parseInt($(this).html())-1;
			chagesRecommd(pic_ds_index);
		}catch(w){
			
		}
	},function(){
	});
	
	var ind=0;
	$("#advDivBig div").each(function(){
		$(this).css("background-image","url("+imgArr[ind]+")");
		ind++;
	});
	
	pic_ds_timer=setTimeout("changePic_ds_index()",pic_ds_delay);
});

var pic_ds_index=0;
var pic_ds_delay=5000;
var pic_ds=new Array();//推荐页面 幻灯片图片数据
var pic_ds_timer=null;

var novalTitleEn=new Array();
var novalTitleZh=new Array();
var novalTitleAuthor=new Array();
var novalTitleInfo=new Array();
var novalId=new Array();



//改变显示图片索引
function changePic_ds_index(){
	pic_ds_index++;
	if(pic_ds_index>=imgArr.length){
		pic_ds_index=0;
	}
	chagesRecommd(pic_ds_index);
}
//改变背景
function chagesRecommd(pic_ds_index){
	
	$("#advDivBigSmall div").each(function(){
		$(this).css("color",fontCss);
		$(this).css("background-color",bgCss);
	});
	$($("#advDivBigSmall div")[pic_ds_index]).css("color",moveFontCss);
	$($("#advDivBigSmall div")[pic_ds_index]).css("background-color",moveBgCss);
	
	changImg();

	$("#novalTitleEnDiv").html(novalTitleEn[pic_ds_index]);
	$("#novalTitleZhDiv").html(novalTitleZh[pic_ds_index]);
	$("#novalTitleAutorDiv").html(novalTitleAuthor[pic_ds_index]+"&nbsp;著");
	$("#novalTitleInfoDiv").html(novalTitleInfo[pic_ds_index]);
	$("#novalTitleInfoDiv").html($("#novalTitleInfoDiv").text());
	$("#novelHref").click(function(){
		window.location.href=path+"/novel/"+novalId[pic_ds_index]+".jsp";
	});
	$("#advDivBig").click(function(){
		window.location.href=path+"/novel/"+novalId[pic_ds_index]+".jsp";
	});
	pic_ds_timer=setTimeout("changePic_ds_index()",pic_ds_delay);
}


function changImg(){
	try{
		$("#advDivBig").stop(true);
		var ss=-wid*(pic_ds_index);
		$("#advDivBig").animate({marginLeft:(ss+"px")},delays);
		
	}catch(w){
		
	}
}

function moveAdv(obj){
	setVa(obj);
	var advDivBigSmallWidth=30*m;
	var moveAdv={
		init:function(){
			document.write("<div style='width:"+(wid)+"px; height:"+(hei+30)+"px;overflow:hidden;' >");
			
			document.write("<div id='advDivBig' style='width:"+(wid*m)+"px;'>");
			for(var i=1;i<=m;i++){
				document.write("<div style='width:"+wid+"px; height:"+hei+"px;'></div>");
			}
			document.write("</div>");
			document.write("<div>");
			document.write("<div id='ingosDiv' style='width:"+(wid-advDivBigSmallWidth-13)+"px;padding-left:10px; color:"+showInfoCss+"; font-size:13px; float:left; padding-top:3px; height:17px;'></div>");
			document.write("<div id='advDivBigSmall' style='float:right;width:"+advDivBigSmallWidth+"px;height:20px;'>");
			for(var i=1;i<=m;i++){
				document.write("<div>"+i+"</div>");
			}
			document.write("</div>");
			document.write("</div>");
			document.write("</div>");
		}
	};
	return moveAdv;
}
//obj参数说明（是一个json对象）属性列表如下：

//delaysN：滑动时间
//moveBgCssN：数字div移上去背景颜色
//moveFontCssN：数字div移上去文字颜色
//bgCssN：数字div移开背景颜色
//fontCssN：数字div移开文字颜色
//num:显示数字个数
//widN：宽度
//heiN：高度
//borderCssN：边框颜色
//showInfoCssN:信息显示字体颜色


//以上参数需要可以重新设置

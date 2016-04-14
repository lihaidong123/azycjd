$(function(){
	
});

function initCommentFunction(){
	$(".iframe_css").each(function(){
		var d=$("<div class='bigVideo' onclick='bigVideo(this)'>放大</div>");
		var f=$($(this).find("embed")[0]);
		try{
			d.insertBefore(f);
		}catch(e){}
	});
	
	//设置图片
	$(".comment_content img").each(function(){
		if($(this)[0].src.indexOf("kindeditor")==-1&&$(this)[0].src.indexOf("attached")!=-1){
			$(this).data("init_width",$(this).width()).data("init_height",$(this).height());
			var per=140/$(this).width();//计算缩小的百分比
			$(this).width(140);
			$(this).css("cursor","pointer");
			$(this).click(function(){
				if($(this).width()==140){
					//放大
					var maxWidth=860;
					var init_width=$(this).data("init_width");
					var init_height=$(this).data("init_height");
					if(maxWidth<init_width){
						var p=860/init_width;
						init_width=860;
						init_height=init_height*p;
					}
					$(this).animate({width:init_width});
				}else{
					//缩小
					var init_width=$(this).data("init_width");
					var init_height=$(this).data("init_height");
					var per=140/init_width;//计算缩小的百分比
					$(this).animate({width:140});
					//$(this).height(init_height*per);
				}
			});
			$(this)[0].style.visibility="visible";
		}else{
			$(this)[0].style.visibility="visible";
		}
	});
	
	loadMusicData();
}


function bigVideo(obj){
	if($(obj).html()=="放大"){
		var p=$(obj).parent();
		p.height(450).width(600);	
		p.find("embed")[0].height="400";
		p.find("embed")[0].width="600";
		$(obj).html("缩小");
	}else{
		var p=$(obj).parent();
		p.height(150).width(240);	
		p.find("embed")[0].height="110";
		p.find("embed")[0].width="200";
		$(obj).html("放大");
	}
	
}
var videocon=true;
function loadMusicData(){
	var music_a_index=0;
	$(".ke-insertfile").each(function(){
		var d_m=$("<div class='play_div_btn' id='music_index_"+music_a_index+"'></div>");
		var play_btn=$("<input type='button' class='play_btn'/>").val($(this)[0].innerHTML);
		play_btn.data("music_url",$(this)[0].href);
		play_btn.data("music_name",$(this)[0].innerHTML);
		play_btn.click(function(){
			$("#anziMusinPlayer").remove();
			$("<div id='anziMusinPlayer'></div>").appendTo(d_m);
			writeMusic("anziMusinPlayer");
			$("#wuyuehuPlayer").jPlayer("setMedia",{
				m4a:$(this).data("music_url")
			}).jPlayer("play");				   		
			$("#playfilename").html("歌曲名称："+$(this).data("music_name"));
			//$("#yndfMusicPlayerSongList").html("安之原创音乐:"+$(this).data("music_name"));
			$("#anziMusinPlayer").slideDown();
		});
		play_btn.appendTo(d_m);
		d_m.insertBefore($(this));
		$(this).remove();
		music_a_index++;
	});
}
function addVideo(){
	if(!(/^.+(\.swf)(.+)?$/).test($("#videoUrl").val())){
		alert("请输入合法的FLASH地址!");
		return;
	}
	//editor1.appendHtml("<div class='iframe_css'><iframe id='"+new Date().getTime()+"' src='"+$("#videoUrl").val()+"' width='240' height='150' frameborder='0' allowfullscreen=''></iframe></div>");
	editor1.appendHtml("<div class='iframe_css'><embed id='"+new Date().getTime()+"' src='"+$("#videoUrl").val()+"' allowFullScreen='true' quality='high' width='240' height='150' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash'></embed></div>");
}

window.onload=function(){
	initCommentFunction();
}
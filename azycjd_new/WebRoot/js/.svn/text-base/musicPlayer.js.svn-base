// JavaScript Document
//创建播放器
function writeMusic(id){
	var info="<div id='fathermusicdiv'><div id='mainPlayerdiv'><div id='wuyuehuPlayer'></div><div id='yndfMusicPlayer'><div id='songPercent'><div id='allPercent'><div id='nowpercent'></div></div></div><div id='yndfplayinfo'><table width='100%' border='0'><tr><td><div id='playfilename'></div></td><td width='70'><div id='yndfMusicPlayerPlay' class='btn_class'>播放</div><div id='yndfMusicPlayerPause' class='btn_class'>暂停</div></td><td width='170'><div id='playtime'></div><div id='totaltime'></div></td><td width='70'><div id='yndfMusicPlayerJingyin' class='btn_class'>静音</div><div id='yndfMusicPlayerNoJingyin' class='btn_class'>开音</div></td><td width='150'><div id='allvolumn'><div id='selectVolumn'></div></div></td></tr></table></div></div></div><div><table width='100%' border='0'><tr><td width='95%'><div id='yndfMusicPlayerSongList'></div></td><td width='5%'><div id='yndfMusicPlayerSongGeCi'></div></td></tr></table></div></div>";
	$("#"+id).html(info);
	musicInitNew();
}

function musicInitNew(){
	initMusicData();//初始化操作
	$("#wuyuehuPlayer").jPlayer( {  
		ready: function() { // $.jPlayer.event.ready 事件 
			if(is_auto_player){
				$(this).jPlayer("setMedia", { // 设置媒体  
					m4a: music_path+first[1]  
				}).jPlayer("play"); // 自动播放媒体  		
			}
		},  
		ended: function() { // The $.jPlayer.event.ended 事件  
			$(this).jPlayer("play"); //重复播放媒体  
		},
		timeupdate:function(e){
			$("#timesdiv").html(e.jPlayer.status.currentTime +"    "+ e.jPlayer.status.duration);
		},  
		supplied: "m4a",
		wmode:"window",
		loop:false,
		volume:1,
		cssSelectorAncestor: "",
		cssSelector:{
			currentTime:"#playtime",
			duration:"#totaltime",
			seekBar:"#allPercent",
			playBar:"#nowpercent",
			play: "#yndfMusicPlayerPlay",
			pause: "#yndfMusicPlayerPause",
			mute: "#yndfMusicPlayerJingyin",
			unmute: "#yndfMusicPlayerNoJingyin",
			volumeBar: "#allvolumn",
			volumeBarValue: "#selectVolumn"
		}  
	});	
}

var is_auto_player=false;
var fathermusicdiv_width=860;//最大的外框
var fathermusicdiv_border_color="#FFFFFF 1px solid";//最大的外框
var main_height=60;//外框
var main_bg_color="#aeafb1";//外框
var main_color="#f7f8f9";//外框
var allPercent_height=10;//进度条高度
var allPercent_bg_color="#f1f4f6";//进度条背景颜色
var nowpercent_bg_color="#8e9193";//当前播放进度背景颜色
var playtime_right_color="#CCCCCC 1px solid";//小边框颜色
var btn_width=50;//按钮宽度
var btn_height=30;//宽度高度
var btn_bg_color="#52565a";//按钮背景颜色
var btn_class_color="#f6f9fc";//按钮文字颜色
var btn_class_hover_bg_color="#85888a";//按钮移动背景颜色
var allvolumn_bg_color="#f0f4f7";//声音背景颜色
var allvolumn_height=7;//音乐进度条高度
var selectVolumn_bg_color="#2e3033";//选择音乐量背景颜色
var yndfMusicPlayerSong_height=0;//歌曲列表、歌词高度
var music_path="";

function initMusicData(){
	//最大的外框
	$("#fathermusicdiv").width(fathermusicdiv_width).css("border",fathermusicdiv_border_color).css("border-radius","4px 4px 0px 0px");
	//外框
	$("#mainPlayerdiv").height(main_height).css("background-color",main_bg_color).css("border-radius","4px 4px 0px 0px").css("padding","10px").css("padding-top","20px").css("color",main_color);
	//时长
	$("#allPercent").css("width","100%").height(allPercent_height).css("background-color",allPercent_bg_color).css("border-radius","10px");
	//当前播放进度
	$("#nowpercent").css("width","100%").height(allPercent_height).css("background-color",nowpercent_bg_color).css("border-radius","10px");
	//右边的颜色
	$("#playtime").css("border-right",playtime_right_color);
	//按钮的样式
	$(".btn_class").width(btn_width).height(btn_height).css("border-radius","4px").css("background-color",btn_bg_color).css("line-height",btn_height+"px").css("color",btn_class_color);
	$(".btn_class").hover(function(){
		$(this).css("background-color",btn_class_hover_bg_color);					
	},function(){
		$(this).css("background-color",btn_bg_color);					
	});
	
	//声音
	$("#allvolumn").css("width","100%").height(allvolumn_height).css("background-color",allvolumn_bg_color).css("border-radius","3px");
	$("#selectVolumn").css("width","100%").height(allvolumn_height).css("background-color",selectVolumn_bg_color).css("border-radius","3px");
	
	//歌曲列表
	$("#yndfMusicPlayerSongList").height(yndfMusicPlayerSong_height);
	$("#yndfMusicPlayerSongGeCi").height(yndfMusicPlayerSong_height);
	
	//addmusic();
}

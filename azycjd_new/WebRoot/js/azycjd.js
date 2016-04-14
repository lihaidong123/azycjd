var paihangbang=new Array("本月月票榜","总点击","总收藏","本月更新榜","本月推荐榜","本月订阅榜","本月新书月票榜","本月书友打赏榜","本月新书点击榜","本月新书推荐榜","本月新书收藏榜","本月完结精品榜");
var paihangbangName=new Array("票数","点击","收藏","更新","票数","订阅","票数","打赏","点击","票数","收藏","完结精品榜");
var novelTypeHtml=new Array("xhqh","wxxx","dsyn","lsjs","yxjj","khly","xdyq","gdyq");
var pageNum=2;
var readJsp=false;

function browserRedirect() {
    var sUserAgent = navigator.userAgent.toLowerCase();
    var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
    var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
    var bIsMidp = sUserAgent.match(/midp/i) == "midp";
    var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
    var bIsAndroid = sUserAgent.match(/android/i) == "android";
    var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
    var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
    if (!(bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) ){
       
    }else{
    	window.location.href="http://www.azycjd.com/mobile/m_index.do?menu_type=0";
    }
}


$(function(){
	loadLoginInfoCookie();
	/*if(window.location.host.indexOf("www.azycjd.com")==-1||window.location.host.indexOf("azycjd.wozmeu.org")!=-1){
		window.location.href="http://www.azycjd.com/";
	}*/
	browserRedirect();
	try{
		$("#login_div_css").css("left",($(window).width()-620)/2+"px");
		$("#login_div_css")[0].style.visibility="visible";
	}catch(e){}
	
	$("#showLoginDiv").click(function(){
		//showLoginWin();
	});
	
	$(".menu_css").click(function(){
		var menutype=$(this)[0].id;
		menutype=menutype.substring(menutype.indexOf("menu")+4,menutype.length);
		window.location.href=path+"/"+novelTypeHtml[parseInt(menutype)]+".html";
	});
	
	/*$(".author_name").click(function(){
		window.location.href="author_info.jsp";
	});*/
	$(".backindex").click(function(){
		window.location.href="index.html";
	});
	
	resetList();//去掉列表最左边的空隙
	$(".tree_css div").click(function(){
		changeTreeItem($(this)[0]);
		window.location.href=$(this)[0].className;
		//window.open($(this)[0].className);
	});
	
	$(".pic_ones div").click(function(){
		pic_ds_index=parseInt($(this).html())-1;
		clearInterval(pic_ds_timer);
		chagesRecommd($(this)[0]);
	});
	
	$(".menuPage li").click(function(){
		if($(this).html()=="论坛"){
			window.open("http://bbs.azycjd.com/");
			return;
		}
		window.location.href=$(this)[0].id;
		//window.open($(this)[0].id);
	});
	
	//改变究竟是点击了哪个菜单
	setLiColor();
	
	$("#tree_css_div").css("left",(($(window).width()-1000)/2+1000)+"px").css("top",(($(window).height()-$("#tree_css_div").height())/2)+"px");
	
	//作品详情页面切换底部边框线部分
	$(".projects_qiehuan div").click(function(){
		$(this).siblings().css('border-bottom', '#fff').css('border-bottom','#1a9cda');
	});
	
	//注册切换底部边框线部分
	$(".register_qiehuan div").click(function(){
		$(this).siblings().css('border-bottom', '#fff').css('border-bottom','#1a9cda');
	});
	
	$(".title_two").click(function(){
		var p_id=$(this)[0].parentNode.id;
		if(p_id=="zishu"||p_id=="xiezuo"||p_id=="paixu"||p_id=="shijian"){
			$($(this)[0].parentNode).children("div").each(function(){
				if($(this)[0].className!="title_one"){
					$(this)[0].className="title_two";
				}
			});
			$(this)[0].className="title_two_click";
			searchNovel();
		}else{
			var tp=($(this).parent()[0]).id;
			$("#typs_div").find(".title_two_click").each(function(){
				$(this)[0].className="title_two";
			});
			if($(this).html()=="不限"){
				$(this).parent().children(".title_two_click").each(function(){
					$(this)[0].className="title_two";
				});
			}else{//则需要将不限按钮设置为：title_two
				$(this).parent().children(".title_two_click").each(function(){
					if($(this).html()=="不限"){
						$(this)[0].className="title_two";
					}
				});
			}
			if($(this)[0].className=="title_two"){
				$(this)[0].className="title_two_click";
			}else{
				$(this)[0].className="title_two";
			}
			searchNovel();
		}
	});

	$(".index_img_1").hover(function(){
		var info="<div>完美世界</div>";
		info+="<div>校花的贴身高手</div>";
		info+="<div>天涯明月刀</div>";
		info+="<div>盗墓笔记</div>";
		info+="<div>琅琊榜</div>";
		info+="<div>斗破苍穹</div>";
		info+="<div>我欲封天</div>";
		//$("<div id='index_img_1_hover' class='hover_div_css'></div>").css("margin-top","1px").css("margin-left","1px").html(info).height(545).width(569).insertBefore($($(this).children("div")[0]));
		$("<div id='index_img_1_hover' class='hover_div_css'></div>").css("margin-top","1px").css("margin-left","1px").html("<div class='paihangbang_index' onclick=\"window.location.href='"+path+"/paihangbang.html'\"></div>").height(545).width(569).appendTo($(this));
	},function(){
		$("#index_img_1_hover").remove();
	});
	
	
	$(".index_img_2").hover(function(){
		var info="<div class='fuli_index'><div>网站签约福利</div>";
		info+="<div>原创未发表买断福利</div>";
		info+="<div>平台签约福利</div>";
		info+="<div>作家培训</div>";
		info+="<div>上架福利</div>";
		info+="<div>新书福利</div></div>";
		//$("<div id='index_img_2_hover' class='hover_div_css'></div>").css("margin-top","33px").css("margin-left","34px").html(info).height(325).width(400).insertBefore($($(this).children("div")[0]));
		$("<div id='index_img_2_hover' class='hover_div_css'></div>").html("<div class='zuojiafuli_index' onclick=\"window.location.href='"+path+"/zuojiafuli.jsp'\"></div>").height(321).width(400).appendTo($(this));
	},function(){
		$("#index_img_2_hover").remove();
	});
	
	$(".huodongzhuanquIndexCss_td").hover(function(){
		var info="<div class='novel_info'>我若要有，天不可无。我若要无，天不许有！ 这是一个起始于第八山与第九山之间的故事，一个“我命如妖欲封天”的世界！《我欲封天》是起点中文网白金作家耳根的全新力作小说，也是其转型问鼎之作。《我欲封天》讲述的是书生孟浩，步入修真界，一步步追寻人生大愿的封天之路，故事整体不似上一本小说《求魔》那般压抑。</div>";
		info+="<div style='text-align:center;'>安之米珺  著</div>";
		info+="<div class='novel_list_index'>";
		info+="<div>> 绝世唐门</div>";
		info+="<div>> 斗罗大陆</div>";
		info+="<div>> 莽荒纪</div>";
		info+="<div>> 水浒求生记</div>";
		info+="</div>";
		$("<div id='huodongzhuanquIndexCss_td_hover' class='hover_div_css'></div>").css("margin-top","-46px").html($("#bestRecommandNovel").html()).height(536).width(329).insertBefore($($(this).children("div")[0]));
	},function(){
		$("#huodongzhuanquIndexCss_td_hover").remove();
	});
	
	$(".right_menu_one li").click(function(){
		loadJsp($(this)[0]);
	});
	
	
	try{
		$($(".right_menu_one li")[lineNumber]).css("background-image","url("+path+"/index/images/clickmenu.png)").css("color","#FFFFFF").css("background-repeat","no-repeat");
		$($(".right_menu_one li")[lineNumber].parentNode).slideDown();
	}catch(e){}
	
	//($(window).scrollTop($(".right_menu_one li")[lineNumber].offsetTop));

	$(".right_menu_two").click(function(){
		$($(this)[0].parentNode).children("ul").slideToggle();
	});
	
	$(".divTableCss tr:even").each(function(){
		$(this).css("background-color","#f5f2f2");
	});
	
	//申请签约阅读协议
	signcontentInit();
	$("#signcontentBtn").click(function(){
		if($("#signcontent").css("display")==""||$("#signcontent").css("display")=="none"){
			$("#signcontent").css("display","block");
		}else{
			$("#signcontent").css("display","none");
		}
	});
	//申请签约关闭协议
	$("#signcontentBtntwo").click(function(){
		if($("#signcontent").css("display")==""||$("#signcontent").css("display")=="none"){
			$("#signcontent").css("display","none");
		}else{
			$("#signcontent").css("display","none");
		}
	});
	
	//申请签约弹框打开
	sqdivInit();
	$(".sqqy").click(function(){
		var shusize=$(".shusize").val();
		if(shusize == 0){
			alert("暂时没有可以申请福利的小说哦！");
			return;
		}
		var a=$(this).children(".benefitType").html();
		$("#suodiandezhi").val(a);
		var novelnam=$("#novelId")[0];
		var txt = novelnam.options[novelnam.selectedIndex].text;
		$("#shenqingdeshuname").html(txt);
		if($(".sqDiv").css("display")==""||$(".sqDiv").css("display")=="none"){
			$(".sqDiv").css("display","block");
		}else{
			$(".sqDiv").css("display","none");
		}
	});

	
	$(".bar_menu div").click(function(){
		var ids=$(this)[0].id;
		//获得当前点击对象的索引
		var chooseInd=($(this).parent().parent()).find("div").index($(this));
		var index=$(".bar_menu").index($(this).parent().parent());
		ids+="#chooseIndex="+chooseInd+"#index="+index;
		getJspDataByUrl(ids);
	});
	//显示横向菜单
	showBar();
	
	$(".my_activity_content_css").hover(function(){
		var t=$(this).html();
		var ind=0;
		$(".my_activity_content_css").each(function(){
			if(t==$(this).html()){
				return false;
			}
			ind++;
		});
		if($($(".my_activity_content_css")[ind]).children("div").length==0){
			var trendid=$(this).children(".trendid").val();
			var replyid=$(this).children(".replyid").val();
			if(replyid==undefined){
				$("<a id='huifu' class='huifu_css' href='javascript:addHuiFu("+ind+","+trendid+")'>回复</a>").appendTo($(this));
			}else{
				$("<a id='huifu' class='huifu_css' href='javascript:addHuiFuhh("+ind+","+trendid+","+replyid+")'>回复</a>").appendTo($(this));
			}
				
			
		}
	},function(){
		$("#huifu").remove();
	});
	
	$(".incomecheckmonth").click(function(){
		var id=$(this).next(".xiaoshuodeid").val();
		var name=$(this).nextAll(".xiaoshuodename").val();
		$.post(path+"/anzhiconsume/findAnzhiConsumeMyComeByMonth.do",{
			id:id
		},function(res){
			$("#incomegaikuang").html(res);
			$("#xiaoshuodename").html(name);
		});
	});
	
	$(".sqDiv").hide();
	$(".textarea_css").bind('propertychange input', function () {  
        var counter = $(this).val().length;
        if(counter>2000){
        	alert("您真是一代文豪，先歇息一会再写好吗?");
        	$('#remainCharNum').text("还可以输入0字");
        	var t=$(this).val();
        	t=t.substring(0,2000);
        	$(this).val(t);
        }else{
        	 $('#remainCharNum').text("还可以输入"+(2000 - counter)+"字");
        }
	});
	
	$.post(path+"/anzhipicture/loadPicture.do",null,function(res){
		if(res=="yes"){
			window.location.reload();
		}
	});
	
	try{
		if(!readJsp){
			$("body").bind('keydown', function (e) {
		        var key = e.which;
		        if (key == 13) {
		        	enterSubmit();
		        }
		    });
		}
	}catch(ex){
		
	}

	$("#novel_content br").each(function(){
		$("<p></p>").insertAfter($(this));
	});
	
	$(".novellabelCss").click(function(){
		novellabelCss($(this)[0]);
	});
	
	$("#dabusijian input[type='text']").css("background-color","red");
	$("#dabusijian input[type='text']").click(function(){
		$(this).css("background-color","#f0f0f0");
	});
	
	$(".sr-bdimgshare sr-bdimgshare-list sr-bdimgshare-24 sr-bdimgshare-black").css("display","none");
	
	try{
		$($("#login_div_css .top_1 div")[0]).width(200);
	}catch(e){}
	
});

function enterSubmit(){
	try{
		if(loginSession==''&&$("#login_css").css("display")=="block"){
			var obj=null;
			$(".login_btn").each(function(){
				if($(this).html()=="登录"){
					obj=$(this)[0];
				}
			});
			memberLogin(obj);
		}else if(searchNovelJsp==true&&loginSession!=''){
			searchNovelByTitle();
		}
	}catch(e){
		
	}
	
}

function showLoginWin(){
	if($("#login_css").css("display")==""||$("#login_css").css("display")=="none"){
		$("#login_css").css("display","block");
	}else{
		$("#login_css").css("display","none");
	}
}


var getBookBasicTimer;
var getBookBasicObject;
var removeBookBaiscTimer;
var novelImg;
var novelTitle;
var authorWriter;
var clickNum;
var readNum;
var novelVote;
var novelId;
//鼠标移上书的封面显示书的基本信息
function getBookBasicInfo(obj){
	if(getBookBasicObject!=null){
		if(novelVote!=null){
			if(novelVote.length>100){
				novelVote=novelVote.substring(0,100)+"...";
			}
		}
		if(novelId==null||novelId==undefined){
			novelId=$(getBookBasicObject).data("novelId");
		}
		$.post(path+"/book_basic_info.jsp",{
			novelImg:novelImg,
			novelTitle:novelTitle,
			authorWriter:authorWriter,
			clickNum:clickNum,
			readNum:readNum,
			novelVote:novelVote,
			novelId:novelId
		},function(res){
			var obj=$("<div class='book_info_css' id='book_info_css_div'></div>").html(res);
			obj.insertBefore($(getBookBasicObject));
			obj.hover(function(){
				clearInterval(removeBookBaiscTimer);
			},function(){
				removeBookBaiscTimer=setTimeout("removeBookBasic()",1000);
			});
			obj.css("margin-top",(obj.height()*(-1)-15)+"px");
		});
	}
}

/**
 * 设置小说的缩略图的点击效果
 */
function novalImgClick(){
	$(".noval_img").each(function(){
		var ids=$(this)[0].id;
		var novleId=ids.substring(0,ids.indexOf("novalImg"));
		$(this).children("img").click(function(){
			window.location.href=path+"/novel/"+novleId+".jsp";
		});
	});
}

function removeBookBasic(){
	$("#book_info_css_div").remove()
}

//去掉列表最左边的空隙
function resetList(){
	var ds=$(".article_items");
	for(var i=0;i<ds.length;i++){
		if(i%5==0){
			//ds[i].style.marginLeft="0px";
		}
	}
}



//排行榜滚动时树形图标变化
function changeTreeItem(obj){
	$(".tree_css div").each(function(){
		$(this).css("background","url("+path+"/images/smallyuan.png) 4px 5px no-repeat").css("color","#999999").css("font-weight","normal");
	});
	$(obj).css("background","url("+path+"/images/lanyua.png) 2px 5px no-repeat").css("color","#000000").css("font-weight","bold");
}
//排行榜滚动
function myscroll(){
	if(($(window).width()-1000)/2>=120){
		if(($(window).scrollTop())>1400){
			$("#tree_css_div").css("display","block");
			$("#abousus_div").css("display","none");
			changeTreeItem($(".tree_css div")[0]);
		}else{
			$("#tree_css_div").css("display","none");
			$("#abousus_div").css("display","block");
		}
	}
	var nowposi=($(window).scrollTop());
	var tmp=null;
	var total=2630;
	var av=(($(window).height()-$("#tree_css_div").height())/2);
	var ds=$(".list_items");
	for(var i=0;i<ds.length;i++){
		if(nowposi>(total-av)&&nowposi<(40-av+total+$(ds[i]).height())){
			changeTreeItem($(".tree_css div")[i+1]);
			break;
		}
		total+=$(ds[i]).height()+40;
	}
}

function closeBrowseTip(){
	$('#browseTips').slideUp();
}

//作品详情界面内容切换
function changeContent(obj,contentId){
	document.getElementById("zuopin").style.display="none";
	document.getElementById("zuojia").style.display="none";

	obj.style.borderBottomStyle="solid";
	document.getElementById(contentId).style.display="block";
}

//注册方式内容切换
function changeContentreg(obj,contentId){
	document.getElementById("dianhuazhuce").style.display="none";
	document.getElementById("youxiangzhuce").style.display="none";

	obj.style.borderBottomStyle="solid";
	document.getElementById(contentId).style.display="block";
}

function setLiColor(){
	var url=window.location.pathname;
	$(".menuPage li").each(function(){
		if($(this)[0].id==url){
			$(this).css("color","#1a9cda");
			return false;
		}
		
	});
}

function passwordEqual(obj,objs,objss){//密码一致问题
	var password1=document.getElementById(""+obj+"").value;
	var password2=document.getElementById(""+objs+"").value;
	 if(password1!=password2){
	     document.getElementById(""+objss+"").innerHTML="  密码不一致，请重新输入！";
		 return false;
     }else{
    	 document.getElementById(""+objss+"").innerHTML="";
     }
	 return true;
}


function memberLogin(obj){
	if($("#uname").val()==""){
		alert("请输入登录账户");
		return;
	}
	if($("#upass").val()==""){
		alert("请输入登录密码");
		return;
	}
	obj.style.display="none";
	$.post(path+"/anzhimember/login.do",{
		username:$("#uname").val(),
		userpass:$("#upass").val()
	},function(res){
		if(res.indexOf("登录成功")==-1){
			alert(res);
			obj.style.display="block";
		}else{
			SetCookie("uname",$("#uname").val());
			SetCookie("upass",$("#upass").val());
			try{
				if(registerJsp&&wantToWriter=='yes'){
					window.location.href=path+"/author_apply.jsp";
				}else{
					window.location.reload();
				}
			}catch(e){
				window.location.reload();
			}
			
		}
	});	
}

//注册用户名唯一性验证
function checkOnly(obj){
	var name=$(obj).val();
	if(name==""){
		 $(obj).next(".memberNo").html("请输入有效的用户名");
		 return;
	}else{
	$.post("anzhimember/findAnzhiMemberByNo.do",{name:name},function(res){
		if(res==0){
			$(obj).next(".memberNo").html("");
		}else if(res==1){
			 $(obj).next(".memberNo").html("用户名已存在");
		}
	});
	}
} 

//注册昵称唯一性验证
function checkOnlyNick(obj){
	var name=$(obj).val();
	if(name==""){
		 $(obj).next(".memberNick").html("请输入有效的昵称");
		 return;
	}else{
	$.post("anzhimember/findAnzhiMemberByNick.do",{name:name},function(res){
		if(res==0){
			$(obj).next(".memberNick").html("");
		}else if(res==1){
			 $(obj).next(".memberNick").html("昵称已存在");
		}
	});
	}
} 

//注册电话唯一性验证
function checkOnlyTel(obj){
	var tel=$(obj).val();
	if(tel==""){
		 $(obj).next(".memberTel").html("请输入有效的电话号码");
		 return;
	}else{
	$.post("anzhimember/findAnzhiMemberByTel.do",{tel:tel},function(res){
		if(res==0){
			$(obj).next(".memberTel").html("");
		}else if(res==1){
			 $(obj).next(".memberTel").html("该号码已注册");
		}
	});
	}
}

//注册邮箱唯一性验证
function checkOnlyEmail(obj){
	var email=$(obj).val();
	if(email==""){
		 $(obj).next(".memberEmail").html("请输入有效的邮箱");
		 return;
	}else{
	$.post("anzhimember/findAnzhiMemberByEmail.do",{email:email},function(res){
		if(res==0){
			$(obj).next(".memberEmail").html("");
		}else if(res==1){
			 $(obj).next(".memberEmail").html("该邮箱已注册");
		}
	});
	}
}

//申请作者笔名唯一性验证
function checkwritename(obj){
	var name=$(obj).val();
	if(name==""){
		 $(obj).next(".authorWriterName").html("请输入有效的笔名");
		 return;
	}else{
	$.post("anzhiauthor/findAnzhiAuthorByName.do",{name:name},function(res){
		if(res==0){
			$(obj).next(".authorWriterName").html("");
		}else if(res==1){
			 $(obj).next(".authorWriterName").html("该笔名已存在");
		}
	});
	}
} 

//申请成为作者电话唯一性验证
function updatecheckOnlyTel(obj,yuanshuju){
	var tel=$(obj).val();
	var newtel=yuanshuju;
	if(tel==""){
		 $(obj).next(".memberTel").html("请输入有效的电话号码");
		 return;
	}else{
		if(tel == newtel){
			 $(obj).next(".memberTel").html("");
			return;
		}else{
			$.post("anzhimember/findAnzhiMemberByTel.do",{tel:tel},function(res){
				if(res==0){
					$(obj).next(".memberTel").html("");
				}else if(res==1){
					 $(obj).next(".memberTel").html("该号码已注册");
				}
			});
		}
	}
}

//申请成为作者邮箱唯一性验证
function updatecheckOnlyEmail(obj,yuanshuju){
	var email=$(obj).val();
	var newemail=yuanshuju;
	if(email==""){
		 $(obj).next(".memberEmail").html("请输入有效的邮箱");
		 return;
	}else{
		if(email == newemail){
			 $(obj).next(".memberEmail").html("");
			return;
		}else{
			$.post("anzhimember/findAnzhiMemberByEmail.do",{email:email},function(res){
				if(res==0){
					$(obj).next(".memberEmail").html("");
				}else if(res==1){
					 $(obj).next(".memberEmail").html("该邮箱已注册");
				}
			});
		}
	}
}


//推荐小说编号查找小说
function checkFindNovelById(obj){
	var novelId=$(obj).val();
	if(novelId==""){
		 $(obj).next(".novelId").html("请输入有效的小说编号");
		 return;
	}else{
	$.post("anzhinovel/findAnzhiNovelByIdTuijian.do",{
			novelId:novelId,
			type:1
		},function(res){
		if(res==0){
			$(obj).next(".novelId").html("该小说不存在");
		}else{
			var a=res.split(";");
			$("#novelTitle").val(a[1]);
			$("#authorId").val(a[2]);
			 $(obj).next(".novelId").html("");
		}
	});
	}
}


function loadJspDirec(t){
	var obj=$(".project_manager_css")[t];
	loadJsp(obj);
}

function loadJsp(obj){
	/*右边菜单单击事件*/
	var ids=obj.id;
	getJspDataByUrl(ids);
}

function addHuiFu(ind,trendid){
	if($($(".my_activity_content_css")[ind]).children("div").length==0){
		var t=//"<form id='addhuifu"+trendid+"' method='post' action=\"anzhitrendreply/addAnzhiTrendReply.do?trendid="+trendid+"\">"+
			"<div class='divItemsCss' style='text-align: center;'>" +
			"<textarea style='height:90px; width:100%;' id='replyContent"+trendid+"'></textarea></div>" +
			"<div class='divItemsCss' style='text-align:right; padding-right:10px;'>" +
			"<input type='button' value='发表' class='saveBtnCss' onclick=\"activityReply('"+trendid+"',this)\"></div>";
		$("<div></div>").html(t).appendTo($(".my_activity_content_css")[ind]);
		$("#huifu").remove();
	}
}

function addHuiFuhh(ind,trendid,replyid){
	if($($(".my_activity_content_css")[ind]).children("div").length==0){
		var t=//"<form id='addhuifu"+trendid+"' method='post' action=\"anzhitrendreply/addAnzhiTrendReply.do?trendid="+trendid+"\">"+
			"<div class='divItemsCss' style='text-align: center;'>" +
			"<textarea style='height:90px; width:100%;' id='replyContent"+trendid+"'></textarea></div>" +
			"<div class='divItemsCss' style='text-align:right; padding-right:10px;'>" +
			"<input type='button' value='发表' class='saveBtnCss' onclick=\"activityReplyhh('"+trendid+"',this,"+replyid+")\"></div>";
		$("<div></div>").html(t).appendTo($(".my_activity_content_css")[ind]);
		$("#huifu").remove();
	}
}

function activityReply(trendid,obj){
	var replyContent=document.getElementById("replyContent"+trendid).value;
	obj.style.display="none";
	$.post(path+"/anzhitrendreply/addAnzhiTrendReply.do",{
		trendid:trendid,
		replyContent:replyContent
	},function(res){
		$("#mainContent").html(res);
	});
}

function activityReplyhh(trendid,obj,replyid){
	var replyContent=document.getElementById("replyContent"+trendid).value;
	obj.style.display="none";
	$.post(path+"/anzhitrendreply/addAnzhiTrendReply.do",{
		trendid:trendid,
		replyContent:replyContent,
		replyid:replyid
	},function(res){
		$("#mainContent").html(res);
	});
}

function showBar(){
	try{
		if(barIndex!=''){
			$(".bar_menu")[parseInt(barIndex)].style.display="block";
			if(chooseIndex!=''){
				$(($($(".bar_menu")[parseInt(barIndex)]).find("div"))[parseInt(chooseIndex)]).css("color","#ffffff").css("background-color","#1ea9eb");
			}else{
				$(($($(".bar_menu")[parseInt(barIndex)]).find("div"))[0]).css("border-bottom","#19adfa 3px solid");
			}
		}
	}catch(e){
		
	}
	
}

function getParam(url) {  
    if(url.indexOf("?")==-1){
    	return "";
    }else{
    	var t1=url.split("?");
    	return t1;
    }
}  

function signcontentInit(){
	try{
		$("#signcontent").css("left",($(window).width()-620)/2+"px");
		$("#signcontent")[0].style.visibility="visible";
	}catch(ex){}
}

function sqdivInit(){
	try{
		
		$(".sqDiv").css("left",($(window).width()-620)/2+"px");
		$(".sqDiv")[0].style.visibility="visible";
	}catch(ex){}
}

function loadIntroduceJsp(url,title){
	$.jBox("iframe:"+path+"/"+url, {
		title: "<div style='font-size:14px;'>"+title+"</div>",
		width: 860,
		height: 400,
		top:90,
		persistent: false,
		buttons: { '关闭': true },
		closed:function(){
			$("#body_index").css("background","url("+path+"/index/images/bg.png) repeat-x #f0f0f0").css("padding","0px").css("margin","0px");
		}
	});	
}

/*function showSign(i){
	$("#sqContent"+i).slideDown("slow");
	
}*/

function closeSign(j){
	$("#sqContent"+j).slideUp();
}

var novel_big_type=new Array("玄幻奇幻","武侠仙侠","都市异能","历史军事","游戏竞技","科幻灵异","现代言情","古代言情");
var novel_small_type=new Array("异界大陆;异界争霸;远古神话;东方玄幻;西方奇幻;领主贵族;魔法校园;异类兽族","古典武侠;现代武侠;异界武侠;古典仙侠;现代修真;洪荒修神;幻想修真","都市商战;都市生活;都市重生;官场沉浮;娱乐明星;乡土传记;恩怨情仇;现实百态;青春校园;异术超能;国术武技;合租情缘","外国历史;历史传记;架空历史;上古先秦;秦汉三国;两晋隋唐;五代十国;两宋元明;清史民国;战争幻想;谍战特工;军旅生涯;抗战烽火;军事战争","游戏生涯;电子竞技;虚拟网游;游戏异界;体育竞技;奕林春秋;篮球竞技;足球竞技","星际战争;机械时代;数字生命;时空穿梭;未来世界;古武机甲;超级科技;进化变异;末世危机;推理侦探;恐怖惊悚;悬疑探险;灵异奇谈","豪门总裁;青春都市;军婚高干;娱乐明星;商战职场;异术超能;官场沉浮;婚恋情感","穿越架空;仙侠魔幻;女尊天下;宫斗宅斗;种田养成;民国旧影;江湖情仇;架空玄幻;异族恋情;远古神话");
//输出小说类型-创建作品界面
function writeNovelType(divId){
	var inf="";
	for(var i=0;i<novel_big_type.length;i++){
		inf+="<div class='novel_type'><table width='100%'><tr><td class='bigTypeTd' valign='top'>";
		inf+="<div><input type='radio' name='anzhiNovelType' class='bigType' value='"+novel_big_type[i]+"' name='bigType' id='type"+i+"' onclick='noChooseSmallType()'>"+novel_big_type[i]+"</div>";
		inf+="</td><td class='smallTypeTd' valign='top'>";
		var t=novel_small_type[i].split(";");
		for(var k=0;k<t.length;k++){
			inf+="<div><input type='checkbox' class='smallType' value='"+t[k]+"' name='smallType' id='type"+i+"@"+k+"'>"+t[k]+"</div>";
		}
		inf+="</td></tr></table></div>";
	}
	$("#"+divId).html(inf);
	$(".smallType").click(function(){
		var nums=0;
		$(this).parent().parent().find(".smallType").each(function(){
			if($(this)[0].checked==true){
				nums++;
			}
		});
		if(nums>3){
			alert("小分类下可以选3个");
			$(this)[0].checked=false;
		}
		var ids=$(this)[0].id.split("@");
		$("#"+ids[0])[0].checked=true;
	});
}

function noChooseSmallType(){
	$(".smallType").each(function(){
		$(this)[0].checked=false;
	});
}

//根据传入的url进行跳转
function getJspData(obj){
	getJspDataByUrl(obj.id);
}

function getJspDataByUrl(url){
	if(url!=undefined&&url!=""){
		try{
			$("#azycjd_form").remove();
		}catch(ex){}
		var arr=url.split("#");
		var forms=document.createElement("form");
		forms.id="azycjd_form";
		forms.action=path+"/"+arr[0];
		forms.method="POST";
		for(var i=1;i<arr.length;i++){
			if(arr[i]!=null&&arr[i]!=""){
				var tmp=arr[i].split("=");
				var inputs=document.createElement("input");
				inputs.type="text";
				inputs.name=tmp[0];
				inputs.value=tmp[1];
				forms.appendChild(inputs);
			}
		}
		try{
			$.jBox.tip("请等待，数据加载中...", 'loading');
		}catch(e){}
		var html=$("html")[0];
		html.appendChild(forms);
		forms.submit();
	}
}


function goPageNum(textId,methodAction,formId){
	if(!(/^\d{1,5}$/).test($("#"+textId).val())){
		alert("页码输入错误！");
		return;
	}
	direcNum(methodAction,formId,parseInt($("#"+textId).val()));
}

//页面跳转
var nowPage=1;
var beishu=1;
var needSubmitForm=new Array("interactivedateform","AnzhiCommentFormManage","AnzhiNovelFormSearch","AnzhiNewsFormIndex","accountconsumeform","accountrechargeform","cavebookmarksform","cavecollectionform","commentpriseform","commentreplyform","incomedetailform","incomegaikuangform","cashmanageform","mycommentform","paiHangBangForm","replyForm","AnzhiFenJuanFormIndex","AnzhiNovelFormIndex","AnzhiNewsFormIndex","AnzhiMessageFormIndex");
function direcNum(methodAction,formId,pageNum){
	if(pageNum>nowPage){
		beishu=2;
	}else{
		beishu=-2;
	}
	nowPage=pageNum;
	var form=document.getElementById(formId);
	form.action=path+"/"+methodAction;
	var form=document.getElementById(formId);
	//添加请求页码
	if(pageNum!=undefined&&pageNum!=""){
		try{
			$("#pageNum").remove();//先移除
		}catch(e){}
		var pageNumInput=document.createElement("input");
		pageNumInput.name="pageNum";
		pageNumInput.value=pageNum;
		pageNumInput.type="hidden";
		pageNumInput.id="pageNum";
		form.appendChild(pageNumInput);
	}
	//如果是submit请求，需要重新设置
	if(checkSubmitForm(formId)){
		var t=form.action.split("?");
		form.action=t[0];//重新设置Action
		if(t.length>1){
			var arr=t[1].split("&&");//ep:wrw=1234
			for(var i=0;i<arr.length;i++){
				var tmp=arr[i].split("=");
				var input=document.createElement("input");
				input.name=tmp[0];
				input.value=tmp[1];
				input.type="hidden";
				form.appendChild(input);
			}
		}
		$.jBox.tip("请等待，数据加载中...", 'loading');
		form.submit();
	}else{
		ajaxSubmit(formId);
	}
}

function checkSubmitForm(formId){
	for(var i=0;i<needSubmitForm.length;i++){
		if(needSubmitForm[i]==formId){
			return true;
		}
	}
	return false;
}

function setNovelType(){
	var novelTypes="";
	var mess="请选择小说类型";
	$(".novel_type").each(function(){
		if(($(this).find(".bigType"))[0].checked==true){
			novelTypes+=($(this).find(".bigType"))[0].value+"@";
			var tmp="";
			$(this).find(".smallType").each(function(){
				if($(this)[0].checked==true){
					tmp+=$(this)[0].value+";";
				}
			});
			if(tmp==""){
				mess=($(this).find(".bigType"))[0].value+"还没有选择小类型呢！";
				novelTypes="";
				return false;
			}
			novelTypes+=tmp;
			novelTypes+="/";
		}
	});
	if(novelTypes==""){
		alert(mess);
		return false;
	}
	$("#novelType").val(novelTypes);
	return true;
}

function ajaxFormSubmit(id,obj) {
	isSubmit=true;
	if(id=="create_novel_form"||id=="update_novel_form"){
		if(!/^[\u4e00-\u9fa5]{1,}$/.test($("#novelTitle").val())){
			alert("作品名称输入错误！");
			return;
		}
		if(!setNovelType()){
			return;
		}
	}
	if(id=="day_chapter_form"){
		if($("#fenJuanId").val()==undefined||$("#fenJuanId").val()==""){
			alert("请选择所属分卷!");
			return;
		}
		
	}
	
	if(id=="youxiangzhuceform"){
		if($("#zhucexieyiyouxiang")[0].checked==false){
			alert("您还没有同意[安之原创基地用户注册协议]呢");
			return;
		}
		if($("#yonghuxieyiyouxiang")[0].checked==false){
			alert("您还没有同意[安之原创基地付费用户协议]呢");
			return;
		}
		var a=$("#youxiangzhuceform").find('.memberNo').html();
		var b=$("#youxiangzhuceform").find('.memberNick').html();
		var c=$("#youxiangzhuceform").find('.memberEmail').html();
		if(a!=""||b!=""||c!=""){
			alert("请输入合法的数据");
			return;
		}
	}
	
	if(id=="dianhuazhuceform"){
		if($("#zhucexieyidianhua")[0].checked==false){
			alert("您还没有同意[安之原创基地用户注册协议]呢");
			return;
		}
		if($("#yonghuxieyidianhua")[0].checked==false){
			alert("您还没有同意[安之原创基地付费用户协议]呢");
			return;
		}
		if($(".memberNo").html()!=""||$(".memberNick").html()!=""||$(".memberTel").html()!=""){
			alert("请输入合法的数据");
			return;
		}
	}
	if(id=="authorapplyform"){
		if($(".memberEmail").html()!=""||$(".memberTel").html()!=""){
			alert("请输入合法的数据");
			return;
		}
		$("#authorAddress").val($("#anzhi_provice").val()+"@#"+$("#anzhi_city").val()+"@#"+$("#anzhi_qu").val()+"@#"+$("#authorAddressDetail").val());
	}
	if(id=="myinfoform"){
		if($(".memberEmail").html()!=""||$(".memberTel").html()!=""){
			alert("请输入合法的数据");
			return;
		}
		$("#memberAddress").val($("#anzhi_provice").val()+"@#"+$("#anzhi_city").val()+"@#"+$("#anzhi_qu").val()+"@#"+$("#memberAddressDetail").val());
	}
	if(id=="infoupdateform"){
		$("#authorAddress").val($("#anzhi_provice").val()+"@#"+$("#anzhi_city").val()+"@#"+$("#anzhi_qu").val()+"@#"+$("#memberAddressDetail").val());
	}
	if(id=="interactiveform"){
		if($("#interactiveContent").val()==""){
			alert("请输入内容");
			return;
		}
	}
	var form=document.getElementById(id);
    var dataPara = getFormJson(form);
    if(isSubmit){
    	var t=form.action.split("?");
		form.action=t[0];//重新设置Action
		if(t.length>1){
			var arr=t[1].split("&&");//ep:wrw=1234
			for(var i=0;i<arr.length;i++){
				var tmp=arr[i].split("=");
				var input=document.createElement("input");
				input.name=tmp[0];
				input.value=tmp[1];
				input.type="hidden";
				form.appendChild(input);
			}
		}
		if(id=="update_novel_form"&&isSign&&oldNovelTitle!=$("#novelTitle").val()){
			alert("小说名称修改申请已经提交，请等待审核！");
		}
		$.jBox.tip("请等待，数据加载中...", 'loading');
		form.submit();
    }
}

var isSubmit=true;
function ajaxSubmit(id,obj) {
	var frm=document.getElementById(id);
	if(id=="updpassform"){
		if($("#newPass1").val()!=$("#newPass").val()){
			alert("两次输入密码不一致！");
			return;
		}
	}
	if(id=="AnzhiNovelFormAction"){
		if(!setNovelType()){
			return;
		}
	}
	if(id=="AnzhiWebEditorUpdatePass"){
		if($("#newPass1").val()!=$("#newPass").val()){
			alert("两次输入密码不一致！");
			return;
		}
	}
	if(id=="my_news_message"||id=="myactivityform"){
		if(!/^\d{4}$/.test($("#randCode").val())){
			alert("验证码输入错误！");
			return;
		}
		if(!(/^.{5,2000}$/).test($($(frm).find(".textarea_css")[0]).val())){
			alert("发送内容长度必须在4-120之间！");
			return;
		}
	}
	if(id=="AnzhiRecommendFormAction"||id=="AnzhiDiscountedFormAction"||id=="AnzhiWebEditorAuthorFormAction"){
		if($("#novelId").val()==""){
			alert("您还没有选择一本小说呢");
			return;
		}
	}
	if(id=="applybenefitform"){
		if($("#applyReason").val()==""){
			alert("请输入申请理由！");
			return;
		}else{
			$("#sqContent1").slideUp();
		}
	}
	if(id=="cashapplyform"){
		if($("#anzhiMoneyCash").val()==""){
			alert("请输入提现金额！");
			return;
		}
	}
	isSubmit=true;
    var dataPara = getFormJson(frm);
    if(isSubmit){
    	$.jBox.tip("请等待，操作中...", 'loading');
    	try{
    		obj.style.display="none";
    	}catch(e){}
    	$.ajax({
            url: frm.action,
            type: frm.method,
            data: dataPara,
            success:function(res){
            	if(id=="AnzhiFenJuanFormActionIndex"){
            		$("#addFenJuanDiv").slideUp();
            		getJspDataByUrl("anzhifenjuan/findAnzhiFenJuanAll.do#linenumber=11#novelId="+questNovelId+"#index=8#chooseIndex=1");
            	}else if(id=="updpassform"){
            		alert(res);
            	}else if(id=="AnzhiWebEditorUpdatePass"){
            		alert(res);
            	}else if(id=="updateAnzhiWebEditorFormAction"){
            		alert(res);
            	}else if(id=="AnzhiWebEditorWorkFormAction"){
            		alert("作业提交成功！");
            		frm.reset();
            		obj.style.display="block";
            	}else if(id=="AnzhiWebEditorTuijianFormAction"){
            		alert("推文报备成功！");
            		frm.reset();
            		obj.style.display="block";
            	}else if(id=="AnzhiWebEditorFuliApplyFormAction"){
            		alert("福利申请提交成功！");
            		frm.reset();
            		obj.style.display="block";
            	}else if(id=="authorapplyform"){
            		alert(res);
            	}else if(id=="AnzhiThirdRecommandFormAction"){
            		thirdRecommand(res);
            		obj.style.display="block";
            	}else if(id=="AnzhiMessageFormActionAdmin"){
            		if(res.indexOf("接收人账号或昵称不存在")!=-1||res.indexOf("该用户设置了隐私权限")!=-1){
            			alert(res);
            			obj.style.display="block";
            		}else{
            			$("#mainContent").html(res);
            		}
            	}else if(id=="AnzhiRecommendFormAction"||id=="AnzhiDiscountedFormAction"){
            		$("#searchNovelData").html("");
        			$("#novelId").val("");
        			$("#novelSearchTitle").val("");
        			$("#novelSearchTitle")[0].focus();
        			obj.style.display="block";
            	}else if(id=="AnzhiWebEditorAuthorFormAction"){
            		if(res=="yes"){
            			$("#searchNovelData").html("");
            			$("#novelId").val("");
            			$("#novelSearchTitle").val("");
            			$("#novelSearchTitle")[0].focus();
            		}else{
            			alert(res);
            		}
            		obj.style.display="block";
            	}else if(id=="my_news_message"){
            		if(res=="yes"){
            			alert("消息发送成功！");
            			$("#messageTitle").val("");
            			$("#messageContent").val("");
            			$("#jieshouren").val("");
            		}else{
            			alert(res);
            			try{
            	    		obj.style.display="block";
            	    	}catch(e){}
            		}
            	}else{
            		$("#mainContent").html(res);
            	}
            	$.jBox.closeTip();
            }
        });
    }
}

//将form中的值转换为键值对。
function getFormJson(frm) {
    var o = {};  
    var a = $(frm).serializeArray();
    $.each(a, function () {
    	try{
    		var t=$("#"+this.name)[0];
        	if(t.alt&&t.alt!=""){
        		var ts=t.alt.split(";");
        		reg=new RegExp("^"+ts[0]+"$");
        		if(!reg.test(t.value)){
        			try{
        				alert(ts[1]);
        				isSubmit=false;
        				return false;
        			}catch(e){
        				
        			}
        		}
        	}
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                if(this.value!=""){
                	o[this.name]+=","+this.value;
                }
                //o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
    	}catch(e){
    		//return false;
    	}
    });
    return o;
}


//弹出框
function alertYndf(info){
	alert(info);
	return;
	/*info="<div style='padding:10px;font-size:14px;'>"+info+"</div>";
	$.jBox(info,{
		title:"<div style='font-size:13px;'>友情提示</div>",
		height:150,
		closed:function(){
			$("#bodyObject").css("padding","0px").css("margin","0px");
		}
	});*/
}

function allLoadPage(url){
	$.jBox.tip("请等待，数据加载中...", 'loading');
	$.post(url,null,function(res){
		$("#mainContent").html(res);
		$.jBox.closeTip();
	});
}

function loadPageData(actions){
	allLoadPage(actions);
}

function loadUpdatePageData(url,obj,domid,width,height){
	loadPageData(url);
}

function del(p){
	if(confirm("您确定删除该条记录吗？")){
		if($("#hiddenNowPageNum").length==1){
			if(p.indexOf("?")==-1){
				p+="?pageNum="+$("#hiddenNowPageNum").val();
			}else{
				p+="&&pageNum="+$("#hiddenNowPageNum").val();
			}
		}
		allLoadPage(path+"/"+p);
	}
}

function resetpass(p,obj){
	if(confirm("您确定重置该作者密码吗？")){
		obj.style.display="none";
		$.post(path+"/"+p,null,function(res){
			alert(res);
		});
	}
}


//打印
function doPrint(printid) {
	bdhtml=window.document.body.innerHTML;
	bdhtml=$("#printView").html();
	if(printid!=undefined){
		bdhtml=$("#"+printid).html();
	}
	sprnstr="<!--startprint-->";
	eprnstr="<!--endprint-->";
	prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);
	prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));
	window.document.body.innerHTML=bdhtml;
	window.print();
}

//异步加载小说数据
function loadNovelDeTail(novelId){
	$.post(path+"/anzhinovel/loadNovelDeTail.do",{novelId:novelId},function(res){
		var json=res; 
		$("#zhoudianji").html(json.zhoudianji);
		$("#zhoutuijian").html(json.zhoutuijian);
		$("#yuedianji").html(json.yuedianji);
		$("#yuetuijian").html(json.yuetuijian);
		$("#zongdianji").html(json.zongdianji);
		$("#zongzishu").html(json.zongzishu);
		$("#gengxinshijian").html(json.gengxinshijian);
		novelSignState=json.novelSignState;
		//是否点赞、收藏、推荐本书
		if(json.yetSouCang=="yes"){
			$("#shoucangbenshu").html("已收藏");
		}
		if(json.yetTuiJianNovel=="yes"){
			$("#tuijianbenshu").html("已推荐");
		}
		$("#shoucangbenshu").slideDown();
		$("#tuijianbenshu").slideDown();

		for(var i=0;i<json.newsdata.length;i++){
			var t=json.newsdata[i];
			newsdata[newsdata.length]="<a href='news_html/anzhi_news_"+t.id+".jsp' target='_blank'>"+t.newsTitle+"</a>";
		}
		
		try{
			//去掉已经点赞的评论
			var commentPraiseArr=json.praise.split(",");
			for(var i=0;i<commentPraiseArr.length;i++){
				if(commentPraiseArr[i]!=""){
					try{
						var tsss=$("#dianZanComment"+commentPraiseArr[i]);
						var v=tsss.html();
						v=v.replace(new RegExp("点赞"),"已点赞");
						tsss.html(v);
						tsss[0].onclick=function(){
							return;
						};
					}catch(e){}
				}
			}
		}catch(ex){}
		
		if(json.zhizhushangjia=="yes"){
			$("#zhizhushangjia").slideDown();
		}

		//显示优惠信息
		if(json.youhuiInfo=="yes"){
			$("#youhui_info").html("本书有["+json.discountedType+"]优惠，截止:"+json.discountedEndDate+"。<span class='discountedRebate_class'>"+json.discountedRebate+"</span>");
		}
		moves();
	});
}

//异步加载小说数据replyAll
function loadNovelDeTailAll(novelId){
	$.post(path+"/anzhinovel/loadNovelDeTail.do",{novelId:novelId},function(res){
		var json=res; 
		try{
			//去掉已经点赞的评论
			var commentPraiseArr=json.praise.split(",");
			for(var i=0;i<commentPraiseArr.length;i++){
				if(commentPraiseArr[i]!=""){
					try{
						var tsss=$("#dianZanComment"+commentPraiseArr[i]);
						var v=tsss.html();
						v=v.replace(new RegExp("点赞"),"已点赞");
						tsss.html(v);
						tsss[0].onclick=function(){
							return;
						};
					}catch(e){}
				}
			}
		}catch(ex){}
	});
}

//评论回复
function commentReply(commentId,novelId,memberId){
	if(memberId==''){
		showLoginNew();
		return;
	}
	/*getJspDataByUrl("anzhicomment/commentAction.do#commentId="+commentId+"#novelId="+novelId);*/
	if($("#reply"+commentId).length==0){
		$("<div class='reply_div_css' id='reply"+commentId+"'></div>").html("<input placeholder='回复一下你的看法...' class='reply_text_css' id='reply_content"+commentId+"' type='text'/><input type='button' class='reply_btn_css' value='回复' onclick=\"saveReplyComment(this,'"+novelId+"','"+commentId+"',0)\"/>").insertAfter($("#comment_time"+commentId));
	}
}

//评论点赞
function commentPraise(obj,memberId,novelId,commentId,chapterId){
	if(memberId==''){
		showLoginNew();
		return;
	}
	$.post(path+"/anzhicommentpraise/addAnzhiCommentPraise.do",{
		novelId:novelId,
		commentId:commentId,
		chapterId:chapterId
	},function(res){
		if(res!="yes"){
			alert(res);
		}else{
			var t=obj.innerHTML;
			var dianzan_num=t.substring(t.indexOf("(")+1,t.indexOf(")"));
			obj.innerHTML="已点赞("+(parseInt(dianzan_num)+1)+")";
			obj.onclick=function(){
				return;
			}
		}
	});
}

//选择表情
function chooseBiaoQing(obj,biaoQingId){
	$("#"+biaoQingId).val($("#"+biaoQingId).val()+obj.className);
	$("#"+biaoQingId+"BiaoQing").slideUp();
}

//验证码
function loadimage(){ 
	document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
} 
//保存评论
function saveComment(obj,novelId,memberId,commentFatherid,commentType){
	if(!/^\d{4}$/.test($("#randCode").val())){
		alert("验证码输入错误！");
		return;
	}
	if(memberId==''){
		showLoginNew();
		return;
	}
	if(commentFatherid==undefined){
		alert("参数请求错误！");
		return;
	}
	//if(confirm('您确定提交书评吗?')){
		obj.style.display="none";
		var state=0;
		if($("#state").val()!=undefined){
			state=$("#state").val();
		}
		$.post(path+"/anzhicomment/addAnzhiComment.do",{
			commentFatherid:commentFatherid,
			commentType:commentType,
			commentContent:$("#commentContent").val(),
			tableId:novelId,
			commentTitle:$("#comment_title").val(),
			state:state,
			randCode:$("#randCode").val()
		},function(res){
			if(res=="yes"){
				window.location.reload();
				/*$.post(path+"/anzhinovel/createHtml.do",{htmlName:"novel/"+novelId,data:res},function(){
					alert("评论成功");
					window.location.reload();
				});*/
			}else{
				alert(res);
				obj.style.display="block";
			}
		});
	//}
}

//保存评论回复
function saveReplyComment(obj,novelId,commentFatherid,commentType){
	if(loginMemberId==''){
		showLoginNew();
		return;
	}
	if($("#reply_content"+commentFatherid).val()==null||$("#reply_content"+commentFatherid).val()==""){
		alert("您还没有写您的看法呢！");
		return;
	}
	if(commentFatherid==undefined||commentFatherid==0){
		alert("参数请求错误！");
		return;
	}
	obj.style.display="none";
	var state=0;
	if($("#state").val()!=undefined){
		state=$("#state").val();
	}
	$.post(path+"/anzhicomment/addAnzhiComment.do",{
		commentFatherid:commentFatherid,
		commentType:commentType,
		commentContent:$("#reply_content"+commentFatherid).val(),
		tableId:novelId,
		commentTitle:'',
		state:0
	},function(res){
		window.location.reload();
		/*$.post(path+"/anzhinovel/createHtml.do",{htmlName:"novel/"+novelId,data:res},function(){
			window.location.reload();
		});*/
	});
}

//推荐作品、收藏小说
function multifunction(obj,memberId,novelId,actionType,novelTitle){
	if(memberId==''){
		showLoginNew();
		return;
	}
	//if(confirm("确定收藏《"+novelTitle+"》吗?")){
		$.post(path+"/anzhinovelmultifunction/saveAnzhiNovelMultifunction.do",{novelId:novelId,actionType:actionType},function(res){
			if(res!="yes"){
				alert(res);
			}else{
				alert("收藏成功");//《"+novelTitle+"》作品
				obj.innerHTML="已收藏";
				obj.onclick=function(){return;}
			}
		});
	//}
}

/**
 * 打赏作品
 */
function daShangNovel(divIndex,memberId,novelId,novelTitle,con){
	if(memberId==''){
		showLoginNew();
		return;
	}
	if(con==undefined){
		con="no";
	}
	if(divIndex==1&&novelSignState==0){
		alert("该小说不是VIP作品,不能投月票！");
		return;
	}
	$.jBox("iframe:"+path+"/anzhinovel/loadDaShangJsp.do?novelId="+novelId+"&&divIndex="+divIndex+"&&con="+con, {
		title: "<div style='font-size:14px;'>"+novelTitle+"---互动区</div>",
		width: 750,
		height: 500,
		top:90,
		persistent: false,
		buttons: { '关闭': true },
		closed:function(){
			try{
				$("#top_banner").css("background","url("+path+"/images/top_t.png)  center 0px no-repeat #f0f0f0").css("padding","0px").css("margin","0px");
			}catch(ex){}
			try{
				$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
			}catch(ex){}
			
		}
	});	
} 

/**
 * 购买单章节、或购买本书、或订阅界面跳转
 */
function buyChapter(chapterId,chapterIndex){
	$.jBox("iframe:"+path+"/anzhichapter/loadBuyChapter.do?chapterId="+chapterId+"&&chapterIndex="+chapterIndex, {
		title: "<div style='font-size:14px;'>章节购买</div>",
		width: 850,
		height: 500,
		top:90,
		persistent: false,
		buttons: { '关闭': true },
		closed:function(){
			$("#top_banner").css("background","url("+path+"/images/top_t.png)  center 0px no-repeat #f0f0f0").css("padding","0px").css("margin","0px");
		}
	});
}

function buyChapterAction(){
	
}

/**
 * 添加好友
 */
function addFriend(friendId,memberId,obj){
	if(memberId==''){
		showLoginNew();
		return;
	}
	if(confirm("您确定将该用户添加为好友吗?")){
		obj.style.display="none";
		$.post(path+"/anzhifriend/addAnzhiFriend.do",{friendMemberId:friendId},function(res){
			if(res!="yes"){
				obj.style.display="block";
				alert(res);
			}else{
				alert("添加成功");
			}
		});
	}
}


/**
 * 购买分卷
 */
function buyFenJuan(fenJuanId,totalChapterNum,totalCharNum,fenJuanTotalChapterNum){
	if(memberId==''){
		showLoginNew();
		return;
	}
	var vipChapter=0;
	var vipCharNum=0;
	$("#chapter_div"+fenJuanId).children(".vip_chapter").each(function(){
		var tmp=($(this).children("a"))[0].id.split("@");
		vipChapter++;
		vipCharNum+=parseInt(tmp[0]);
	});
	if(vipChapter==0){
		alert("该分卷您已经购买了！");
		return;
	}
	if(parseInt(youhuiType)==0||parseInt(youhuiType)==1){//如果是本周免费、限时免费，则不能购买
		alert("该小说目前有["+discountedTypeName+"]优惠，暂不提供购买！您可以直接阅读！");
		return;
	}
	var needAnzhiMoney=getAnZhiBi(vipCharNum);
	var youhuiInfo="";
	if(parseInt(youhuiType)==2||parseInt(youhuiType)==3){
		needAnzhiMoney=parseInt(needAnzhiMoney*(parseFloat(discountedRebate)/10));
		youhuiInfo="本书目前有["+discountedTypeName+"]优惠,购买折扣为:"+discountedRebate+"。现在购买需要"+needAnzhiMoney+"安之币。";
	}
	if(confirm("您账户上还有["+memberMoney+"]安之币。该分卷总共包含"+totalChapterNum+"章，其中没有购买的VIP章节有"+vipChapter+"章，共计"+vipCharNum+"字，需要"+getAnZhiBi(vipCharNum)+"安之币,"+youhuiInfo+"您确定购买吗？")){
		if(memberMoney<needAnzhiMoney){
			alert("您账户上剩余安之币不足，请先充值！");
			return;
		}
		$(".buyFenJuan").each(function(){
			$(this)[0].style.visibility="hidden";
		});
		$.post(path+"/anzhichaptersubscribe/fenJuanDingYue.do",{fenJuanId:fenJuanId},function(res){
			if(res!="yes"){
				$(".buyFenJuan").each(function(){
					$(this)[0].style.visibility="visible";
				});
				alert(res);
			}else{
				alert("购买成功");
				window.location.reload(true);
			}
		});
	}
}

/*
 * 签到
 */
function qiandao(obj){
	if(confirm("是否确认签到?")){
		obj.style.display="none";
		$.post(path+"/anzhiexperiencerecord/addAnzhiExperienceRecord.do",{experienceType:0},function(res){
			if(res!="yes"){
				obj.style.display="block";
				alert(res);
			}else{
				$("#qiandaohaole").html("已签到");
				alert("签到成功");
				$.post(path+"/index/qiandaonum_info.jsp",null,function(res){
					$("#qiandaonumDiv").html(res);
					$("#qiandaonumDiv")[0].style.display="block";
				});
			}
		});
	}
}

/**
 * 阅读小说
 */
function readNovel(chapterId,obj,charNum,chapterIndex){
	if(($(obj).parent())[0].className=="vip_chapter"&&loginMemberNo!='admin'){
		if(memberId==""){
			showLoginNew();
			return;
		}
		var needAnzhiMoney=getAnZhiBi(charNum);
		if(parseInt(readMoney)>needAnzhiMoney){//如果阅读币可以支付
			window.open(path+"/anzhichapter/read.do?chapterId="+chapterId);
			return;
		}
		if(autoBuy==0){//说明没有自动订阅，则需要提示购买
			if(parseInt(youhuiType)==0||parseInt(youhuiType)==1){//如果是本周免费、限时免费，则不需要验证
				window.open(path+"/anzhichapter/read.do?chapterId="+chapterId);
			}else{
				var youhuiInfo="";
				if(parseInt(youhuiType)==2||parseInt(youhuiType)==3){
					youhuiInfo="本书目前有["+discountedTypeName+"]优惠,购买折扣为:"+discountedRebate+"。";
				}
				buyChapter(chapterId,chapterIndex);
				/*if(confirm("该章节是VIP章节，您还没有购买。"+youhuiInfo+"是否需要购买?")){
					
				}*/
				return;
			}
		}else{
			//自动购买、阅读
			window.open(path+"/anzhichapter/read.do?chapterId="+chapterId);
			return;
		}
	}
	window.open(path+"/anzhichapter/read.do?chapterId="+chapterId);
}

/**
 * 根据小说文字计算需要的安之币
 * @param charNum
 * @returns {Number}
 */
function getAnZhiBi(charNum){
	return parseInt(charNum/1000)*4;
}

/**
 * 取消订阅
 * @param novelId
 * @param obj
 */
function delautoBuy(novelId,obj){
	if(memberId==""){
		alert("您还没有登录呢");
		return;
	}
	if(confirm("您确定取消自动订阅吗?")){
		obj.style.display="none";
		$.post(path+"/anzhichaptersubscribe/delautoBuy.do",{novelId:novelId},function(res){
			if(res=="yes"){
				autoBuy=0;
				alert("取消成功");
				window.location.reload();
			}else{
				alert(res);
				obj.style.display="block";
			}
		});
	}
}

/**
 * 章节加入书签
 * @param id
 */
function shuqian(chapterId,novelId,obj){
	if(memberId==""){
		alert("您还没有登录呢");
		return;
	}
	obj.style.display="none";
	$.post(path+"/anzhibookmark/addAnzhiBookmark.do",{bookmarkType:0,chapterId:chapterId,novelId:novelId,readAddress:$(document).scrollTop()},function(res){
		if(res=="yes"){
			autoBuy=0;
			$.jBox.tip("成功加入书签！");
		}else{
			alert(res);
		}
		obj.style.display="block";
	});
	
}

function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
	var Days = 30; //此 cookie 将被保存 30 天
	var exp  = new Date();    //new Date("December 31, 9998");
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie(name)//取cookies函数        
{
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	 if(arr != null) return unescape(arr[2]); return null;

}
function delCookie(name)//删除cookie
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function changecashmoney(obj,mymoney){
	var anzhimoney=$(obj).val();
	var cashMoney=$("#cashMoney");
	if(anzhimoney>0){
		if(anzhimoney>mymoney){
			alert("安之币余额不足");
			$(obj).val("");
			return;
		}else{
			cashMoney.val(anzhimoney/100);
		}
	}else{
		cashMoney.val("");
	}
}

function loadLoginInfo(){
	$.post(path+"/model/now_login_info.jsp",null,function(res){
		$($("#login_div_css .top_1")[0]).html(res);
	});
}

function commentTypeClick(con,obj){
	obj.className="comment_type_css_click";
	if(con){
		$('#pinglunDiv')[0].style.display='none';
		$('#liuyanpinglunDiv')[0].style.display='block';
		
		$('#commentShupinTotalNum')[0].style.display='none';
		$('#commentLiuYanTotalNum')[0].style.display='block';
		$("#c_t_2")[0].className="comment_type_css";
	}else{
		$('#pinglunDiv')[0].style.display='block';
		$('#liuyanpinglunDiv')[0].style.display='none';
		$('#commentShupinTotalNum')[0].style.display='block';
		$('#commentLiuYanTotalNum')[0].style.display='none';
		$("#c_t_1")[0].className="comment_type_css";
	}
}

function delTable(obj,tableId,tabNameIndex,actionType,stateValue,actionurl,t){
	if(confirm("您确定执行吗?")){
		$("#actiondiv"+tableId).slideToggle();
		$.post(path+"/util/delRecord.do",{
			tableId:tableId,
			tabNameIndex:tabNameIndex,
			actionType:actionType,
			stateValue:stateValue,
			vote:$("#vote").val()
		},function(res){
			if(res=="yes"){
				alert("操作成功");
				if(tableId!=''){
					actionurl+="?novelId="+t;
				}
				getJspDataByUrl(actionurl);
			}else{
				alert(res);
				$("#actiondiv"+tableId).slideToggle();
			}
		});
	}
}

function getMoreHuanYiPi(menutype){
	clearInterval(pptHuanYipiTimer);
	$.post(path+"/anzhinovel/findAnzhiNovelchangeyipi.do",{
		menutype:menutype,
		pageNum:pageNum++
	},function(res){
		$("#huanyipiDIv").html(res);
		pptHuanYipiTimer=setTimeout("pptHuanYiPi()",pptHuanYipiDelay);
	});
}

function getHtmlContent(className,len){
	if(className=="xiaoshuojieshao"){
		len=95;
	}
	$("."+className).each(function(){
		var t=$(this)[0].innerText;
		if(t.length>len){
			t=t.substring(0,len)+"...";
		}
		$(this).html(t);
	});
}

//初始化省份数据
function initAnzhiProvice(oldAddress){
	var anzhi_provice=document.getElementById("anzhi_provice");
	for(var i=0;i<provinceArray.length;i++){
		anzhi_provice.add(new Option(provinceArray[i],provinceArray[i]));
	}
	getCityData(anzhi_provice.value);
	setDefaultValue(oldAddress);
}

function getCityData(v){
	var anzhi_city=document.getElementById("anzhi_city");
	anzhi_city.options.length=0;
	for(var i=0;i<cityArray.length;i++){
		var tmp=cityArray[i].split(",");
		if(tmp[1]==v){
			anzhi_city.add(new Option(tmp[0],tmp[0]));
		}
	}
	getQuData(anzhi_city.value);
	getShengShiquHtml();
}

function getQuData(v){
	var anzhi_qu=document.getElementById("anzhi_qu");
	anzhi_qu.options.length=0;	
	for(var i=0;i<districtArray.length;i++){
		var tmp=districtArray[i].split(",");
		if(tmp[0]==v){
			anzhi_qu.add(new Option(tmp[1],tmp[1]));
		}
	}
	getShengShiquHtml()
}

function setDefaultValue(oldAddress){
	if(oldAddress==undefined||oldAddress==''){
		return;
	}
	var arr=oldAddress.split("@#");
	if(arr.length!=4){
		return;
	}
	var p=arr[0];	
	var c=arr[1];
	var q=arr[2];
	document.getElementById("anzhi_provice").value=p;
	getCityData(p);
	document.getElementById("anzhi_city").value=c;
	getQuData(c);
	document.getElementById("anzhi_qu").value=q;
	document.getElementById("memberAddressDetail").value=arr[3];
	getShengShiquHtml();
}

function getShengShiquHtml(){
	$("#shengshiquHtml").html($("#anzhi_provice").val()+$("#anzhi_city").val()+$("#anzhi_qu").val());
}

function getLoginData(){
	if(QC.Login.check()){
		QC.Login.getMe(function(openId, accessToken){
			var op=openId;
			alert(openId);
		});
		cbLoginFun(oInfo, oOpts);
	}
}
var cbLoginFun = function(oInfo, oOpts){
	$("#figureurl_qq_1")[0].src=oInfo.figureurl_qq_1;
};


function delRecordBack(url){
	if(confirm("您确定删除该记录吗?")){
		getJspDataByUrl(url);
	}
}

function showLoginNew(){
	//$(window).scrollTop(0);
	showLoginWin();
	$("#login_css").css("position","fixed").css("top","140px");
}

function novellabelCss(obj){
	var info="";
	var dt=document.getElementsByName(obj.name);
	for(var i=0;i<dt.length;i++){
		if(dt[i].id!=obj.id){
			dt[i].checked=false;
		}else{
			if(obj.checked==true||obj.checked=="checked"){
				obj.checked=false;
			}else{
				obj.checked=true;
			}
		}
	}
	if(obj.checked==true||obj.checked=="checked"){
		obj.checked=false;
	}else{
		obj.checked=true;
	}
	$(".novellabelCss").each(function(){
		if($(this)[0].checked==true){
			info+=$(this)[0].value+",";
		}
	});
	info=info==""?"":info.substring(0, info.length-1);
	$("#novelLabel").val(info);
}

function setColorFeiFa(){
	$.post(path+"/anzhiillegalchar/checkFeiFa.do",null,function(res){
		var json=eval('(' + res + ')'); 
		var chapterContent=$("#chapterContent").html();
		for(var i=0;i<json.data.length;i++){
			var tmp=json.data[i];
			chapterContent=chapterContent.replace(new RegExp(tmp.charName,"gm"),"<span style='color: red;font-weight: bold;'>"+tmp.charName+"</span>");
		}
		$("#chapterContent").html(chapterContent);
	});
}

function delCommentByAdmin(commondId,tableId,obj){
	if(confirm("您确定删除该记录吗?")){
		$(obj).slideToggle();
		$.jBox.tip("请等待，数据加载中...", 'loading');
		$.post(path+"/anzhicomment/delAnzhiCommentAdminByIndex.do",{
			anzhicommentId:commondId,
			tableId:tableId
		},function(res){
			if(res!='yes'){
				$(obj).slideToggle();
				$.jBox.closeTip();
			}else{
				window.location.reload();
			}
		});
	}
}

var pptHuanYipiDelay=8000;
var pptHuanYipiTimer;
function pptHuanYiPi(){
	getMoreHuanYiPi(pptHuanYiPiType+'3');
}

function loadNovelPartInfo(obj){
	var ids=obj.id;
	ids=ids.substring(0,ids.indexOf("novalImg"));
	var novelId=ids;
	$.post(path+"/anzhinovel/loadNovelInfo.do",{novelId:novelId},function(res){
		var json=res.data; 
		if(json.length==1){
			var tmp=json[0];
			$(obj).data("novelImg",tmp.novelImg).data("novelTitle",tmp.novelTitle).data("authorWriter",tmp.authorWriter).data("clickNum",tmp.clickNum).data("readNum",tmp.readNum).data("novelVote",tmp.novelVote).data("novelId",tmp.novelId);
			novelImg=tmp.novelImg;
			novelTitle=tmp.novelTitle;
			authorWriter=tmp.authorWriter;
			clickNum=tmp.clickNum;
			readNum=tmp.readNum;
			novelVote=tmp.novelVote;
			novelId=tmp.novelId;
			getBookBasicTimer=setTimeout("getBookBasicInfo()",400);
		}
	});
}
var feiFaCharArr=null;
function checkFeiFa(charContent){
	if(feiFaCharArr==null){
		$.post(path+"/anzhiillegalchar/checkFeiFa.do",null,function(res){
			var json=eval('(' + res + ')'); 
			feiFaCharArr=json.data;
			checkFeiFa(charContent);
		});
	}else{
		for(var i=0;i<feiFaCharArr.length;i++){
			var tmp=feiFaCharArr[i];
			if(charContent.indexOf(tmp.charName)!=-1){
				alert("出现违禁词："+tmp.charName+"。请修改后再发布");
				/*charContent=charContent.replace(tmp.charName,"<font style='color:red;'>"+tmp.charName+"</font>");
				$("#chapterContent").val("ddd");*/
				return false;
			}
		}
		return true;
	}
	
}

function loadLoginInfoCookie(){
	var uname=getCookie("uname");
	var upass=getCookie("upass");
	if(uname==null){
	
	}else{
		$("#uname").val(uname);
		$("#upass").val(upass);
	}
}

function updateFenJuan(chapterId,obj){
	if(confirm("您确定调卷吗？")){
		$(obj).slideToggle();
		$.post(path+"/anzhichapter/updateChapterFenJuan.do",{chapterId:chapterId,fenjuanId:obj.value},function(res){
			alert("调卷成功");
			getJspDataByUrl("anzhifenjuan/findAnzhiFenJuanAll.do#linenumber=11#novelId="+questNovelId+"#index=8#chooseIndex=1");
		});
	}
}

function benefit(novelId,vote,types,obj){
	if(confirm("您确定申请该福利吗？")){
		$(obj).slideToggle();
		$.post(path+"/anzhibenefit/applyAnzhiBenefit.do",{novelId:novelId,benefitType:types,applReason:vote,vote:vote},function(res){
			alert("申请成功");
		});
	}
}

function loadotherNovelList(novelType){
	$.post(path+"/anzhinovel/loadSameNovel.do",{novelType:novelType},function(res){
		$("#otherNovelList").html(res);
	});
}

QC.Login({
    //btnId：插入按钮的节点id，必选
    btnId:"qqLoginBtn",    
	    //用户需要确认的scope授权项，可选，默认all
	    scope:"all",
	    //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
	    size: "A_XL"
	}, function(reqData, opts){//登录成功
	    //根据返回数据，更换按钮显示状态方法
		try{
			if(loginSession==''){
				QC.Login.getMe(function(openId, accessToken){  
		        	$.post(path+"/anzhimember/qqloginAfter.do",{
		    	    	pid:openId,
		    	    	nickname:reqData.nickname,
		    	    	headImg:reqData.figureurl_qq_2,
		    	    	memberSex:reqData.gender,
		    	    	type:0
		    	    },function(res){
		    	    	if(res=="yes"){
		    	    		window.location.reload();
		    	    	}else{
		    	    		alert(res);
		    	    	}
		    	    });
		        });
			}
		}catch(e){}
		
	}, function(opts){//注销成功
	      
	}
);

function weiboLogin(reqData){
	try{
		if(loginSession==''){	
			if(WB2.checkLogin()){
				$.post(path+"/anzhimember/qqloginAfter.do",{
	    	    	pid:reqData.id,
	    	    	nickname:reqData.screen_name,
	    	    	headImg:reqData.avatar_hd,
	    	    	memberSex:reqData.gender,
	    	    	type:1
	    	    },function(res){
	    	    	if(res=="yes"){
	    	    		window.location.reload();
	    	    	}else{
	    	    		alert(res);
	    	    	}
	    	    });
			}
		}
	}catch(e){}
}

function outAnZhiSystem(){
	$.post(path+"/anzhi/adminOutSystem.do",null,function(res){
		var con=true;
		try{
			if(QC.Login.check()){
				con=false;
				QC.Login.signOut(function(){
					window.location.reload();
				});
			}
		}catch(e){
			
		}
		
		try{
			if(WB2.checkLogin()){
				con=false;
				WB2.logout(function(){
					window.location.reload();
				});
			}
		}catch(e){
			
		}
		
		if(con){
			window.location.reload();
		}
	});
}

function loadMobileJsp(){
	window.open(path+"/mobile.jsp");
}

//互动专区发布动态
function interactiveSend(formId,obj,memberId){
	if(memberId==''){
		showLoginNew();
		return;
	}
	ajaxFormSubmit(formId,obj);
}

function thirdRecommand(res){
	var json=eval('(' + res + ')'); 
	alert(json.mess);
}




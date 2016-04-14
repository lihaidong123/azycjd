$(function(){
	$(".bangdan_css div").click(function(){
		$(".bangdan_css div").css("background-color","#ededed");
		$(".bangdan_css div").css("background-image","none");
		$(this).css("background","url("+path+"/mobile/images/p_b.png) no-repeat #FFFFFF");
		
		var index=$(".bangdan_css div").index($(this));
		$(".bangdan_items").css("display","none");
		$($(".bangdan_items")[index]).css("display","block");
		$(window).scrollTop(0);
	});
	setMenuType();
});

function setMenuType(){
	var reg=/^\d{1}$/;
	if(reg.test(menuType)){
		$($(".menu_css div")[parseInt(menuType)]).css("border-bottom","#0099FF 3px solid");
	}
}

var isLoadData=true;
function ownScroller(){
	if(document.body.scrollTop>130){
		$("#fixed_div").css("top","0px");
	}else{
		$("#fixed_div").css("top",(130-document.body.scrollTop)+"px");
	}
	if((document.body.scrollTop+document.body.clientHeight)-$(document).height()>=0){
		if(isLoadData){
			isLoadData=false;
			var index=0;
			$(".bangdan_items").each(function(){
				if($(this).css("display")=="block"){
					return false;
				}
				index++;
			});
			if($($(".bangdan_items")[index]).data("this_div_load")=="no"){//不需要加载数据了
				isLoadData=true;
				return;
			}

			var url=$(".bangdan_items").length==12?"mobile/mBangDanFenYe.do":"mobile/m_shuku_fenye.do";
			var num=2;//默认第二页
			if($($(".bangdan_items")[index]).data("nowPageNum")!=undefined&&$($(".bangdan_items")[index]).data("nowPageNum")!=""){
				num=$($(".bangdan_items")[index]).data("nowPageNum");
			}
			$("#lodingData").slideToggle();
			$.post(path+"/"+url,{types:index+1,pageNum:num},function(res){
				num++;
				try{
					var tn=$(res).length-1;
					if(tn==0){
						$($(".bangdan_items")[index]).data("this_div_load","no");
					}else{
						$($(".bangdan_items")[index]).data("this_div_load","yes");
					}
				}catch(e){
					
				}
				$($(".bangdan_items")[index]).html($($(".bangdan_items")[index]).html()+res);
				$($(".bangdan_items")[index]).data("nowPageNum",num);
				$("#lodingData").slideToggle();
				isLoadData=true;
			});
		}
	}
}

function loadNovel(novelId){
	window.location.href=path+"/mobile/mChapterMenu.do?novelId="+novelId;
}

var isLogin=true;
function memberLogin(obj){
	if(!isLogin){
		return;
	}
	isLogin=false;
	if($("#uname").val()==""){
		alert("请输入登录账户");
		return;
	}
	if($("#upass").val()==""){
		alert("请输入登录密码");
		return;
	}
	obj.innerHTML="登录中...";
	$.post(path+"/anzhimember/login.do",{
		username:$("#uname").val(),
		userpass:$("#upass").val()
	},function(res){
		isLogin=true;
		if(res.indexOf("登录成功")==-1){
			alert(res);
			obj.innerHTML="登录";
		}else{
			SetCookie("uname",$("#uname").val());
			SetCookie("upass",$("#upass").val());
			window.location.href=path+"/mobile/user_center.jsp";
		}
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
				$("#qiandao_info").html("您今日已经签到！");
			}
		});
	}
}

function outSystemFn(){
	$.post(path+"/anzhi/adminOutSystem.do",null,function(res){
		window.location.href=path+"/mobile/m_index.do?menu_type=0";
	});
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

//保存评论
function saveComment(obj,novelId,memberId,commentFatherid,commentType){

	if(memberId==''){
		window.location.href=path+"/mobile/m_login.jsp";
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
			mobileModel:'yes'
		},function(res){
			if(res=="yes"){
				window.location.reload();
			}else{
				alert(res);
				obj.style.display="block";
			}
		});
	//}
}

//推荐作品、收藏小说
function multifunction(obj,memberId,novelId,actionType,novelTitle){
	if(memberId==''){
		window.location.href=path+"/mobile/m_login.jsp";
		return;
	}
	
	$.post(path+"/anzhinovelmultifunction/saveAnzhiNovelMultifunction.do",{novelId:novelId,actionType:actionType},function(res){
		if(res!="yes"){
			alert(res);
		}else{
			alert("收藏成功");//《"+novelTitle+"》作品
			obj.innerHTML="已收藏";
			obj.onclick=function(){return;}
		}
	});
}

function buyChapter(chapterId,memberId){
	if(memberId==''){
		window.location.href=path+"/mobile/m_login.jsp";
		return;
	}
	window.location.href=path+"/anzhichapter/loadBuyChapter.do?chapterId="+chapterId+"&&pageName=mobile/buyChapter";
}

function buyChapterAction(types,tableId,memberId,memberMoney,novelId){
 	if(tableId==undefined||memberId==undefined||types==undefined){
 		alert("当前页面加载异常！");
 		return;
 	}
 	if(memberId==""){
 		window.location.href=path+"/mobile/m_login.jsp";
 		return;
 	}
 	if(confirm("您确定操作吗?")){
 		$(".add_da_shang").each(function(){
 			$(this)[0].style.display="none";
 		});
 		$.post(path+"/anzhichaptersubscribe/buySignChapter.do",{
 			types:types,
 			tableId:tableId
 		},function(res){
			if(res=="yes"){
				window.location.href=path+"/mobile/readChapter.do?chapterId="+tableId+"&&novelId="+novelId;
			}else{
				alert(res);
			}
		});
 	}
 }
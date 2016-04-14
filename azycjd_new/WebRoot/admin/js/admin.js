var advTypeData=new Array("0,系统公告","1,读者公告","2,作家公告");
var novelStateTypeData=new Array("0,未发表","2,连载中","3,已完结");
var authorizationLevelTypeData=new Array("0,原创","1,连载");
var isSignedTypeData=new Array("0,未签约","1,已签约");
var isJinbiTypeData=new Array("0,未参加","1,已参加");
var isWangwenTypeData=new Array("0,未参加","1,已参加");
var actionsTypeData=new Array("0,未处理","1,已处理");
var isJiajingTypeData=new Array("0,未加精","1,已加精");
var isHotTypeData=new Array("0,未热帖","1,热帖");
var checkTypeData=new Array("0,待审核","1,已通过","3,已拒绝");
var tongTypeData=new Array("0,未通过","1,通过");
var checkTuiJianTypeData=new Array("0,未申请","2,待审核","1,已通过","3,已拒绝");
var postedWayTypeDta=new Array("0,独家");
var editorLevelTypeData=new Array("A级,A级","B级,B级","C级,C级","实习,实习");
var handleResultTypeData=new Array("1,通过","0,不通过");
var recommendPositionTypeData=new Array("01,玄幻奇幻幻灯片区","02,玄幻奇幻单本小说推荐区","03,玄幻奇幻换批推荐区","11,武侠仙侠幻灯片区","12,武侠仙侠单本小说推荐区","13,武侠仙侠换批推荐区","21,都市异能幻灯片区","22,都市异能单本小说推荐区","23,都市异能换批推荐区","31,历史军事幻灯片区","32,历史军事单本小说推荐区","33,历史军事换批推荐区","41,游戏竞技幻灯片区","42,游戏竞技单本小说推荐区","43,游戏竞技换批推荐区","51,科幻灵异幻灯片区","52,科幻灵异单本小说推荐区","53,科幻灵异换批推荐区","61,现代言情幻灯片区","62,现代言情单本小说推荐区","63,现代言情换批推荐区","71,古代言情幻灯片区","72,古代言情单本小说推荐区","73,古代言情换批推荐区","81,首页书库推荐","82,首页大神推荐","91,优惠书坊本周免费推荐区","92,优惠书坊限时免费推荐区","93,优惠书坊完本优惠推荐区","94,优惠书坊红文折扣区","101,完结推荐","111,大神推荐的作家的最热门作品","121,大神推荐的作家作品","131,手机编辑推荐");
var discountedTypeTypeData=new Array("0,本周免费","1,限时免费","2,完本优惠","3,红文折扣区");
var benefitTypeTypeData=new Array("0,上架申请以及上架福利申请","1,签约作品完结奖励","2,全勤奖","3,打赏奖","4,订阅奖","5,签约文、签约作者的新书福利","6,买断福利","7,平台签约","8,道具分成","9,精英奖","10,道具分成");
var jingyanTypeData=new Array("0,签到获得","1,每日动态","2,每日投票","4,每日订阅","5,每日收藏","6,每日评论","8,每日点赞","9,每日打赏100安之币","10,每日打赏1000安之币","11,每日打赏2500安之币","12,每日打赏5000安之币","13,每日打赏10000安之币","14,每日充值1元","15,每日充值5元","16,每日充值20元","17,每日充值50元");
var pictureTypeData=new Array("0,首页头部","1,首页排行榜","2,首页福利","3,首页推荐","4,合作渠道头部","5,编辑专区头部","6,版权维护头部","7,活动专区图片","8,用户指南头部","9,作者投稿头部","10,诚聘英才头部","11,联系我们头部","12,新闻公告头部","13,在线充值头部","14,作家福利");
var pictureStateTypeData=new Array("0,未启用","1,启用");
var fuliTypeData=new Array("签约福利,签约福利","全勤福利,全勤福利","完结奖励,完结奖励","绩效奖励,绩效奖励");
var stateTypeData=new Array("0,未启用","1,启用");
var interactiveTypeData=new Array("0,编辑区","1,公告区","2,版权维护区");
var thirdRecommandTypeData=new Array("0,UC","1,畅读书城","2,360","3,2345","4,爱书课","5,爱阅读","6,当当","7,豆丁网豆丁书房","8,书香云集","9,掌阅","10,苏宁阅读","11,塔读原创","12,网易","13,迅雷阅读","14,阅读星","15,醉蝶");
function showSelect(ids,names,selectValue,values,divId,fieldsName,writeCon,widthCon,url){
	if(values==undefined){
		$.post(path+"/"+url,null,function(res){
			if(names=="secondUserId"){
				userIdJianZhiData=res.split(";");
				showSelect(ids,names,selectValue,userIdJianZhiData,divId,fieldsName,writeCon,widthCon);
			}
		});
		return;
	}
	var widths=widthCon;
	if(writeCon){
		widths=160;
	}
	widths=210;
	if(ids=="discountedType"){
		var selectS=fieldsName+"<select  class=\"txt\" style=\"width:"+widths+"px;\" name='"+names+"' size=\"1\" id='"+ids+"' onchange='changeTimeText()'>";
	}else{
		var selectS=fieldsName+"<select  class=\"txt\" style=\"width:"+widths+"px;\" name='"+names+"' size=\"1\" id='"+ids+"'>";
	}
	if(writeCon){
		selectS=fieldsName+"<select  class=\"txt\" style=\"width:120px;\" name='"+names+"' size=\"1\" id='"+ids+"'>";
		selectS+="<option value=''>全部</option>";
	}

	for(var i=0;i<values.length;i++){
		var tempValue=values[i];
		if(tempValue==""){
			continue;
		}
		var tempArr=tempValue.split(",");
		if(selectValue==tempArr[0]){
			selectS+="<option value='"+tempArr[0]+"' selected='selected'>"+tempArr[1]+"</option>";
		}else{
			selectS+="<option value='"+tempArr[0]+"'>"+tempArr[1]+"</option>";
		}
	}
	selectS+="</select>";
	try{
		document.getElementById(divId).innerHTML=selectS;
	}catch(e){}
	
}

function createHtml(obj){
	if(confirm("您确定生成静态网站公告页面吗？")){
		$.jBox.tip("请等待，生成静态网站公告中...", 'loading');
		$.post(path+"/anzhinews/crateNewsHtml.do",null,function(res){
			$.jBox.closeTip();
			alert(res);
		});
	}
}

var arr=new Array("0,书库","1,玄幻·奇幻","2,武侠·仙侠","3,都市·异能","4,历史·军事","5,游戏·竞技","6,科幻·灵异","7,现代言情","8,古代言情","9,排行榜","10,优惠书坊","11,限时免费","12,完本优惠","13,红文折扣区");
function createNovelDataAll(obj){
	createData(0,false);
}

function createData(arr_index,con){//con--true：是所有 false--不需要
	var ds=arr[arr_index].split(",");
	$.jBox.tip("请等待，生成【"+ds[1]+"】中...", 'loading');
	$.post(path+"/util/createData.do",{createType:arr_index},function(res){
		if(con){
			if(res=="yes"){
				var next_index=arr_index++;
				if(next_index<arr.length){
					createData(next_index,con);
				}else{
					$.jBox.closeTip();
				}
			}else{
				$.jBox.closeTip();
				alert(res);
			}
		}else{
			$.jBox.closeTip();
		}
	});
}

function addtuijianxiaoshuo(){
	var a="<div style='margin-left:-15px;'>";
	a+="<font class='textTitleCss'>推荐编号：</font><input type='text' class='txt' name='novelId' id='novelId' style='width:80px;' onblur='checkFindNovelByIds(this,1)' alt='[0-9]{1,};推荐编号输入错误'/>";
	a+="<font class='textTitleCss'>&nbsp;小说名称：</font><input type='text' class='txt' name='novelTitle' id='novelTitle'  alt='' onblur='checkFindNovelByName(this,1)'/>";
	a+="<font class='textTitleCss'>&nbsp;小说作者：</font><input type='text' class='txt' name='authorwritername' id='authorwritername'  alt='.+;请输入正确的查询数据' readOnly='readOnly'/>";
	a+="<a class='textTitleCss' style='cursor:pointer;' onclick='removetuijianxiaoshuo(this)'>&nbsp;删除</a>";
	a+="</div>";
	//var neirong=$(".yaojiadetuijian").html();
	$(a).appendTo(".tuijiandeaddress");
}

function addtuijianxiaoshuoer(){
	var a="<div style='margin-left:-15px;'>";
	a+="<font class='textTitleCss'>推荐编号：</font><input type='text' class='txt' name='novelId' id='novelId' style='width:80px;' onblur='checkFindNovelByIds(this,2)' alt='[0-9]{1,};推荐编号输入错误'/>";
	a+="<font class='textTitleCss'>&nbsp;小说名称：</font><input type='text' class='txt' name='novelTitle' id='novelTitle'  alt='' onblur='checkFindNovelByName(this,2)'/>";
	a+="<font class='textTitleCss'>&nbsp;小说作者：</font><input type='text' class='txt' name='authorwritername' id='authorwritername'  alt='.+;请输入正确的查询数据' readOnly='readOnly'/>";
	a+="<a class='textTitleCss' style='cursor:pointer;' onclick='removetuijianxiaoshuo(this)'>&nbsp;删除</a>";
	a+="</div>";
	//var neirong=$(".yaojiadetuijian").html();
	$(a).appendTo(".tuijiandeaddress");
}

function removetuijianxiaoshuo(obj){
	var neirong=$(obj)[0].parentNode;
	$(neirong).remove();
}

//推荐小说编号查找小说
function checkFindNovelByIds(obj,type){
	var novelId=$(obj).val();
	if(novelId==""){
		 alert("请输入有效的推荐编号");
		 return;
	}else{
	$.post("anzhinovel/findAnzhiNovelByIdTuijian.do",{
			novelId:novelId,
			type:type
		},function(res){
		if(res==0){
			alert("该小说不存在");
		}else if(res==2){
			alert("该小说已参加其他优惠");
		}else{
			var a=res.split(";");
			$(obj).parent().children("#novelTitle").val(a[1]);
			$(obj).parent().children("#authorwritername").val(a[2]);
		}
	});
	}
}

/**
 * 生成排行榜、优惠书坊
 * @param obj
 * @param url
 * @param htmlName
 * @returns
 */
var needCreateArray=new Array("anzhinovel/leaderboard.do?loadData=yes,paihangbang,排行榜","anzhinovel/youhuishufang.do,yhsf,优惠书坊","anzhinovel/recommand.do?menutype=0,xhqh,玄幻奇幻","anzhinovel/recommand.do?menutype=1,wxxx,武侠仙侠","anzhinovel/recommand.do?menutype=2,dsyn,都市异能","anzhinovel/recommand.do?menutype=3,lsjs,历史军事","anzhinovel/recommand.do?menutype=4,yxjj,游戏竞技","anzhinovel/recommand.do?menutype=5,khly,科幻灵异","anzhinovel/recommand.do?menutype=6,xdyq,现代言情","anzhinovel/recommand.do?menutype=7,gdyq,古代言情","anzhinovel/index.do,index,网站首页");
var createIndex=0;
function createHtmlNovel(){
	if(createIndex==needCreateArray.length){
		$.jBox.closeTip();
		createIndex=0;
		return;
	}
	var tmp=needCreateArray[createIndex].split(",");
	$.jBox.tip("["+tmp[2]+"]数据生成中...", 'loading');
	if(createIndex<needCreateArray.length){
		$.post(path+"/"+tmp[0],null,function(res){
			$.post(path+"/anzhinovel/createHtml.do",{data:res,htmlName:tmp[1]},function(){
				createIndex++;
				createHtmlNovel();
			});
		});
	}
}
//优惠书坊的时间空间的调整
function changeTimeText(){
	var type=$("#discountedType").val();
	var discountedRebate=$("#discountedRebate")[0];
	var zhouridate=$("#zhouridate");
	var zhengchangdate=$("#zhengchangdate");
	if(type==0){
		discountedRebate.readOnly=true;
		zhengchangdate.css("display","none");
		zhouridate.css("display","block");
		$(discountedRebate).css("background-color","#eaeaea");
	}else if(type==1){
		discountedRebate.readOnly=true;
		zhengchangdate.css("display","block");
		zhouridate.css("display","none");
		$(discountedRebate).css("background-color","#eaeaea");
	}else if(type==2){
		discountedRebate.readOnly=false;
		zhengchangdate.css("display","block");
		zhouridate.css("display","none");
		$(discountedRebate).css("background-color","#fff");
	}else if(type==3){
		discountedRebate.readOnly=false;
		zhengchangdate.css("display","block");
		zhouridate.css("display","none");
		$(discountedRebate).css("background-color","#fff");
	}
}
//或去当前周的最后一天，周日
var now = new Date(); //当前日期 
var nowDayOfWeek = now.getDay(); //今天本周的第几天 
var nowDay = now.getDate(); //当前日 
var nowMonth = now.getMonth(); //当前月 
var nowYear = now.getYear(); //当前年 
nowYear += (nowYear < 2000) ? 1900 : 0; // 

var lastMonthDate = new Date(); //上月日期 
lastMonthDate.setDate(1); 
lastMonthDate.setMonth(lastMonthDate.getMonth()-1); 
var lastYear = lastMonthDate.getYear(); 
var lastMonth = lastMonthDate.getMonth(); 

//格局化日期：yyyy-MM-dd 
function formatDate(date) { 
	var myyear = date.getFullYear(); 
	var mymonth = date.getMonth()+1; 
	var myweekday = date.getDate(); 
	
	if(mymonth < 10){ 
	mymonth = "0" + mymonth; 
	} 
	if(myweekday < 10){ 
	myweekday = "0" + myweekday; 
	} 
	return (myyear+"-"+mymonth + "-" + myweekday +" "+ "10:00:00"); 
	} 

function getWeekEndDate() { 
	var weekEndDate = new Date(nowYear, nowMonth, nowDay + (1 - nowDayOfWeek+7)); 
	$("#discountedEndDate").val(formatDate(weekEndDate));
	return formatDate(weekEndDate);
} 

//设置事件处理的id集合
var handleResultTableIdArray=new Array();
var handleResultType="";
function addHandeResultLoadTableId(tableId,resultType){
	handleResultTableIdArray[handleResultTableIdArray.length]=tableId;
	handleResultType=resultType;
}

//去加载集合
function loadHandleResult(){
	if(handleResultTableIdArray.length!=0&&handleResultType!=""){
		var inf="";
		for(var i=0;i<handleResultTableIdArray.length;i++){
			inf+=handleResultTableIdArray[i]+",";
		}
		if(inf==""){
			return;
		}
		inf=inf.substring(0,inf.length-1);
		$.post(path+"/anzhihandle/getHandleResult.do",{tableId:inf,handleResultType:handleResultType},function(res){
			var json=eval('(' + res + ')'); 
			for(var i=0;i<json.datahand.length;i++){
				var tmp=json.datahand[i];
				var t="<div class='handle_result_item'>";
				var dt=new Date((tmp.addTime.time));
				var dates=dt.getFullYear()+"/"+(dt.getMonth()+1)+"/"+(dt.getDate())+" "+dt.getHours()+":"+dt.getMinutes();
				if(tmp.handleType==15){
					t+="<div class='"+(tmp.handleResult==1?"passOK":"passNo")+"'><span class='hand_title_css'>[加精]处理结果:</span>"+(tmp.handleResult==0?"不通过":"通过")+"<span class='hand_time_csss'>处理时间:"+dates+"</span></div>";
				}else if(tmp.handleType==16){
					t+="<div class='"+(tmp.handleResult==1?"passOK":"passNo")+"'><span class='hand_title_css'>[热帖]处理结果:</span>"+(tmp.handleResult==0?"不通过":"通过")+"<span class='hand_time_csss'>处理时间:"+dates+"</span></div>";
				}else{
					t+="<div class='"+(tmp.handleResult==1?"passOK":"passNo")+"'><span class='hand_title_css'>处理结果:</span>"+(tmp.handleResult==0?"不通过":"通过")+"<span class='hand_time_csss'>处理时间:"+dates+"</span></div>";
				}
				t+="<div><span class='hand_title_css'>处理说明:</span>"+(tmp.handleVote)+"</div>";
				if(tmp.addMemberId==''||tmp.addMemberId=='null'||tmp.addMemberId=='0'||tmp.addMemberId==0){
					t+="<div><span class='hand_title_css'>处理人员:</span>[网编处理]</div>";
				}else{
					t+="<div><span class='hand_title_css'>处理人员:</span>"+(tmp.memberNick)+";</div>";
				}
				
				t+="</div>";
				$("#handle_result"+tmp.tableId).html($("#handle_result"+tmp.tableId).html()+t);
			}
		});
	}
}

function jieyue(obj,id,novelTitle){
	if(confirm("您确定与["+novelTitle+"]解约吗?")){
		$.post(path+"/anzhinovel/noSigned.do",{novelId:id},function(){
			alert("解约成功！");
		});
	}
}

function checkFindNovelByName(obj,type){
	var noveltitle=$(obj).val();
	if(noveltitle==""){
		 alert("请输入有效的小说名称");
		 return;
	}else{
		$.post("anzhinovel/findAnzhiNovelByName.do",{
				novelTitle:noveltitle,
				type:type
			},function(res){
			if(res==0){
				alert("该小说不存在");
			}else if(res==2){
				alert("该小说已参加其他优惠");
			}else if(res==3){
				alert("该小说名称重复，请输入小说编号查找");
			}else{
				var a=res.split(";");
				$(obj).parent().children("#novelId").val(a[1]);
				$(obj).parent().children("#authorwritername").val(a[2]);
			}
		});
	}
}

function adminjiav(obj){
	var indexNow=$("input[name='jiavip']").index($(obj));
	for(var i=indexNow;i<$("input[name='jiavip']").length;i++){
		if($("input[name='jiavip']")[i].id==obj.id){
			if(obj.checked==true){
				obj.checked=false;
			}else{
				obj.checked=true;
			}
		}else{
			$("input[name='jiavip']")[i].checked=true;
		}
		
	}
	if(obj.checked==true){
		obj.checked=false;
	}else{
		obj.checked=true;
	}
}

function setChapterVip(obj,novelId){
	var ids="";
	for(var i=0;i<$("input[name='jiavip']").length;i++){
		if($("input[name='jiavip']")[i].checked==true){
			ids+=$("input[name='jiavip']")[i].value+"@";
		}
	}
	if(ids==""){
		alert("您还没有选择一章呢");
		return;
	}
	ids=ids.substring(0,ids.length-1);
	if(confirm("您确定为选中的章节加V吗?")){
		$(obj).slideToggle();
		$.post(path+"/anzhichapter/setChapterVip.do",{ids:ids,novelId:novelId},function(res){
			alert(res);
		});
	}
}

function getNovelInfo(obj){
	if(obj.id=="novelNo"){
		var reg=/^2\d{4}$/;
		if(reg.test(obj.value)){
			$.post(path+"/anzhinovel/getNovelInfo.do",{novelId:obj.value},function(res){
				var json=eval('(' + res + ')');
				if(json.success=="no"){
					$("#novelName").val("");
					$("#authorName").val("");
					$("#novelId").val("0");
				}else{
					$("#novelName").val(json.novelTitle);
					$("#authorName").val(json.authorName);
					$("#novelId").val(json.novelId);
				}
			});
		}else{
			$("#novelName").val("");
			$("#authorName").val("");
			$("#novelId").val("0");
		}
	}else if(obj.id=="novelName"&&obj.value!=''){
		$.post(path+"/anzhinovel/getNovelInfo.do",{novelTitle:obj.value},function(res){
			var json=eval('(' + res + ')');
			if(json.success=="no"){
				$("#novelNo").val("");
				$("#authorName").val("");
				$("#novelId").val("0");
			}else{
				$("#novelNo").val(json.novelNo);
				$("#authorName").val(json.authorName);
				$("#novelId").val(json.novelId);
			}
		});
	}
}

function goodsChange(goodsId,goodsName){
	if(confirm("您确定兑换["+goodsName+"]物品吗?")){
		$(".goodsChangeCss").each(function(){
			$(this)[0].style.visibility="hidden";
		});
		$.post(path+"/anzhiwebeditorgoodschange/goodsChange.do",{goodsId:goodsId},function(res){
			alert(res);
			if(res.indexOf("成功")==-1){
				$(".goodsChangeCss").each(function(){
					$(this)[0].style.visibility="visible";
				});
			}
		});
	}
}

function goodsDeatil(goodsId,title){
	$.jBox("iframe:"+path+"/anzhiwebeditorgoods/goodsDetail.do?anzhiwebeditorgoodsId="+goodsId, {
		title: "<div style='font-size:14px;'>"+title+"</div>",
		width: 860,
		height: 400,
		top:90,
		persistent: false,
		buttons: { '关闭': true },
		closed:function(){
			$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
		}
	});	
}

function qiandao(obj){
	$(obj).slideToggle();
	$.post(path+"/anzhiwebeditorsign/qiandao.do",null,function(res){
		alert(res);
	});
}

function searchNovelByTitle(){
	var iuthor='no';
	try{
		if(includeAuthor){
			iuthor=includeAuthor;
		}
	}catch(e){
		
	}

	if($("#novelSearchTitle").val()!=""){
		$.post(path+"/anzhinovel/searchNovelData.do",{novelTitle:$("#novelSearchTitle").val(),includeAuthor:iuthor},function(res){
			$("#searchNovelData").html(res);
			$("#novelId").val("");
		});
	}
}


function chooseSearchNovel(){
	var novelIdCheckBox=document.getElementsByName("novelIdCheckBox");
	var info="";
	for(var i=0;i<novelIdCheckBox.length;i++){
		if(novelIdCheckBox[i].checked==true){
			info+=novelIdCheckBox[i].value+",";
		}
	}
	info=info==""?"":info.substring(0, info.length-1);
	$("#novelId").val(info);
}

function updateTuiJian(types,state,obj,id){
	if(confirm("您确定执行操作吗?")){
		$(obj).parent().children(".tuijiancss").each(function(){
			$(this).slideToggle();
		});
		$.post(path+"/anzhiwebeditortuijian/updateTuiJian.do",{types:types,state:state,id:id},function(res){
			alert(res);
		});
	}
}

function updateRecord(types,state,obj,id,novelId){
	if(confirm("您确定执行操作吗?")){
		$(obj).parent().children(".tuijiancss").each(function(){
			$(this).slideToggle();
		});
		obj.style.display="none";
		$.post(path+"/util/updateRecord.do",{types:types,state:state,tableId:id,novelId:novelId},function(res){
			alert(res);
		});
	}
}

function setDefault(editorId,id){
	if(confirm("您确定设定为默认的吗?")){
		$.post(path+"/anzhiwebeditormessage/setDefault.do",{editorId:editorId,id:id},function(){
			$(".setDefaultCss").each(function(){
				$(this).slideUp();
			});
		});
	}
}

function updateApply(obj,id){
	if(confirm("您确定通过审核吗?")){
		$(obj).slideUp();
		$.post(path+"/anzhiwebeditorapply/updateApplyState.do",{id:id},function(res){
			alert(res);
		});
	}
}

function cuigenga(obj,id){
	if(confirm("您确定通过催更吗?")){
		$(obj).slideUp();
		$.post(path+"/anzhiwebeditormessage/cuigeng.do",{id:id},function(res){
			alert(res);
		});
	}
}

function adminCheck(id,title,types){
	$.jBox("iframe:"+path+"/admin/adminCheck.jsp?tableId="+id+"&&types="+types, {
		title: "<div style='font-size:14px;'>"+title+"---审核</div>",
		width: 550,
		height: 300,
		top:90,
		persistent: false,
		buttons: { '关闭': true },
		closed:function(){
			try{
				$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
			}catch(ex){}
		}
	});	
}

function resetMemberPass(nick,memberId,obj){
	if(confirm("您确定将["+nick+"]的密码重置吗?")){
		$(obj).slideToggle();
		$.post(path+"/anzhimember/resetpass.do",{id:memberId},function(res){
			alert(res);
		});
	}
}


function mem_type_fn(){
	$("#author_list_div li").each(function(){
		var t=$(this)[0].id.split("@");
		if($("#mem_type").val()=="0"){
			if(t[0]=="0"){
				$(this).css("display","block");
			}else{
				$(this).css("display","none");
			}
		}else if($("#mem_type").val()=="1"){
			if(t[0]=="1"){
				if($("#sign_book_type").val()=="2"){
					$(this).css("display","block");
				}else if($("#sign_book_type").val()=="0"){
					if(t[1]!="0"){
						$(this).css("display","block");
					}else{
						$(this).css("display","none");
					}
				}else if($("#sign_book_type").val()=="1"){
					if(t[1]!="0"){
						$(this).css("display","none");
					}else{
						$(this).css("display","block");
					}
				}
			}else{
				$(this).css("display","none");
			}
		}else{
			$(this).css("display","block");
		}
	});
}

function updateChapterReadType(chapterId,obj){
	if(confirm("您确定取消该章节的加V吗？")){
		$(obj).slideToggle();
		$.post(path+"/anzhichapter/updateChapterReadType.do",{chapterId:chapterId},function(res){
			alert("取消成功");
		});
	}
}

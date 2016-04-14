<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("contextPath", path);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>（四十三）鱼翔浅底祝生辰 巧做蛋糕乐融融</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/azycjs.css"/>
	<script language="javascript">var path='<%=request.getContextPath()%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var readAddress='${param.readAddress}';</script>
	
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/jquery.color.js"></script>
	<script language="javascript" src="<%=request.getContextPath()%>/js/azycjd.js"></script>
	<script language="javascript">readJsp=true;</script>
	<!--jbox-->
	<link id="skin" rel="stylesheet" href="<%=path %>/js/jBox/Skins/Blue/jbox.css" />
	<script type="text/javascript" src="<%=path %>/js/jBox/jquery.jBox-2.3.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jBox/i18n/jquery.jBox-zh-CN.js"></script>
	<script language="javascript">var path='<%=path%>';</script>
	<script language="javascript">var memberId='${loginUsers.id}';</script>
	<script language="javascript">var novelId='15670';</script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/index/css/index.css"/>
	<script language="javascript" src="<%=path %>/js/azycjd.js"></script>
	<style type="text/css">
		img{border: none;}	
	</style>
	<!--[if lte IE 7]>
		<div id="browseTips" style="width:830px;background-color:#FFFFFF; margin:0 auto; margin-top:40px;margin-bottom:20px;line-height:23px;">
			我们发现您使用的IE浏览器版本距离现在已经很遥远了。为了更好的体验本系统，我们建议您升级浏览器。您可以选择：<br />
 			<a target="_blank" href="http://rj.baidu.com/soft/detail/14917.html?ald">IE10</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/11843.html?ald">火狐浏览器</a>|<a target="_blank" href="http://rj.baidu.com/soft/detail/14744.html?ald">谷歌浏览器</a>|<a href="javascript:closeBrowseTip()">关闭</a>
		</div>
 		
	<![endif]-->
	<script type="text/javascript">
		var timer;
	    $(function(){
	        $(window).scroll(function(){
	            clearInterval(timer);
	            var topScroll=getScroll();
	            var topDiv="80px";
	            var top=topScroll+parseInt(topDiv);
	            timer=setInterval(function(){
	                $(".read_ds").animate({"top":top},0);
	                $(".read_left_menu").animate({"top":top},0);
	            },0)
	        });
	        
	        $(".huanfu div").click(function(){
	        	var t=$(this)[0].id.split("@");
	        	$("#novel_content").css("color","#"+t[1]).css("background-color","#"+t[0]);
	        });
	        
	        $(".replyContent").each(function(){
				$(this).slideToggle("fast");
			});
			
			$(document).bind("contextmenu",function(e){   
            	return false;   
		    });
		    $(document).bind("mousedown",function(e){   
		        if(e.which==1||e.which==3){
	        	  return false;    	
		        }
		    });
		    
		    $("#zitidiv li").click(function(){
		    	var tds=$(this)[0].id;
		    	tds=tds.substring(8,tds.length);
		    	$("#novel_content").css("font-size",tds+"px");
		    	$("#zitidivparent").html("字体["+tds+"号]");
		    	SetCookie("novel_font_size",tds);
		    	$("#zitidiv").slideUp('fast');
		    });
		    $("#beijingdiv li").click(function(){
		    	$("#novel_content").css("background-color","#"+$(this)[0].id);
		    	$("#beijingdivparent").html("背景["+$(this).html()+"]");
		    	SetCookie("novel_bg_color",$(this)[0].id);
		    	SetCookie("novel_bg_color_name",$(this).html());
		    	$("#beijingdiv").slideUp('fast');
		    });
		    var novel_font_size=getCookie("novel_font_size");
		    if(novel_font_size!=null&&novel_font_size!=undefined){
		    	$("#novel_content").css("font-size",novel_font_size+"px");
		    	$("#zitidivparent").html("字体["+novel_font_size+"号]");
		    }
		    var novel_bg_color=getCookie("novel_bg_color");
		    var novel_bg_color_name=getCookie("novel_bg_color_name");
		    if(novel_bg_color!=null&&novel_bg_color!=undefined){
		    	$("#novel_content").css("background-color","#"+novel_bg_color);
		    	$("#beijingdivparent").html("背景["+novel_bg_color_name+"]");
		    }
		    
		    if(readAddress!=''){
		    	($(window).scrollTop(parseInt(readAddress)));
		    }
		    
		    window.onkeydown=function(e){
				if(e.keyCode==39){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351956&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351956&&novelId=15670";
				}else if(e.keyCode==67){
					return false;
				}else if(e.keyCode==17){
					return false;
				}else if(e.keyCode==123){
					return false;
				}else if(e.keyCode==86){
					return false;
				}else if(e.keyCode==65){
					return false;
				}else if(e.keyCode==83){
					return false;
				}else if(e.keyCode==13){
					window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp';
				}
			}
		    
	    });
	    function getScroll(){
             var bodyTop = 0;  
             if (typeof window.pageYOffset != 'undefined') {  
                     bodyTop = window.pageYOffset;  
             } else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {  
                     bodyTop = document.documentElement.scrollTop;  
             }  
             else if (typeof document.body != 'undefined') {  
                     bodyTop = document.body.scrollTop;  
             }  
             return bodyTop;
	    }
	    function loadReportReasonJsp(){
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351956+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十三）鱼翔浅底祝生辰 巧做蛋糕乐融融]</div>",
				width: 860,
				height: 600,
				top:90,
				buttons: { '关闭': true },
				closed:function(){
					$("#body_index").css("background-color","#f0f0f0").css("padding","0px").css("margin","0px");
				}
			});	
		}
		
		function changeFontSize(num){
			var n=parseInt($("#novel_content").css("font-size"));
			n+=num;
			$("#novel_content").css("font-size",n+"px");
		}
		
		function huanfu(){
			$("#huanfu").slideToggle();
		}

		function showMulv(){
			if($("#mulvdiv")[0].style.display==""||$("#mulvdiv")[0].style.display=="none"){
				$("#mulvdiv")[0].style.display="block";
				$("#mulvdiv").animate({marginLeft:'30px'});
			}else{
				$("#mulvdiv")[0].style.display="none";
				
				$("#mulvdiv").css("margin-left","0px");
			}
		}

	</script>
  </head>
  
  <body id="body_index" style="padding:0px; margin:0px;background: center 0px no-repeat #f0f0f0;">
  	 <c:if test="${readFlag eq 'no' }">
  	 	<div class="no_read_flag_css">
  	 		该章节是VIP章节。
  	 		${errorInfo }
  	 		<a href="javascript:;" onclick="buyChapter('351956')">购买</a>
  	 	</div>
  	 </c:if>
  	 <c:if test="${readFlag eq 'yes' }">
	    <div class="read_top">
	    	<div class="huanfu" id="huanfu">
	     		<div id="f7f5ed@292927" style="background-color: #f7f5ed"></div>
	     		<div id="e1e8b2@292927" style="background-color: #e1e8b2"></div>
	     		<div id="bdebe1@292927" style="background-color: #bdebe1"></div>
	     		<div id="cfd5bb@292927" style="background-color: #cfd5bb"></div>
	     		<div id="ebd1de@292927" style="background-color: #ebd1de"></div>
	     		<div id="bfe1c6@292927" style="background-color: #bfe1c6"></div>
	     	</div>
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670.jsp'">公子，请上钩</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:官秋月</div>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="zitidivparent" style="background:url(<%=request.getContextPath()%>/images/9_p_3.png) no-repeat 20px 14px;" onclick="$('#zitidiv').slideToggle('fast');">字体[12号]</div>
	    			<ul id="zitidiv">
	    				<li style="font-size: 12px;" id="fontSize12">安之<span>12号</span></li>
	    				<li style="font-size: 14px;" id="fontSize14">安之<span>14号</span></li>
	    				<li style="font-size: 16px;" id="fontSize16">安之<span>16号</span></li>
	    				<li style="font-size: 18px;" id="fontSize18">安之<span>18号</span></li>
	    				<li style="font-size: 20px;" id="fontSize20">安之<span>20号</span></li>
	    				<li style="font-size: 22px;" id="fontSize22">安之<span>22号</span></li>
	    			</ul>
	    		</div>
	    		<div class="novel_info_read_div">
	    			<div id="beijingdivparent" style="background:url(<%=request.getContextPath()%>/images/10_p_1.png) no-repeat 15px 11px;" onclick="$('#beijingdiv').slideToggle('fast');">背景[默认(白)]</div>
	    			<ul id="beijingdiv">
	    				<li style="background-color: #ffffff;" id="ffffff">默认(白)</li>
	    				<li style="background-color: #e1e8b2;" id="e1e8b2">浅绿</li>
	    				<li style="background-color: #bdebe1;" id="bdebe1">浅蓝</li>
	    				<li style="background-color: #cfd5bb;" id="cfd5bb">浅灰</li>
	    				<li style="background-color: #ebd1de;" id="ebd1de">小粉</li>
	    				<li style="background-color: #bfe1c6;" id="bfe1c6">青色</li>
	    			</ul>
	    		</div>
	    	</div>
	    </div>
	    <div class="read_content">
	    	<div class="read_content_left">
	    		<div class="read_left_menu" id="read_left_menu">
	    			<!-- <div id="mulvdiv">
	    				novel_chapter.chapter.menu
	    			</div>
	    			<p><a href="javascript:showMulv()">目录</a></p> -->
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351956 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351956,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第44章&nbsp;&nbsp;&nbsp;（四十三）鱼翔浅底祝生辰 巧做蛋糕乐融融
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“这次风岛主既然邀请了顾王，那么代表别的国家的皇亲贵族也会前来，自然，说不定南苧太子宫雪也会权衡利害而来的。”书绘音看着南宁淡淡道。<p class='chapter_content_read_css'>  南宁抿了一下嘴，犹豫道：“你说，宫雪他到底是什么身份？他到底和南宫是不是一个人？”<p class='chapter_content_read_css'>  “你若信他，他便就是他。”书绘音淡淡撇下一句，紧接着抽出腰间的笛子挑起车窗帘，一道紫影转瞬即逝，“那你就自己去问问他。”<p class='chapter_content_read_css'>  不知道什么时候清醒过来的琴霜七忽然跳到了窗户边，将半个身子都探了出去，南宁担忧的从后面搂紧她的腰。<p class='chapter_content_read_css'>  琴霜七使劲挥动着手臂，冲前面大喊道：“南宫！南宫！”<p class='chapter_content_read_css'>  马背上的紫色身影骤然勒住缰绳停在原地，向后回望。<p class='chapter_content_read_css'>  “七七姑娘？”<p class='chapter_content_read_css'>  马车也很快停下来，几人也恰好到了渡口，渡口的早班客船还未起航出海。<p class='chapter_content_read_css'>  渡口也聚集了许多人，都三三两两的聚在一起闲聊。<p class='chapter_content_read_css'>  琴霜七“嗖”的一下窜下了马车，南宫宁雪翻身下马，牵着马缰绳向他们走近。琴霜七毫不客气的上爪拍拍南宫宁雪的胳膊算是见面礼。<p class='chapter_content_read_css'>  “既然七七姑娘在此，那么秦姑娘也一定在了。”南宫宁雪看向马车，正看见南宁的手指隐于车窗帘下，随即就看见了小心翼翼下了马车的南宁，紧随其后的便是书绘音。<p class='chapter_content_read_css'>  琴霜七很是眼尖的发现了南宫宁雪的视线在书绘音脸上停留了良久，她以她一颗纯正的腐女心稍稍窃喜一下，很是正经的咳了几声。南宫宁雪的目光瞬时从书绘音身上收回来。<p class='chapter_content_read_css'>  “南宫你这是要去哪儿啊？怎么就你一个人？衣蓝呢？”<p class='chapter_content_read_css'>  “在下是要前往风铃岛，”南宫宁雪说着将怀里的船票和请柬拿出来，金闪闪的滚金边闪了一下琴霜七的眼，“至于衣蓝，府中还有要事，他要替在下留在府中打理。”<p class='chapter_content_read_css'>  “没想到这个风岛主邀请的人还真广，”琴霜七扫了一下等在渡口的人们，哪个不是华袍锦衣非富即贵，“他这到底是想给女儿办及笄礼啊，还是想招个金龟婿啊？”<p class='chapter_content_read_css'>  南宫宁雪闻言一笑，“说不定这两样全都有呢。只是，你们？怎么顾王爷没有来？”<p class='chapter_content_read_css'>  “啊——顾王爷说什么有事不能去，就让南宁代他去，南宁自己又不愿意来，正好有三张船票我和书绘音就跟着来了，”琴霜七忽然惊呼一声，惹得不少人看向她，但她自己却对这些目光不管不顾，“去参加及笄礼不就是成人礼？那我们还要送礼物啊，可是我们除了行李什么都没带啊？怎么办啊——”<p class='chapter_content_read_css'>  “不是啊，”南宁赶忙制止她安抚她，想了想道，“昨日临近傍晚的时候，顾大哥就让化叔准备好礼品用货船给托运到孚城岛去了，好像是要再送上风家的船队，今日傍晚就该到风铃岛了。”<p class='chapter_content_read_css'>  话音刚落，就听到渡口开放的号声，洪亮又绵长。<p class='chapter_content_read_css'>  南宁晃了一下神，赶忙回神道：“我们也赶快上船吧。”<p class='chapter_content_read_css'>  几人拿着船票与行李匆匆上船，南宫宁雪的马儿就寄养在渡口，等到午时就会有人带马回府。<p class='chapter_content_read_css'>  “哎呀！”南宁被后面的紫衣公子给撞了一下，身形不稳，整个人倚在了南宫宁雪身上。<p class='chapter_content_read_css'>  “抱歉。”那公子有一双丹凤眼，目光轻浮的一扫南宁，道歉的声音有些戏谑，瞥了南宫宁雪一眼，走上船去。<p class='chapter_content_read_css'>  “什么人啊？”琴霜七赶忙看看南宁，不满地嘟囔着，“真没礼貌。”<p class='chapter_content_read_css'>  “好了，快走吧。”南宁牵过琴霜七的手，一笑，大步向前走去。<p class='chapter_content_read_css'>  南宫宁雪却抿了抿唇，那个人，他认得。<p class='chapter_content_read_css'>  他一抬头就看见书绘音若有所思的看着自己。<p class='chapter_content_read_css'>  客船一共分为三层，一二层是客房，第三层是用膳厅，每一层都有可以观望江水两岸的观望台，一上船琴霜七就兴奋地拉着南宁在每一层的观望台乱窜。<p class='chapter_content_read_css'>  “哇！好舒服！”江上的视野更为开阔，放眼望去便是滚滚江水，清爽的凉风吹拂在人身上让人格外舒服。<p class='chapter_content_read_css'>  “虽然还要三天才能看见大海，不过这条江也真够漂亮了，不跟黄河似的，半杯清水半杯沙啊。”琴霜七整个人都挂在围栏上，兴奋地说道。<p class='chapter_content_read_css'>  “嗯。”南宁忽然眉头一皱，将不适强忍下去微微一笑，“这里还可以看到小鱼呢。”<p class='chapter_content_read_css'>  “小鱼？哪里哪里？”琴霜七赶忙向江面望去，但只看到了一些模模糊糊的影子，懊悔道，“早知道我就戴着眼镜来了，隐形眼镜也行啊，这么好看的小鱼竟然看不到，嘤嘤嘤嘤。”<p class='chapter_content_read_css'>  “好了，”南宁一拍她，将揣在怀里的眼镜盒给她，“我帮你拿来了，带上吧。”<p class='chapter_content_read_css'>  “戴着这个没关系吧？会不会被别人认为很怪啊？”琴霜七接过眼镜盒故作担忧道。<p class='chapter_content_read_css'>  “放心啦，没事。”南宁拿过眼镜给她戴上，悄悄在眼镜上使了个隐咒。<p class='chapter_content_read_css'>  琴霜七又向江面望去，果然看见许多五彩斑斓的鱼儿，兴奋地从行李里拿出速写本和炭笔坐在南宁搬来的小凳子上认真的画着。<p class='chapter_content_read_css'>  南宁则就站在一旁认真地看着，其实，她最喜欢七七画画时的样子了，认真的眼睛里闪着不同于平时的光芒，很自然的就有一种吸引人的魅力。<p class='chapter_content_read_css'>  不知不觉间周围的人越聚越多，等到琴霜七终于呼了一口气画完的时候，已是半个时辰后了，周围突然响起雷鸣般的掌声，倒是把琴霜七和南宁吓得一咯噔。<p class='chapter_content_read_css'>  “姑娘果然技艺高超，竟用碳底垢物作此美画。”一位年轻公子上前赞美道。<p class='chapter_content_read_css'>  “是啊。”随后就有人随声附和。<p class='chapter_content_read_css'>  “没什么啦，素描是最基础的啦，可惜没有颜料只能画成黑白的了，”琴霜七将画塞进南宁怀里，“七月九日那天是你生日，我没来得及送你礼物，现在才补给你，对不起啦，南宁，十六岁生日快乐。成人礼快乐。”琴霜七紧紧抱住她。<p class='chapter_content_read_css'>  “七七。”南宁呜咽着感动的说不出话来，除了七七，还没有别人送过她生日礼物，也从未有人给她说过“生日快乐”。<p class='chapter_content_read_css'>  “好啦，”琴霜七松开她，大大咧咧的拍了拍肚子，笑道，“我有点饿了，也不知道这船上有没有生日蛋糕可以吃。”<p class='chapter_content_read_css'>  “我会做的啊。”南宁抹了抹眼角的泪花，将画折了几折小心翼翼的放进怀里的锦袋中。又将锦袋放到里衣夹层中，又用手轻按了几下，才放心。<p class='chapter_content_read_css'>  “各位客人，已经到了早膳时间，还请入厅。”船上的侍从恰好进到观望台中，冲各位行礼。<p class='chapter_content_read_css'>  众人也都稀稀散散的进到了用膳厅中，琴霜七拉着南宁跟在后面。<p class='chapter_content_read_css'>  南宁趁着琴霜七一个看不见就窜到了小厨房里。<p class='chapter_content_read_css'>  诸位厨子奇怪的看着忽然闯入的南宁，一位像是主厨的人走向南宁，道，“这位小姐，厨房重地闲人免入。”说着还指了指挂在门上的牌子。<p class='chapter_content_read_css'>  “我只是想……”南宁又开始嘴笨，说不出来话。<p class='chapter_content_read_css'>  “无论怎样，还请您出去。”那人眉头一皱，锐利的目光直射南宁。<p class='chapter_content_read_css'>  “我们想借用一下这里的厨房，怎么样，风船主？”书绘音和南宫宁雪不知何时南宁身后，旁边正站着此船的船主。<p class='chapter_content_read_css'>  “郝楚，你们先去忙活别的吧，反正全部早膳都已经做好上桌了。”风船主已经发话，厨房里的所有人就全都出了厨房，给南宁腾了地方。<p class='chapter_content_read_css'>  “你们怎么会在这儿？”南宁感激地看着他们两人，手上也没闲着，到处找着做蛋糕的材料，找了一会儿，虽是有几样材料没找到，但也不会妨碍蛋糕做出来后的整体效果。<p class='chapter_content_read_css'>  “有什么在下和书兄可以帮忙的吗？”南宫宁雪也不好意思只让南宁一人忙活。<p class='chapter_content_read_css'>  南宁想了一会儿，指着大锅道：“那就麻烦南宫公子帮忙烧锅吧，可以吧？”<p class='chapter_content_read_css'>  “自然可以，”南宫宁雪一笑，将长袖一挽衣衫下摆一拢就坐到了锅前的凳子上，忙活起来。看着他熟练的动作，南宁默默一惊，略微惊讶的看着他。<p class='chapter_content_read_css'>  许是觉察到了南宁疑惑的目光，南宫宁雪解释道：“我从十二岁就跟在师父身边，师父教我的第一件事就是烧锅做饭，可惜，只学会了烧锅，我只要一回到君玄观，十四娘就指名道姓让我给她烧锅，她就说我烧锅做出的鱼汤最好喝。”<p class='chapter_content_read_css'>  头一次听南宫宁雪没以“在下”自称，让南宁觉得有些亲切，心中的隔阂也消失了些。<p class='chapter_content_read_css'>  “十四娘？”听起来就是个女孩子的名字，“君玄观还收女徒弟？”<p class='chapter_content_read_css'>  “十四娘是我师父破格收的关门弟子，年龄虽小却完全没有小孩子脾气，做得一道好鱼汤，只可惜眼疾甚重就连我师父也治不好。”南宫宁雪忽然被勾起了话头，兴致勃勃的继续往下讲，“我第一见她的时候她才不过十一二岁，倒是机灵胆大得很，还将我痛骂了一通，除了我父亲还从未有人那样凶过我，现在想想那时她还是有点儿孩子气儿，可是现在却愈发像个大人了，也不知是幸还是不幸。”<p class='chapter_content_read_css'>  “这样啊。”南宁又继续闷头做蛋糕了，两人之间又瞬时寂静无语，站在门口的书绘音淡淡瞧了他们二人一眼，转身离去。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351956&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351956&&novelId=15670'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')"/>
	    		</div>
	    	</div>
	    </div>
  	 </c:if>
     

    <div class="read_foot">
   		<p style="padding-top: 43px;">Copyright 2006-2012&nbsp;&nbsp;
   			 www.azycjd.com &nbsp;&nbsp;
   			  All Rights Reserved&nbsp;&nbsp;
   			   版权所有&nbsp;&nbsp;
   			    云南安柔科技有限公司
   		</p>
   		<p>
   			滇ICP备12006807号-1 &nbsp;&nbsp;滇网文许字【2014】1100-002号
   		</p>
    </div>
  </body>
</html>

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
    <title>（十三）回不回去的一切 回又回去的一切</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351926&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351926&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351926+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十三）回不回去的一切 回又回去的一切]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351926')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351926 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351926,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第14章&nbsp;&nbsp;&nbsp;（十三）回不回去的一切 回又回去的一切
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  沈言的病已经痊愈，两家开始商量成亲的事宜。<p class='chapter_content_read_css'>  经此波折沈言与夏曼的感情愈发亲密，两家老人也是无比高兴。<p class='chapter_content_read_css'>  原本沈家是决定在泽成沈家主宅举行成亲仪式，但是夏曼却意外的要求在中辰成亲，夏家父母询问她为什么，她支支吾吾也说不出来，在旁边的沈言却急忙解释道。<p class='chapter_content_read_css'>  “是我告诉曼儿，我父母便是在中辰沈家的铃铛亭中成的亲，所以，曼儿也是想……”<p class='chapter_content_read_css'>  夏母了然看着满脸通红的夏曼，和蔼道：“原来如此，我还一直担心曼儿没有小女儿家的心思呢，看来是白担心了。”<p class='chapter_content_read_css'>  “至于伯父伯母在中辰的住处，便由晚辈提前打点。”沈言捏捏夏曼藏在袖子底下的手，满脸笑意。<p class='chapter_content_read_css'>  “好好，你们年轻人拿主意就好。”夏父也很通情达理。<p class='chapter_content_read_css'>  沈言和夏曼便先行告退，走到花园时，夏曼停下脚步，有些扭捏道：“真是麻烦言哥哥了，我其实，嗯，我……”其实是赤瞳的男子让她说要在中辰成亲的，但是，这种话怎么能说出口啊？<p class='chapter_content_read_css'>  “好了，”沈言大手摸摸她的头，“无论在哪儿成亲，只要有你在就行，在哪儿不能有，嗯，洞房花烛夜。”<p class='chapter_content_read_css'>  听他暧昧的语气，夏曼原本平静下来的脸颊又腾地红起来，嗔视他：“言哥哥！你羞不羞！”<p class='chapter_content_read_css'>  沈言见她活力又回来，脸上溢着笑，承受她雨点般的怒锤。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  成亲前夜，夏曼满心喜悦地试穿嫁衣，那赤瞳男子就那样突如其来的闯了进来。<p class='chapter_content_read_css'>  “你，你来干什么？”夏曼紧张的慢慢向后退着，想着要不要喊人。那人却像看透她似的，轻启薄唇，道：“那些人早就睡着了，任凭你怎么喊，也不会醒来的，至于我要干什么，自是让你履行承诺的，你答应我的事，也是该兑现了。”说着慢慢逼近夏曼，一抬手，修长的手指便抵在了她纤细的脖颈上，慢慢收拢。<p class='chapter_content_read_css'>  “言……哥……哥……”夏曼想要挣扎，却发现已被施咒，动弹不得，只能像是案板上的鱼肉，任人宰割。夏曼眼中溢出泪水，慢慢阖上眼皮，没了气息。<p class='chapter_content_read_css'>  “痴情女子……”那人在她额间一点，密密麻麻的红丝便缠满手指，轻轻一弹便消失不见，抱起夏曼，脚尖轻点，落到了一处枯井旁，轻轻将她投了进去，手指轻扬在井口画了几道咒，再望便无人影。<p class='chapter_content_read_css'>  第二日，一封信寄到沈家，落款是夏曼。拆开信，沈言脸色瞬间变得煞白，信上只有“退婚”二字。而且笔迹是夏曼的准确无误。<p class='chapter_content_read_css'>  前去夏家住的庭院，夏父看完信，脸色也如同锅底一般黑，气冲冲的跑到夏曼的院子，却发现下人丫鬟皆倾倒一地，夏曼也不见了踪影，夏曼自幼随他学武，劈倒这几个人逃婚也不是全无可能，只是这丫头为什么要逃婚？夏父突然看向面色惨白的沈言，心中的担忧愈发沉重。<p class='chapter_content_read_css'>  在院中守了一天也没见到夏曼的踪影，却收到了一封信，只有短短一句话。<p class='chapter_content_read_css'>  夏曼，悦来客栈，天字号房。<p class='chapter_content_read_css'>  一行几人来到悦来客栈，小二见几位面色不善，赶忙离开，越往靠近房间的方向走，众人越觉得不对劲，只听得低低的喘息声还有，女子的呻吟声。<p class='chapter_content_read_css'>  “夏曼。”夏父脸色更加不善，刚想闯进去，却被沈言拦住，只见沈言强装镇定，扯出一个笑，“伯父，我想，亲自了结。”<p class='chapter_content_read_css'>  “好。”这个字似从牙缝中挤出，带着满满的怒气。<p class='chapter_content_read_css'>  沈言深吸一口气，推开门进去，又立刻关上门，阻挡住门外人的视线。地上是凌乱不堪的衣物，只瞧见床上丝被下有东西不断涌动着，伴着重重的喘息声。沈言只觉得自己掉入了冰窖中，万分艰难的一步一步向前行走，双手止不住的颤栗，轻轻扯开丝被。<p class='chapter_content_read_css'>  入目，是两具只着亵衣，衣衫凌乱的身体，下面的女子正是夏曼，而那男子，沈言猛地扇了他一巴掌，将他扇到了地上，咬牙切齿道：“沈阡陌。”<p class='chapter_content_read_css'>  沈阡陌猛打了一个激灵，清醒过来，看清面前的沈言和床上丝被下只露出一个头，满脸惨白的夏曼，还有亵衣凌乱的自己。<p class='chapter_content_read_css'>  “表哥……我、我……”他反应过来发生了什么，也是万分慌张，他明明在自己房中睡觉，怎么会跑到这里来，还和嫂嫂……<p class='chapter_content_read_css'>  “沈阡陌，你个畜生，你可知道，她是你未过门的嫂嫂，你怎么能，怎么能做出如此禽兽不如的事！”沈言狠狠咬牙，别过头闭上眼，不去看他，甚至连夏曼。<p class='chapter_content_read_css'>  “啊！”沈阡陌忽然一声惨叫，倒在地上，沈言一惊，只见夏曼手持一支发簪狠狠刺入沈阡陌心口，取出，又狠狠扎下去，溅的自己也浑身是血。<p class='chapter_content_read_css'>  “曼儿！”沈言大惊，赶忙钳住她的手，她缓缓扭过头，头发披散凌乱，脸上沈阡陌的血缓缓流下，眼神空洞，活像一只厉鬼，扬手便要将另一只手中的簪子向沈言刺来，他行动一顿，被刺中了肩胛，血花在青色的衣料上绽开。<p class='chapter_content_read_css'>  “沈言！”房门被突然踹开，夏曼见有人闯进来，一裹丝被，从窗户跳下，引得路人一阵惊呼。<p class='chapter_content_read_css'>  “这是怎么回事？！”夏父见倒在血泊中的沈阡陌，“夏曼呢！”<p class='chapter_content_read_css'>  “表哥，”沈阡陌使劲抓住沈言的衣襟，记忆浑浑噩噩的回来，“我、我、我没有、没有……她、她……不……”不是嫂嫂……沈阡陌的手重重的垂下，没了气息。<p class='chapter_content_read_css'>  他想起来了，是有人，有人用了表哥的名义邀他过来，那人幻作表哥的模样骗他喝酒，又幻作嫂嫂的模样，陷害他，毁嫂嫂的名节，他都听到了，嫂嫂被那人杀了，尸体就在春言兰阁西院的枯井里，他还要，还要杀夏伯父一家，表哥……<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “再后来呢？”南宁不敢去看她的表情。<p class='chapter_content_read_css'>  “后来？”她一顿，认真回想，“后来我被官府判为杀人重罪通缉，我爹爹他们也都在一夜之间离奇消失，他们说爹爹是羞于见人，逃走了，我想，或许是这样吧，有我这样一个女儿，他应该觉得很耻辱吧。再后来，言哥哥就娶了洛家二小姐洛瑾冉，这样的结局，嗯，应该算是好吧。”<p class='chapter_content_read_css'>  “你那时不是已经死了吗？怎么还会知道死后的事？”<p class='chapter_content_read_css'>  “啊，这个呀，我住的旁边有个蛙精，他可以随意出井，这些事都是他看到的，他还告诉我，言哥哥成亲当天好热闹，到处都是红彤彤的，洗媒、挂红、开揖……拜天地、合欢礼、入洞房……”说着说着，眼泪就忍不住的滑落，“他，他一定很幸福吧，一定要幸福啊……”<p class='chapter_content_read_css'>  “那么，你呢？”南宁看向她，再望望快要翻白肚皮的天空。<p class='chapter_content_read_css'>  “我……没有……”她艰难的抬起头，“我什么都不想要，也要不起。”<p class='chapter_content_read_css'>  “走吧，没有时间了。”南宁扯过她的手，想要扯她走，她定定的站在原地，“秦姑娘，你说，我这种人是不是不值得被原谅？所以，他才不来见我的，是这样吧。”<p class='chapter_content_read_css'>  “你在说什么傻话？”南宁难得语气凶恶起来，“你哪里错了？错的是他们！尤其是那什么给你忘川花的人，肯定是早有预谋，说不定沈言的病就是他有意为之！”<p class='chapter_content_read_css'>  “我、我不想离开，这铃铛亭是言哥哥为我造的，最后在这里，灰飞烟灭，也不错。”她那粲然一笑闪的南宁有些恍然，南宁磨磨牙，她真想撬开她的脑袋看看，看看她脑袋里都装了些什么。<p class='chapter_content_read_css'>  “曼……儿？”一个不确定的声音从远处传来。<p class='chapter_content_read_css'>  夏曼忽的站起来，向声源看去，只瞧见沈言手中的灯笼“啪”的掉在地上，满脸的震惊。<p class='chapter_content_read_css'>  “你，你终于来了……”夏曼一手提灯，一手紧紧攥住胸口的衣物，慢慢向沈言走去。沈言也向她走去。两人隔着几步，面面相觑。<p class='chapter_content_read_css'>  夏曼脚步顿了顿，快走几步，张开手臂想要抱住他，沈言却后退几步闪开了。她眼中闪过受伤，忽而笑笑，自我安慰道：“没关系，你能来就很好了，就很好了，真好呢，还能再看你一眼。”眼泪就那样流下来，悄无声息的，化进虚空中。<p class='chapter_content_read_css'>  南宁忽的，心中有些微微抽动，心中觉得有些不妙，忽然冲着夏曼大喊道：“快回来！太阳升起来了！”<p class='chapter_content_read_css'>  夏曼摇摇头，“已经没关系了，都没关系了。”只见阳光从地平线射出，五角红灯笼闪了几下，失了亮。夏曼的身体开始被阳光撕裂，化作点点碎片，她弯着眉眼，努力冲沈言笑着。<p class='chapter_content_read_css'>  “对不起。”沈言跨出一步，将她揉在怀里，嘴唇贴在她耳边，喃喃道：“我恨你，我恨你离开我。”<p class='chapter_content_read_css'>夏曼一愣，灯笼掉在地上，缓缓回拢住他，“嗯，那就恨我吧……”声音随风而散。<p class='chapter_content_read_css'>  太阳升起，湖面的光点也完全消失，远处传来几声鸡叫，沈言缓缓松开怀抱，怀里空空，恍若之前的一切都是一场梦，只是清醒的意识让他明白，他确确实实抱住的，是他的曼儿。<p class='chapter_content_read_css'>  忽而一颗红色的珠子从夏曼消失的地方飞出，飞到南宁手中。<p class='chapter_content_read_css'>  南宁定睛看了一瞬，惊觉到，“七圣珠！”话音刚落，珠子瞬时褪色，只剩下一颗灰色的石头。<p class='chapter_content_read_css'>  “怎么会！？”南宁失声叫道，怎么会这样？<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “哝，阿绘，这是下一颗圣珠的所在地，虽然很想跟你见面的啦，但是不可以哟，哝哝，我知道你很想我啦，我也很想你哦，有缘再见啦！”书绘音在远处看着南宁，忽的就听到一阵女子的声音，一张纸条飘然而下，落到书绘音手中。<p class='chapter_content_read_css'>  “顾王妃木若涵”<p class='chapter_content_read_css'>  看着熟悉的字迹，书绘音紧紧攥了手掌，心中一阵烦躁，又瞧见南宁手中的圣珠变成了石头，原本的猜测完全成了真，那人，早一步开始行动了。<p class='chapter_content_read_css'>  这才要开始了，南宁，你可要做好准备啊。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351926&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351926&&novelId=15670'">下一章</div>
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

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
    <title>（四十四）偷吃药被发现啦 登徒子你干什么</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351957&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351957&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351957+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十四）偷吃药被发现啦 登徒子你干什么]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351957')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351957 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351957,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第45章&nbsp;&nbsp;&nbsp;（四十四）偷吃药被发现啦 登徒子你干什么
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  而琴霜七正趴在门框边偷听两人谈话，听着南宫宁雪一直谈着什么十四娘，还颇为关心的样子，恨不得一脚踹过去，看看南宫宁雪这颗榆木脑袋里到底都装了啥，竟然在一个女人面前兴致勃勃的谈论另一个女人，好吧，就算两个都只是少女，但是，任谁都不会高兴的啊！<p class='chapter_content_read_css'>  好不容易有机会可以让他们两个人气氛回暖些，结果就被他自己给抹杀了啊！苍天啊！<p class='chapter_content_read_css'>  啊！琴霜七猛地捂住了嘴，突然转身的书绘音快吓死她了。<p class='chapter_content_read_css'>  书绘音盯了她两秒，直接拽着她的后领子把她拖了出去，琴霜七踉踉跄跄的跟着，心中怒吼，你怎么可以这么粗暴的对待妹纸！<p class='chapter_content_read_css'>  “你觉得南宫宁雪这个人怎么样？”书绘音突然站定，琴霜七踉跄着差点摔在地上，被他问的愣住。<p class='chapter_content_read_css'>  “你问什么？”琴霜七若不是还顾忌着一点面子，要不然就直接掏掏耳朵以表示自己的不敢相信，是她听错了吧？<p class='chapter_content_read_css'>  “你觉得南宫宁雪这个人怎么样。”书绘音冷冷的重复一遍。<p class='chapter_content_read_css'>  “奥啊啊，我懂了，”琴霜七赶忙回答唯恐惹怒了书绘音，“人还不错啊，挺会照顾人还很温柔，南宁昏迷的时候他还天天来看南宁，还带来那么多药材，就是有时候有点木讷不解风情。”<p class='chapter_content_read_css'>  “那他来看南宁——”书绘音看着她突然就不说话了，自顾自的凝思一会儿又自顾自的走开了，弄得琴霜七也是丈二和尚摸不着头脑。<p class='chapter_content_read_css'>  “怪人。”琴霜七小声嘟囔一句，又跑去小厨房了。<p class='chapter_content_read_css'>  等着琴霜七再探头进去，南宁已经把蛋糕放进锅里开始蒸了。<p class='chapter_content_read_css'>  南宁刚刚盖上锅盖就突然蹲下，从琴霜七那里只能看到南宁的背影，只见南宫宁雪焦急地去扶南宁，被南宁一把拂开。<p class='chapter_content_read_css'>  “没事老毛病了，只是有些晕船罢了。”南宁缓缓站起身，“还麻烦你不要告诉七七，我不想让她担心。”<p class='chapter_content_read_css'>  南宫宁雪无奈只好答应，但又接着道：“如果秦姑娘真的很不舒服的话，就请来找我，我会给秦姑娘开些药的。”<p class='chapter_content_read_css'>  “多谢。”<p class='chapter_content_read_css'>  “南宁？”琴霜七故意做出意外的神情，欢快的跳进门来，“我说呢原来是你在做蛋糕啊，好香呢！”<p class='chapter_content_read_css'>  “七七。”南宁见到是她有一瞬的慌张，不过立刻恢复正常，“我本来还想给你个惊喜呢，只可惜没有奶油，所以只能做夹心水果鸡蛋松糕了，不介意吧？”<p class='chapter_content_read_css'>  “只要是你做的我全都喜欢。”琴霜七克制住了想要冲上去亲她两口的意思，只是紧紧搂住她的胳膊以示欢心。<p class='chapter_content_read_css'>  南宁刚刚好只做了四人份的蛋糕，几个人就端到了琴霜七房间去吃，南宁只吃了一小口就不再吃了，琴霜七见状夺过来，笑道：“我就知道南宁最好了，把自己的蛋糕留给我吃，么么哒，南宁。”<p class='chapter_content_read_css'>  南宁笑笑，忽然道：“我先回房间休息一会儿，你们慢慢吃，至于午膳和晚膳，你们就不用喊我了，加奈。”南宁起身匆匆离开。<p class='chapter_content_read_css'>  “加——奈？”南宫宁雪疑惑的看向刚刚关上的房门。<p class='chapter_content_read_css'>  “是再见的意思啦，”琴霜七大吞一口蛋糕口齿不清的说到，“看日漫看多了就会一不留神说出来了。”<p class='chapter_content_read_css'>  “原来如此。”南宫宁雪没再把“日漫是什么？”问出口，只怕无限循环啊。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  当夜，琴霜七辗转反侧难以入眠，终于还是点了一盏油灯静悄悄地溜到南宁房门前，只是轻轻一推就将房门推开一条小缝，以琴霜七的高度近视只能勉强看到床边伏着一个人影，她心中大感不妙，立刻冲进门，借着灯光看清倒在床边的人果然就是南宁。<p class='chapter_content_read_css'>  “南宁，南宁，南宁！”琴霜七不敢动她，只得在她耳边大声呼唤几声，但南宁还是毫无反应，这下琴霜七可真的急眼了，也顾不得拿起放在旁边的油灯摸着黑跌跌撞撞的跑到南宫宁雪房门前，大力敲打着门。<p class='chapter_content_read_css'>  南宫宁雪才刚刚打开了一条门缝就被琴霜七抓住手腕直接拽到了隔壁南宁的房间。<p class='chapter_content_read_css'>  南宁依旧是伏在地上，南宫宁雪只能谨慎地先为她把脉，发觉可以移动才将南宁抱到床上，趁这空档琴霜七已经把他的医箱拿来了。<p class='chapter_content_read_css'>  “怎么样？只是晕船的话怎么会晕倒？怎么会这么严重？”琴霜七自是偷听到了南宁晕船，她本以为只是和晕车差不多，又怎么会到了晕倒的地步？<p class='chapter_content_read_css'>  “是秦姑娘本身身子底就弱，晕船反应也比平常人更剧烈，至于昏倒，”南宫宁雪微微眯眼，语气有些怪异，“好像就不是晕船的原因了。”<p class='chapter_content_read_css'>  “那是——”琴霜七被南宫宁雪掏出的一包药给堵回去，呆愣愣的接过药材包。<p class='chapter_content_read_css'>  “麻烦七七姑娘去煎一下这副药材，大概一个时辰就好，请尽快。”南宫宁雪张嘴还想说些什么，看琴霜七的身影已经消失在紧紧关闭的房门后便收了言语。<p class='chapter_content_read_css'>  一直昏迷的南宁突然睫毛颤动醒了过来，呆呆的看了南宫宁雪半晌，哑着嗓子道：“南宫公子……你……”<p class='chapter_content_read_css'>  声音嘶哑了半晌忽而没了动静。<p class='chapter_content_read_css'>  南宫宁雪倒了杯凉开水喂给南宁喝，南宁靠着枕头小口喝着，慢慢喝完了三杯才长出了一口气。<p class='chapter_content_read_css'>  “秦姑娘你，是不是在吃什么药？”<p class='chapter_content_read_css'>  南宁瞪大着眼睛看着他，忽然咬住唇垂下头，微弱的灯光下可以看到她因紧攥着被子而泛白的骨节。<p class='chapter_content_read_css'>  “我——是在吃一些药，还请你替我保守秘密，如果被七七知道的话，她一定会——”南宁的声量忽然小下去，若不是南宫宁雪听力异于常人怕是就错过了，“绝对不能让她再承受一次了。”<p class='chapter_content_read_css'>  南宁慢慢躺下身子将被子一蒙，又闭眼昏睡过去。<p class='chapter_content_read_css'>  南宫宁雪移了凳子坐在床边守着，整间屋子就这样静谧着。<p class='chapter_content_read_css'>  南宫宁雪在烛火摇曳中静静地看着南宁，南宁眉头紧皱似是在做什么噩梦，慢慢又舒展开来，终是化为一潭平静。他慢慢俯下身去只差一点点就可以亲到南宁的唇，就那样硬生生的停住，南宁温暖的鼻息轻轻吹在南宫宁雪面上。<p class='chapter_content_read_css'>  他微微勾起唇角，眼里却露着冷光，将修长的手指慢慢抚上南宁的脖颈，缓缓收拢，南宁紧皱眉头痛苦地喘息着，南宁胸口剧烈的起伏，慢慢的越来越微弱，只差一点点儿。<p class='chapter_content_read_css'>  南宫宁雪猛然撤了手，像是在问南宁，又像是在问自己。<p class='chapter_content_read_css'>  “是不是你，杀了她？”<p class='chapter_content_read_css'>  南宁并没醒来，大口的喘着气，过了良久才缓过来，陷入平稳。<p class='chapter_content_read_css'>  等了大概有一个时辰了，南宫宁雪见琴霜七还没回来，心里有些不放心就起身想去查看，关门之前深深看了南宁一眼才关好门离去。<p class='chapter_content_read_css'>  又过了半个时辰，天色开始慢慢放光，南宁被走廊里的脚步声给吵醒，有两人的脚步声恰好在她门前戛然而止。<p class='chapter_content_read_css'>  就听见两个男人说话的声音，其中一个还让南宁觉得有些耳熟。<p class='chapter_content_read_css'>  “公子，此去风铃岛可是为了寻找漠小姐？”<p class='chapter_content_read_css'>  “自然不是，此行的目的自是为了风岛主的独生女儿风韵，既然风岛主抛出了这个橄榄枝，又怎有不接之说？”男子顿了顿，继续道，“至于漠漠，现在还只有零碎的消息证明她出现在过风铃岛，就算找到她本公子还没信心能将她带回去。”<p class='chapter_content_read_css'>  “那，公子可有信心得到风小姐的芳心？”<p class='chapter_content_read_css'>  “那就要看那对鸳鸯玉脂佩了。”<p class='chapter_content_read_css'>  “鸳鸯玉脂佩？”<p class='chapter_content_read_css'>  “司元，看来你一点儿也不知道这鸳鸯玉脂佩的传说啊，”紧接着传来扣扇子的声音，“相传这鸳鸯玉脂佩乃为风家的家传宝物，一直由岛主与岛主夫人分别保管，可保世代岛主夫妇恩爱白头，可惜，传到这一代的风岛主这儿，却出了意外。<p class='chapter_content_read_css'>  风岛主年轻时酷爱出海寻宝，他与其夫人便是在海上相识相爱的，直到最后一次风岛主出海，风夫人恰好怀孕，结果却出了海难，虽然风岛主安然无恙回到风铃岛，但是风夫人也在生下女儿后大出血而亡，鸳鸯玉脂佩也从此下落不明。”<p class='chapter_content_read_css'>  “那，看来公子其实也是势在必得了。”被叫做司元的男子一笑，“说不定，也会找到漠小姐呢。”<p class='chapter_content_read_css'>  “那便是最好了……”<p class='chapter_content_read_css'>  南宁一开始侧着头模模糊糊的听着他们说话，慢慢不禁也被吸引住细细听着，措不及防的，房门突然被打开，南宁侧着头与推门进来的男子面面相觑。<p class='chapter_content_read_css'>  怎么个状况？！<p class='chapter_content_read_css'>  南宁默默将被子往上拉了拉，明明想说些什么“快出去！”“登徒子！”之类的话，喉咙却哽住，只能“咕咚”咽了两口唾液，跟闯进来的男子干瞪眼。<p class='chapter_content_read_css'>  那男子是——<p class='chapter_content_read_css'>  一袭华袍紫衣，滚着一圈鎏金祥云纹，戴翡翠金边白玉冠，面色白皙，一双桃花眼正直勾勾的盯着南宁看。<p class='chapter_content_read_css'>  是撞她的那个贵公子！<p class='chapter_content_read_css'>  南宁使劲眨眨眼，挣扎了半天想要坐起来，但身体根本不受自己控制，只能瘫在床上任男子肆无忌惮的目光在自己身上看来看去。<p class='chapter_content_read_css'>  只见男子忽而动了步子作势要上前来。<p class='chapter_content_read_css'>  南宁忽然心跳加速。<p class='chapter_content_read_css'>  他、他要干什么？！<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351957&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351957&&novelId=15670'">下一章</div>
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

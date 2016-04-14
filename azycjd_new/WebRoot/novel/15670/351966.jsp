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
    <title>（四十九）大雨磅礴天外天 三生石上曾留名</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351966&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351966&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351966+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十九）大雨磅礴天外天 三生石上曾留名]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351966')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351966 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351966,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第54章&nbsp;&nbsp;&nbsp;（四十九）大雨磅礴天外天 三生石上曾留名
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  没错，这是要闹哪样啊！<p class='chapter_content_read_css'>  告白吗？你瞅瞅这环境，像是个正儿八经告白的地方吗？<p class='chapter_content_read_css'>  一片破稻草，一堆熊熊篝火上翻涌着的木耳汤，还有好像有些快要糊掉的蘑菇，最后是这崎岖诡异的山洞，怎么也都不像是说这话的地方吧？！<p class='chapter_content_read_css'>  再者是他说的是“负责”！“负责”啊！根本不是什么告白的话啊！<p class='chapter_content_read_css'>  南宁脸皮抽搐的赶忙向后挪了挪，一脸惊悚的看着南宫宁雪，右手抬起来伸出食指抖了半天，“你你你你不是在开玩笑吧？”<p class='chapter_content_read_css'>  “在下不曾戏语。”他很认真的看着她，“在下虽为医者，但确确实实瞧了秦姑娘的身子，毁了秦姑娘的清白，在下自是要负责。”<p class='chapter_content_read_css'>  只是看了而已，再说——<p class='chapter_content_read_css'>  “这件事不过你知我知，天知地知罢了，南宫公子，你，你莫要在意。”南宁是差点儿咬了自己的舌头，“当真没必要这样做，负责什么的，我又不是什么大户家的千金小姐，哪里需得这么多条条框框。”<p class='chapter_content_read_css'>南宁顿了顿，又套上了武侠小说里常常出现的一句：“江湖儿女不拘小节。”<p class='chapter_content_read_css'>“可是，秦姑娘，在下当真……”<p class='chapter_content_read_css'>“好了，我知道南宫公子乃为正人君子，但我都不甚在意，公子何必如此呢？婆婆妈妈的，当真有些娘气。”南宁一不留神的把心里的吐槽全都说了出来，当反应自己最后一句到底说了啥的时候，一抬眼就看见南宫宁雪有些微微抽搐的嘴角，“啊，那个，南宫公子，我，我刚才，那个，哈哈，哈。”<p class='chapter_content_read_css'>南宫宁雪见她干笑两声，便抿了抿唇，脸色很是不好，任谁被别人说成娘气都不会笑得很开心吧，哈，他也真想干笑两声。<p class='chapter_content_read_css'>“既然秦姑娘这样说，那在下便——不再，婆婆妈妈了。”<p class='chapter_content_read_css'>南宁下意识地摸摸暖和的汤碗，但总感觉汤碗的温度下降了不止是零点一个百分点，气氛正在尴尬之中，忽然一阵雷声划破了天际，她瞬间吓得扔了碗，紧紧蜷起身子双手紧紧捂着耳朵，面色惨白。<p class='chapter_content_read_css'>南宫宁雪反应迅速的接住了碗，否则怕是再次要湿了衣袍，看见南宁的状态，伸手便向南宁碰去，南宁以迅雷不及掩耳盗铃之势扯住他的胳膊，直接撞在他怀里，浑身瑟缩着。<p class='chapter_content_read_css'>“好冷，好冷，好冷……”南宁牙齿咬的咯咯响，只是喃喃的重复着这一句。<p class='chapter_content_read_css'>“秦姑娘，秦——秦姑娘。”南宫宁雪只得紧紧将她怀抱起来，下巴搁在她头顶，手掌轻轻摩挲着她的墨发。不只是头发，不只是手掌，不只是背上，所有地方都是冰凉的，都是痛的。<p class='chapter_content_read_css'>为什么，为什么，心里好痛，到底是为了什么？<p class='chapter_content_read_css'>倾盆大雨中，白衣女子怀抱着一个包袱，慢慢走到河岸边，河边立着一块石碑，大雨模糊了石碑上的字迹，只能隐隐约约瞧出是两个人的名字。<p class='chapter_content_read_css'>“愿儿，你也很冷，对不对？”女子眼神恍惚的看着怀里的包袱，包袱被风吹开一角，一只婴儿的小脚露了出来，“愿儿，我也好冷啊，好冷啊，好冷啊……”<p class='chapter_content_read_css'>女子忽然笑了起来，笑得很是迷人，分不清是雨水还是泪水布满了脸颊，墨发乱舞竟渐渐变成了灰白色，再慢慢地变成白丝，她小心翼翼的将包袱的上角掀开，雨水肆意的洒在婴孩青灰色的脸颊上。<p class='chapter_content_read_css'>她将脸紧贴着婴孩的额头，“愿儿放心，再也不会让你冷了，你要一个人静静的，乖乖的呆在那里，虽然我不会随你而去，但你一定要好好的，你舅舅他会给你寻一个很好很好的宿体的，你是娘亲的乖孩子，对不对？”<p class='chapter_content_read_css'>婴孩只是静静的沉默着，静静的沉睡着。<p class='chapter_content_read_css'>女子轻轻捏了个诀，包袱便被裹上了数层透明的轻纱，再施一个诀，不足一尺的玄冰棺便展现在眼前，婴孩被轻轻放在里面，女子轻轻一扬手，蓝色的花瓣从天而降飘扬着香气尽数落进玄冰棺中，“就让它们代替娘亲守在你的身边吧，愿儿。”<p class='chapter_content_read_css'>玄冰棺缓缓沉入河中，大雨越发肆意，整个天地间都是一片昏暗。<p class='chapter_content_read_css'>“是呀，是很冷啊。”见着玄冰棺彻底沉入河底，女子忽然凌厉了眼神，一柄长剑出现在手中，“真是可惜呢，执苏，到最后还是无法让你尝尝鲜血的味道呢。”剑身猛然轰鸣了一下，声音凄厉。<p class='chapter_content_read_css'>女子的眼神瞬间转移到那石碑之上，她冷笑一下，手腕一动，剑影闪过，石碑便被拦腰斩断，砸在湿润的泥土里，发出沉闷的声音。<p class='chapter_content_read_css'>“你既薄情，这三生石上，这区区几个字，又何必将你我拴在一起，你便跟那人好好过去便是了，只是你欠我的，你欠愿儿的，就算我魂魄散尽，你也必定是要偿还的！”长剑被狠狠甩在地上，女子撩起裙袍依然跳下了旁边的枯井。<p class='chapter_content_read_css'>井底不断冒出的戾气如同刀子一般将女子划得遍体鳞伤，女子慢慢化为了一缕白烟，风只是轻轻一吹便再无踪影。<p class='chapter_content_read_css'>而井外，电闪雷鸣丝毫没有减弱，磅礴大雨洒满天地间，河水又涨了几分，岸边的火红色的彼岸花却开得正是妖娆。<p class='chapter_content_read_css'>南宁痛苦地哼咛一声缓缓睁开眼，梦里的痛楚真真切切的传导在身上，还有心脏撕心裂肺的痛楚，都真的，真的好像是真的，南宁想要紧紧攥住胸口的衣物，却发现手被一人紧握着。<p class='chapter_content_read_css'>南宫宁雪微微垂着头酣睡着，几缕凌乱的发丝垂在面颊前，细长的眉毛微微下拧，睫毛也是弯长，有些不安的颤动着，脸色有些苍白，嘴唇也有些干涩了。他还是紧紧的怀抱着南宁，小心地避开了她的伤口，修长的手指紧贴在她的掌心，传来丝丝温暖。<p class='chapter_content_read_css'>南宁心里也是暖和起来，看着天色还未晴朗，便将狐裘披风向上蹭了蹭，脸颊轻轻贴在南宫宁雪的胸膛上。<p class='chapter_content_read_css'>“咚咚咚，咚咚，咚咚咚……”<p class='chapter_content_read_css'>寂静的山洞里，南宫宁雪的心跳声在南宁耳边不断放大，渐渐与她的心跳声重合，她的手微微合拢，感到前所未有的安心。<p class='chapter_content_read_css'>这次，她没再做什么奇怪的梦，真的很平静。<p class='chapter_content_read_css'>***********************************<p class='chapter_content_read_css'>而琴霜七这边却没怎么平静。<p class='chapter_content_read_css'>琴霜七忐忑的等了三天，按照约定去找书绘音，她一大早便等在了书绘音房门前，天才刚刚翻了白肚皮就立刻敲了书绘音的房门，连敲了十几下却没有一点儿回应，终是推了推房门。<p class='chapter_content_read_css'>而房门却是开着的，入目便是干净利索的床铺，哪里有什么银发男子的身影？<p class='chapter_content_read_css'>“书、绘、音！！！！！”<p class='chapter_content_read_css'>房梁上的灰尘落了一地。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351966&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351966&&novelId=15670'">下一章</div>
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

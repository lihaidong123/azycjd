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
    <title>（九）未何以欢何以幻 亦不曾欢不曾欢</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351922&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351922&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351922+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（九）未何以欢何以幻 亦不曾欢不曾欢]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351922')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351922 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351922,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第10章&nbsp;&nbsp;&nbsp;（九）未何以欢何以幻 亦不曾欢不曾欢
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  南宫宁雪正盯着花盆看，并未注意到南宁的异样，刚瞧见须臾花的一点模样，还没来得及仔细看，就觉得肩头一沉，皱了一下眉，抬手想要扫开重物，向后努了一下身子，重物便落到了怀中，他低头一看，竟是南宁。<p class='chapter_content_read_css'>  “秦、秦姑娘？”他疑惑的摇了摇面朝下的南宁，见她没有回应，有种不祥的预感，猛然将南宁扶起来，只见她早已失去意识，面色灰白，气息浅薄。<p class='chapter_content_read_css'>  沈言也看出不对劲，赶忙让小侍收拾了房间，让南宫宁雪抱着南宁进去，书绘音淡淡瞥了一眼南宫宁雪怀中的南宁，向洛瑾香取走了须臾花与夜凝花，并未将花盆带走，只是将花朵剪下，装在了一个锦袋中，又谨慎的放在怀中，并未多言，施施然走进南宁的那间屋子，留下还没反应过来的众人。<p class='chapter_content_read_css'>  “唉，这到底是闹得哪一出啊？”席座中，不知是谁淡淡说了一句。<p class='chapter_content_read_css'>  “诸位，今年的才情会算是已经结束了，若是诸位并无急事，便请参加接下来的……”洛家主看着席间的众人，开口道。<p class='chapter_content_read_css'>  洛瑾香早已到了屏风后，望着书绘音消失的身影，勾起一边唇角。<p class='chapter_content_read_css'>  “怎么样？秦姑娘无碍吧？”沈言站在床旁，问着正在诊脉的南宫宁雪。<p class='chapter_content_read_css'>  “在下也说不清楚，怕是很早之前的心脉旧疾，应该有两三年没有发作过，只是……”他顿了顿，看向南宁的脖颈，“秦姑娘，冒犯了。”说着手便探向南宁。<p class='chapter_content_read_css'>  沈言似乎觉察到他想要干什么，扭过头去，只看见一道蓝影飘过。<p class='chapter_content_read_css'>  “啪！”还没等到南宫宁雪碰到南宁，手就被狠狠地打到一边，再看，竟是书绘音的玉笛。<p class='chapter_content_read_css'>  “阁下……”南宫宁雪还没来得及说完，只见书绘音只是拿着玉笛在南宁面前闪了几下，一颗奇怪的药丸就被她吞下，期间不过短短数秒，而且，书绘音并没有用肢体接触她，只是用玉笛轻碰了几下。<p class='chapter_content_read_css'>  “唔……”南宁皱着眉头哼了一声，只是一直紧闭着眼，丝毫没有醒来的迹象。<p class='chapter_content_read_css'>  沈言也盯着书绘音看，心中有些奇怪他的做法，好似早就知道南宁会晕倒，就连药也准备好了。<p class='chapter_content_read_css'>  “我早就告诉过你，不要动她。”书绘音看向南宫宁雪，猛然开口。<p class='chapter_content_read_css'>  南宫宁雪一顿，也隐住了情绪，“阁下在说些什么，在下与阁下不曾相识。”<p class='chapter_content_read_css'>  书绘音不再言语，缓缓看向昏迷的南宁，走近，扯出南宁袖中的手，手紧紧攥着依稀可以看见一些红色的液体，他沉了一下眸，使劲掰开她的手，手中的银色铃铛早就变成了血红色，手心被铃铛的利处割得道道血痕。<p class='chapter_content_read_css'>  他用掌风一带，手心里的铃铛就飞了出去，落到沈言怀中。沈言一惊，赶忙掏出来，却见是早已被自己丢弃的信物，还被染上了赤色的鲜血，带着浓浓的血腥味，他心中亦是复杂，沉默了一会儿，缓缓将铃铛用帕子裹住放到衣襟里。<p class='chapter_content_read_css'>  南宫宁雪见南宁手中伤痕，便寻来小侍要了一些草药和布条。书绘音听见他吩咐，伸出的手一顿，又缩回袖中。起身，出去。只留下走神想着夏曼的沈言和处理草药的南宫宁雪。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “二哥，我要那个！”<p class='chapter_content_read_css'>  “好了，阿桠，那个不可以要的，小心阿母又骂你，乖乖去找卿尘玩吧。”<p class='chapter_content_read_css'>  “哼！”<p class='chapter_content_read_css'>  是谁在说话？南宁试着睁了睁眼，就听到这样一段对话，那声音好熟悉，卿尘？<p class='chapter_content_read_css'>  再睁看眼，却是才情会会场，布置什么的，好像变了变，还有书绘音呢？沈言？南宫宁雪呢？<p class='chapter_content_read_css'>  “你好……”南宁扬起微笑向正在向前来的男子说话，只见那人却像看不见自己似的，径直走了过去。看不见自己？南宁顿了顿，应该是陷入梦魇了吧。苦笑一下，往四周望望，寻找破解梦魇的办法。<p class='chapter_content_read_css'>  周围的人行走愈来愈快，天色不过几瞬就黑了下来，南宁发着愣，只听到台上一个女子质问的声音。转过身去，等看清那女子的模样，竟是被震了几下，倾国倾城也不过如此罢了。<p class='chapter_content_read_css'>  她一身男子打扮，墨发散在肩头，额间一朵蓝花，怀中抱着一盆花，脸色微愠，瞪着台上的男子。<p class='chapter_content_read_css'>  那男子不急不慢的说：“这是才情会的规矩，花项胜的花必须留下。”<p class='chapter_content_read_css'>  女子深吸了一口气，尽量平静的说：“那好，我用另一样东西来换，总可以了吧。”<p class='chapter_content_read_css'>  “何物？”	<p class='chapter_content_read_css'>  女子要来了纸笔，刷刷落笔，扯起宣纸轻轻一吹，递给男子,“这酒名为竹酒，是我家族秘方，用来换须臾花总够本了吧！”<p class='chapter_content_read_css'>  男子看了几眼方子，又拿到后面给专门的酿酒师傅看，过了半晌才出来，笑着对女子说：“姑娘确实可以了，以物换物。”<p class='chapter_content_read_css'>  女子听了他的话，二话不说，抱起桌上的须臾花就走，脚踩在船沿上，轻轻一蹬，行在水面，渐渐消失不见。<p class='chapter_content_read_css'>  南宁抬头看向男子，只见他笑着与诸位宾客谈笑，不经意的，嘴角勾起的弧度泄露了他的情绪，她皱了皱眉，忽然一阵飓风袭来，她只好用广袖遮面，不经意扫到一个男人，竟和沈言有几分相像。<p class='chapter_content_read_css'>  再睁开眼时，却是换了个地方，稍微抬眼就能看到万家灯火，南宁心里咯噔一下，颤巍巍的往下看去，脚下一软，顺势歪坐在瓦片上，她所在的地方，正是某一处的屋顶上，还挨着屋檐，还好她是往后歪去，否则怕是要在此处摔死了吧。<p class='chapter_content_read_css'>  正想着下去，就听到一阵吵闹声，定睛向下看去，黑漆漆的巷中几个人扭扯在一起，哦，不对，是十几个人在欺负一个人。<p class='chapter_content_read_css'>  “砰！”忽然一个物件从其中一人怀中飞出，砸碎在地上，蓝色的花朵散着莹莹的光，就着那光，南宁看清了那人的模样，原是那位姑娘。<p class='chapter_content_read_css'>  却见她眼中戾气尽显，着实要发怒，忽而一团白毛从袖中蹿出，一阵强光从那白毛身上发出，闪得人张不开眼，南宁强撑着眼将那白毛的样子收入眼中，是一只雪狐，琥珀色的眼瞳，额间一点蓝。不过瞬时，巷子又恢复了黑暗，只有那十几人在奇怪的嘀咕，其中一人闪了身形，将地上的须臾花捧起，嘴里念了几句，花盆便恢复原样。<p class='chapter_content_read_css'>  “回去交差。”那人暗沉一声，消失在夜色中，随后几人也赶紧跟上。<p class='chapter_content_read_css'>  南宁捏着下巴沉思了一会儿，便理出了头绪，这应当是某人的记忆，正是沈言说的那次才情会中的事，还有那夺取须臾花的人，应当是四大家的人。不过，最主要的是，这是谁的记忆？又或是，这片湖的记忆？<p class='chapter_content_read_css'>  闭上眼睛，想要寻找一些蛛丝马迹，只听到一些隐隐约约的话语。<p class='chapter_content_read_css'>  “阿桠！下次不可以乱跑了，我和二哥都很担心你。”<p class='chapter_content_read_css'>  “知道了，啰嗦歌映。”<p class='chapter_content_read_css'>  “你，唉，现在就这么不讲理，成了亲之后该怎么办啊？”<p class='chapter_content_read_css'>  “算了，歌映你还是取消婚约好了，不然，总有一天你会被这丫头逼疯的。”<p class='chapter_content_read_css'>  “嗯，确实是。”<p class='chapter_content_read_css'>  “哎呀！二哥！真讨厌啦！”<p class='chapter_content_read_css'>  “哈哈哈……”<p class='chapter_content_read_css'>  那笑声让南宁一阵恍惚，身上打了个激灵，摇摇晃晃的站起来，左脚往前一探，却是虚忽一踩，身体前倾，从屋檐栽了下去。彼时，一双眼睛在不远处静静地观望，若是仔细一点，便可看见她刚才射出去一颗石子，正摇摇晃晃的从那屋檐滚下，发出微小的声音。<p class='chapter_content_read_css'>  “哝，阿桠，该醒了吧。”不知是谁，低喃一声。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351922&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351922&&novelId=15670'">下一章</div>
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

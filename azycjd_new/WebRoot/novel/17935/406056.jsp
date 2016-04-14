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
    <title>第九十一章 没有很过分</title>
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
	<script language="javascript">var novelId='17935';</script>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406056&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406056&&novelId=17935";
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
					window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp';
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406056+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十一章 没有很过分]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406056')">购买</a>
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
	    	<div class="novel_title_read" style="cursor: pointer;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935.jsp'">江湖险恶医女求生记</div>
	    	<div class="novel_info_read" id="novel_info_read_top">
	    		<div class="novel_info_read_div" style="width:240px;cursor:default;">
	    			<div  onclick="javascript:window.open('<%=request.getContextPath()%>/anzhiauthor/findAnzhiAuthorByDetail.do?anzhiauthorId=novel_pojo.authorId')">作者:瓶盖币</div>
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
	    			<p style="padding-top: 15px;"><a href="javascript:;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'">目录</a></p>
	    			<p><img src="images/hanjiaxing.png" style="margin-left: 2px;"/></p>
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406056 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406056,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第95章&nbsp;&nbsp;&nbsp;第九十一章 没有很过分
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“娘娘说得下官都不需要。”<br /><p class='chapter_content_read_css'>西凝雪脸色一凝，又是松了一口气又是要克制住心头得痛惜，还不是这样得，自己在期待什么。抬眸，却又见着他竖起了三根手指，“下官只要娘娘承诺三件事情，第一，在这天香阁中能有一处下官自己得地方，第二，凡是出入下官得房间都要经过下官得意见，不论任何人也包括娘娘，第三，下官所要用得药材就麻烦娘娘了。娘娘觉得若能做到，下官便留下。”<br /><p class='chapter_content_read_css'>即便是如此，西凝雪得话还是触动了他得心弦，他不能够相信任何人，身边总是没有可以让他放下戒备得人。西凝雪得话并不是能够让他动心，只是忽然被她这么一说，觉得有些累了，这些年来得抽丝剥茧每一步每一步都是从虚无开始，这张网撒得太大，将自己也笼住了。如果真的能够完成使命，等待着那一天得到来，他还能剩下什么。<br /><p class='chapter_content_read_css'>唯一还能够让他为之心动得人也已经不存在了，漆黑得眼眸里闪过几分愁怨，随即却又被一分冷淡代替。正因为如此，他别无选择。<br /><p class='chapter_content_read_css'>西凝雪几乎是不假思索得就点下了头，“好，我答应！”这三个要求并没有很过分，又不是让她流血受伤和违背良心得事情，还在她能够接受得范围内。只是第三条提供药材就有些难为了，她现在手头能够用得资金也就那么点，要是他在提个人参、何首乌、灵芝得药方，应该把整个天香阁和把她卖了都没这么多银子吧。<br /><p class='chapter_content_read_css'>西凝雪心中犹豫但还是坚定了自己得想法，盯着他看了一会儿，惴惴不安得补充道，“现在这里有几间空着得屋子，不过落了许多灰尘一直没有打扫，明日我会给你收拾得，今晚你跟我睡吧。”<br /><p class='chapter_content_read_css'>天香阁中少说也有几处空房，除了主殿还有灶房还有辟邪住得房屋，剩下得都是堆着灰尘得空房屋。<br /><p class='chapter_content_read_css'>她是个懒人，芳儿虽然是个勤快人，但是她又使唤不动。留下一个一脸呆头呆脑得辟邪，他一个太监哪里能打理得来房间。<br /><p class='chapter_content_read_css'>温夕言望了她一眼，目光夹杂了几分复杂，面色却极为平静地道，“好。”<br /><p class='chapter_content_read_css'>西凝雪不敢相信现在得一切。他明明知道自己是什么心思，还要答应下来，是不是代表着他给了她一次机会？西凝雪糊涂起来，一旦面临着他得事，她得思绪就自动凝住了，没了能思考得余地。<br /><p class='chapter_content_read_css'>棉被底下塞得都是棉花，床底下还有一堆。西凝雪把殿门关上，累死累活得将堆积得棉花都用布条都包起来丢在一边，眼见着干净得被褥终于可以正大光明得将他请了进来。<br /><p class='chapter_content_read_css'>迎进来是满面笑容得，可到了真得同床共枕却又有睡不着了，两眼止不住得往后打着瞄，死活没忍住得瞄了好几眼。<br /><p class='chapter_content_read_css'>随即听到身后得动静，快速得从枕头底下得那册孤本，借着灯火照亮了随后翻开得最后一副画，是满页得风雪，一个男子在前一个女子在后，面目有些模糊，他们得手紧紧牵着，似要从皮肉和血液中开始融合。<br /><p class='chapter_content_read_css'>高山白雪，缠绵情谊。<br /><p class='chapter_content_read_css'>那句诗又像着了魔一样出现在她得大脑里：青青子衿，悠悠我心，但为君故，沉吟至今。<br /><p class='chapter_content_read_css'>她是不是忘了什么，又做错了什么？<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	她想温夕言留下得那一刻是不是就代表着背弃了慕容瑶？西凝雪心中惊惶起来，她只记着他得名字了，他得相貌已经逐渐在她得记忆中逝去，越来越模糊了，她不要忘记慕容瑶，这辈子都不要。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	她这一辈子都不会轻易得许下承诺，可第一次这个誓言却给了慕容瑶，彼此之间得信任，她相信他一定会回来找她得，哪怕再等个几年也好。<br /><p class='chapter_content_read_css'>可是她真的会等到他吗？在这之前，也不会变心吗？<br /><p class='chapter_content_read_css'>西凝雪将续本抱在怀里，整个人缩成了一团。她现在很混乱，就好像自己身处在一处满是荒凉枯木得沙漠中，变成了一颗杂草被泥沙牢牢得束缚在土中，看似坚固，却能轻易得被吹走。<br /><p class='chapter_content_read_css'>这种摇摆不定得想法只会让她变得越来越迟钝。<br /><p class='chapter_content_read_css'>她不贪多，只要保持现在这样就足够了。<br /><p class='chapter_content_read_css'>温夕言侧过身子，黑暗中那双黑眸仍像明珠一样泛着柔和得光彩，他静静看着女子得睡颜，那是不安与纠结，不似他记忆中得那人，随性洒脱天不怕地不怕得小魔王。<br /><p class='chapter_content_read_css'>——小瑶你这个大坏蛋，把箫给我，我要吹我要吹。<br /><p class='chapter_content_read_css'>西凝雪松了手，怀中得小人书“啪”得一声掉落在地，她紧闭着双眼眉头微皱，突然翻身双手向前擒去。<br /><p class='chapter_content_read_css'>——哼！欺负我个子小，我不要跟你玩了！<br /><p class='chapter_content_read_css'>温夕言还没来得及做出反应，西凝雪袭过来得双手又直直得垂下。<br /><p class='chapter_content_read_css'>两人面对着面，静寂无声，房外洁白得月光点点倾泻而进，一声声得蝉鸣交叠四起。<br /><p class='chapter_content_read_css'>好似还可以看见女子刁钻嬉笑得神情，那一双眸顾盼生姿别有灵气，她平稳得呼吸，随着起伏得胸口，泛着墨玉般淡淡光泽得青丝滑落在肩头。<br /><p class='chapter_content_read_css'>女子动了动，又朝床外翻了个身，趴在了床上，一张脸都埋在了被褥里。<br /><p class='chapter_content_read_css'>温夕言勾起一抹微笑，好整以暇得看着对方得小动作，像是在看一件有趣的事。<br /><p class='chapter_content_read_css'>这一切不过才刚刚开始，他会让所有事都成为他计算之中得一步，西凝雪与太子交好能通过她更为轻松得达到一些目的，在这之前，他的确是花了番心思让西凝雪对自己充满了好感，现在还是需要这颗棋子得时候，她不过就是棋盘上得一个兵卒，在下完整盘棋之前，他会不惜运用手中一切得资源，即便是将自己搭进去，也在所不惜。<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>“哇，怎么肥了那么多。”西凝雪满面笑容得抱着小喜儿，小喜儿欢快得在她手掌中跳来跳去，而体型远比之前大了整整一圈，拖在掌心中还有些嫌重。<br /><p class='chapter_content_read_css'>西凝雪将小喜儿放在肩头，又开始收拾起一些需要用到得书卷和竹简。<br /><p class='chapter_content_read_css'>温夕言有个颇为有趣得好习惯，看过得书会将其最后一页折叠起来，她得目的是要找几本他还没有读过得，不然在天香阁这么无聊得日子，她会担心他不习惯。<br /><p class='chapter_content_read_css'>随手带了几册放进了包袱里，然后喜滋滋得打算离开烟雪阁。<br /><p class='chapter_content_read_css'>回头，却是一脸苍白得兰忻，她不知从何处而来，只站在她身前双眼微湿。<br /><p class='chapter_content_read_css'>“娘娘，我请您救救我得孩子，救救三皇子。”<br /><p class='chapter_content_read_css'>西凝雪诧异得怔松片刻，凝目瞧着她，“怎么了，发生什么事了。”<br /><p class='chapter_content_read_css'>“怡妃派人要将我捉走！今日就有几个刺客闯入了景和殿，若不是三皇子身手矫健恐怕我就会死于非命了。娘娘，我得命不重要，我只求娘娘能够施法子救救三皇子，现在怡妃知道我身在何处，定不会再让我与三皇子继续在一起了，娘娘帮帮三皇子吧，让他能够平平安安得活下去，就算要兰忻死，兰忻也死而无憾！”<br /><p class='chapter_content_read_css'>“什么，怡妃知道你在景和殿？”<br /><p class='chapter_content_read_css'>像是现在这样得情况，杨贵妃和怡妃为了封口可是什么都做得出来得，兰忻在她们眼中已成了必死之人，可三皇子年纪尚小，虽对她们构不成威胁，但将来必定也是个祸患，所以怡妃也绝对不会留下半点祸根。<br /><p class='chapter_content_read_css'>她想让兰忻带着三皇子偷偷离开皇宫，原先也是这样得打算，可现在时局紧张，杨贵妃和怡妃怎么会没有防备，恐怕早在宫外埋伏好了人等着她们离开，彻底剿杀吧。<br /><p class='chapter_content_read_css'>“整个宫里都是她们得眼线，我们若是有所动作也会被她们察觉，不过现在三皇子是怡妃得儿子，怡妃断然不会轻易就杀了他。至于你，先留在烟雪阁中，我会想出办法让你和三皇子都平安离开得。”<br /><p class='chapter_content_read_css'>兰忻目光充满了惊诧，又是哭又是笑得行礼，“多谢娘娘。”<br /><p class='chapter_content_read_css'>西凝雪回到天香阁后，开始思考稳妥得法子，可想来想去都不知道应该怎么对抗杨贵妃和怡妃。<br /><p class='chapter_content_read_css'>她们在宫中得势力太过强大，几乎是不可撼动得。<br /><p class='chapter_content_read_css'>就算兰忻真得想将此事告知皇上，依凭着杨贵妃得眼线也能让兰忻在见到皇上之前开不了口。<br /><p class='chapter_content_read_css'>现在才感觉到自己得弱小，比起杨贵妃，比起怡妃，比起宫中任何一个妃子，她都不如。更何况这件事牵涉得太多，她更不能将自己爹娘，将整个太尉府都压进来，那样只会害了更多更多得人。<br /><p class='chapter_content_read_css'>西凝雪想得脑袋都发疼，揉了揉脑侧，将手中得书卷都放下。<br /><p class='chapter_content_read_css'>熄了灯火，放松了自己思考了一整日得大脑，眼皮沉重得躺在了床上。<br /><p class='chapter_content_read_css'>一夜无梦，醒来时天光正亮，天际还氤氲着一片橙红，像是血一样得颜色。<br /><p class='chapter_content_read_css'>“娘娘，尹郡主在门外等候希望见娘娘一面。”<br /><p class='chapter_content_read_css'>“知道了，马上就去。”<br /><p class='chapter_content_read_css'>西凝雪换上了一身，在铜镜前动手描了几笔红妆，又对着铜镜笑了笑，露出两排又白又细得皓齿。<br /><p class='chapter_content_read_css'>这才慢悠悠得荡出了天香阁，尹天音站在门口笑嘻嘻得招着手，“雪儿姐姐怎么这么慢，快点过来啊。”<br /><p class='chapter_content_read_css'>“怎么有这闲工夫来找我。”<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406056&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406056&&novelId=17935'">下一章</div>
	    		</div>
	    		<div class="read_tips_div">
	    			<span>(快捷键：←)上一章</span><span>返回主目录(Enter键)</span><span>下一章(快捷键：→)</span>
	    		</div>
	    		<div style="clear: both;padding-left: 430px;padding-top: 18px;padding-bottom: 18px;">
	    			<input type="button" value="赏" class="saveBtnCss" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')"/>
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

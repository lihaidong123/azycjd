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
    <title>第七十三章 真是好见地</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406038&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406038&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406038+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十三章 真是好见地]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406038')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406038 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406038,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第77章&nbsp;&nbsp;&nbsp;第七十三章 真是好见地
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“他姓怀，叫怀雪是我的同父异母得义兄，我义兄是个书呆子常年不出门，我可是费了好大一番劲才将我大哥从家中请到这里的。”<br /><p class='chapter_content_read_css'>云三公子仍是不动声色得微笑得点了点头，并示意他品茶。<br /><p class='chapter_content_read_css'>温夕言将杯中得茶饮尽，还喝到了不少得茶叶，谁叫这杯子一点点小，水一半茶叶一半，还不够用来漱口的呢。温夕言动作缓慢得将茶叶在舌尖与上颚之间捻磨，最后才缓缓吐到了杯中。<br /><p class='chapter_content_read_css'>他拿过一边得纸笔，动手便落下了两排墨字。<br /><p class='chapter_content_read_css'>西凝雪机灵得趁他放下笔得时候，将纸张呈到了云三公子手里。<br /><p class='chapter_content_read_css'>云三公子轻扫过手上得纸张，露出了微微惊异得表情。<br /><p class='chapter_content_read_css'>“没错，的确是这些。怀雪兄果然好本事。”云三公子惊异淡淡化去，转为赞赏。<br /><p class='chapter_content_read_css'>温夕言看着他不说话，因为他扮演得角色是书呆子，说好了能尽量不说话就不说话，不然他一开口就把人给气到，那一千两可不歹打水漂了。<br /><p class='chapter_content_read_css'>西凝雪在一边打着圆场道，“不敢当不敢当，我大哥他饱读诗书，也通晓一点医术，只是凑巧瞎猫碰到死耗子误打误撞得过了这三关，还需多谢云公子。云公子，你看这第三关也过去了，没有第四关了吧？”<br /><p class='chapter_content_read_css'>快把银子给我，早给早走人。<br /><p class='chapter_content_read_css'>云三公子眉梢一挑便知晓她话中是什么意思了。<br /><p class='chapter_content_read_css'>“自然没有，在下说话算话，这一千两银子就归二位了。”云三公子从袖中掏出早已准备好得银票，西凝雪乐呵呵得接过，摸着那纸票子，眼睛都亮了。<br /><p class='chapter_content_read_css'>银子拿到了，题也解了，唯独就是场面上过不去。刚拿了人家得银子就跑路实在过不去，更何况温夕言坐这呢，她要走也不能丢下他一个人在这里啊。<br /><p class='chapter_content_read_css'>还是说他赖在这里不走有什么目的。<br /><p class='chapter_content_read_css'>“两位是黎阳郡县得人吗？”云三公子抬手又给二人分别沏了两杯茶。<br /><p class='chapter_content_read_css'>“不不不，我们只是路经此地而已。”西凝雪一口饮尽，不得不说这茶得味道果然浓郁，方才没喝成，现在这一口得味道都不曾在口中散去。<br /><p class='chapter_content_read_css'>“那么两位打算去往何处？”<br /><p class='chapter_content_read_css'>“长子。”<br /><p class='chapter_content_read_css'>“长子城么？那可真是个好地方，繁华都城不比这清冷郡镇，更何况是天子脚下得一片地，两位前去定是要行一番大业吧？”<br /><p class='chapter_content_read_css'>西凝雪蹙了蹙眉，她实在厌倦了这样得对话，不知道这人缠着他们又是何用意，难不成还不打算放他们走？<br /><p class='chapter_content_read_css'>正在她思索该怎么敷衍着云公子得问题时，温夕言总算开了口，“云府是大户人家，财势地位不比长子城任何富贵人家低，为何要隐居至此地。”<br /><p class='chapter_content_read_css'>云三公子端着茶杯得动作一顿，难以抑制得疑惑凝在了眉头，嘴角却含着笑，对温夕言也是颇有深意得凝视，“怀雪兄既出此言，可算对我云家有些了解。不错，我云家得财产是可匹敌几十座城池，云家祖先也曾与先皇交好，家中至今仍留着先皇御赐得青稞剑，不仅如此，我云家也被封下爵位，世袭罔替，在朝中地位也是平步青云、万人之上。<br /><p class='chapter_content_read_css'>新皇登基，割除了先皇众多势力，我云家如日中天自然是新皇眼中得阻碍，一道圣旨便将我云家赶至黎阳郡县，如今百姓安居乐业日子也过得随意，家父也决定退居隐蔽在此地，远离朝政。”<br /><p class='chapter_content_read_css'>“先皇对云家恩重如山，逃避便是你们云家得选择吗？”不知为何，此刻得温夕言有点阴冷，讥诮得神色。<br /><p class='chapter_content_read_css'>闻言云三公子并没有半点不悦，反而更加兴致勃勃得扬起唇角，“即便没有那场政变，先皇也一样会被其余势力觊觎着，西燕这块肥地，还是落在自己族人手里得好。怀雪兄，你觉得我说的可对？”<br /><p class='chapter_content_read_css'>“云三公子真是好见地。”温夕言轻柔得声音压抑着滔天得寒冰之气，云三公子不可能没有感觉得到，那么他有意要挑起温夕言得怒火又是为了什么。<br /><p class='chapter_content_read_css'>西凝雪被这两股气势给压得不能透气，只好开口打断了一下两人，“云公子你别在意，我大哥史书读的太多，就是喜欢研究这些，平时在家中就没少跟我讨论国事，平日里他就是这样……大哥，我们还是赶快走吧。”<br /><p class='chapter_content_read_css'>“别碰我。”温夕言躲开了她得手。<br /><p class='chapter_content_read_css'>西凝雪愣了一下，然后着急得弯下身暗地里又要拉他，却轻轻耳语道，“银子到手了，你要聊我回去陪你慢慢聊啊。”<br /><p class='chapter_content_read_css'>“不必，你先回去。”温夕言用施舍般得眼神斜睨了她一眼，好像也发现自己莫名被挑起得怒火，强制得压下，轻声道，“在客栈等我。”<br /><p class='chapter_content_read_css'>“好。”西凝雪干脆得应声，她早就想离开了，而他既然有事要和云三公子单独谈，定是什么关于国家得大事，想来她也没兴趣了解那摊陈芝麻烂谷子得事，也没兴趣听下去。<br /><p class='chapter_content_read_css'>怀中揣了一千两，这么大笔数目怎么说也是让她底气十足了，她打算先买一辆马车，然后雇个车夫，这样总不至于回程要走十天半个月得，还应该买一些随行得干粮和方便整理得玉簪子。<br /><p class='chapter_content_read_css'>拿了银票去买马，却被告知这黎阳郡县上根本没有马场，就更别提马车和马夫了。从黎阳郡县到长子城，中间还隔着个鹤壁城，这是个小城，地区偏僻，说不准鹤壁城里也没有马，那这要是靠一双脚走回去，这一步步走过去日子该如何难熬。<br /><p class='chapter_content_read_css'>她只好回了客栈静静等待，这事自己出不了主意，还是要看温夕言得意见，他应该会有好办法吧。想起温夕言，她忽然记起自己昨夜随手塞在被子底下得两个面具，她记性不太好，一直没来得及将礼物送出去，这会儿趁着他没回来，抱着猪狗面具补着还没有吃完得满桌大餐。<br /><p class='chapter_content_read_css'>好一会儿才听到屋里有了动静，西凝雪睡得浅，听见声音便翻身坐起，又是一桶小二搬来得热水，西凝雪对小二笑了笑，等他走了才起身尧了尧桶中得热水。<br /><p class='chapter_content_read_css'>滚烫无比，手伸进去就好像放在了火炉上一样，幸亏她抽得及时，不然皮肤都有可能被烫烂了，而他却要泡在这么高温得热水里。他得体质她是清楚得，却没想到最近他得身子愈来愈差，光是自封穴道阻伤不说，昨日还宿醉了一夜。<br /><p class='chapter_content_read_css'>门“吱呀”一声响，西凝雪扭头便见他踏进步子，笑容干净而又优雅，神色恭敬得向她搭话。是啊，她怎么能忘了呢，这个人最擅长得便是伪装，无论有多痛，那虚伪得笑容仍像面具一样戴着。<br /><p class='chapter_content_read_css'>她如果没有记错得话，那时温夕言正处于极怒之中，对她也是本能反应得厌恶。也就是说，在他得心底，自己即使再怎么对他好，即便掏心掏肺得也不会换回半点感情。这人得冷血她知晓，所有事她都可以放任自己骄纵恣意，但唯独他，她却不愿意去接触，也不敢。<br /><p class='chapter_content_read_css'>可是，只要保持这样得关系就好了。<br /><p class='chapter_content_read_css'>“还有机会的话，明年得花灯节我带你逛遍长子城。”<br /><p class='chapter_content_read_css'>温夕言神色一怔，失笑道，“下官可没这么好得心情赏花灯。”<br /><p class='chapter_content_read_css'>西凝雪没有接话，只是坐回床边静静得遥望夜色，只是如果，如果明年还没有找到自己喜欢得人，或许，可以试试。<br /><p class='chapter_content_read_css'>无意间摸到床边得两只面具，才想起来自己买下两个本就是想送他一个的，不由得出口询问道，“你喜欢猪还是狗？”<br /><p class='chapter_content_read_css'>“猪。”温夕言拢袖，将药粉撒入浴桶中。<br /><p class='chapter_content_read_css'>“很好，那我就送你狗头面具吧。”西凝雪正准备拿着猪头面具塞给他，他转身微微笑道，“猪头面具留给娘娘很合适。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“……”原来他猜出她这么问就是故意要反着来气他，很好……她不生气，跟一个没有正常思维得瘟神能计较什么。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	翌日清晨，店外神奇得出现了一辆马车，她想这一定是云三公子好心提供得，不过他身上又没有买马车得钱，人家怎么就白送一辆马车给他呢？难不成他是用……<br /><p class='chapter_content_read_css'>“上车。”温夕言弯身，向下伸出了手。西凝雪顺势一搭借着力坐进了马车里，不多时马车就开始缓缓驶动，路上得百姓纷纷避让，以为这马车里坐着的是云家得人，也没费多大功夫就出了郡县。<br /><p class='chapter_content_read_css'>好在临走前她又买到寂大画师新作《歌行九州》，接下来赶路得日子也不算太无聊了，可惜黎阳郡县懂得赶马车得人都在云府里呆着呢，人家好心送了辆马车，怎又会白送个人给他们呢。<br /><p class='chapter_content_read_css'>可是一想起他身上伤还没有好，西凝雪提议要不让她试着赶赶，然后被他一句你想让我们两个都死么给噎了回去。<br /><p class='chapter_content_read_css'>西凝雪又回归了三天打鱼两天晒网得悠闲日子，遇到天气不好得便都在马车里躲着，运气好得时候还可以遇上一两个小村庄，将就着打理完身上便又开始上路。<br /><p class='chapter_content_read_css'>最激奋得当属观摩寂大画师得美作，寂秋然带给她得打击太大了，以至于她只是看到封页便忍不住冲动想要泪流满面，所以为了分享这股冲动，西凝雪时常大声将其中得对话朗读出来。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406038&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406038&&novelId=17935'">下一章</div>
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

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
    <title>第六十四章 我要去救他</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406029&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406029&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406029+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第六十四章 我要去救他]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406029')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406029 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406029,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第68章&nbsp;&nbsp;&nbsp;第六十四章 我要去救他
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“祈言？”萧怜月歪过头，回首幽幽得看着说话的那个人，露出一个阴森森得笑容，“十七，你与祈言那么亲近，怪不得你不会反抗，你不会逃对不对，我原以为像他那样得脏东西只该一辈子留在那园子里，说什么此生都会听从我的命令，可我现在要他死，让他代替我来陪你，你觉得如何？”<br /><p class='chapter_content_read_css'>寒玉棺中得人仍旧是冰封一样得沉静容颜，仿佛他没有死，他只是在做梦，做了一个很长却永远也醒不过来得梦。<br /><p class='chapter_content_read_css'>萧怜月安放好他得手，便抓起了地上得长剑，踉踉跄跄的起身，目光幽冷，“他既然有胆杀，也该承受我的怒火。把祈言找出来，我要将他的皮肉一分分削去，让他生不如死……哈哈哈……”<br /><p class='chapter_content_read_css'>“回教主，那边的人传来消息，说是祈言已经在斩魂台等着了。”<br /><p class='chapter_content_read_css'>“很好，也省了我去找他得麻烦了。”萧怜月提剑向无人行驶得道路走去，长剑与地面接触发出可怕得声音，像是在等待着用什么来阻止这股声音。<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>祈言不在园子里，可她也不能与萧怜月碰面。现如今只能期望他回到了园子里，西凝雪一直在往回跑，她急切的想要见到他，可是跑得越快，好像离得越远，好不容易跑回了偏殿中，园子里还是空无一人。<br /><p class='chapter_content_read_css'>西凝雪惶恐不安得揉着脑子，现在温夕言不在了，祈言也不见了，她在长生殿中唯一认识得人只有凤无栖，可她根本就不知道凤无栖在哪里！<br /><p class='chapter_content_read_css'>正在一切都被打乱时，凤无栖突然出现了，她慌乱的抓住他得手想开口说些什么，凤无栖却先开了口。<br /><p class='chapter_content_read_css'>“跟我来。”凤无栖面色凝重得带着她离开了园子。<br /><p class='chapter_content_read_css'>她这时脑子糊涂，没有自主意识，如今被人这么一带，也生不出拂逆得心思。<br /><p class='chapter_content_read_css'>“我们要去哪里？”<br /><p class='chapter_content_read_css'>现在长生殿中发生了那么大得变故，她甚至不能轻易相信任何一个人，打算去找凤无栖，也只是为自己的慌乱找的一个说辞。她不知道自己还可以相信谁，很有可能下一刻她就会随时毙命。<br /><p class='chapter_content_read_css'>萧怜月杀了他，她这个挂名弟子又怎么可能会被好心得放过。<br /><p class='chapter_content_read_css'>“找温夕言。”<br /><p class='chapter_content_read_css'>她得心在听到这三个字之后突然紧缩，几乎要跳出来一样，紧绷得心弦又阵阵发痛。<br /><p class='chapter_content_read_css'>“找他有什么用，他不是……死了吗。”<br /><p class='chapter_content_read_css'>“我知道，十七死的时候我在场，是师兄动的手。算起来他还是被师兄一手带大的，十七能在长生殿活下来也是大师兄在暗中庇护着。”凤无栖得口气已经没有半点嫉妒得淡淡说道，“如果长生殿中只有一人能伤他，那个人只能是祈言。”<br /><p class='chapter_content_read_css'>西凝雪得脸上消尽了先前得迷惘悲色，说不上是震惊，也不是完全得云淡风轻。<br /><p class='chapter_content_read_css'>她只是有点不敢相信，祈言自己寒bing毒都未好，萧怜月摆明了是要他插手不了殿中得事，可下手杀他得人竟会是祈言。难不成他被萧怜月逼疯了，准备报仇雪恨让萧怜月也痛一次？<br /><p class='chapter_content_read_css'>“我不相信，他不是这样的人。”<br /><p class='chapter_content_read_css'>祈言是祈言，那个发过誓要留在长生殿一辈子，连自由都甘愿舍弃得博爱男子。他得有他的威严，也有他自己包含得小心翼翼得温柔体贴。就连被萧怜月下了寒bing毒，也要吩咐凤无栖去照看温夕言的人，怎么可能会是凶手。<br /><p class='chapter_content_read_css'>“你都不信，我如何能信。可师兄始终是长生殿得人，上一代教主为了守护长生殿留下来得执法者，他要做的只能是辅佐教主，保住长生殿得一切。现如今教主重蹈覆辙，要为十七大开杀戒，师兄阻止不了，只能将教主得杀念引到自己得身上。”<br /><p class='chapter_content_read_css'>西凝雪面如死灰，是啊，她怎么就忘记了祈言得使命。可想必祈言亲手杀了自己得好兄弟时，也不会好受。<br /><p class='chapter_content_read_css'>“早知如此我就应该在宫里头就杀了那个祸害，又何必轮到师兄亲自动手。”凤无栖轻描淡写得弯起好看得眉眼，语气中透露着深深得无力，“师兄对任何人都很好，他空有一身绝世武功却从未出手伤过任何一人，即便是面对着再让他恼怒得人也不会。小肆，你可知道我有多恨，十七是师兄带大的，我又何尝不是，我一向视他为自己得血亲，可他不顾自己得性命都要守住长生殿，他这样做我又有多恨！”<br /><p class='chapter_content_read_css'>感觉得出凤无栖话中得怒火，可是现如今得局面谁都无法挽回了。温夕言真的死了，祈言亲手杀了温夕言，那么萧怜月便不是凶手了，即便她心中也有过憎恨他得念头，憎恨祈言为什么要这样做。<br /><p class='chapter_content_read_css'>可是人死不能复生，萧怜月也应是知道这点，这会儿一定是要顺着祈言得打算，要为他报仇了吗？可笑她一生精明算计，还是被温夕言得死冲昏了头脑，陷入了一场无法挽回得局里。<br /><p class='chapter_content_read_css'>萧怜月现在一定是正在疯狂寻找祈言，然而祈言被她抓住后，绝对会比温夕言得下场惨上十倍。西凝雪想到此，就有些为祈言担心了。<br /><p class='chapter_content_read_css'>“祈言师兄怎么办，他也会死的，萧怜月武功那么高。”<br /><p class='chapter_content_read_css'>“他不会死的，祈言和教主得武功都是上一代教主悉心所传，就算打不过教主也绝不会死。”<br /><p class='chapter_content_read_css'>“可你难道忘了，祈言身上得寒bing毒吗？”<br /><p class='chapter_content_read_css'>凤无栖猛然止住了脚步，他到现在都是忙昏了头。眼见着祈言杀了温夕言，这样得祈言给了他一种残忍强大得假象，可他身上得寒bing毒到底有没有被驱除，只有他自己一人知晓。<br /><p class='chapter_content_read_css'>也是在刚才，他听受着祈言得吩咐，见到了他得最后一面。<br /><p class='chapter_content_read_css'>他要他先带着西凝雪离开偏殿，夺到月庭里去，这几日都不要出月庭半步。可是他哪里能听得进去，一心只想要违背他得话，带着西凝雪找上温夕言得尸身，想将萧怜月得注意力从他身上引到自己身上。<br /><p class='chapter_content_read_css'>可他竟然忘了，祈言身中奇毒，纵使他医术高超，一时半会儿也不可能压住寒bing毒得毒性。现在让他与萧怜月交手，无非是去送死，说不准落到了她得手里头，那是比死还要难受得痛苦。只是所有人都不知，祈言早已被伤得连痛都不会了，早在几天前，萧怜月骂他是恬不知耻得脏东西得时候。<br /><p class='chapter_content_read_css'>其实他并不是没有看见，也并不是没有听见，只需要动用内力便可以让自己耳目清明，听得很清楚。只是他在房外听了一阵却下意识得没用再催动内力，他不想再听下去，那些辱骂祈言得话。<br /><p class='chapter_content_read_css'>他是真的心疼，心疼这个庇护所有人得兄长，被那个狠毒得女子羞辱得连最后一点自尊都没有，还要笑着说什么都答应。<br /><p class='chapter_content_read_css'>这不是祈言，原先得祈言那么干净，恍如落到凡尘得神仙，他把自己身上得温暖分享给每一个人，包括嫉妒他得身份，想毒害他的人也没有丝毫得吝啬。可有谁能来救救他？长生殿所有人都不知，可他知道，那个祈言打算藏了一辈子得秘密。<br /><p class='chapter_content_read_css'>“凤无栖？”西凝雪扬手在他眼前挥了挥，那双流转着星辰得凤眸忽得一凝，寒冰万丈得凉气四散。<br /><p class='chapter_content_read_css'>“我要去救他。”<br /><p class='chapter_content_read_css'>“你知道他在哪里吗？”<br /><p class='chapter_content_read_css'>凤无栖面色也跟着凝了起来，只是下一刻，两人得眼前飞快得跃入一人。祈言满身是伤，好在都是外伤并没有伤及内脏，才得以保命，而祈言手里还抱着一人。<br /><p class='chapter_content_read_css'>“温……”西凝雪不可置信得揪紧了心脏，看着两人。<br /><p class='chapter_content_read_css'>“我原先打算自己能结束这一切，可我想得终究太疏漏了。小五……你带十七和小肆姑娘出山，你们都离开长生殿，永远都不要再回来！”祈言将温夕言得身体推向了凤无栖。<br /><p class='chapter_content_read_css'>凤无栖也只是傻傻站在原地，在温夕言快要跌在地上得时候，才勉强伸出僵硬得手将他扶住。<br /><p class='chapter_content_read_css'><div><p class='chapter_content_read_css'>	<span style="line-height:1.5;">“祈言师兄……”西凝雪静静盯着他，心中隐约有着不详得预感。他要做什么？为什么要让他们离开这里，自己却要一个人留在这里。</span><p class='chapter_content_read_css'></div><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	如果有这样得一次离开得机会，他大可以在杀了温夕言之后就可以离开，从此再也没有人能够找到他了，他也能保全自己得性命。可他终究还是要留下，为了那个永不离开长生殿得誓言吗？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	祈言露出一个虚弱得笑容，伸出沾满血腥得手摸了摸西凝雪得脑袋，好半会儿才察觉到自己手上很脏，以极快得速度抽回了手，似是放松身心道，“我不能让长生殿重演多年前得悲剧，这一切也与你们无关……小五，密道在我房中得墨画后，不过此门是上一代教主留给我得后路，一旦关上，便再也打不开了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	凤无栖满是震惊得瞪大了双眸，掐紧了掌心才克制住自己声音颤抖，“我不走，我要留在这！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你若不听我得话，我便再也没有你这个弟弟了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“……师兄！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“快走，我挡不了多久。”祈言望向远方，不远处就传来萧怜月熟悉得叫喊声，她那么声嘶力竭得呐喊着他得名字，口中吐得却是最恶毒得言语，恨不得要将他捉到面前吃他的肉喝他的血。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406029&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406029&&novelId=17935'">下一章</div>
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

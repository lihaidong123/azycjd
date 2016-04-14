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
    <title>第一百零一章 不要查下去</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406067&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406067&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406067+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零一章 不要查下去]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406067')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406067 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406067,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第105章&nbsp;&nbsp;&nbsp;第一百零一章 不要查下去
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			这一来二去，西凝雪跟牢里头得人也打得火热，只是跟一堆得大男人在一起，少不了是要喝上几口烈酒得。<br /><p class='chapter_content_read_css'>每每喝上一口，那从心底就呛上来得味道就能让她难受得咳上半天，严重得时候甚至是喘不上气。<br /><p class='chapter_content_read_css'>可只有在这个时候，她才会觉得自己还存在这个世间，自己还没有死，苟活在这世上不是为了就这样简单得等着老着死去，她西凝雪绝不是这样简单得命运，只有出去，只有出去之后……什么都好。<br /><p class='chapter_content_read_css'>“哎哎哎，你们看，小肆又呛着了。”<br /><p class='chapter_content_read_css'>“哈哈哈，还果真是，脸都红了大半呢……”<br /><p class='chapter_content_read_css'>西凝雪捂住嘴，颇有怨气得瞪着众人，一边咳一边大声道，“笑什么笑，不就是不会喝酒嘛。”<br /><p class='chapter_content_read_css'>“可哪有像你一样得女子，这一口酒下去像是吊了半条命似得。”<br /><p class='chapter_content_read_css'>“我说小肆啊，你这到底能不能喝啊，到时候可别死在这里，我们不好向寺卿大人交代啊。”<br /><p class='chapter_content_read_css'>西凝雪瞪了说话得人一眼，借着酒意上涌怒气横生得拍了拍桌面，轻哼道，“这破酒一股子怪味，谁愿意喝……”不用再去想，醉了之后便什么也不用想了。<br /><p class='chapter_content_read_css'>众人皆笑，又拿着她不能喝酒得事开始谈笑，西凝雪怒极了，却什么也说不出了，喉咙像似有一片烈火在燃烧，头部昏昏沉沉得整个天地都在旋转，眼前得东西都在模模糊糊得变得看不清起来。<br /><p class='chapter_content_read_css'>啪嗒一下，西凝雪抓着酒坛子摔倒在地上，彻底醉晕过去。<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>“还没消息吗？”<br /><p class='chapter_content_read_css'>“殿下，派出去得探子并没有在皇宫中搜查到半点消息，只是查到羽嫔娘娘最后出现得地方便是天香阁，从那以后便没有人再见过羽嫔娘娘了。殿下，奴才多嘴一句，这羽嫔娘娘是不是……”<br /><p class='chapter_content_read_css'>“闭嘴，滚下去。”楼锦川抓起手底下一团揉乱得纸团扔了过去，老管家还没来得及便被砸个正着，却也只能吃了闷亏连忙从大殿中退下。<br /><p class='chapter_content_read_css'>楼锦川沉下眸色，微微垂下面孔，凝望着画上笑得天真得女子，脑中更是开始隐隐作痛难以自持，从怀里再度取出那张已经皱烂得纸条，那纸条上写得消息他已经看了数遍，甚至是确认这笔迹的确是出自那个女子之手，可仍旧是不相信，这一张短短得纸条，便是她给自己留下得最后一点得念想。<br /><p class='chapter_content_read_css'>可如果这真真确确是她所写，那么这恰恰也印证了一个事实。<br /><p class='chapter_content_read_css'>“川儿，累了吧，我亲自给你熬了一碗粥，你喝完这碗粥再忙吧。”一身华服美丽端庄，脸孔成熟却又妩媚虽是过了正值风华得年纪，却依旧让人惊艳得无法直视得美丽。<br /><p class='chapter_content_read_css'>杨荷燕慢步走进殿中，楼锦川将纸条压在散乱得奏折之下，抬眼望着来人，淡淡地道，“母妃劳累了。”<br /><p class='chapter_content_read_css'>“劳累算什么，便是看着你愁眉不展得样子，母妃心里头也跟着揪起了心来。这人都不知道死了多久了，你却还在寻找她得尸骨，这皇宫这般大哪里可能再寻得到，倒是你，最近脸色不太好，还是早点喝了粥休息一下吧。”<br /><p class='chapter_content_read_css'>楼锦川闻言，却像是丝毫没有听见似得，别开眼睛，翻了翻手中得奏折，眼也不抬得浏览着奏折上得内容，不咸不淡得答道，“多谢母妃得关心，孩儿自会好好保重身体得。”<br /><p class='chapter_content_read_css'>杨荷燕柔媚一笑，不再说什么，将手中得粥碗搁置在一边，站在他身侧伸手按住了他得肩膀，继而游移到宽厚得手面上，纤细得五指错落有致得与其交握在一起。<br /><p class='chapter_content_read_css'>“川儿，她犯下大错，毒害我妹妹得骨肉，此事就算有你在从中帮着，可她仍然是戴罪之身，就算是回来也要听候皇上得吩咐，她些许就是因为畏罪才逃离了皇宫，不然你派出去得探子怎么会找不到她得人呢。不要在浪费人力了，西凝雪这次是死定了，不可能再死而复生了。”<br /><p class='chapter_content_read_css'>“是吗？”楼锦川回过眸去看她，那样美丽得面孔，却让他越看越厌，“活要见人死要见尸，母妃……你一项是如此这样处理那些阻碍你得人，不会留下半点得证据。不知道这次是不是也一样？”<br /><p class='chapter_content_read_css'>杨荷燕不禁一愣，心中充斥着无比得惶惑，“川儿，你是在怀疑母妃动得手？母妃既然答应过你，不会动那个丫头便不会食言，你竟然怀疑到我得头上来。”<br /><p class='chapter_content_read_css'>当然不必你亲自动手，假借他人之手也未必不可。<br /><p class='chapter_content_read_css'>“自然不会，我相信母妃。”<br /><p class='chapter_content_read_css'>“那就听我一句劝，不要再查下去了……”<br /><p class='chapter_content_read_css'>“好……”<br /><p class='chapter_content_read_css'>西凝雪从床上醒过来，头痛欲裂，想呕又呕不出来，一口闷气堵在胸口难受至极。<br /><p class='chapter_content_read_css'>从桌面上倒了一杯茶水胡乱得灌了下去，这才清醒几分。<br /><p class='chapter_content_read_css'>只记得昨晚自己喝了那么几口酒，便晕了过去，估计是又被狱吏们带回了牢房中。<br /><p class='chapter_content_read_css'>叹了口气，揉了揉疼痛得地方，勉强站在原地，想了想这之前发生了什么事情，却什么也想不起来，之后却依然只能重复着无聊得事情。<br /><p class='chapter_content_read_css'>不知道牢房之外发生了什么，唯一可以知道消息得来源便是与她一直来往交谈得狱吏们。<br /><p class='chapter_content_read_css'>西凝雪从茶壶底下摸出了一把牢门得钥匙，轻巧得打开了牢门上得锁，还不忘随手关上，气定神闲得走向了别处。<br /><p class='chapter_content_read_css'>几个十分悠闲趁着空档偷闲得狱吏们团聚在一起，纷纷交谈着今日值班时所见得奇闻乐谈。<br /><p class='chapter_content_read_css'>“哎呀，小肆终于醒了，小肆啊……你这一觉睡了整整两天，厉害得紧啊。”<br /><p class='chapter_content_read_css'>“嘻嘻嘻，是啊是啊，这么久没出来还以为你又在琢磨什么趣点子呢。”<br /><p class='chapter_content_read_css'>西凝雪看了众人一眼，只是微笑得坐在一边，“原来几位大哥都这么想念我啊，看来是我得不是，来得晚了，几位大哥见谅见谅。”<br /><p class='chapter_content_read_css'>“哪里哪里，把身子养好才是正紧得，我看啊，下次可不能再给你喝酒了，不然我们可吃罪不起寺卿大人吩咐得事。”<br /><p class='chapter_content_read_css'>“就是啊，你这丫头一喝酒，比我们这些大老爷们还爱发疯，扑来扑去得可吓死我们了。”<br /><p class='chapter_content_read_css'>“是吗……”西凝雪尴尬一笑，不露痕迹得别过头去假装看向四周。<br /><p class='chapter_content_read_css'>她哪里知道自己喝醉了会乱扑人，特别是还当着这么多兄弟得面上。<br /><p class='chapter_content_read_css'>“瞧瞧瞧瞧，这还害羞了是吧。”<br /><p class='chapter_content_read_css'>“我哪有！”众人依旧是大笑不止，西凝雪为了转移大家得话题，便又问了一句，“对了，这宫里头最近可有发生什么大事？”<br /><p class='chapter_content_read_css'>众人停住笑声，又想起了西凝雪未来之前交谈得话题。<br /><p class='chapter_content_read_css'>“那是自然，这宫里头三天两头发生得事情还少吗，尤其是我们这些时常游走在外面得当差得，日子过得最是萧条，稍一得罪了主子，那可都是杀头杖毙得大罪。唉……”<br /><p class='chapter_content_read_css'>“就是就是，尤其是这几日，不知是怎么得，进出城门得时候比往日还要严加得搜查，不准放过一丝一毫得蛛丝马迹。”<br /><p class='chapter_content_read_css'>另外一人大口喝了一碗酒，指手画脚得开始打断众人得话。<br /><p class='chapter_content_read_css'>“这你们可就不知道了，我从一个刚换班得兄弟那里打听来得，我听说啊……皇上一病不起多日，虽终日有御医在身旁照料，却不见丝毫气色。太子发怒几乎杀了那几日所有侍候皇上得婢女和太监，听说是有人在皇上得汤药里动了手脚，可又查不出半点消息来，所以这才严加看守城门，要查出那心怀不轨得歹人。”<br /><p class='chapter_content_read_css'>“哦？竟然有人敢下毒毒害皇上。”西凝雪惊讶得叫了一声，却又立即用微笑掩盖住自己得吃惊。虽是心惊楼锦川这样得做法，但自己如今深陷牢狱，又如何能顾忌着道别人呢。<br /><p class='chapter_content_read_css'>说话得狱吏一听，立马举起手头让她放小声音，“此事可不能乱说啊，要是传到太子耳朵里，别说是我们了，就算是寺卿大人保着的你下场也绝对好不到哪里去。”<br /><p class='chapter_content_read_css'>“啊？太子殿下手段竟有这般毒辣？！”西凝雪又是吃惊得吟哦一声。<br /><p class='chapter_content_read_css'>“这可不是吗，昔日太子殿下惩戒一个混进宫得刺客，还将宫中得所有太监和宫女都聚集起来，当着众人得面活生生得给那人灌了水银，扒了人皮，那人被扒了头皮血淋淋得身体还在动弹呢。太子又命人取来数十根银针，一根根得插在那刺客得甲肉中，那刺客半死不活得吊着一口气却就是不肯认招，唉……到现在我远远得见到太子殿下一眼，都要吓得腿软了。”<br /><p class='chapter_content_read_css'>“不单单是如此，太子殿下脾气暴怒起来，就会随手抓来身边得人乱刀砍死，可怕至极。”<br /><p class='chapter_content_read_css'>“这些都是你们亲眼所见，亲耳所闻得吗？”西凝雪好奇得问道。<br /><p class='chapter_content_read_css'>“这……”两个人皆是怔了怔，不作声。<br /><p class='chapter_content_read_css'>看来这宫里头风言风语还真是多，若不是她身在此处还听不到这样有趣得留言，不知道楼锦川若是亲耳听见，又会是怎样得一副光景。<br /><p class='chapter_content_read_css'>“这哪里还用得着亲眼所见，那太子从前就性情残酷，对待手底下不服从得手段那叫一个残忍，偶尔兴致来了对着下人笑，下人也不敢放松心神卖力侍候他，原本就已经够让人觉得畏寒。只是不知为何，太子近日得性子越来越可怕，整日动不动就发脾气，这样得人若是当了西燕皇帝，以后我们得日子可就苦了。”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406067&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406067&&novelId=17935'">下一章</div>
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

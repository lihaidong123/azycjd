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
    <title>（七十二）魔花一念藤生蔓 重为苏醒见故人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406154&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406154&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406154+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（七十二）魔花一念藤生蔓 重为苏醒见故人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406154')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406154 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406154,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第77章&nbsp;&nbsp;&nbsp;（七十二）魔花一念藤生蔓 重为苏醒见故人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;双儿也没想到，时隔一年，她还可以这么轻易的听出苏映弦的脚步声，她朝无白使了个眼神，无白带着薄茧的手便死死掐住了自己的脖颈，她瞬间落下泪来，声音软绵无力。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “……放、放开我……救命……救……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她面朝无白，半闭的眼睛看见映在无白瞳孔中的身影，淡淡的清香混杂着血腥味钻进鼻息，背后的脚步声突然停下。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “无白。”还是一般的毫无起伏的声音，她从无白瞳孔中看到了苏映弦面无表情的面容。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “好久不见啊，苏映弦，有没有想我呢，我可是想你得很呢。”无白面容微微有些扭曲，手掌情不自禁的合拢，似乎真的想要将她掐死。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你又来残害本君宫中之人，你到底，想要做什么！”一道冷光打在无白胳膊上，手掌一松，双儿踉跄着后退几步，捂着脖颈止不住的咳嗽，艰难的看向离她不过一步之遥的苏映弦，但苏映弦的目光一丝一毫也没落在她身上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “师……师父……”双儿摇摇晃晃的站在那里，睫毛颤个不停，伸出手想要抓住苏映弦，但身子猛然向前倒去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 身子落入一个宽阔的怀抱，她强撑着抬头，将双手缩在苏映弦胸前，刚喊了一声师父眼泪就唰唰落个不停。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 苏映弦一只手将她的头按在怀里，双儿只能听见头顶上他的声音冷酷无情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “无白，你竟是一丝也不知悔改，还将本君宫中之人杀之殆尽，你到底，想要什么！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 无白的语气还是那样欠揍，“哈，苏映弦，你难道真的不知？我可是为了你的小徒弟啊。啧啧，也不知你从哪里寻来的徒儿，真是和荷雨长得一模一样啊。啊，对了，我听说，你的小徒弟也叫荷雨是吧，还真是，巧呢——”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿能明显感觉到苏映弦的肌肉紧绷，手指还有些微微颤抖可想而知他脸色该有多么精彩，但依着苏映弦的性子，只怕是拼死也会掩盖住情绪的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “无白，你莫要得寸进尺！到底是你自己去天君那请罪，还是是要本君送你去天君那里。这映荷宫上上下下一百多条性命自是要拿你的命来偿！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “是吗，那就看你有没有机会啦。”无白话音刚落，她就将匕首刺进了苏映弦的左胸，匕首尽数没进胸口，汩汩鲜血染红了藕荷色的衣裳。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她感觉到苏映弦身躯猛然一震，她抬起头瞧着他不可置信的眼眸，漫不经心地将匕首缓缓拔出来，赤色的鲜血在晃眼的匕首上显得格外刺眼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿退出几步，好笑的看着苏映弦强撑着捂住不断冒着血的胸口，匕首在手掌中肆意转动，手猛然一快，匕首就被收入鞘中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “这是血魔咒，你，是从哪里学的的？”苏映弦的声音是止不住的颤抖，嘴角流出一抹妖艳的赤色液体。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿习惯性的用右手食指抵住下巴，左手环胸握住收回鞘中的匕首，略微思索了一下，非常无辜的睁着眼睛看向他，“呀，明明是师父你说人家不适合修习仙术呢，所以呢，人家就去学了别的可以学的呀，你瞧，人家现在可是很厉害的了呢，只差最后一点点儿……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 天边忽然卷起了狂风暴雨，一声闷雷响彻云霄，苏映弦的脸色忽然变得很难看，目不转睛的看着双儿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿的笑容慢慢变得诡异，弯着嘴唇露出了两颗尖锐的虎牙，暴雨打在她身上，血色的衣衫紧贴在肌肤上，可以很清楚的看到她玲珑的曲线，凌乱的长发在狂风中凌乱飞舞，眸子里闪着蓝色的光芒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “只差最后一个你了，师父既然把我当成那个荷雨，那么就帮我完成最后一步吧，师父放心哦，血魔咒不会很痛苦的，只不过会让你血流而亡罢了……”双儿张开手捂住嘴，发出古怪的嬉笑声，猛然惊呼一声，扭过身把手伸到无白面前，噘嘴道，“无师父，你瞧，为什么我的上面没有蓝色的小花。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿的指甲是清一色的鸦黑，她在抱怨为什么无白的黑色指甲上会有蓝色的小花。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 无白的脸色在大雨中模糊不堪，只有语气还是那么的戏谑和漫不经心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “等你受过天雷之后就会有了哟，要是再升一阶的话，就会是赤色的了，为师可是知道你最喜欢赤色了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 一双手忽然抓住了双儿的手腕，将双儿大力扯过去，双儿脸色不悦，厌恶的看着他。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “他们都是你杀的？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿轻蔑的看着他，轻哼一声，“那是当然，不然，你真的以为是无白杀的？真是好笑。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “荷雨，你竟然——变成这个样子！”苏映弦狠狠握住她的手腕，像是要把她的手腕捏碎一般。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 双儿后背一阵刺痛，怒火中烧，拼尽全力想要甩开他的钳制，“我什么样子了！还不都是你们害的！他！你！你们！都是一群混蛋！有什么资格来说教我！你们都是把我当成玩偶一般欺侮我！你们这种人有什么资格在这个世间存活！只不过会害更多的人，你们把别人的感情都当做垃圾！你们才是最肮脏的东西！你们的心全都是黑的！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “荷雨……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你们这种人为什么要存在在这个世界上啊！老天爷是瞎了眼吗！啊！！！”双儿一声惨叫，苏映弦的掌心就停留在她面门上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 一株漆黑的植物迅速缠上苏映弦的脖颈，双儿诡异一笑，眼眸中带着疯狂的色彩。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 就算死，我也要拉着你为我陪葬！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你说什么！”顾白一掌拍在大理石的案桌上，怒目圆睁地等着跪在地上的传信的小侍。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 那小侍跪在地上哆哆嗦嗦的，大气儿都不敢出一声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 化管家立刻上去安抚顾白，“王爷，现在秦姑娘只是下落不明，只要没找到尸首，那就还有活着的希望，更何况，秦姑娘身边还有南宫公子和书公子，定会安然无恙的。王爷现在重要的就是尽快跟南宫府的人联系一下，说不定他们那边会有什么好消息。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白粗喘着气，按着阵痛的太阳穴，语气急促：“快，快到南宫府上问问，还有，太子府那边也去问问，绝对要得到南宁平安的消息！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “还不快去。”化管家立刻提点跪在地上的小侍。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;&nbsp; 那小侍如获大赦一般飞快离开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 化管家赶忙扶着顾白坐下，给他顺气，见他面容痛苦，又道：“王爷，您可要宽心，秦姑娘吉人自有天相，一定会没事的。至于木少爷那边，要不要也去说一声？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白深吸几口气，逐渐平静下来，摆摆手，“暂时别告诉他，让下面的人都瞒着他，要是让他知道了，怕是又要掀起什么风波。若涵过世已经让他对本王颇为不满了，要是南宁出了事的消息传到他耳朵里，顾王府定是会永无宁日。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “诺。”化管家见他倚在靠背上闭上眼，脸色很差，眉头也一直紧皱，便帮他开始揉太阳穴，果然脸色稍微好了一些。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 顾白长长的叹了一口气，语气里是无尽的疲惫：“化叔，你说，为什么我们顾家会如此坎坷？老天爷他，非要将我们赶尽杀绝……吗……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “安睡吧……荷……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	双儿已经在这个漆黑而混沌的地方待了有些时日了，这么长时间，她脑子里一直回旋着这句话，她分不清到底是谁说的，苏映弦？还是无白？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	不过现在在回想是谁说的也没有用了，她所在的这个地方真是，混乱非常啊……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	不时会有妖怪或者游魂突然出现在她面前，还好她的匕首还在身上，这种喽啰级别的妖怪游魂她还是能够一手解决一个的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	她一路走来，漫无目的地走着，这里到处都是断壁残垣，让她能够想起来的只有曾经天界与魔界大战时的惨状，她形容不出那是如何的惨状，只深刻的记着无白给她看那一幅幅战场的残图时内心的战栗。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	或许这里就是残莲幻境？双儿又很快否认掉自己的猜测，残莲幻境早就该被天族清除了不是吗？那这里又算是什么？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	因着她周身都散着魔界赤光，大多数的小喽啰还是不敢靠近她的，除了一些确实是脑袋缺根弦故意找死的，那也就不能怪她不手下留情了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	一阵嘈杂声远远传来，混杂着各种叫骂声和踢打的声音。双儿心里一阵烦躁，这群喽啰真是有够烦人的，冷着脸慢慢走近，隐约看见一片漆黑和肮脏之中透着些许微弱的白光。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“你们在做什么！”双儿大吼一声，那群“东西”立刻回过身来，刚开始都凶神恶煞的盯着双儿，但突然不知道是谁喊了一声“小魔女啊！”，他们立刻都惨叫着慌乱逃离这里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	双儿一挑眉，摸着下巴，好笑道：“小魔女，这个名字不错，没想到这群喽啰还真有眼光。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	她回过神看向缩在地上发着微弱的白光的小女孩。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	啊，白光呢，真是少见呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	双儿上前几步，蹲在地上低头看着她，只见她缩在那里，肩膀一抖一抖的，低声哭泣着。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	她将女孩子凌乱的头发捋了捋，低声道：“没事了，那群小喽啰都走了，别害怕了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	女孩子颤巍巍的抬起头，用哭的红肿的眼睛看着她，女孩子左眼角的痣让她浑身一震，她轻轻抚上自己的右眼角，抖着嗓子问道：“你、你叫什么？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“漠漠，”女孩子吸吸鼻子，“柳冥漠，我叫柳冥漠。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	而她的右眼角有一颗一模一样的痣。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406154&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406154&&novelId=15670'">下一章</div>
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

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
    <title>（七十四）一盏荷灯玄天现 一双巧手为情毁</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406175&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406175&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406175+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（七十四）一盏荷灯玄天现 一双巧手为情毁]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406175')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406175 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406175,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第79章&nbsp;&nbsp;&nbsp;（七十四）一盏荷灯玄天现 一双巧手为情毁
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	南宁眉心一痛，便被苏映弦带出了幻境，浮在自己面前的，便是散着微弱绿光的双儿和散着红光的十四娘。她扭头便看到苏映弦神色复杂地盯着紧紧闭着双眼的双儿，她知道之后一定发生了什么大事，让双儿和漠漠的灵魂都陷入了沉睡，只怕，全都是身边的这位仙君做出来的吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她看着苏映弦一会儿，见他还没有什么反应，舔了舔嘴唇，缓缓道：“仙君，那个，玄天石……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 苏映弦随手一掷，南宁赶忙接住那个夜明珠一般闪亮的石头，喜形于色，然后小心翼翼地装进书绘音给她的锦袋里，之前她还以为书绘音给她的是什么香囊呢，还带着香味说得那么神秘，结果就是一个空洞洞的钱袋子，也不对，是个杂物袋子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她看到苏映弦的嘴张了张，但一阵冷风忽然卷起，面前的两个影子一闪，化作了点点尘埃，一盏荷灯出现在二人面前，荷灯闪着微弱的光芒，映的苏映弦的脸色有些戚戚，但南宁一眨眼，苏映弦还是那一副冷淡模样，荷灯早已跑到了他的手中。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “这些事情，还请你保密。还有，玄天石用完交予君安即可。”苏映弦看着南宁淡淡道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁心思早已飞到了一边，欢喜的点着头，看着苏映弦缓缓消失，自己也很快从幻境中退出来，但猛然一阵眩晕让她差些倒在地上，这就是强行被人从幻境中拖出来的后遗症。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁露出一丝苦笑，揉了揉阵阵刺痛的眉心，看见十四娘缓缓睁开眼睛，在看见她时微微蹙眉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你怎么会……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁也顾不得什么，抓住十四娘的双肩，激动道：“十四娘，玄天石，我得到了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 十四娘惊讶地微微张开了嘴。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你可以现身了吧。”苏映弦抱着荷灯站在南宁房门口，面对着对面的大树。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 天已经微微掀起了白肚皮，树下一个模糊的身影缓缓移动了一下，站在了一个恰好让苏映弦看见半张脸的地方，看着苏映弦蹙眉，那人响起了圆润的女声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你竟然还能认出我？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 苏映弦看着她雪色长发，淡淡道：“我同他们一样，都认为你已经故去了，只是没想到，世事无常。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “是呢，”她的声音微微一低，“我想请你帮我告诉我哥，不要插手我的事，我会靠自己的力量，将他们一个个都除掉，他们欠我的帐我都是有好好记着呢。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 苏映弦顿了顿，只能微微颔首，“好。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 看着女子慢慢就着阳光消失，苏映弦揉了一下酸痛的双眼，宽大的袖子遮住了表情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 第二日，南宁就匆匆赶回君玄观，她本想让十四娘和她一起走，但被十四娘严词拒绝，她在山上走着，一想到十四娘的态度，就有点儿磨牙。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你回去也没有用，师父不在观中，无人能够启用玄天石，也救不了大师兄。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “可是你呢？你不是也会吗？君师父同我提到过。你和我一起回去不就好了？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “我？开玩笑，我是绝对不会再踏进君玄观半步的。”十四娘给自己覆上白绫，冷冷道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “半步不行，百步总可以吧！”南宁磨磨牙。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “你愿意回去就自己回去！”十四娘掌风一带直接将她轰出门外，任她怎么在外面拍门也没有回应。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁只好无奈跟王曾和柳氏打了声招呼，匆匆赶上山。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 其实，十四娘在看见南宁拿出玄天石时，心脏就已经漏了一拍，但她将内心的吃惊掩饰的很好，将南宁轰走之后，又躺回床上闭目养神了一会儿，等心情平复下来，又唤来了青鸟，提笔书信一封。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 她不知道为什么，心里空了好大一块，但很快又被一股不明情绪给充满。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp;<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城奉了父命到孚城岛购置海产，恰好途经君山，便想着到山上的君玄观看看师兄师弟们，自他下山后便有一年多没有见过他们了，真是分外想念啊，也不知道十四娘和十三还是不是老是吵架。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城提着一大包礼物，微微一笑，赶忙上山。走到一半，脑袋忽然一顿，想着抄小路去，便舍了较为平坦的大道，窜进了一旁的树林，但越往前走越觉得不对劲，一阵微弱的哭泣声充斥在耳边，让他心情纠结。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 他定了定心，仔细听那哭泣声，寻着声音找了过去，远远的就看见一团白色的东西在地上微微抖动。慢慢走近，他这才看清是位白衣姑娘蹲在地上哭泣，因为她身量微微有些圆润，蹲在地上当真有些像一个圆滚滚的圆球。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “姑娘？”许连城将礼物放在地上，走近，低声问道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; “嗯？”南宁蹭了蹭泪花，抬头一看，竟是一位很是俊俏的小公子，她眼睛一亮，救星终于出现了！南宁连忙想要起身抓住他，害怕他一不小心就消失了，但蹲的太久了，腿已经麻了，直接坐在了地上，挣扎了半天也没能起来。很是尴尬的看向许连城。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城微微一笑，掏出手帕搭在手上，紧接着扶起南宁，温和道：“姑娘是出了什么事吗？我有什么可以帮忙的吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁对他的举动有些微微发愣，想起来曾经南宫宁雪也这样搭着帕子扶起她，一下子又红了眼眶。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城见她又要哭吓了一跳，急切道：“是有什么难处吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁憋住眼泪勉强笑了一下，道：“我想去君玄观，可是，迷路了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城恢复笑容继续道：“恰好我也要去君玄观，若是姑娘不嫌弃便与我一起同行吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁连忙点头，忽然看到他放在地上的东西，上前一步抱起来，笑道：“这东西我帮你拿着吧，就当谢谢你的帮忙了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城连忙摆手，想要接过东西，“怎么好意思麻烦姑娘呢，我自己拿着便是。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 南宁抱住东西不放手，“不帮你拿东西的话，我心里会过意不去的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 许连城无奈一笑，“那好吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	&nbsp; 二人一路上很快搭上话，南宁这才知道了原来这位看起来年纪轻轻的俊俏公子竟是许氏商帮少主，这下许连城在南宁心里可就升级为了一块会走路的金子，也不对，是一座钱庄才更贴切。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城倒是觉得眼前的姑娘倒也有趣得很，说话会时不时蹦出一些稀奇古怪的词语，说话做派也没有那些女子的做作扭捏。不一会儿二人就到了君玄观门口。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	南宁一抬眼就看见了正在门口拔草的二师兄，默默地退后几步，躲在了许连城身后，故而二师兄一起身就看到了许连城而直接“忽视”了南宁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“十二，你怎么来了？”二师兄笑呵呵的看着许连城。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城道：“我刚刚从孚城岛回来，路经此地，分外想念师兄弟们便回来看看了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	二师兄按着他的肩膀上下左右从头到尾仔细看看，赞赏道：“十二出落得是愈发丰神俊朗了，不知要迷倒多少姑娘小姐们，不错不错。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城一下子红了脸，“二师兄胡说些什么。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“好好，我不胡说了，快些进来……吧……”二师兄脸色突然一变，许连城疑惑的向身后看去，却见南宁有些奇怪的缩着身子站在后面。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“二师兄……”许连城被二师兄一把拉到后面，只听见二师兄道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“你怎的又回来了？前几天拍拍屁股离开不是很潇洒吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“我……我没有……我只是……”南宁被他浑身散发的冷气镇住，语无伦次。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“二师兄，”许连城连忙冲到南宁前面，他听出二师兄的语气确实很不对劲，那么浓重的针对意味，“到底发生了何事？秦姑娘做了什么事，惹得二师兄这么生气？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	二师兄微微眯眼，严声道：“你这女子，到底有什么狐媚妖术，惹得我师兄师弟都为你神魂颠倒！你害我大师兄还不够，还想害得我们师兄弟反目成仇吗！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“我没有！你不能这么冤枉我！”南宁低声道，说完就死死咬住下唇。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城似乎听出了什么道道，沉声劝道：“二师兄，有什么事咱们先进观再说，别都杵在门口了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	二师兄冷冷一笑，“她别再想踏进君玄观一步。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“二师兄！”许连城语气有些急切。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“十二，你若是再为她说话，你就跟她一样，给我滚出君山！”二师兄说完就要关上观门将二人关在外面，南宁忽然冲上前去，把手塞进了门缝里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	南宁惨叫一声，跪倒在门边，两手被夹在门缝里，许连城也惨白了脸色，上前拍门。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“二师兄！你快些开开门！秦姑娘的手夹在门里了！二师兄！你快点儿开门！二师兄！”许连城见门内一点儿反应也没有，也顾不得形象，直接上脚踹门。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	但君玄观观门乃由灵气所化，任他再踢再踹也未有丝毫活动的迹象，而因着振动，南宁脸色更加苍白，冷汗浸湿了衣裳，身子也是摇摇欲坠。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城一咬牙，顾不得礼仪直接坐在地上，让南宁靠在他怀里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“秦姑娘，你怎么那么傻，你这双手，可是要怎么办啊？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	南宁眼神恍惚，勉强的笑笑，声音细若游丝断断续续，“大不了就是废了，比起南宫公子的命来，我，我的命，可是一文不值，我没了，无人牵挂，若是南宫公子，真的，真的没了的话，这天下有多少的人，会生死两隔……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城霎时湿润了眼眶，“秦姑娘，你忍忍，我一定会想法子……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“不，不用了，我什么情况，我自己知道，我，右手，袖子里，有一个，锦，袋，那里面有，有玄天石，去交给，给君师父……”南宁彻底瘫软在他怀里，昏迷不醒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“秦姑娘！”许连城惊呼一声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	一阵冷风忽然从身后刮来，观门应声而开。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	许连城向后看去，只见君安捋着胡须，叹息道：“真是一群不省心的孩子，唉，可惜了，丫头的一双巧手……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;text-indent:12.0pt;"><p class='chapter_content_read_css'>	“师父……”<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406175&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406175&&novelId=15670'">下一章</div>
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

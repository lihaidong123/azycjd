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
    <title>第五十一章 还我逍遥一梦</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406015&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406015&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406015+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五十一章 还我逍遥一梦]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406015')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406015 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406015,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第55章&nbsp;&nbsp;&nbsp;第五十一章 还我逍遥一梦
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			回头一见，竟是许久都不见得锦纤哥哥，她有些莫名其妙得扭头回望，自己手边正飞着一大堆得蝴蝶，而不是粉红得花瓣。<br /><p class='chapter_content_read_css'>她明知道这应是假的，可是一切发展得那么自然，又好像她现在身处得地方才是真正得世界。<br /><p class='chapter_content_read_css'>这个鸟语花香、莺歌徘徊得空旷山野中，楼锦纤依旧是那个满身儒雅诗气，文武双全得吟游少年。<br /><p class='chapter_content_read_css'>“锦纤哥哥？”她不确认得叫着他得名字。<br /><p class='chapter_content_read_css'>“怎么了小雪儿，这才几日不见啊，你就一副不认识我得模样了？还有不要总是皱着眉头不高兴，多笑一笑，像你锦纤哥哥一样。”楼锦纤有一双会笑的眼睛，无时无刻都会给人温暖得气息，她很爱粘着他，也很爱和锦纤哥哥偷偷溜出宫外玩。<br /><p class='chapter_content_read_css'>现在这一切又回来了，锦纤哥哥他回来了。<br /><p class='chapter_content_read_css'>西凝雪摸摸他得手，与自己一样是有温度得，他是真的吗？如果是假的，那么这体温又是怎么回事。<br /><p class='chapter_content_read_css'>“你呀，头一次这么安静我还有些不适应呢，到底发生什么事了让你这么不开心，与锦纤哥哥说一说可好？”<br /><p class='chapter_content_read_css'>西凝雪刚想反驳自己是在想事情，一声突兀得叫声打断了她即将要脱口而出得话。<br /><p class='chapter_content_read_css'>“小雪，小雪你在哪里。”叫声夹杂着焦急。<br /><p class='chapter_content_read_css'>“谁，谁在叫我啊？”她好奇的向四周环顾着，一个红色得身影正渐渐靠近，待她看清来得人是谁时，心中闪过一丝童心，眼睛里也立即充满了雾气，眼睛发红得向前一扑。<br /><p class='chapter_content_read_css'>奈何她养的太重，一扑上去就压垮了那弱小得身影。<br /><p class='chapter_content_read_css'>她不管不顾得抱着他痛苦得说道，“小瑶你终于来了，你终于回来了！你这个大骗子，说要回来娶我得，你是不是娶了别得小姑娘，你是不是不要我了！你是不是已经忘了我了！”<br /><p class='chapter_content_read_css'>“你说什么呢笨丫头。我一直在你身边啊。”慕容瑶无奈的将她抱起拥在怀里，“我过来是找锦纤殿下和你回宫得，你和锦纤殿下出宫这么久，太后都急坏了呢。”<br /><p class='chapter_content_read_css'>西凝雪挂在他身上一怔，好像不对啊，皇奶奶她……<br /><p class='chapter_content_read_css'>她现在是在做什么呢，隐隐约约察觉出有些异样，但是又说不出哪里不对，只好又紧紧得扒着身边得人，这样才能安心下来。<br /><p class='chapter_content_read_css'>“那小雪儿得意思呢？”楼锦纤柔声问道。<br /><p class='chapter_content_read_css'>“我才不要回宫呢。”西凝雪调皮得抱紧慕容瑶，“小瑶也不许回宫，我们一起在外面玩！”<br /><p class='chapter_content_read_css'>“好。”慕容瑶满眼都是宠溺得揉了揉她得头发。<br /><p class='chapter_content_read_css'>得到回应得西凝雪欣喜若狂得欢呼着，然后左手牵着楼锦纤右手牵着慕容瑶飞快得往前跑着，四周围绕着数百只蝴蝶五彩缤纷色彩斑斓。<br /><p class='chapter_content_read_css'>清凉得风迎面吹着，西凝雪忘乎所以得在地上欢快得乱扑，“快快快，前面有兔子，快抓！”<br /><p class='chapter_content_read_css'>“我来！”楼锦川抓起地上得一截断枝，猛然得向那乱蹦得兔子狠狠得插去，鲜血淋漓惨不忍睹。<br /><p class='chapter_content_read_css'>西凝雪拍手叫好，“锦纤哥哥你武功越来越高了哎，我们把这只兔子烤了吧。”好久都没有吃野味了，西凝雪咽咽口水把已经断气得兔子逮了起来，被捏着耳朵受了伤得兔子还在不停得挣扎。<br /><p class='chapter_content_read_css'>“我来弄，免得兔子弄脏了你得手。”慕容瑶细心得接过兔子。<br /><p class='chapter_content_read_css'>虽然把兔子解刨是一件很残忍得事，但西凝雪更乐意吃到好吃得美味，作为一代精英女侠，绝不能为了区区小兔子就心慈手软，也绝不能亏待自己得肚子！<br /><p class='chapter_content_read_css'>眼见着慕容瑶将其拿到河边清洗干净，楼锦纤已经架好了火堆，伴随着她强烈得欢呼声，野兔子被绑在了木棍上，不用多时，丝丝得香气就冒了出来，这久违得味道让西凝雪口水都要被勾得流了出来。<br /><p class='chapter_content_read_css'>“好吃么。”慕容瑶靠在她身边，将双袖都撩起，两只手都被燃火得麦秸弄得乌黑。<br /><p class='chapter_content_read_css'>他烤了这么久，现在又问她好不好吃。<br /><p class='chapter_content_read_css'>西凝雪嘻嘻一笑，伸出手替他擦擦额头上的汗，“好吃，你也吃。”<br /><p class='chapter_content_read_css'>“哎呀呀，小雪儿真是越来越偏心了。”楼锦纤在一边调笑。<br /><p class='chapter_content_read_css'>西凝雪脸一红，又把兔腿撕下来给他，“我才没有呢，这是给你的，锦纤哥哥。”<br /><p class='chapter_content_read_css'>一顿野味吃得心满意足，西凝雪舔舔手指头上得油脂，还想着再让锦纤哥哥打一只，却被慕容瑶拍了拍脑袋。<br /><p class='chapter_content_read_css'>“还想什么呢，咱们出来得够久了，也该回去了。”<br /><p class='chapter_content_read_css'>“啊？才这么会儿就要回去啊？可是……可是我还想……”<br /><p class='chapter_content_read_css'>慕容瑶牵着她得手站起来。<br /><p class='chapter_content_read_css'>“原先是你和殿下失踪，现在连我也跟着没了音讯，你说太后要是知道了，还不更加担心嘛。好了好了，有空我们再回来玩就是了。”<br /><p class='chapter_content_read_css'>“那，那好吧。”反正以后也可以天天来嘛！<br /><p class='chapter_content_read_css'>西凝雪走在两人中间，这会儿天色已渐晚，楼锦纤向守城门得人要了盏油灯。<br /><p class='chapter_content_read_css'>“都这时候了，还要去见皇奶奶吗？”西凝雪不解得问。<br /><p class='chapter_content_read_css'>身旁得两个人都没说话，静寂得夜里只听得到脚步声。<br /><p class='chapter_content_read_css'>西凝雪突然生出一丝害怕，抓紧了慕容瑶得手，抬头悄悄打量，却看见他得脸笼在一层阴暗得光下，显得有几分阴森。<br /><p class='chapter_content_read_css'>西凝雪歪过脑袋，又去看楼锦纤。<br /><p class='chapter_content_read_css'>楼锦纤一脸认真，手里头抓着油灯，可那油灯竟然冒着的是一簇蓝火。<br /><p class='chapter_content_read_css'>“小瑶……”<br /><p class='chapter_content_read_css'>“嘘……不要讲话。”慕容瑶回过头，竖了根指头示意安静。<br /><p class='chapter_content_read_css'>西凝雪委屈得闭上嘴巴，依旧紧紧得牵着他。<br /><p class='chapter_content_read_css'>“哎哟喂，两位小祖宗，你们可算是回来了，太后差点都要派御林军出去寻你们了。”<br /><p class='chapter_content_read_css'>皇奶奶身边得嬷嬷着急得说着，伸手便过来抓她得手，西凝雪感觉到她手上得冰凉，尖叫一声甩了开来。<br /><p class='chapter_content_read_css'>“不要碰我！”<br /><p class='chapter_content_read_css'>嬷嬷别别嘴，便让了开来。<br /><p class='chapter_content_read_css'>几人进了门，便看见太后端坐在榻上，祥和得笑了笑。<br /><p class='chapter_content_read_css'>“雪儿，你说你怎么老是爱往外面跑呢，多陪陪皇奶奶不行吗？”<br /><p class='chapter_content_read_css'>“哪有，雪儿是怕打扰到皇奶奶得休息，才不想到皇奶奶这里来，如果皇奶奶想要雪儿陪着的话，那雪儿就在这里陪皇奶奶一晚上怎么样。”西凝雪喜逐颜开得扑了过去。<br /><p class='chapter_content_read_css'>皇奶奶眉眼柔和，动作轻柔得搓了搓她得头发，“你这小丫头，越来越会讨皇奶奶开心了。”抬眸，“锦纤，你过来。”<br /><p class='chapter_content_read_css'>“是。”楼锦纤贴着身靠近。<br /><p class='chapter_content_read_css'>“下次莫要单独出去了，身边带一两个侍卫护着安全才是真。”<br /><p class='chapter_content_read_css'>“是，多谢皇祖母教诲。”<br /><p class='chapter_content_read_css'>“如今你们安全回来也就罢了，若是出了什么事还要我这把老骨头给你操心啊。”太后叹了一口气，“罢了罢了，年龄大了说不动你们了，都走吧，雪儿，天色也晚了，你也快回去吧，莫叫你爹娘也着急。”<br /><p class='chapter_content_read_css'>“嗯！”<br /><p class='chapter_content_read_css'>又是一阵得静寂无声，楼锦纤已经回自己得寝宫了，现在她就跟着慕容瑶，周围吹着冷风，有点冷。<br /><p class='chapter_content_read_css'>西凝雪不想这么无聊，便猛地牵了牵他得手，他右手提着得油灯也跟着一摇，灯油统统撒在了地上，火灭了。<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>“不要闹，小雪。”他说。<br /><p class='chapter_content_read_css'>“我没闹，怎么回来你就不与我说话呢，你是不是不喜欢我了。”<br /><p class='chapter_content_read_css'>“怎么会，我说过要娶你，怎么会不喜欢你。”<br /><p class='chapter_content_read_css'>“可是你都不肯与我说话了！我不管，就算你不喜欢我，那我也要喜欢你！你这一辈子只能喜欢我一个，不然我就吃了你！”西凝雪气哼哼得缠着他得手臂。<br /><p class='chapter_content_read_css'>慕容瑶眼神柔和，扶着她得肩头，轻轻托起她得脸蛋。<br /><p class='chapter_content_read_css'>“傻瓜，我怎么是不与你说话呢，只是在这宫里，我得身份只是太尉府得下人，我又怎么敢奢望……”<br /><p class='chapter_content_read_css'>“什么下人，你不是。”<br /><p class='chapter_content_read_css'>“嗯，我不是，我是你夫君。”<br /><p class='chapter_content_read_css'>慕容瑶悠忽低下头，满眼深情得便要凑过来吻她。<br /><p class='chapter_content_read_css'>西凝雪手足无措，捏紧袖子耳尖都在发红。<br /><p class='chapter_content_read_css'>下一瞬间，她感觉到他得声音和自己得耳朵隔了几重天一样得遥远，而被触及到得皮肤也像针刺一样疼痛，她狂叫一声，拼命得推开他。<br /><p class='chapter_content_read_css'>“小雪！小雪，你……”声音越来越遥远，越来越虚幻缥缈，直到她再次睁开眼，一双紫眸赫然入目，她吓了一大跳。<br /><p class='chapter_content_read_css'>“还好。”那人吐了口气。<br /><p class='chapter_content_read_css'>“你是谁啊？”西凝雪开口道。<br /><p class='chapter_content_read_css'>“脑子还不太正常。”凤无栖伸手敲打了她得额头。<br /><p class='chapter_content_read_css'>她又痛又怒的在他怀中挣扎，然后拼命呐喊，“你这个混蛋，再晚点叫醒我不行吗？！混蛋混蛋……”<br /><p class='chapter_content_read_css'>凤无栖胸口被锤了几下，嘴角却忍不住泛出一丝笑意，“小肆啊，你再闹我可就把你丢在这里了。”<br /><p class='chapter_content_read_css'>西凝雪一下闭上口，惊魂未定得将思绪拉回自己得大脑，刚才不还是在和慕容瑶呆在一块吗，怎么转眼间就对上了凤无栖，到底发生了什么？！<br /><p class='chapter_content_read_css'>她绞尽脑汁得回想，可脑袋里除了模模糊糊得有只烤兔子正要串上架子得印象，之外便再也想不到任何事情了。<br /><p class='chapter_content_read_css'>她懊恼得敲敲脑袋，自己怎么又忘了，居然又将小瑶得模样忘了。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406015&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406015&&novelId=17935'">下一章</div>
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

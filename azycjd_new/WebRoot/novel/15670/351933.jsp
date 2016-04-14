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
    <title>（二十）繁华三千往事近 忆中梦境何为真</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351933&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351933&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351933+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十）繁华三千往事近 忆中梦境何为真]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351933')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351933 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351933,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第21章&nbsp;&nbsp;&nbsp;（二十）繁华三千往事近 忆中梦境何为真
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			但让顾白失望的是，木若涵一点事也没有。<p class='chapter_content_read_css'>木若涵脚步一顿，看向桌前二人，缓缓福身：“妾身参见王爷。”<p class='chapter_content_read_css'>“王妃免礼。”顾白含笑的看向她，不着痕迹的拉开趴在他身上的水灵，只是将左手放在水灵腰间，“这是水灵，是本王新纳的侧妃，王妃应该不会介意吧。”<p class='chapter_content_read_css'>木若涵坐到席间，安然一笑：“王爷在说哪里话？妾身高兴还来不及呢，妾身总是孤孤单单一个人，现在有个伴儿也很好，那我便唤你灵妹妹如何？”<p class='chapter_content_read_css'>水灵含蓄一笑，挑了个刚刚好可以让木若涵看到的角度，将手不经意放在顾白腿上，“倒是姐姐高看妹妹了。”<p class='chapter_content_read_css'>她眼神还是很安然，带着恬淡的笑容，只是不再言语。<p class='chapter_content_read_css'>“好了，你们妹妹来，姐姐去的，还是快些吃饭吧。”顾白忽而应话，用手将水灵的手拂掉，自顾自的夹菜，水灵时不时的给他夹菜，还带上几句“王爷多吃些这个。”“王爷，多吃些那个。”木若涵夹起菜想给顾白，却瞧见顾白与水灵谈笑风生，又默默收回了手。一顿晚膳就这样诡异的吃完了。<p class='chapter_content_read_css'>蹲在房顶的南宁忽然打了个阿嚏，揉揉鼻子，看着书绘音撤去法咒，透明的屋顶又变回了青灰色的瓦片，皱眉道：“我们这是该住哪啊？总不能一直驻守房顶的吧？”<p class='chapter_content_read_css'>书绘音往空中一抓，将一件白色狐裘裹到南宁身上，南宁这才暖和一点儿。见他不言语，又道：“这王妃的记忆为何会有不属于她的混在其中？从前也没遇到过这种状况啊？”<p class='chapter_content_read_css'>“应当是此次的咒文问题，毕竟你也只是第二次使用，第一次你也只是取忆，并没读忆。”书绘音解释道。<p class='chapter_content_read_css'>“哦，那我们到底……啊！”书绘音忽然将南宁抱起来，在各个屋顶上飞来飞去，最终停在一间屋子前将南宁放下，“你就住在这间房中，我住隔壁。”<p class='chapter_content_read_css'>南宁环看四周，咦，这不是槿华苑吗？最左边的屋子就是水灵住的，这间正是最右边的房间，推门进去，一种莫名的熟悉感便油然而生。<p class='chapter_content_read_css'>入夜，南宁躺在床上辗转难眠，按理说，在忆境之中她是不会感到困乏与饥饿，但是为什么她看见那一桌子的菜会肚子叫啊！<p class='chapter_content_read_css'>南宁很是愁闷，她一点儿也不想睡觉，时间过得好漫长，她是很想施个咒术加快读取记忆的速度，但是书绘音的一番话让她颇感犹豫，她是第二次使用这个新咒术，第一次读忆，而且这记忆也不光只是木若涵的记忆，还混着与她相关的东西，若是有什么细节的地方一不小心错过去就完了，读忆可不是看录像带，可以倒带。所以只能慢慢磨了，若是从忆境出来，应该到早晨了。<p class='chapter_content_read_css'>想着想着，不自觉的打了个哈欠，竟然犯困了，刚想睡觉，就被突然出现的书绘音拎小鸡似的拎起来，瞌睡虫霎时就跑得一干二净，结结巴巴问道：“有什么情况？”<p class='chapter_content_read_css'>“去顾白的书房看看。”书绘音把她拎出房间。<p class='chapter_content_read_css'>南宁揪开他的手，“我自己会走，放心，移形幻影在忆境中我可是就轻驾熟，不会拖你后腿。”说完就施咒，身影消失在原地。书绘音一摆衣袖，也紧跟着隐去身影。不过眨眼之间，二人就落到书房外，书绘音手指往窗上一点，似是泛起层层涟漪，化为了一块透明的玻璃，二人能清清楚楚的瞧见里面的情形。<p class='chapter_content_read_css'>顾白遣退了服侍的下人，书房中亮着如同白昼的光芒，数颗夜明珠正镶在四面墙壁上，顾白用手覆在东北位的夜明珠上，一阵轻微的响声从他脚下传出，习惯一般的向后跨出一步，脚尖抵的地方正是一个向下凹去的巴掌大小的暗格，单膝跪地，取出其中物件，是一封泛黄的信，还有一个素色锦袋，仔细看来上面绣着一朵小巧的木槿花。<p class='chapter_content_read_css'>他将东西放在案桌上，坐到梨花雕木椅上，神色郑重的打开信封拜读，脸上又露出浓重的哀伤，到最后又释然一笑，轻语道：“是呢，娘亲。”<p class='chapter_content_read_css'>南宁心里一顿，感觉到他笑容中带着的一丝寂落，原来，是他娘亲给他的信吗？用胳膊肘撞撞书绘音：“喂，你可以看见信上的东西吗？”<p class='chapter_content_read_css'>书绘音摇摇头。<p class='chapter_content_read_css'>除非是看顾白的记忆。<p class='chapter_content_read_css'>“既然我们什么也看不到，那来……”他将食指竖在唇上，表示噤声，南宁不语继续看向书房。<p class='chapter_content_read_css'>他将锦袋放在手心，不断犹豫着，最终还是打开，一颗小小的漆黑的种子躺在手心，他不断摩挲着，不断轻抚着，像是要将自己的一切柔情注入其中，眼眸中闪着无比的笑意。<p class='chapter_content_read_css'>“小妹……”恍如黑暗中的一丝低喃，带着无尽的彷徨。<p class='chapter_content_read_css'>“咔吱”一声怪响在寂静的夜间极其醒耳，南宁看向声源，是满目哀伤的木若涵，颤巍巍的转身，逃离开。<p class='chapter_content_read_css'>难道是顾白对自己的妹妹有那种感情吗？不然，听见顾白唤小妹，木若涵为何会如此心伤？还有连木若涵都不被允许踏进槿华苑，槿华苑中藏着什么秘密？怎么好像更乱了。南宁揉揉眉心。<p class='chapter_content_read_css'>“若涵，对不起。”顾白望着木若涵萧然离去的身影，缓缓扯出一个苦笑，喃喃自语：“只有这样，才能保全你。”<p class='chapter_content_read_css'>“所以，顾白根本就是为了保全木若涵才要立水灵为侧妃，休掉她了。”南宁环胸，踢着脚下的石头，目光却盯着书绘音。<p class='chapter_content_read_css'>“应该是如此了。”	<p class='chapter_content_read_css'>“但是，顾王贵为王爷，就算只是个异姓王，不会连自己的王妃都保不住吧，还是说，是皇帝想杀了顾王，他为了不牵扯上木若涵才出此计谋。但是也没听说顾王有什么功名在身，手中又没军权势力，皇帝又为何想杀他，功高震主？没可能啊。”南宁岔岔念。<p class='chapter_content_read_css'>“你想这么多做什么，木若涵委托你的只不过是调查顾王休她的缘由吗？你只顾好这一点就好。”书绘音打断她的岔岔念，心咐天色已晚，就算身体不疲乏困倦，但魂气也需要休憩补充。又一声不吭的把南宁揪回房。<p class='chapter_content_read_css'>南宁看着他关上房门，一个翻身将被子裹到头上，怨声哀道：“真是的，干嘛老是揪我，我又不是没长腿。”而后蜷起身子，闭眼休憩。<p class='chapter_content_read_css'>嗯，什么东西？南宁忽然感觉身上一重，有什么东西扫过自己的鼻尖，痒痒的，还未等着睁开眼皮一探究竟，就被一双手拉了起来，缓缓睁开眼皮，柔和的阳光洒进眼中。<p class='chapter_content_read_css'>“阿桠，你也太狡猾了吧，竟然跑到这里来睡觉，害得我一个人听二殿下的说教。”拉她起来的女子抱怨着将她晃来晃去。<p class='chapter_content_read_css'>她这才瞧清楚刚才身上的重物是什么，是一只银色的小狐狸，额间一朵蓝色的小花，正趴在女子的肩头小憩着。还有，阿桠？莫不是那时的女子吧？<p class='chapter_content_read_css'>南宁还未反应，这具身体的主人阿桠便开始有所行动，她一把揪过女子肩上的银狐，微愠道：“阿绘，是你带着卿尘来这儿找我的吧，好一个小叛徒，卿尘到底给了你什么好处，竟然背叛你主人我。”<p class='chapter_content_read_css'>银狐眨眨眼，又可怜巴巴的看向名叫卿尘的女子。卿尘一把抢过银狐抱在怀里，得意道：“哝，那是因为阿绘比较喜欢我啦！是吧，阿绘。”银狐乖乖的蹭了蹭她。<p class='chapter_content_read_css'>“哼。”阿桠不甘心的看向银狐，银狐又乖乖的用爪子摸摸她，像是在说“主人，我也很喜欢你啦，不要生气了”。<p class='chapter_content_read_css'>“呦，阿桠原来你在这呐。”一位白衣男子突然从天而降，温和的向两人打招呼。<p class='chapter_content_read_css'>“歌映，你怎么来了？”阿桠问道。虽然阿桠流畅的喊出他是谁，但南宁挤了半天眼也瞧不清他的模样。<p class='chapter_content_read_css'>“啊，二殿下可是在到处找你呢，我觉得你应该在这儿，就提前来知会一声，没想到卿尘也在这儿。”他捂嘴咳了一声，又接着说道：“这次二殿下看样子确实很生气，阿桠若是被带回去怕是会被骂的很惨吧。”<p class='chapter_content_read_css'>“我、我不就是把须臾花偷带出去了嘛，二哥干嘛小题大做，还要罚我，哎，不如我去卿尘家避避风头吧。”<p class='chapter_content_read_css'>卿尘很遗憾的看着她：“阿桠，二殿下又不是不晓得你与我交情最好，若是要找你，肯定先去我家堵人啦。”<p class='chapter_content_read_css'>“那……”又看向歌映。<p class='chapter_content_read_css'>“没可能啦，若是你敢去歌映家，你前脚刚踏进去，后脚二殿下就会追进来。”卿尘打断她的想法。<p class='chapter_content_read_css'>“啊，那可……”阿桠话音还未落，就感到身后一阵低气压，僵硬的回身，扯出一个笑容，“二哥，你怎么有空出来了？”<p class='chapter_content_read_css'>南宁在心里默默扶额，还是看不清脸啊……<p class='chapter_content_read_css'>“阿桠，看来是我平时太宠你了，竟然铸此大错，还胆敢逃罚……”男子语气愈发阴沉，南宁一惊，惶然睁眼，这才逃脱开来。<p class='chapter_content_read_css'>南宁一拂额头上的冷汗，心里岔岔念叨，在忆境中做梦，还真是第一次，不过，真的是梦吗？竟还是接着上一次的，太奇怪了吧？<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351933&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351933&&novelId=15670'">下一章</div>
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

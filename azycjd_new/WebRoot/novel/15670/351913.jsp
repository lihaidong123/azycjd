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
    <title>前记</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351913&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351913&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351913+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[前记]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351913')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351913 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351913,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第1章&nbsp;&nbsp;&nbsp;前记
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p><p class='chapter_content_read_css'>	前记<p class='chapter_content_read_css'>……二十一尘世……<p class='chapter_content_read_css'>  现代，T市西郊一座两层小楼内，南宁懒散的趴在卧室窗台上向下望去，古装男子墨发轻轻绾起，站在不远处的树下，他已经驻留了将近两个小时。南宁眼睛漆黑不知在想些什么，一阵大雪纷飞模糊了视线，再次恢复清明时，哪还有那树下身影。<p class='chapter_content_read_css'>  电脑里自动放着董贞的《问剑》，香炉里散着飘渺的细烟，一切安静得有些微妙，只听得南宁窸窸窣窣的穿衣声，紧接着是嗒嗒的下楼声，将自己裹了好几层，像是个毛茸茸的球一般。<p class='chapter_content_read_css'>  南宁关上店门，有些发冷地跺了几下脚，怀里抱着本书，脚步匆匆又很有节奏感，熟练地拐到人迹罕至的巷子，走了大概二十分钟，再左转，走上一百零七步，猛跨出一步，展现在眼前的俨然是一座宽阔的墓园，正是郊外的墓地。<p class='chapter_content_read_css'>  淡淡的花香指引着她，到达一块开满紫荆花的墓碑前，虽是冬日，但这花开得极是旺盛，浅紫色的花朵贴附在墓碑上，盖住了碑文，若是普通人看见了必定会暗道一声见鬼，但她却见怪不怪。<p class='chapter_content_read_css'>  这是她的职业，她养活自己的唯一依靠，有什么可奇怪的。<p class='chapter_content_read_css'>  手缓缓松开，露出怀中的书，书皮上的蓝色妖姬花像是有了生命一般从书中挣脱出来，书就那样浮在虚空之中，咒文从口中轻轻吐出，书页哗哗作响，柔和的光芒将她笼罩，须臾之间，人已消失。<p class='chapter_content_read_css'>  一道身影从墓碑后走出，信手捏住一朵紫荆花，面色有些苍白，徒步一抖昏倒在地上，墨发散了一地。<p class='chapter_content_read_css'>  忆境中的南宁正身处在一片黑暗之中，平静地伸出手指在空中一划，瞬时有柔光出现，慢步向光源处走去，再一亮，便是一片紫色的花海，某棵树下，白衣翩翩的女子正在等待着她。<p class='chapter_content_read_css'>  长长的青丝绾成妇人鬓，只插了一朵小小的绢花，南宁很是眼尖，看出她裙摆满是烧灼的痕迹，即使隐藏得那么好。<p class='chapter_content_read_css'> “秦小姐，你终于来了。”她朝南宁轻轻一笑。<p class='chapter_content_read_css'>  她同她保持着几步的距离，脸上是一贯的公式化笑容：“您是想找回什么记忆呢？还是，想拿去什么记忆？”<p class='chapter_content_read_css'>  她握着纸伞的手紧了紧，眼神含糊迷离，话是有些语无伦次：“我好像要找个什么人，很重要很重要，还有就是一团火很大，烧得我好痛，他就在外面看着我，可是不救我，我真的好痛。”<p class='chapter_content_read_css'>  虽是有些激动的话，她说出来就好像一汪水，没有波澜。<p class='chapter_content_read_css'>  “那，他的名字，你还记得吗？”<p class='chapter_content_read_css'>  “翎君，”她刚说出一个名字，就自己否定掉：“是，珩，宫珩。”<p class='chapter_content_read_css'>  “那好，汝忆回梦中，汝忆梦中回……”轻启微风，流畅的咒语倾吐而出。<p class='chapter_content_read_css'>  “不！不是！我想让你，好好照顾他，一定要……阿南……”大风起，女子被花海淹没，声音也随之消逝，南宁听到她说阿南，身形一顿，有冷汗从额间冒出，怎么会？巧合吧。<p class='chapter_content_read_css'>  从忆境退出，雪花落在她身上，轻吐了一口寒气，刚想起步走开，就觉得不对劲儿，低头一看，一只骨节分明的手紧紧抓住她的脚踝，目瞪了半晌，无奈扶额，掏出手机，拨号……<p class='chapter_content_read_css'>  不过少时，一辆纯白色的福克斯停在南宁的店面前面，驾驶座的门“咔”的一声打开，戴着眼镜的女子从车上下来。<p class='chapter_content_read_css'>  女子无奈的看着车里躺着的古装男子，再瞅瞅副驾驶上的南宁，道：“南宁，我直接把他送警察局就是了，干嘛还送到你店里？”<p class='chapter_content_read_css'>嘴里说着，一边绕过去给南宁开车门，和南宁一起把他从车上抬下来，两人踉踉跄跄的把男子抬到一楼的临时客房里去。<p class='chapter_content_read_css'>  南宁让她在屋里看着他自己上楼去拿医药箱。<p class='chapter_content_read_css'>  女子摸着下巴，推了推眼镜框，仔细看着男子。<p class='chapter_content_read_css'>  男子面色苍白，相貌姣好，她是有花痴症，但是，这一身古衣，还有这长发，莫非是cos爱好者？<p class='chapter_content_read_css'>  数分钟过去……<p class='chapter_content_read_css'>  “真是麻烦你了，七七。”南宁把体温计从他嘴里拿出来，看了看没有问题。<p class='chapter_content_read_css'>  “还这么客气干嘛，只是这个人，有古怪哦，要不然还是把他送到警察局好了。”被唤作七七的女子全名琴霜七，是南宁的专属闺蜜，她盯着他古怪的服装打扮，疑从心生提醒她。<p class='chapter_content_read_css'>  “没关系啦，对了，今天不是晓阮的家长会吗？你怎么有空？”南宁看了一下日历，看到上面圈的大大的“家长会”三个字。<p class='chapter_content_read_css'>  “哎呀！完蛋了！我忘了！琴晓阮那小子一定会骂死我的，我先走了……”琴霜七匆匆下楼，嘴里嘟囔着“完蛋了，完蛋了”，带动着门口的风铃一阵响动。<p class='chapter_content_read_css'>  她又将被子往他身上裹了裹，走出去。他原本紧闭的眼睛颤了颤，落下一滴泪来。<p class='chapter_content_read_css'>  南宁瞧着快到饭点儿了，打开QQ音乐，正放着《青衫隐》，转身进了厨房，再出来，手拿着托盘盛着两碗粥和一碟小菜，走进男子住的客房，他散着发倚在床头，面色苍白，眼神放空。<p class='chapter_content_read_css'>  “你既然醒了，就喝些粥吧，暖暖身子吧。”南宁见他醒来，松了一口气。将托盘放在床头的桌子上，转身欲走，又转过头，看他没有动筷，还一副怏怏的样子，以为是在雪地里冻得发烧了，用额头触了触他的额头。<p class='chapter_content_read_css'>  “没有发烧，是哪里不舒服吗？”<p class='chapter_content_read_css'>  他摇了摇头，又点了点头。倒是弄得南宁有些奇怪，看他脸色通红，又想起自己刚才亲昵的动作，脸颊也飘了红，诺诺道：“抱歉，刚才是我失礼了，呃，你先吃饭吧，凉了就不好了。”<p class='chapter_content_read_css'>  男子瞥了瞥饭菜，又瞥了瞥她，里面的意思不言而喻。<p class='chapter_content_read_css'>  南宁默默扶额，一口粥一口菜喂着。<p class='chapter_content_read_css'>  所以，她是捡了个什么宝回来啊。<p class='chapter_content_read_css'>  “你叫什么？家住在哪里？”南宁收拾好碗筷拿了纸笔坐在床边，询问着。<p class='chapter_content_read_css'>  他张了张嘴，没有发出声音，眼中闪过一丝诧异。南宁将纸笔递给他，“既然开不了口，就写一下吧。”<p class='chapter_content_read_css'>  看着他有些奇怪的握笔姿势，又接过纸，虽然笔韵有些怪，但笔迹却很锋锐，工整的“宫雪”二字跃然纸上。<p class='chapter_content_read_css'>  “宫雪，宫，倒真没听说过这个姓。对了，我姓秦，秦南宁。”南宁笑了笑，又继续道，“你，不会是不记得自己家在哪吧？”<p class='chapter_content_read_css'>  宫雪坚定地点了点头。<p class='chapter_content_read_css'>南宁不禁有些后悔把他带到家来，心里想着要不要真依琴霜七所说把他送到警察局，但看到他茫然无辜的眼神后却有些心软了。<p class='chapter_content_read_css'>  “算了算了，就留在我店里吧，和我做个伴儿，说不定过不了多久你就想起来了。”关了门出来，又把那张纸掏出来看了看，猛然惊觉，那写字的姿势和动作和师父如出一辙，分明是惯用毛笔写字的姿势，也就是说，他根本不会用圆珠笔……<p class='chapter_content_read_css'>  那么……<p class='chapter_content_read_css'>  又去了墓地好几趟，紫荆花墓就那样消失了，像从来都没有存在过似的，南宁无所事事地将魂书翻了一遍又一遍，一点痕迹也没有，那委托给她的到底是什么事呢？还有宫雪。<p class='chapter_content_read_css'>  “嗯，这个放这里，那个放在第二架第二排第三本后面……”南宁指挥着宫雪摆放着书目，自己又拿着鸡毛掸子弹着书架上头的灰尘，阳光透过落地窗穿过纷纷扬扬的灰尘洒在南宁身上。<p class='chapter_content_read_css'>  宫雪抱着书看着她发怔，眼睛里流着异样的光芒。<p class='chapter_content_read_css'>  忽然一阵风朝着南宁吹来，怀里的几本书被吹得哗哗作响，像是有什么东西进了眼睛，揉了几下，半闭着眼要去关窗户，手还没触到窗子，就怔的停下来，那窗户……分明就是关着的！那，风又是怎么回事？还没等南宁反应过来，就觉得脖子一麻，就失去了知觉。<p class='chapter_content_read_css'>  “砰！”宫雪怀里的书尽数砸在地上。<p class='chapter_content_read_css'>  “阿宁！”声音有些喑哑，却满腹深情，只可惜那人却再也听不到。<p class='chapter_content_read_css'>  戏剧的序幕已经打开，演员们也该就位了……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<br /><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	喜欢此文请加群&nbsp;295865650，进群有福利哦<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351913&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351913&&novelId=15670'">下一章</div>
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

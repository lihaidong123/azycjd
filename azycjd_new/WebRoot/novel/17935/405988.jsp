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
    <title>第二十八章 这么中意你</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405988&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405988&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405988+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第二十八章 这么中意你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405988')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405988 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405988,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第32章&nbsp;&nbsp;&nbsp;第二十八章 这么中意你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	这是一种奇妙的体验，好比你明知道你手里头的是一种有毒的果子，可它是你爱吃的，并且它无时无刻散发着甜美的香气诱惑你的脾脏，当你再也忍不住时，你会因为这颗果子而死，而这颗果子的目的也正好达成。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	想必一生也只有这一次，没有遵从自己的心意。她西凝雪向来是想要什么就有什么，就算是在别人手里她也会毫不犹豫的抢过来，论狠心，她自认比那些闺中秀女狠毒多了，论胆色，即便是遇上一百头狗熊大不了就是一死也没什么好怕的，论姿色，她从小到大听到的称赞哪里还少得了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	可只有这一次，全栽了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	更何况自己在他面前也根本没有留下什么好印象，反而还一次次的出丑。她这会儿自个儿纠结有用吗，他都摆明了准备杀了她，这总不可能是半夜梦游做的吧，脸皮都丢尽了，哪里还能在乎自己是不是还会出丑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	说不定他只是为了掩人耳目，不想自己死后还要掀起一股轩然大波，就等着明天把自己大卸八块呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这么一想，西凝雪就觉得这会儿短暂的黑夜也变得漫长起来了，若是他真的这么打算了，她又何须在顾忌了。抓紧趁着这时候把想要做的事情都办了，一身轻松去了地府也好瞑目啊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪将手伸了出去，还有些微不可查得颤抖，费劲抑制住了才敢移到那软稠的布料上，她本想叫醒他来一场最后的告白。但是不知道为何，手掌反射性的退了回来，还不小心触到了床头发出“啪”的一声惊响，西凝雪吃痛的按着手指头哑声狂嚎。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪心底在流血，明明说好了要坦白自己的心言。可是这只可恶的手居然在平时温夕言各种威慑下有了自主的意识！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这还能得了啊，不过即使是简单的碰触，也让西凝雪的心久久不能平静。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“唔……出什么事了。”楼锦仁迷糊的醒过来，歪过头打量身边的人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“没事没事，方才有只蚊子飞过，我怕它会惊扰到三皇子殿下的安眠，就出手拍死了它。尸体还在我手里呢，三皇子殿下要不要看一看？”西凝雪说罢把两只手都伸了出去，本是捂着手指压抑疼痛的动作也像是在用手包蚊子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	楼锦仁一阵恶寒头皮发麻的缩向一边，嫌恶道，“还不扔掉！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“啊，这就扔了！”西凝雪机灵的把手一甩，反正现在熄了灯黑灯瞎火的他也看不出个啥。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	也不管楼锦仁的目光是如何的怪异，西凝雪这一躲就是几个时辰，天色大亮时，她才顶不住困意沉沉睡了去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	醒来时就自己一人霸占着整张大床，浑身犯懒的动了动全身的骨头，然后扫视了一眼空荡荡的大殿，脑子茫然的坐到了桌前，手一抬，茶盅里已经见底了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	再用力甩了几下，真的一滴水也没有。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不由得口干舌燥的用眼神瞄瞄其余的地方，果不其然终于又给她发现了一个茶壶，欣喜万分的奔上前，抬眸又见一张器宇轩昂、仪表堂堂的男子画像，多半又是拿什么有名的诗人才子之类的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但西凝雪还是恭敬的朝着面前的画像拜了三拜。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这位老兄，出门在外大家交个朋友，我现在与你拜了三下我两就是同甘共苦的好兄弟了，既然是好兄弟，那么你面前这茶盅的茶水我就借用了，大哥莫要生气哈。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	慎重的拿着茶盅倒了满杯，入口是香醇浓厚又有点古怪的味道，她第一次喝这种奇怪的茶水，但是奈于口渴的紧，就胡乱的灌了几口也没有细细品尝就统统倒进了嘴巴里。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	半晌西凝雪发觉了有些不对，觉得这不像是茶水，倒像是酒。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	老爹和老娘说女子不能沾半滴酒水，但是一代女侠怎么会连喝酒都不会呢，可这么两杯下去喉咙就跟在冒火一样，不仅是喉咙难受，身体更加难受，就跟被温火烤了一遍似的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	从来没有尝过酒的西凝雪也知道酒是干什么的，一醉解千愁，可她现在刚睡醒哪里有什么愁等着她来解啊！不仅解不了愁，脑子也跟着晕乎乎的，摇晃了几下脑袋也平稳不了自己的视线。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪原地转了几圈，然后揉揉脑子，“原来酒这么难……喝，下次我绝……绝……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	殿门口慢悠悠得走进几人，三皇子走在前头，左手边跟着的是神态严谨但步伐悠然自得的温夕言，右手边跟着的是一袭紫袍手着孔雀羽扇的紫眸男子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	三皇子正和那紫眸男子聊的正是兴头，走路也不忘提问道，“国师大人，难得这次你和夫子都在景和殿，不如就在此以棋为策较量一场，分出个上下如何。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	紫眸男子微眯起桃花眸，似女子般的朱唇妖娆的勾起，这一幕若是让西凝雪看见了，铁定是要被迷惑的连魂儿都丢了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“殿下，臣以为这盘棋的输赢没有任何意义，温太医攻于兵策，而臣却只偏爱于那些个上不了台面的诡计，依臣之见，结局早已注定。”声音宛若春风被吹响的银铃，让人不禁惊疑为何这样一个男子却说得出女子的清脆与婉柔。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“国师大人何必自谦，我听闻国师大人和温太……太……”三皇子剩下的话都被那个趴在桌上像头死猪一样呼呼大睡的西凝雪打断了，三皇子当即怒火冲冠的捏紧了小手，眉头倒竖的涨红了脸。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这小奴才怎么这么大的胆子，竟然敢在他的景和殿这样放肆！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	完全没意识到自己的行为已然落入耳目的少女打着呵欠翻了个身，然后猛地从桌子上摔了下来，然后又踉踉跄跄的抓着椅子站了起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	几人纷纷都将目光投了过来，只见少女面凝腮红，两眼幸福得眯成一条直线，时不时抬头抓抓自己凌乱得头发，面上露出得醉态和笑意更加为少女增添了一些似有似无的媚意。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	少女双眼迷离的看着不远处的三人，心想一定是周公知道她喜欢美人儿，特地的挑了个绝色的来服侍她，周公如此厚道，她当然秉着不要白不要的理念全盘接受！于是少女身形不稳、摇摇晃晃的冲着最艳的那个扑去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪一把勾住他的脖颈，也不管他什么意见，整个人都挂在他的身上，但窜入鼻间的不是熟悉的香味，但脑子一片糊涂的她压根什么都没想的叫出了他的名字。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“温夕言，你……个死王八，枉我……这么，这么中意你，我掏心掏肺……你还敢拒绝我！我，我，我一定要……要……把你……”西凝雪站不住脚稀里糊涂的往地上一倒，口中轻念，“先奸后杀，杀完再奸……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	三皇子从没听过这等淫秽之词，自然又怒又羞的憋了口气，对西凝雪无比讨厌的瞪了一眼，才发现自己是徒劳无功，这小奴才早就躺地上睡得香甜了，根本看不到自己威严的眼神。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	于是当即转了目光，道，“夫子你，你对他，一个男的，做什么了……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	而方才被西凝雪扑过的国师大人，平淡无奇的掸了掸身上莫须有的灰，口气中充满了戏谑道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“看来温太医不仅被女子倾慕，追随者中更是不乏这等姿色姣好的男子，啊~温太医魅力不是一般的大啊，连本国师都为之嫉妒。”<br /><p class='chapter_content_read_css'>温夕言并无解释，但眉眼间流露的确实得轻蔑。<br /><p class='chapter_content_read_css'>西凝雪在地上打了个滚，因而方才这一倒撞上耳侧，这丝疼痛唤回了她的几分清醒，按着脑袋迷糊的甩了甩头，不过她记得自己好像说了什么做了什么，西凝雪头疼脑胀的朝面前看去。<br /><p class='chapter_content_read_css'>自己面前不知何时多了个紫袍的美男，眼见那肤如凝脂、紫眸好似正在绽开的幽花一样朵朵开得都勾魂摄魄，而那巧笑倩兮的红唇微微上扬，噙着一抹妖异的诡感，好似那笑容可以轻松将人控制住。<br /><p class='chapter_content_read_css'>西凝雪脑子转不过弯得拿此人在脑中迅速的和温夕言比对了一下，一个淡漠舒雅一个妖冶如精，后者分明是她最喜爱的，但是直觉告诉她此人远比温夕言危险的多。<br /><p class='chapter_content_read_css'>西凝雪脑子还是很迷糊，不知道为什么眼前会出现一个陌生的男子，难不成周公准备帮她圆梦，找个祸国殃民的妖孽给她美梦成真？不错，现在如此得美好时光，不做些什么还对不起自己。<br /><p class='chapter_content_read_css'>“美人儿美人儿，来……我们去吃饭，呜哈哈……”西凝雪成功的扑了过去，原以为温夕言会敞开怀抱来迎接她，不过当他真的伸出手将她拥住，西凝雪却暗自腹诽，自己这梦做的是不是太真实了点，怎么扑过去的时候还能看见他笑得诡异的面容。<br /><p class='chapter_content_read_css'>下一瞬间，那温热的暖息便吐在了耳畔，“下不为例。”<br /><p class='chapter_content_read_css'><span style="line-height:1.5;">西凝雪张扬得笑容僵在嘴角，整个人都挂在他身上不知是大肆得抱紧一点以防摔倒还是直接避开才好，一时之间进退万难。</span><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		而他的口气分明是看出她已经清醒了，若是她继续得寸进尺的搂上去，他指不定记仇得等着什么时候就来报仇，可若是她自己退开，那她装醉得事情就会被三皇子一行人给发现了。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'>	<p class="MsoNormal"><p class='chapter_content_read_css'>		周公啊周公，这下你可害苦我了，下次我绝对不给你烧香了，你等着饿死吧。<p class='chapter_content_read_css'>	</p><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405988&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405988&&novelId=17935'">下一章</div>
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

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
    <title>（三十一）一众胭脂粉扑香 半截断木魂开散</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351944&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351944&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351944+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十一）一众胭脂粉扑香 半截断木魂开散]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351944')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351944 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351944,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第32章&nbsp;&nbsp;&nbsp;（三十一）一众胭脂粉扑香 半截断木魂开散
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			为了这三年一度的花魁大赛，滦城四大青楼可谓是不留余力，狠下血本，只为夺取这第一花魁的称号。<p class='chapter_content_read_css'>凉荷作为清香玉的头牌自然是要下心思练舞和精心打扮，舞蹈都是新的鸢裳舞，整整练习了三个月，衣裳是在香布庄定制的，胭脂水粉都是最上乘的，一切都准备好了，只差上场了。<p class='chapter_content_read_css'>但是……<p class='chapter_content_read_css'>还是出了纰漏……<p class='chapter_content_read_css'>“鸢妈妈，我的鸢裳不见了……”凉荷哭的梨花带雨，好不容易扑的胭脂都被染花了。<p class='chapter_content_read_css'>“怎么会突然不见了？”鸢妈妈不过三十岁上下，原本笑眯眯的表情突然凝住，“还有一刻钟就该你了，怎么这个时候出纰漏？燕儿、留香去帮忙找，凉荷快去补妆，我先去帮你换一下场次，真是的，尽给我惹麻烦。”<p class='chapter_content_read_css'>“谢谢鸢妈妈。”凉荷被苏软按在座位上，尽快补着妆。<p class='chapter_content_read_css'>“好了。”苏软补妆很快，但是鸢裳还是没有找到，虽然鸢妈妈帮她换到了最后一位，但是时间也不算充裕啊。<p class='chapter_content_read_css'>“我还是自己去找找吧。”凉荷还是放心不下，决定自己去找找看，迈出房门，整个楼道都空荡荡的，所有人都去到前场了，慢步溜进衣装房但是听到里面发出不对劲的声音，只得打开一个门缝偷偷看。<p class='chapter_content_read_css'>一个身材娇小的白衣少年被人按在地上没有一丝反抗，只用鼻子轻嗅一下，凉荷就知道一定是被人下了迷香，只是，她可不该多管闲事，反正这种事在这种地方常有，爱好男风也并不稀奇。<p class='chapter_content_read_css'>但是她心里怎么慌慌的呢？<p class='chapter_content_read_css'>“凉荷，鸢裳已经找到了！”燕儿的一声呼喊吓了她一跳，但是房里的男人好像没有发现，凉荷捋了捋发丝，当做什么事也没发生似的回到自己房里，但中途还是回头看了衣装房一眼，确保没人跟出来才松了一口气。<p class='chapter_content_read_css'>时辰掐的刚刚好，凉荷刚换好衣服就轮到她上场，将面纱戴好，脚还没有踏上台阶场下就一阵骚乱。她被苏软一把扯下来。<p class='chapter_content_read_css'>“怎么了？”她还没搞清楚状况，但苏软确实扯得她手腕很痛。<p class='chapter_content_read_css'>“你还敢上去？真是不要命了。”苏软的语气十分紧张，“你虽然是清香玉的头牌，但见识还是太少了，你应该听说过顾王吧，南苧唯一一个异姓王爷，那个穿白色华服的就是顾王。”<p class='chapter_content_read_css'>凉荷顺着她所指的方向看去，顾王面目俊美但溢满了戾气，花魁赛的袁老板一个劲儿的解释着什么，顾王背后的俊美男子激动地吵吵着，但听声音应当是个女子，还有经常光顾清香玉的公孙公子，平常总是笑若春风的他也冷了面一脸严肃。<p class='chapter_content_read_css'>好像出了什么不得了的大事啊。<p class='chapter_content_read_css'>“顾王做世子时就是滦城第一公子，性格温文尔雅，但自从顾府走水继承王位后性情就变得阴晴不定，而且前一段日子顾王妃刚刚去世，听说还是被顾王逼死的，你说，若是不小心惹上他，你说会有什么后果？”苏软语气加重故意吓唬凉荷，果然，凉荷被吓得腿都在打抖。<p class='chapter_content_read_css'>“希、希望我刚才看见的跟这件事没关系……”凉荷小声祈祷道，但男装的女子耳朵尖到连这么小的声音也听到，只是眨了两下眼就跑到了自己眼前，凉荷直接吓得坐在台阶上。<p class='chapter_content_read_css'>“你说你刚才看见的，你看见了什么！”凉荷的衣领直接被揪住，女子凶狠地质问她。<p class='chapter_content_read_css'>“我、我……”凉荷哆嗦地说不出话来。<p class='chapter_content_read_css'>“七七，你吓到她了。”公孙公子扯开女子的手，安抚道，“你冷静些，南宁应该还没离开这里太远。”<p class='chapter_content_read_css'>“凉荷，你放心，我们没有恶意的，”公孙公子给她一个如水的笑容，“你刚才到底看到了什么？告诉我。”<p class='chapter_content_read_css'>良久，凉荷才缓过来，小声道：“我刚才去衣装房的时候看见一个白衣的小公子被一个男人按在地上，好像是中了迷香，之后，之后我就不知道了。”<p class='chapter_content_read_css'>“白衣，就是南宁，衣装房在哪儿？”顾王不知道什么时候到了面前，语气低沉。<p class='chapter_content_read_css'>“婢子带您去。”苏软连忙道。<p class='chapter_content_read_css'>“白，没问题的，南宁绝对不会有事的。”公孙公子想要安慰他，却被他的一个冷眼吓住。<p class='chapter_content_read_css'>“公孙风清，下次你再敢带南宁来这种不三不四的地方，本王就把你直接送到左丞相府去。”<p class='chapter_content_read_css'>“没想到顾白你还这么关心南宁……”女子竟然敢直呼顾王的名字，苏软也是被吓了一跳，但还是本分的带路。<p class='chapter_content_read_css'>刚到了衣装房门口，顾王就粗暴的踹开了门，但房间里除了几件衣服和衣架什么也没有，苏软明显感觉到他的戾气又重了许多，冷汗顺着脖颈就滑进里衣里。<p class='chapter_content_read_css'>“怎么回事，南宁她——可恶，到底是谁，最好别让姑奶奶找到他，否则我抽死他！”女子又咒骂一声，这下连公孙公子也不敢再说话了。<p class='chapter_content_read_css'>苏软慢慢压低身子，以求能降低自己的存在感，在心里默默问一句。<p class='chapter_content_read_css'>南宁……到底是何方神圣啊？<p class='chapter_content_read_css'><p class='chapter_content_read_css'>一樱山山脚下。<p class='chapter_content_read_css'>晏紫荆刚从师父那里回来，她师父也是个奇怪的人，这次让她回孚城岛必须路过一樱山和滦城，一樱山她还能理解，最近一樱山山匪出没，大概是想练练她的剑术有没有下降，但是，路过滦城是想干嘛啊？伤脑筋。<p class='chapter_content_read_css'>真是说曹操曹操到，晏紫荆刚想到山匪就遇到一群山匪，还是一群正在实施打劫的山匪，对象是——一个弱女子！<p class='chapter_content_read_css'>说是一群山匪其实只有十几个人罢了，但是十几个大男人欺负一个弱女子真的让晏紫荆忍受不了。<p class='chapter_content_read_css'>晏紫荆怒火中烧抽出月牙长剑对这其中一人便是一剑，正刺在那人的肩胛骨上，血顿时喷涌而出。<p class='chapter_content_read_css'> “喂！”晏紫荆拿剑指着他们，语气愤慨，“我原来认为山匪只不过是打劫钱财罢了，没想到还做如此下流之事，看本姑娘不好好教训你们一番！看剑！”<p class='chapter_content_read_css'>山匪们还没反应过来就被晏紫荆痛扁一通，慌不择路的逃回山寨。<p class='chapter_content_read_css'>“姑娘，你没事吧？”晏紫荆扶起摔在地上的女子，等看清她的面貌大吃一惊，“师、师姐？”<p class='chapter_content_read_css'>“谢、谢谢。”女子低头诺诺的回答。<p class='chapter_content_read_css'>晏紫荆仔细看她一会儿，才发觉认错了人：“你和我师姐长得好像啊，你叫什么名字？”<p class='chapter_content_read_css'>“阿南。”女子依然诺着声音回答，不敢正视晏紫荆。<p class='chapter_content_read_css'>“啊，你怎么一个人到这里来？从前阵子这里就闹山匪了，你一个弱女子在这里真是不安全。”晏紫荆看她的样子就想起自己的师姐，也对她分外亲热。<p class='chapter_content_read_css'>“家乡闹灾，父亲、母亲和哥哥都死了，我，逃难出来。”女子跟在晏紫荆后面，平静地回答。<p class='chapter_content_read_css'>“啊——那你是要去投靠亲戚吗？”<p class='chapter_content_read_css'>“没有，亲戚。”女子说话断断续续，语气也有些生硬。<p class='chapter_content_read_css'>晏紫荆想，大概平常不和人说话接触吧，连性格也这么软糯。<p class='chapter_content_read_css'>“啊——要不然你跟着我吧，我恰好缺一个身边人呢，我这个人你别看剑术很好，其实生活上就是很毛躁，我娘常说我根本就不像一个女子，还很担心我以后嫁不出去，看阿南你这么温柔，应该和我正好相反吧？”<p class='chapter_content_read_css'>“那就，做，侍女，可以留在，小姐身边。”<p class='chapter_content_read_css'>晏紫荆听她认真的语气，笑道：“好啊。”其实她想有个姐妹啊，算了算了。<p class='chapter_content_read_css'>晏紫荆赶了整整六天六夜的路终于赶到滦城，打开师父交给自己的书信，看完之后她彻底恼了。<p class='chapter_content_read_css'>什么啊！竟然让她再回到一樱山！可恶！师父他到底想干嘛啊！<p class='chapter_content_read_css'><p class='chapter_content_read_css'>已经半夜深临，就在所有人都在寻找南宁的时候，书绘音却潜入了守卫森严太子府。<p class='chapter_content_read_css'>书绘音像是出入无人之地一般在太子府随意走动，不一会儿就到了太子府的珍宝库，点了一小截迷香，数位守卫都打着哈欠倒在地上。<p class='chapter_content_read_css'>书绘音手指一动钥匙便到了自己的手心，将门打开，用了数分钟就找到了被扔置在角落里的小铜盒，他一扫上面的灰尘再打开，一株普通的绿色植物静静地躺在里面。<p class='chapter_content_read_css'>他将植物装在事先准备好的香袋里，正准备离开，就听到了一个最不想听的声音。<p class='chapter_content_read_css'>“没想到本宫的太子府的守卫竟然如此不堪一击。”太子宫雪那张半着面具的脸出现在书绘音视线内。<p class='chapter_content_read_css'>书绘音平静地看着他，看了半晌突然道：“你就不担心南宁吗？还是说，果然你一直把她当成棋子呢？”<p class='chapter_content_read_css'>“嗯？”他并没回答只是发出一个疑问单音。<p class='chapter_content_read_css'>“南宁，宫雪，南宫宁雪对吧？”书绘音继续面无表情道，“我记得我有警告过你，离南宁远一点儿吧？”<p class='chapter_content_read_css'>“嗯？”南宫宁雪对书绘音知道自己的身份一点儿也没感到吃惊，缓缓将面具取下，“我只是有些好奇，你是怎么知道我是宫雪的，猜出来的吗？”<p class='chapter_content_read_css'>书绘音看着他说了句匪夷所思的话。<p class='chapter_content_read_css'>“你魂魄的味道我可是有好好的记着。”语音刚落，书绘音就捏了个诀消失在这茫茫夜色中。<p class='chapter_content_read_css'>南宫宁雪疑惑的皱了皱眉。<p class='chapter_content_read_css'>“魂魄……的……味道？”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351944&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351944&&novelId=15670'">下一章</div>
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

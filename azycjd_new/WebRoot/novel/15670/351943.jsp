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
    <title>（三十）素色罗衫的意外 出乎意料的绝对</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351943&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351943&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351943+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十）素色罗衫的意外 出乎意料的绝对]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351943')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351943 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351943,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第31章&nbsp;&nbsp;&nbsp;（三十）素色罗衫的意外 出乎意料的绝对
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			顾王府书房。<p class='chapter_content_read_css'>顾白一遍遍地练字祈求平静下来但好像适得其反，木若涵临走时浅淡的笑容又浮现在脑海里，将他的心彻彻底底撕开一个血淋淋口子。<p class='chapter_content_read_css'>“啪”，手里的湘妃竹毛笔瞬间变成两节，顾白叹了口气，坐到木椅上重重的揉着蜷成一团的眉头。<p class='chapter_content_read_css'>“王爷，”管家敲了敲门框道，“王爷，南宫公子求见。”<p class='chapter_content_read_css'>“南宫公子？”顾白一愣，他来这里做什么？恢复到平静的状态道，“请他到花厅暂等。”看见管家还没有走，“还有什么事？”<p class='chapter_content_read_css'>“还有前几日来的那位公子，已经在花厅了。”<p class='chapter_content_read_css'>顾白心里涌上莫名的感觉，忍不住有一丝紧张：“本王会尽快赶过去。”说罢又反口，“算了，本王与你一起去。”<p class='chapter_content_read_css'>从书房到花厅不过只有短短几十步的距离，顾白只觉得好像走了很久，久到似乎闻到了几个月之后的木槿花的香味。<p class='chapter_content_read_css'>花厅里有些吵杂，说话的声音，还有婴儿的哭闹声。<p class='chapter_content_read_css'>但是只有一个声音一遍遍回响在顾白耳边。<p class='chapter_content_read_css'>顾白只看到了她的背影就扑过去紧紧抱住，像是抱住绝世珍宝。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>“啊！”南宁瞬间就僵硬住了，什么情况？到底是谁在抱她，好像，是个——男人！<p class='chapter_content_read_css'>“嘶——”琴霜七一脚踹在顾白胳膊上，直接把他踹倒在地上，像是护着小雏的母鸡将南宁护在身后，抬脚就要踹到顾白脸上，顾白一闪身躲了过去。<p class='chapter_content_read_css'>木梓这才看清是他姐夫顾白，手里的糕点“啪”的掉在地上，就连南宫宁雪也被吓住。<p class='chapter_content_read_css'>“你个臭流氓！竟然敢吃小南宁的豆腐，看姑奶奶我不打死你！”琴霜七怒火中烧，是有想把顾白吃下去的冲动，南宁赶忙抱住琴霜七的腰，“七七，冷静啊！冷静！”<p class='chapter_content_read_css'>顾白拍拍衣袖上极其显眼的脚印，站在原地等着琴霜七冷静下来，但目光一直没离开南宁。<p class='chapter_content_read_css'>南宁被他炽热的目光注视着，心里竟然没有一丝异样，好似——本该如此？<p class='chapter_content_read_css'>“好了，顾王爷似乎也有一些冲动了。”坐在角落里的书绘音慢慢站起来，好像在替顾白开解，“小公子在那边。”<p class='chapter_content_read_css'>衣蓝将顾叶抱到顾白面前，顾白的注意力终于从南宁身上移开，看着呆萌萌很安静的顾叶，顾白心里漫上一丝惆怅，轻声道：“他和若涵真像，叫什么名字？”<p class='chapter_content_read_css'>“叶，顾叶。”木梓终于从呆愣中回过神来，很快回答道。<p class='chapter_content_read_css'>南宁也终于把琴霜七安抚下来，但琴霜七还是颇有怨气，恶狠狠地盯着顾白。<p class='chapter_content_read_css'>“刚才是本王失礼了，希望姑娘不要介意。”顾白颇有风度的拱手对南宁道歉。<p class='chapter_content_read_css'>“没、没关系，”南宁毫不在意的摆摆手，其实她只是吓了一跳罢了，“既然叶子已经交给王爷，那我们也该告辞了。”<p class='chapter_content_read_css'>“不知姑娘所住何处？”顾白拦住转身欲走的南宁。<p class='chapter_content_read_css'>“当然是住在南宫家了。”琴霜七一把推开顾白，一边拉着南宁往外走一边对她道，“南宁，回去你还要给我做红烧乳鸽呢，张叔做的鸽子总有一股怪怪的味道。”<p class='chapter_content_read_css'>一只手忽然扯住南宁的另一只手腕，琴霜七转身想要发怒却呆愣住。<p class='chapter_content_read_css'>“南宁要留在顾王府。”书绘音口气很淡，淡的就像在说今天要吃腌黄瓜一样。<p class='chapter_content_read_css'>“喂，你又是谁？”琴霜七质问道。<p class='chapter_content_read_css'>“他是我师兄，书绘音。”南宁不着痕迹地甩开两人的手，不经意地看向有些意外但脸上明显写着欣喜的顾白，心里有些不解。<p class='chapter_content_read_css'>“就算你是南宁师兄又怎样，南宁怎么能和这个流氓住在一个屋檐下！”<p class='chapter_content_read_css'>顾白虽然不知道“流氓”这个词，但也大概能猜出是“登徒子”的意思，也十分困扰，果然是被误会了。<p class='chapter_content_read_css'>南宁看看书绘音的脸色就知道没法反驳，大概是因为七圣珠的原因吧，或许顾王府里就有另外一颗七圣珠。<p class='chapter_content_read_css'>“七七，没这回事，王爷他只是、只是——”南宁一时也不知道该解释什么，但下意识的就想替顾白辩解。<p class='chapter_content_read_css'>“只是什么啊——连自己老婆都肯伤害的人算什么啊！”琴霜七不屑地看着顾白，她闲暇无聊时也逛逛瓦肆听听说书，自然对顾白的种种做法都知晓，虽然不知是真是假，但也绝不会是空穴来风，“背信弃义想要休了自己的恩人，连自己的孩子都想杀害的人怎么可能让南宁住在他的屋檐……下……”<p class='chapter_content_read_css'>“啊——”大概是木梓的一声惊呼，南宫宁雪的脸色也微变。<p class='chapter_content_read_css'>“我不许你这样说他！”南宁像是换了一个人一样，眼神发狠地看着琴霜七。<p class='chapter_content_read_css'>琴霜七不可置信地摸摸红肿的脸颊，再看南宁敌人一般的眼神一下子泄了气：“算了，我不说就是了。”<p class='chapter_content_read_css'>“对、对不起。”南宁瞬间不好意思地低下头，她到底干了什么？她竟然打了七七，只为了一个只见了一面的顾白，“脸，很疼吧？”<p class='chapter_content_read_css'>“还好啦，我皮比较厚，尤其是脸皮。”琴霜七不打紧地揉揉南宁的头发，“只是没想到小南宁劲竟然这么大，嘛嘛，南宁既然愿意留在这里就留在这里吧，真是没办法，南宁晚上要给我做红烧乳鸽吃。”<p class='chapter_content_read_css'>“好。”南宁连忙点头。<p class='chapter_content_read_css'>“化叔，去准备三间客房，南宫公子就留下吃顿晚膳吧。”<p class='chapter_content_read_css'>“不用，准备两间就好，我和南宁住在一起。”琴霜七搂住南宁就往外走，“怎么样，不介意我们去参观一下王府吧？顾、王、爷。”<p class='chapter_content_read_css'>“我去帮她们带路。”木梓冲顾白打声招呼匆匆跟上二人。<p class='chapter_content_read_css'>“看来本王又被仇视了。”顾白自嘲一笑，冲管家打了个手势，管家立刻会意退下。<p class='chapter_content_read_css'>“不过刚才王爷的行为确实有些越矩了，不是吗？”南宫宁雪虽然笑眯眯地回答，但语气里出现了连自己都不知晓的不善意味。<p class='chapter_content_read_css'>“嗯。”顾白认真思考了一会儿，“大概吧。”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>等南宁反应过来的时候就只抓住了夏天的尾巴，时间就这样完全被浪费掉了。<p class='chapter_content_read_css'>还没等着南宁感慨，琴霜七就又计划着到哪里去玩。琴霜七对顾白确实算不上友好，抢他筷子下的吃食，拐着弯讽刺他，害怕他对南宁居心不良就非要在他跟南宁说话的时候插嘴如此诸类，弄的南宁也有些尴尬，但顾白好像一点也不在意，反而乐在其中。<p class='chapter_content_read_css'>“啊——夏天的尾巴啊，其实南宁你想这样感慨吧，嘻嘻。”琴霜七一把就摸清了南宁的心思，“也不知道还有什么可以玩的，这里好像没有枫叶可以看吧？”<p class='chapter_content_read_css'>“风清竟然要去那种地方，不可以啊！”<p class='chapter_content_read_css'>“本公子就要去，要不然带着萱雨你一起去啊，怎么样？”<p class='chapter_content_read_css'>南宁和琴霜七不用回头就知道一定是楚萱雨和公孙风清在花园门口斗嘴。<p class='chapter_content_read_css'>楚萱雨和公孙风清严格来说就是一对冤家，他们俩完全就是吵着架进入南宁和琴霜七的视线。楚萱雨是礼部尚书的二女儿，性格活泼人也很容易打交道；公孙风清是左丞相的独子，是完全流连花丛不沾片叶的风流公子。两人都和顾白都是至交好友，偶尔也来府里串串门，自从认识了南宁和琴霜七，见识过南宁的厨艺之后，蹭饭都是常事。<p class='chapter_content_read_css'>“萱雨，公孙要去什么地方啊，你这么激动。”琴霜七好奇地问道。<p class='chapter_content_read_css'>“当然是那种地方啊！”楚萱雨不好意思的红了脸。<p class='chapter_content_read_css'>“啊，是很有趣的地方哦，七七，南宁，要不要一起去？”公孙风清一摇象牙折扇，魅惑一笑。<p class='chapter_content_read_css'>“啊——我知道了！我也要去！哈哈，来到这里怎么可能不去秦楼楚馆逛一逛呢，真是失策了。”琴霜七笑的一脸灿烂，超级喜欢看古装剧外加小说的她，怎么可能不知道公孙风清说的是什么地方呢。<p class='chapter_content_read_css'>“七七……”<p class='chapter_content_read_css'>“哈哈，南宁有美女看啊，而且那种地方的衣服也超漂亮的，嘻嘻，去吧去吧。”琴霜七晃着南宁的胳膊。<p class='chapter_content_read_css'>“但是……”南宁一皱眉。<p class='chapter_content_read_css'>“没关系，我想公孙可以赞助给我们几身男子的衣服吧。”琴霜七看向公孙风清，“对吧？”<p class='chapter_content_read_css'>“当然，区区几件衣服而已，本公子可不吝啬，哈哈。”公孙风清合起折扇敲敲缠满绷带的左手心，“而且还有，今天晚上可是三年一度的花魁赛，满春楼、清香玉、流漫阁和巧芝房四大青楼可都有当家花旦出台表演，怎么样？很期待吧。”<p class='chapter_content_read_css'>“呦呦，今天晚上可真有看点了，lucky。”<p class='chapter_content_read_css'>“哈，哈。”南宁和楚萱雨同时干笑两声。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>南宫府书房。<p class='chapter_content_read_css'>“公子，太夫人的衣冠冢已经找到了，就在侯南林中，只是，并没有立碑。”衣蓝将准确的位置图递给南宫宁雪。<p class='chapter_content_read_css'>“没有立碑？那陌雪阁是怎么知道一定是母亲的墓，找了这么多年都没有找到，怎么可能……”南宫宁雪看到第二张纸时就顿住，“原来是他回来了……”<p class='chapter_content_read_css'>“那接下来该怎么办？”<p class='chapter_content_read_css'>“那就如他所愿，既然所有的真相都在那个人身上，就不留余力的去找到真相，那样，所有的计划才可以顺利进行，”南宫宁雪打开桌上的木盒，一块浅棕色的硬物赫然躺在红色锦布上，“在一樱山上采到的断木也可以派上用场了。”<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351943&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351943&&novelId=15670'">下一章</div>
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

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
    <title>（四十二）两舟共渡风云起 一舟直航入风铃</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351955&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351955&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351955+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十二）两舟共渡风云起 一舟直航入风铃]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351955')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351955 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351955,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第43章&nbsp;&nbsp;&nbsp;（四十二）两舟共渡风云起 一舟直航入风铃
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			太阳刚刚从地平线上升起，若按照平常的出海规律来看，这个时辰渡口早就该是客船出海最频繁的了，但是，现在却只有一两艘小船停泊在港口。<p class='chapter_content_read_css'>  一位身着华贵紫袍的公子乘马车赶到渡口，只是一掀帘子，一个侍童打扮的人下了马车，他便敲着扇子用食指挑起车窗帘向外看去。<p class='chapter_content_read_css'>  不多时，侍童便回来了，在他耳边低语几句，他一声冷笑。<p class='chapter_content_read_css'>  “区区一个小渡口还有这么多规矩，南苧倒也就是如此了，罢了，今日便先回去，若是明日还是无法出港，那就该要有点办法了。”<p class='chapter_content_read_css'>  侍童低头低喏一声。<p class='chapter_content_read_css'>  马车又扬长而去，扬起几层飞灰。<p class='chapter_content_read_css'>	<p class='chapter_content_read_css'>  旦日，南宁像是什么也没有发生似的去厅堂吃早饭，但事实上她是错过了早饭，恰好赶上了午饭。<p class='chapter_content_read_css'>侍女刚刚布好最后一道菜，南宁快走几步坐到了顾白旁边，完全忽视其他人怪异的眼神，冲着顾白淡淡一笑。<p class='chapter_content_read_css'>琴霜七也不知道到底是该喜还是该忧。喜的是南宁终于醒过来了，精神看起来也不错，但是，南宁平常都是挨着她吃饭的，今天却跑去挨着顾白了，让她心里很不平衡啊。<p class='chapter_content_read_css'>想着她还颇为幽怨的看了旁边的书绘音和木梓一眼，书绘音自是无所谓，而木梓却被吓的呛了好几口汤，然后默默挪了凳子远离琴霜七。<p class='chapter_content_read_css'>南宁攥着筷子犹豫良久，只见几片香菇被放到了米饭上面。<p class='chapter_content_read_css'>南宁扭头看着顾白，顾白脸上竟是有些扭捏，语气里有些不好意思的宠溺。<p class='chapter_content_read_css'>“你身体刚刚好，多吃些。”<p class='chapter_content_read_css'>南宁直接指着顾白已经吃了接近三分之一的米饭道：“我想吃大哥的饭，好不好？”<p class='chapter_content_read_css'>明明很平常的话，在顾白听来却有撒娇的意味，虽是心里乐开了花，但表面上还是要淡定。<p class='chapter_content_read_css'>“好，可是我的都已经吃了这么多了。”<p class='chapter_content_read_css'>“放心，我不会嫌弃顾大哥的口水的。”南宁一边说着，一边将两人的饭碗换过来，扒着顾白碗里的米饭吃的不亦乐乎。<p class='chapter_content_read_css'>顾白强忍住想要摸摸南宁头发的冲动，一边给南宁夹菜一边含笑。<p class='chapter_content_read_css'>两人就像是亲生兄妹一般温馨融洽，而南宫宁雪进到厅堂时看到的正是这一幕。<p class='chapter_content_read_css'>南宫宁雪心里也颇为费解，看昨天的情形明明两人还有些剑拔弩张的意味而今天却如此和乐。<p class='chapter_content_read_css'>当南宁看见他的时候，刚刚还和顾白说的正高兴一下子就顿住，默默无言的低头扒饭。<p class='chapter_content_read_css'>  侍女为南宫宁雪搬来了凳子，南宫宁雪正落座到顾白旁边，与南宁相距甚近。他自是瞧见了南宁看见他的反应，原本有些憧憬见到南宁的心情一下子变得复杂起来，但还是含笑道：“已入了凉秋，天气转寒，秦姑娘要多加些衣物以免偶感风寒。”<p class='chapter_content_read_css'>  “天气哪里热了？我看你是巴着我生病吧！”南宁还没反应过来话就已经出口，待反应过来自己说了什么，竟“啪”的一声摔了筷子，脸色煞白，落荒而逃。<p class='chapter_content_read_css'>  整个厅堂是死一般的寂静。<p class='chapter_content_read_css'>  南宫宁雪脸上露出尴尬但更多的是不解，不光是他所有人都是如此，没人能想到会从南宁口里说出这样刻薄的话。<p class='chapter_content_read_css'>  “南宁怕只是不留神说出来的，她才刚刚醒来没多久，情绪还不太稳定，”顾白放下了筷子，看向南宫宁雪，沉声道，“还望南宫公子莫要怪罪。”<p class='chapter_content_read_css'>  “无碍。”南宫宁雪轻轻摇头，脸上的尴尬早已褪去。<p class='chapter_content_read_css'>  “白！”一声呼唤远远传来。<p class='chapter_content_read_css'>  众人一听便知道是谁，除了左丞相之子公孙风清，还有何人会如此大胆的亲昵的唤顾白的名字？<p class='chapter_content_read_css'>  只见公孙风清手里扬着一封信出现在厅堂前，面色焦急的快步走来……<p class='chapter_content_read_css'>  <p class='chapter_content_read_css'>  不过未时许，便有侍女来唤南宁前往书房。<p class='chapter_content_read_css'>  而南宁却像鸵鸟似的缩在被子里，完全忽略侍女在门外焦灼的呼唤，她将身子团成一团，心里在不安惊恐的打着鼓。<p class='chapter_content_read_css'>  那明明不是她想说的话啊，她只想轻轻答应一声承了他的好意，但是大脑怎么就像断了层似的不受控制了，说出那种刻薄无礼的话来呢？难道她潜意识里就是个双重人格？怎么会……<p class='chapter_content_read_css'>  房门被砰地一声踹开，紧接着就听到砰砰砰急促的脚步声，再者就是被子被哗的一下掀开，南宁整个人都瑟缩了一下，眯了半会儿眼才敢看向怒气冲冲的琴霜七。<p class='chapter_content_read_css'>  琴霜七两手拤腰，居高临下的看着她，毫不客气的提溜起她的后领子把她提起来，让她直起身子正视自己。<p class='chapter_content_read_css'>  她又戳戳南宁的脑门，故作厉声道：“好你个小南宁躲在这里不去书房，是想让我们等多久啊？还非要我请自来请你。”<p class='chapter_content_read_css'>  南宁乖乖地坐在床上任她批评，好不委屈道：“我只是——”<p class='chapter_content_read_css'>  “我知道，你不就是说了句刻薄话吗？虽然很不像是你的作风，但是人家南宫都走了你还跟自己较什么劲儿啊？你啊你，”琴霜七搂过她的脖子，又狠狠揉着她的头，“再说了，南宫像是那么斤斤计较的人吗？相处这么久他是什么人你还不知道？你以为是跟书绘音和木梓那样的人吗？好啦，快走啦。”<p class='chapter_content_read_css'>  说着将散在一旁的鞋子给南宁踢回来。<p class='chapter_content_read_css'>  南宁没办法只好乖乖跟着琴霜七到书房去。<p class='chapter_content_read_css'>  书房中顾白拿着一纸书信凝思，书绘音在一旁坐着优哉游哉的喝着茶。<p class='chapter_content_read_css'>  “顾大哥。”南宁悄悄往里面探了个头被琴霜七一把推进去，踉跄了几步，直到扶住书桌案才稳住了脚步。<p class='chapter_content_read_css'>  “南宁你可算来了。”顾白见到南宁可谓是喜笑颜开，凝思的眉头倏尔展开，连忙站起身，亲昵的想要去摸南宁的头发，猛然手又转了一下弯，搭在她肩上，“南宁，我想拜托你一件事。”<p class='chapter_content_read_css'>  顾白将刚才拿在手中的信纸递给南宁，南宁低头看了一会儿，顾白继续道：“我想让你代我去参加风小姐的及笄礼，可否？”<p class='chapter_content_read_css'>  南宁手指尖停在信纸的某一处，犹豫了一下。琴霜七以为她是害怕只身前往，便扬声道：“放心吧，南宁，我和书绘音也陪你一起去，而且那可是出海啊，我可是从来没看过海呢，南宁你也是吧？一起去看看吧，说不定真的可以看到鲨鱼哦。”<p class='chapter_content_read_css'>  南宁点点头是答应了，但又微微皱眉道：“我可不想见到鲨鱼，还是鲸鱼和海豚比较可爱。”<p class='chapter_content_read_css'>  “嗯，那就这样说定了，出海呀！”<p class='chapter_content_read_css'>  南宁看着琴霜七兴奋的样子，心里的担忧默默被隐去，说不定，不会再那样了。<p class='chapter_content_read_css'>  其实这封信早在半个月前就该到顾白手上了，但收信的时候恰好被前来的公孙风清瞧见，公孙风清觉得顾白现在只顾得关心南宁也无心打理这些事了，就私自将信搁了起来，结果就忘了这事，直至今天一大清早翻看东西的时候才瞧见了这封信，而且离信上所说的风小姐的及笄礼不过只有七日了，才如此匆忙的赶到顾王府告知顾白此事。<p class='chapter_content_read_css'>  而在这时顾白的封地宁州又出了问题，顾白也着实抽不开身，正好想到了南宁，南宁刚刚醒来趁这个机会去外面玩玩也不错，于是就将这件事拜托给南宁。<p class='chapter_content_read_css'>  “今日渡口之船暂不出海，就只能让你们明日一大早去赶最早的一班船了。”顾白从张那封信的信封里掏出三张船票和一张滚着金边的薄木纸，“这是风岛主所寄的船票和请柬，船票的截止日期恰好是明日清晨的早班客船，所以，今晚还请你们养足精神了。”<p class='chapter_content_read_css'>  当晚，顾白就亲自给南宁收拾行装，他曾去过风铃岛，自是熟悉那里的气候，什么轻薄的夏衫，保暖透气的秋装都给南宁叠的好好的放进行李里，这可羡煞了琴霜七，琴霜七直接大大咧咧的冲顾白要了足够的银两，又装了两本特制的速写本和几根炭笔，就是这样简简单单。<p class='chapter_content_read_css'>  旦日不过才有四五点钟，琴霜七就从被子里被提溜出来，睡眼惺忪的被塞进马车里，南宁虽是有些困倦但还是能打起精神，至于书绘音——他就跟不用睡觉似的，什么时候都那个样子。<p class='chapter_content_read_css'>  南宁透过马车窗看着提着灯笼守在门口看着他们的顾白，心里一阵暖乎，现在也有可以盼着她回家的人了，或许，是家吧。<p class='chapter_content_read_css'>  琴霜七是在困得不行靠在她的肩头呼呼大睡，她也轻轻打了个哈欠想要小憩一会儿，而书绘音却突然开口。<p class='chapter_content_read_css'>  “南宁，你可知风铃岛为何地？”<p class='chapter_content_read_css'>  南宁呆呆的看着他，很真诚的摇了摇头。<p class='chapter_content_read_css'>  听着书绘音淡淡讲述风铃岛的一切，南宁只明白了风铃岛是块风水宝地。<p class='chapter_content_read_css'>  风铃岛虽属东路版图，临近南苧的孚城岛，只隔着一道死亡海峡，但气候却与四季如春的偏南之地有着天壤之别，一年四季的秋更冬替与北地无异，但植被果实的生长规律又与南地相同。最让是人惊异的无疑就是风铃岛自保。<p class='chapter_content_read_css'>  一是整片汪洋汐海上只有风铃岛这一个岛屿，唯一与它邻近的孚城岛中间还隔着一道死亡海峡，正如其名，若是没有岛民所赠的名帖是绝对会死无葬身之地。<p class='chapter_content_read_css'>  二是风铃岛岛体所有的法阵，没有借助任何人力，而是上天所赐的法阵，世世代代保护着岛上的居民。<p class='chapter_content_read_css'>  而正是处在这动荡的年代，各个国家都视风铃岛为肥羊，正所谓是兵家必争之地。<p class='chapter_content_read_css'>  而此次风小姐的及笄礼正是风岛主抛出的绣球，风铃岛，也要开始依附于他国了。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351955&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351955&&novelId=15670'">下一章</div>
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

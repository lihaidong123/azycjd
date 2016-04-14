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
    <title>（三十七）宫珩我就要逃婚 阿南我对不起你</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351950&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351950&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351950+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十七）宫珩我就要逃婚 阿南我对不起你]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351950')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351950 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351950,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第38章&nbsp;&nbsp;&nbsp;（三十七）宫珩我就要逃婚 阿南我对不起你
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			到了后半夜，顾白被琴霜七赶回了自己房间，只要是稍微有心的人就会看见他重重的黑眼圈，他真的是很担心南宁即使他很相信书绘音的承诺，为什么不是南宫宁雪，他不是东陆第一神医吗？但在顾白心里他就是宫家的人，即使他身上流着姨母的血也无法抹去宫氏之人冷血的天性。<p class='chapter_content_read_css'>今天顾白异常困倦，一沾枕头就睡着了，连外袍也没有脱，他梦见了一个儿时只见过一面的人……<p class='chapter_content_read_css'><p class='chapter_content_read_css'>“说到底也只不过是个小贱人！还整天装出一副可怜兮兮的模样给谁看啊？”宫娥说着将阿南手中的洗衣盆碰翻，刚洗好的衣服在地上滚了滚，阿南咬着唇想将衣服拾起来，被另一个宫娥一脚踩住了双手，直接摔在地上。<p class='chapter_content_read_css'>“哈哈哈哈，对不起哦，我不是故意踩到你的，不要怪我啊。”说着捏起阿南的下巴拍了拍她的脸蛋儿。<p class='chapter_content_read_css'>“呦，碧儿，你们怎么能欺负人呢？”远远传来一个女子的轻笑声，那女子注意到地上的阿南，惊呼道，“阿南，你怎么会在这儿？”<p class='chapter_content_read_css'>“怎么？你们认识？”宫娥好奇地问道。<p class='chapter_content_read_css'>“当然，我们不仅认识，我们可是同乡呢。”女子说着拉起阿南的胳膊，想将她拉起来，突然变了嘴脸将阿南一把推到地上，“哼，只不过是个被老娘卖到镇上富人家的窑子货色，我跟你认识都觉得丢脸。”<p class='chapter_content_read_css'>“哦~被老娘卖了啊，好像挺有趣的，说来听听啊。”其中一个宫娥起哄道。<p class='chapter_content_read_css'>“哟，你们是不知道啊——她呀，可从小是个灾星，克死她老爹不说还把她未成亲的未婚夫给克死了，她老娘害怕她再克死她两个哥哥就把她卖给了我们镇上的一个土财主，你们不知道啊，那个土财主胖的可比我们家怀仔的老母猪都要胖啊。”<p class='chapter_content_read_css'>“哈哈哈哈……那就是说，她现在可不一定是个雏了？”<p class='chapter_content_read_css'>“哈，不知道被多少人玩过了。”<p class='chapter_content_read_css'>“就说是个小贱人，没想到还真是啊。”<p class='chapter_content_read_css'>“我看她主子把她扔到这里也不是没有道理，这个小灾星若是留在了身边，她还能做的了皇后娘娘吗？你们说呢？”<p class='chapter_content_read_css'>“是啊……”<p class='chapter_content_read_css'>阿南手上手肘上全被摔出了伤，狠狠作痛，她跪坐在地上咬着唇红了眼眶。<p class='chapter_content_read_css'>“你们在干什么！”一个童稚却很严肃地声音猛然响起，所有笑声戛然而止，紧接着是扑通扑通跪地的声音。<p class='chapter_content_read_css'>“参见顾世子，顾王妃。”<p class='chapter_content_read_css'>“看来是要让皇上狠狠整治整治宫规了，你们竟然闲着没事在这里欺负一同当差的宫娥。”顾王妃声音严厉，她身旁的顾世子顾白连忙跑到阿南身边将自己的手帕递给她。<p class='chapter_content_read_css'>“你没事吧？”顾白微微弯一下腰正好与阿南实现齐平。<p class='chapter_content_read_css'>“多，多谢顾世子。”阿南低着头唯唯诺诺道。<p class='chapter_content_read_css'>“你——你和娘亲好像啊。”顾白赶忙拉着顾王妃过来，而从顾王妃的角度只能看到阿南的头顶，顾王妃伸手就要扶起阿南，阿南慌张一躲，“自己，来就，可以了。”<p class='chapter_content_read_css'>阿南赶忙爬起来，但依旧低着头。<p class='chapter_content_read_css'>顾王妃一皱眉，“抬起头来。”<p class='chapter_content_read_css'>阿南僵硬的抬起头，红通通的眼睛暴露在外。<p class='chapter_content_read_css'>“你和我一点也不像。”顾王妃语气很平静。<p class='chapter_content_read_css'>“明明就很像啊！娘亲！”顾白仔仔细细的看看阿南再看看顾王妃，然后指着自己的左眼角道，“只是娘亲这里多了一颗痣而已。”<p class='chapter_content_read_css'>“我说了不像就是不像，你看从头到脚有一个地方像吗？”顾王妃的语气似乎有些生气。<p class='chapter_content_read_css'>“顾王妃，和……”阿南刚想说确实一点儿也不像，就被慌张跑来的晏紫荆给扯住了胳膊，刚刚好按在摔伤的地方，阿南轻嘶一声，被晏紫荆不由分说地拽走。<p class='chapter_content_read_css'>“刚才那个是——姨母吗？”顾白眨眨眼表示没有看清楚。<p class='chapter_content_read_css'>“走吧。”顾王妃深深的望了阿南的背影一眼，拉着顾白向宫门的方向走去。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>顾白慢慢打开眼皮，刚好听到隔壁院子里公鸡打鸣的声音。<p class='chapter_content_read_css'>他将胳膊压到额头上，回想着只见了一面的那个小宫娥，不对，好像是姨母身边的侍女吧？好像是叫……阿南。再次回想娘亲说过的那些话，他终于明白了是什么意思，确实是不像啊，从头到脚哪有像的地方呐！那种怯懦的人怎么会和娘亲像呢？<p class='chapter_content_read_css'>只是后来她怎么样了？难道是和姨母一起死了吗？<p class='chapter_content_read_css'>顾白心里莫名对这个只见了一面的阿南充满了疑问，只是因为和娘亲长得像所以才会如此在意的吧。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>或许是害怕累到晏紫荆，宫珩没让晏紫荆出场任何仪式，只是让她像寻常人家成亲一样穿上红嫁衣拜堂成亲，当然拜堂就算了，直接入的洞房。<p class='chapter_content_read_css'>当宫珩正喜气洋洋的掀开盖头的时候，晏紫荆早就出了宫城，跑到郊外去了。<p class='chapter_content_read_css'>阿南穿着大红的嫁衣哆嗦着跪在地上，不敢正视浑身散着黑气的宫珩，只听到“乒乒乓乓”的声音，宫珩将能砸的东西都砸了个遍，等冷静下来的时候立刻让内侍去通知宫兵侍卫全都去找晏紫荆。<p class='chapter_content_read_css'>随后又让宦官去马厩里牵了匹马，自己出城亲自去找，走之前看着阿南道：“真是有什么样的主子就有什么样的下人，等找回来紫荆，就会让你去好好领罚。”<p class='chapter_content_read_css'>阿南跪在地上抖了一下，然后站起身来脱下身上的红嫁衣，只着里衣跪在地上，朝着床上的嫁衣磕了几个头。<p class='chapter_content_read_css'>“对不起，小姐。”<p class='chapter_content_read_css'><p class='chapter_content_read_css'>晏紫荆趁着所有人的注意力都在仪式上的时候装成宫娥偷溜出来，没想到会如此顺利，出了城就买了匹马随便往哪个方向扬长而去，直至跑了一个时辰左右，天色完全黑了下来才勒住缰绳思考接下来该怎么办，她也完全没考虑到这样做会对阿南有什么后果。<p class='chapter_content_read_css'>家里是一定不能回去了，那她该去哪儿？不如就去师父那儿避避风头吧，想着就调转马头往北边去，跑了才有一刻钟就听到后面有急促的马蹄声。<p class='chapter_content_read_css'>晏紫荆心道不好，狠狠甩鞭让马跑得更快，但她只是从城外随便买的马，哪里比得上宫珩的千里马跑得快。<p class='chapter_content_read_css'>晏紫荆咬咬牙纵身从马背上跳下来，一个不稳在地上滚了好几圈才停住，她的后脑勺直接撞在树桩上，她被撞得眼前发黑，但还是强撑着爬起来往旁边的林子里窜。<p class='chapter_content_read_css'>宫珩紧接着就跟上她，在后面大喊她的名字，晏紫荆就是吃了秤砣铁了心一股脑往前窜，她夜间视力不是很好，一个劲的磕磕绊绊，最后还是被宫珩追到。<p class='chapter_content_read_css'>她费力地眯着眼才能看清宫珩的身影，后脑勺的疼痛被无限放大，她和他面对着面，隔着两步的距离。<p class='chapter_content_read_css'>“紫荆，你跟我回去吧，之前我骗你是我不对，但已经过了这么久，你也该消气了吧，跟我回去吧。”宫珩说着将手伸向晏紫荆。<p class='chapter_content_read_css'>晏紫荆拍开他的手，向后退了一步，硬气道：“不要！我绝对不要回去！我不要做皇后！不要！不要！”我不要被烧死，我不想死，我不要！<p class='chapter_content_read_css'>说到最后开始失控起来，一直向后退。<p class='chapter_content_read_css'>“好，我们不回去，我们好好商量好不好？”宫珩忽然大声喊道，神色紧张。<p class='chapter_content_read_css'>“你，你说什么？”晏紫荆只觉得耳边嗡嗡直叫完全听不清他在说什么，“你说什么……”<p class='chapter_content_read_css'>说着又向后退了一步，忽而脚下一空，直接向后倒去。<p class='chapter_content_read_css'>晏紫荆只听到有人在她耳边喊道：“抓住我，千万不要松手！”<p class='chapter_content_read_css'>为什么？为什么我要听你的话？我就要松开！我不要听你的话……晏紫荆开始不断挣扎，拿另一只手直接去挠他的手背，指甲缝里都抠出了血，慢慢觉得身体越来越重，越来越重，慢慢向下坠去……<p class='chapter_content_read_css'>“嗯。”晏紫荆模糊地哼唧一声，眼皮刚刚睁开，就听到旁边有人喊道：“娘娘醒了，皇后娘娘醒了。”<p class='chapter_content_read_css'>“紫荆，你醒了。”宫珩喜出望外的面容映进晏紫荆眼瞳中。<p class='chapter_content_read_css'>晏紫荆挣开宫珩紧紧攥着自己的手，皱眉道：“你谁啊？竟然敢闯我的闺房？我二哥呢？他跑哪去了？”<p class='chapter_content_read_css'>晏紫荆一连几个问题直接把宫珩问的面容僵硬。<p class='chapter_content_read_css'>宫珩强装着微笑，问道：“紫荆，你是不是睡糊涂了？怎么会不知道我是谁啊？”<p class='chapter_content_read_css'>“你才睡糊涂了！你全家都睡糊涂了！”晏紫荆生气的拿着枕头就往宫珩身上猛砸，“你给我滚！”<p class='chapter_content_read_css'>旁边的内侍宫娥们直接都吓傻了，他们大概也没想到他们的皇后娘娘这么凶悍，还有——胆大，她打的人是谁啊？那可是九五至尊的皇帝。<p class='chapter_content_read_css'>宫珩黑着脸往外走，被晏紫荆突然喊住，转过脸面色忽然好了。<p class='chapter_content_read_css'>“你等一下，去把我二哥喊来，告诉他我要吃红豆包子，还有，紫荆是你能喊的吗？！喊本小姐晏小姐！听到了没！”<p class='chapter_content_read_css'>宫珩一下子变了脸色，晏紫荆瞅着他，“你以为你玩变脸呢，还不快去。”<p class='chapter_content_read_css'>晏紫荆这一下子可是彻底把宫珩撵走了，又优哉游哉的吩咐内侍宫娥拿吃的喝的，往床头上一倚自在得不得了，后脑勺碰到床头她呲牙咧嘴痛了一下，微微皱了皱眉。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351950&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351950&&novelId=15670'">下一章</div>
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

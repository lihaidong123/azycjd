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
    <title>（五十二）荒野之地现村落 阿音自是阿绘妹</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=403359&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=403359&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+403359+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（五十二）荒野之地现村落 阿音自是阿绘妹]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('403359')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(403359 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(403359,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第57章&nbsp;&nbsp;&nbsp;（五十二）荒野之地现村落 阿音自是阿绘妹
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	风铃岛虽为富饶之地但也不缺极其荒凉之地，而石山村便地处这么一个荒凉之地，稀稀零落的茅草房围成不大不小的一个圈，将较为富饶的土地环围起来，作为耕地；房子外围有大片的森林其中又有各种动物，便适于狩猎；旁边又有小股溪流作为水源。这里每年能够收获的粮食勉强能够果腹，更不要说去卖来换些什么东西了。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	这里的村民白天只有少数的人在田地里耕作，大部分的青壮劳力都去了森林里狩猎，儿童妇女和老人们就留在村中互相看顾。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	所以，村中一旦来了陌生人就会引起大幅躁动，现在，就是这样。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“阿音，那位俊俏的公子是谁啊？还带着这么漂亮的大闺女，阿音，你跟阿叔说说呗。”陈叔一边伸着头看向屋里的紫衣公子，一边笑眯眯地问道。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“是阿哥的朋友，听阿哥说，他们是嗯，”阿音挠挠头，满脸困惑，“是什么来着，啊，就像夏阿婆和夏阿公那样的，叫什么来着？我想不起来了。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	陈叔了然的点点头收回了目光，“原来是一对儿小夫妻呀，怪不得这么亲密，唉，我还想着给我家阿苗找个小郎君呢，唉。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“嗯？啊，”阿音猛然敲了一下脑袋，“哎呀呀，陈阿叔，我要去拿药了，你也赶快回家吧。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音推推搡搡将陈叔推出院子，将小门一关匆匆跑去了后院。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	陈叔摸摸脑袋，耸耸肩，踱步走远了。有些正值青春的少女一听屋里的二人是夫妻，立刻怏怏地走了，有不少好奇的孩童依旧趴在篱笆外瞧着屋里的紫衣公子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音手刚碰上炉子上的药蛊立刻呲牙咧嘴的吹吹手，正为难的想着要怎样把这药拿过去，一方厚棉帕子就递了过来。阿音顺着帕子看过去，正是屋内的紫衣公子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“拿这包着药蛊，小心些，莫要烫着。”紫衣公子倚在窗户边，向后扭头伸着手将帕子递给阿音，面容和煦。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“嗯。”阿音点点头将帕子接过来小心翼翼的包住了药蛊，扭过身，递给了紫衣公子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	紫衣公子微微一笑，将药汤尽数倒入汤碗中，再一挥袖子，药蛊便回到了炉子上，阿音就提水往药蛊里加水，再盖好盖子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音搬了小板凳坐在窗边，往里目光炯炯的看着紫衣公子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	紫衣公子轻轻用手拂了拂床上女子的额头，紧接着端起桌上的汤碗，用木勺子舀起一小勺，轻轻吹几口再慢慢送进女子的口中，女子只能咽下去小半勺，另一半就留在嘴边，紫衣公子就拿帕子再为她擦擦嘴角。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音第一次看见比她阿哥还要温柔的男子，不由得看出了神，还咂了咂嘴。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“阿音，阿音。”紫衣男子将空的汤药碗放在床头柜上，瞧见了趴在窗边出神的阿音，将修长的五指在她面前晃了晃，“阿音？”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“啊，小哥哥。”阿音不好意思的吐吐舌头，“小姐姐怎么样了？还没有醒啊？”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“是啊，小姐姐她害了风寒，不过，过几日就会好了，阿音你不必这么担心。”紫衣公子又给女子捏了捏被角，转过身和阿音聊天。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“阿音，书绘音是你阿哥吗？怎么不见你们父母啊？”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“书绘音？”阿音眨眨眼，摇摇头，“不是呀，阿绘是阿音的阿哥，阿音是阿绘的小妹。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	紫衣公子笑笑，递给她一个洗干净的桃子，“啊，小哥哥知道了，阿绘才是阿音的阿哥。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音咬了一口桃子，满嘴鼓鼓囊囊的点头。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“那，阿音你们的父母呢？这么多天来小哥哥从未见过他们呢。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音又摇了摇头，嘴里含糊不清：“阿爹，阿娘，没有，阿哥养阿音，阿音只有阿哥。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	紫衣公子沉默一会儿，继续笑道：“那你阿哥待你好不好啊？多长时间来看你一次？”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音歪着头，将嘴里的桃子尽数咽下，“不一定的啊，有时候是几天一次，多一点儿是几个月一次，最长一次的话，嗯——”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音掰掰指头，算了半天，“最长一次有三年咧，那时候阿音才只有六岁嘞，三年没见到阿哥，阿音那时候就闹脾气不肯认阿哥，阿哥急得团团转，让陈阿叔，夏婆婆他们一个个来劝阿音呢，阿音闹了一个月，才肯认阿哥，自那以后，阿哥就再也不敢丢下阿音一个人那么长时间了，咯咯。”阿音说完咧嘴笑了笑。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“这样啊。”紫衣公子摸摸她的头顶。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“砰！！”院子里忽然发出巨响，紫衣公子脸色一凝，紧接着房门就被毫不留情的破开。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“啊！小哥哥救命！放开阿音！放开阿音！呀啊！”阿音被一个满脸凶相的男人一把提溜起来，紫衣公子手掌一动，但立刻顿下来，一股紫烟在掌中消散。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	一把寒光凌冽的大刀横在他脖颈间。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	手执大刀的大汉细眼一斜示目抓着阿音的男人，男人立刻将阿音手中的桃子塞到她嘴里。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音立刻上手去抓男人的脸，男人啧了一声，上手便要打晕阿音。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“住手！”紫衣公子猛然大喊，“阿音莫怕，不要乱动。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	阿音立刻不再乱动，男人轻瞥了他一眼，手一扬，另一人适时撤回大刀，阿音被丢在他怀里。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“看好她，若是再大喊大叫，可不是打晕这么简单了。”男人居高临下地瞪着他。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“大哥，那这个女人怎么办？”另一个大汉拿大刀指了指床上的女子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“那是贱内，患了重病，至今药石无治。”紫衣公子抱住阿音，赶忙退到床边遮住女子。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“将那小丫头关到这个房间，还有，去镇上绑个大夫，好好给那小丫头治病，要是病死了可就玩完了。”男人冷冷道。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“是，大哥。”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“等一下。”紫衣公子连忙喊了一声，明晃晃的大刀立刻闪在眼前，他立刻低下头，低声道，“在下乃为行脚郎中，不知是何人患了何病，在下亦可……阿音！”<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“小哥哥！”阿音忽然被男人一把提溜起来。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“好，若是治好了那个丫头，这个小妮子便会无事，如果出了什么差错，你，她，这个小妮子，你们就准备好去见阎王吧！”男人将阿音夹在腋下，大步出了院门。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	“砰！”房门被厉声关上，紧接着被落了锁，窗户也马上被落锁。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	紫衣公子坐在床边，看向床上的女子，静默了片刻。<span></span> <p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal" style="margin-left:-26.25pt;"><p class='chapter_content_read_css'>	不多时，房门被再次打开，一位衣着华贵的女子被带进来，等紫衣公子看清女子的面容，微微张开了嘴。<span></span> <p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=403359&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=403359&&novelId=15670'">下一章</div>
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

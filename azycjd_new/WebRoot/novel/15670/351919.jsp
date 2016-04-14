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
    <title>（六）琴棋书画诗酒花 红衣笑颜夜凝花</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351919&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351919&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351919+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（六）琴棋书画诗酒花 红衣笑颜夜凝花]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351919')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351919 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351919,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第7章&nbsp;&nbsp;&nbsp;（六）琴棋书画诗酒花 红衣笑颜夜凝花
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  云霞出海曙，梅柳渡江春。<p class='chapter_content_read_css'>  淑气催黄鸟，晴光转绿苹。<p class='chapter_content_read_css'>  玉湖算是忘川郡最有名的碧水湖，周围景色最为赏心悦目，故而世家子弟大都爱在湖中乘船游水，四月月中旬正是中辰的才情会，湖中央正停了一艘最大的游船，周围停泊了些许别船，各位世家少爷小姐正陆陆续续的登上游船，南宁给小侍看了名帖，也窜进了船中。<p class='chapter_content_read_css'>  游船一共有两层，才情会会场便布置在二层，一层就供诸位少爷小姐暂时谈笑，吃食。<p class='chapter_content_read_css'>刚进船中，南宁的眼睛就一直停留在那些吃食上，将名帖随意的折了几折塞进袖筒里，找了个僻静的位置，落了座，一心一意吃起东西来，见到邻桌又有新食物，趁其不备便夹了几筷子，尝了一口，酸酸甜甜的很合南宁的口味。<p class='chapter_content_read_css'>  南宁惬意的眯了眯眼，又提起筷子，就听到有人问道：“姑娘旁边的位置可否有人？”<p class='chapter_content_read_css'>  她抬头看了一眼，放下筷子，笑道：“南宫公子，你也来了，这里没人。”<p class='chapter_content_read_css'>  南宫宁雪撩了袍子盘坐在南宁旁边，稍微一扭头就看见南宁不太淑女的坐姿，不自然地咳嗽了两下，南宁啊了一声，赶忙将双膝并拢跪坐在软垫上，腿却微微有些麻。<p class='chapter_content_read_css'>  “对了，南宫公子，我不太懂这才情会，你能告诉我些什么吗？”南宁也不再吃东西，只是双手握住茶杯。<p class='chapter_content_read_css'>  “我也是第一次参加。”看了看南宁，又道，“但稍微还是了解些，最主要还是靠琴棋书画诗酒花七种比赛来选出才子佳人各一位，其实……”<p class='chapter_content_read_css'>  “变相的相亲会。”南宁接住了他的话头，又嘬了一口茶。<p class='chapter_content_read_css'>  “确实是，秦姑娘倒是了解啊。”南宁身后传来一个熟悉的声音，南宁放下茶杯，眨了一下眼，淡淡笑，这其中似乎有些讽刺意味啊。<p class='chapter_content_read_css'>  “沈老板应该不是第一次参加这才情会吧？不置可否给我和南宫公子讲一下到底是怎么回事呢？”<p class='chapter_content_read_css'>  “确实如此，那就麻烦沈老板了。”南宫宁雪也附和一声。<p class='chapter_content_read_css'>沈言看了南宁一眼，落座在二人对面，南宁伸手倒了一杯茶给他，他无法推辞，只好细细讲来。<p class='chapter_content_read_css'>  “这才情会确实是各世家之间变相的相亲，用来巩固各世家之间的实力，至于这比赛的内容，琴棋书画诗是男女都要参加的内容，而酒，是男子参加，花，是女子参加。<p class='chapter_content_read_css'>琴棋书画诗的内容应该不用沈某讲了吧？”<p class='chapter_content_read_css'>  “这个倒是不用了，琴应该指乐器，是音乐上的造诣；棋，应该是指围棋吧；书，是写字；画就是水墨画；诗就是作诗。是吧？”南宁吞了一口汤圆，细细数到。<p class='chapter_content_read_css'>  “啊，是。这酒又分三次比试。一是分酒，比赛者要将没有标识的酒分辨出来，再对号入座，这次可以品尝。二是断酒，也可以品尝，要将同一家不同年限的酒判断出来。三是采酒。”沈言忽然停住不再言语。<p class='chapter_content_read_css'>  “哎，怎么不说了嘞？”南宁奇怪地问道。<p class='chapter_content_read_css'>  “唉，这采酒从制出那么多年，就只有一人完成过，而且竟还是个女子，反正也无人可以完成，不说也罢。”<p class='chapter_content_read_css'>  “这样啊，”南宁又吞了一颗汤圆，遗憾道，忽而一折，“那沈老板还是说说吧。”<p class='chapter_content_read_css'>  “好吧。这采酒的内容就是，每一个比赛者都会领到一小杯不同的酒，在一炷香内，要从船内的各种材料中找出酿酒用的材料，还要在纸上写出此酒的酿造时间，方法。”<p class='chapter_content_read_css'>南宁眼皮一跳，小声道：“真是有够变态的。”<p class='chapter_content_read_css'>南宫宁雪听见她小声嘟囔，不禁莞尔，又看向沈言继续问道：“不知那女子是何人？酒不是只有男子才可以参加吗？”<p class='chapter_content_read_css'>  “沈某也只是听家父说过，”沈言仔细回想了一下，“应该是四十多年前，那女子是女扮男装来参加才情会的，好像也是外乡人，样貌也是极美的，额间还有蓝色的梅花妆，还带着一只颇有灵性的雪狐。<p class='chapter_content_read_css'>除了酒之外的各项也都居第一，记得家父说那女子扮男子倒是没有一人瞧出来，要不是最后她为了参加花，也不会亮出女子的身份，大概，就只有这些了。”<p class='chapter_content_read_css'>  “四十多年前啊……真是有够久了。”<p class='chapter_content_read_css'>  “那花呢？不会也那么难吧？”<p class='chapter_content_read_css'>  “花的话，也是分三次。一是辨花，就是将不同种类的花分辨出来，里面的花大都是从未见过的稀有花种。二是斗花，每位世家小姐都会提前养种特殊的花卉，谁的花更奇特，更稀有，便胜。三是绣花，就是每位世家小姐都会的刺绣。”<p class='chapter_content_read_css'>  “也不简单。”南宁喝了口茶，润润喉咙。<p class='chapter_content_read_css'>忽然头顶传来阵阵铃声，沈言起身道：“是开始的铃声，二位一起去二层吧。”<p class='chapter_content_read_css'>两人起身，跟了上去，刚到楼梯拐角处，南宁就被一只冰冷的手拖入了黑暗中。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  “你就不会轻一点吗！”南宁挣脱开书绘音的钳制，揉了揉发红的手腕，黑暗中书绘音的银发散着微妙的光，他往旁边一动手指，周围瞬间亮堂起来。<p class='chapter_content_read_css'>  “嗯，这个。”书绘音抄出手，摊开手心，一颗银色的小铃铛展现出来。<p class='chapter_content_read_css'>南宁捏过红色的编绳，面无表情地看着他：“这东西怎么会在你手里？”<p class='chapter_content_read_css'>  “是那个人扔掉的。”<p class='chapter_content_read_css'>  “你在监视我。”<p class='chapter_content_read_css'>  “是。”<p class='chapter_content_read_css'>  “你到底想怎么样？”<p class='chapter_content_read_css'>  书绘音看着她，忽而转开视线，“你将铃铛还给夏曼，让她断了见沈言的念头，然后再把她封在这个瓷瓶中。”他说着，手中就出现了一个巴掌大的青瓷瓶，递给南宁。<p class='chapter_content_read_css'>  “为什么？”南宁拍开他的手，心中不悦，“我在这儿刚接第一桩生意，你就让我毁约，还封印，这不是打我嘴巴吗？”<p class='chapter_content_read_css'>  “当然不是，瓷瓶我就交给你了，至于愿不愿意继续这生意是你的事，但有一点，夏曼的记忆，你绝不能看。”书绘音将瓷瓶扣在南宁手中，转身就出了暗阁。南宁奇怪的看着他的背影一点点消失，喃喃道：“真是莫名其妙。”<p class='chapter_content_read_css'>  她抬脚就想出去，顿了一下，朝后面扇了一掌，身后陷入黑暗，南宁揉了揉脸，挂起微笑，向外走去。<p class='chapter_content_read_css'>  “秦姑娘原来在这儿啊，比赛就快开始了，切勿要耽搁了。”南宁混进人流中，被南宫宁雪喊住。<p class='chapter_content_read_css'>  “好，马上。”南宁快步跟上他。<p class='chapter_content_read_css'>  “秦姑娘怎么不见人影了？”沈言见到南宁，奇怪地问道。<p class='chapter_content_read_css'>  “哦，只是见了一个熟人，聊了几句罢了，嗳，开始了诶。”南宁看向最中央的台子上，一时间，整个会场安静下来。<p class='chapter_content_read_css'>  南宫宁雪看着南宁的侧脸，半响也缓缓看向中央。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  南宁自是有自知之明，便在琴上率先弃了权，让她没想到的是，南宫宁雪也弃了权，乖乖做了个旁观者。<p class='chapter_content_read_css'>  南宁右手撑着身体，跪坐着往他身边挪了挪，低语问道：“南宫公子怎么也不参加？”<p class='chapter_content_read_css'>  南宫宁雪小嘬了一口茶，缓缓道：“在下别的倒还可以，只是这音艺上的事，唉~”说着也摇了摇头。<p class='chapter_content_read_css'>  “也是，有长必有短，人太完美了也不是什么好事，会被天妒的，哦，那个怎么说来着，”南宁呆呆想了几秒，“哦，天妒英才，红颜薄命。”<p class='chapter_content_read_css'>  “确实。”他赞同的点了点头，见南宁还想说些什么，低声先道：“秦姑娘还是先看表演吧。”<p class='chapter_content_read_css'>  果然南宁尴尬一笑，不再作声，注意力也放到了台上，他眼睛一瞥，看到她脸色一变，转瞬而逝，他也好奇的看去，只见一位银发的男子站在台上，看其竖冠，已过弱冠之年，一袭蓝色的锦袍，系一条银水色的腰带，手执青玉笛，半垂着眼，随意的吹奏着。<p class='chapter_content_read_css'>  这银发……南宫宁雪垂下眼帘，仔细想了一下，竟没有如此一人，若硬算起来也只有那人是银发，可是，又抬眼看向男子，男子忽然睁开眼来，琥珀色的眼睛让他心中一惊，自有了思量。<p class='chapter_content_read_css'>  南宁保持着微笑，眼睛一直死死盯着书绘音，而书绘音则像没事人似的从她眼前走过，落座在对面的桌旁。<p class='chapter_content_read_css'>  “银发呢，真是少见，也是一个外乡人。”沈言喝茶自语道，目光也落到书绘音身上，探究了一会儿，注意力又回到台上。<p class='chapter_content_read_css'>  “须臾，到底是什么意思？”南宁听那首曲子有些耳熟，正是小时候书绘音常常会吹的“须臾”。<p class='chapter_content_read_css'>  “须臾？是片刻之意。”南宫宁雪好心回答。<p class='chapter_content_read_css'>  “啊，这样啊。”南宁笑了笑，不再言语。<p class='chapter_content_read_css'>  接下来的时间倒过的也快，南宁一共就参加了书和诗两项，南宫宁雪倒是干脆一项都没参加，坐在那里一直喝茶。<p class='chapter_content_read_css'>  好不容易等到了酒项，众人的兴趣才被提起来。<p class='chapter_content_read_css'>  有小厮重摆了长桌，众多侍女端了酒上来，立刻，会场就布满了酒香，书绘音也被分到了几杯，鼻子往杯沿一凑，就执起笔来，从容的写出酒名，众人的眼光都刷刷的落在他身上，前几项，他就已经得了满分，若是这一项再……故而众人也对他十分好奇。<p class='chapter_content_read_css'>  书绘音分酒断酒也是过得极其从容，只剩了采酒这一项，其余的人也颇有自知之明，都不再参与，只剩下了书绘音一人。<p class='chapter_content_read_css'>  南宁不禁捏住衣襟，万分搞不懂他到底想干什么。<p class='chapter_content_read_css'>  只见书绘音捏起酒杯，闭起眼睛，将酒杯放在鼻间闻了闻，半晌没动。众人见他还没有动作，也都小声嘀咕，也有不少嘲笑之音。南宁用长袖遮住面，唇也勾起一个嘲笑的弧度，眼光直勾勾地看着书绘音，托大了吧，这下，你该怎么收场呢？<p class='chapter_content_read_css'>  忽然，书绘音脸上溢出笑容，眼神也变的异常柔和，放下酒杯径直走向那些乱人眼帘的材料。南宁心口腾的一下，脑海中闪出一些零散的碎片，似乎在哪里见过这种表情，在哪里呢？须臾？<p class='chapter_content_read_css'>  见南宁紧皱双眉，南宫宁雪担忧问道：“秦姑娘是身体不适吗？”<p class='chapter_content_read_css'>  “啊？没事，没事。”南宁揉了揉眉心，继而看向书绘音，席宴之间唯有他一袭蓝衣，从容不迫的性子令众人深坠其中，不过几个眨眼之间他就已经选好了大部分辅料，只差酿酒用的主料，只见他停在一堆米旁边不再有动作。<p class='chapter_content_read_css'>  “这米是有什么问题吗？”南宁怪怪的问。<p class='chapter_content_read_css'>  南宫宁雪摇了一下头，表示不知，沈言只好再次讲解：“这米自是有所不同，那米看起来都一样，而事实上是三种完全不同的米，分别是宁州糯米，商州白米和华州香米。宁州糯米用来做汤子最为滑腻，酿起酒来就会有一股软涩的味道；商州白米就是家中最常见的吃食，酿出的酒通透甘甜；华州香米常用于香料，用来酿酒成本较高，但出来的酒却是最为上品，会带着一种特殊的香味，只是一口便会唇齿留香。”<p class='chapter_content_read_css'>  “这样的话，主料应该是十分好选，毕竟各有出彩的特色，很好分辨啊。”南宁猜忌这中间还有别的道道。<p class='chapter_content_read_css'>  这边话音刚落，书绘音就写好了酿酒步骤提交上去，神色坦然自若，从容的回到席座中，不紧不慢的看了南宁一眼。<p class='chapter_content_read_css'>  “话说，这才情会的奖品到底什什么？在下虽有所耳闻奖品十分独特，但，到底是怎么个独特？”南宫宁雪很突然的问了一句。<p class='chapter_content_read_css'>  “还有奖品？”南宁眼眸一闪。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351919&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351919&&novelId=15670'">下一章</div>
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

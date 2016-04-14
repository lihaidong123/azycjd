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
    <title>（二十五）秘密伪装突生变 原是故人在此间</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351938&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351938&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351938+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十五）秘密伪装突生变 原是故人在此间]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351938')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351938 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351938,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第26章&nbsp;&nbsp;&nbsp;（二十五）秘密伪装突生变 原是故人在此间
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			虽是嘴上说着要让木梓长个记性，但还是从南宫宁雪那儿拿了上好的伤药给木梓。<p class='chapter_content_read_css'>  南宁唐突的闯进屋子，木梓吓了一跳，猛从床上弹起来，又呲牙咧嘴的哼哼了几声，趴回床上。<p class='chapter_content_read_css'>  “把袍子脱了，伤应该只在背上吧，至于你前胸的伤，不抹药明天早晨就会好了，还有眼角，幸亏没破相。”南宁见他死鱼一样趴在床上一动不动，心下有些恼火，上去便要扒他的衣服，木梓瞥见她阴沉的脸色，吓的把头埋在枕头里，身子死死贴在床上，任南宁怎样也只能扯起袍子的一角。<p class='chapter_content_read_css'>  “砰！！”<p class='chapter_content_read_css'>  突然发出巨大的刺耳的声音。<p class='chapter_content_read_css'>  木梓将脑袋埋得更深了，肩膀一抖，听到房间门打开的声音才僵硬的扭过脖子，偷偷抬眼看向门外，只看到房间门大开，整个房间都空荡荡的，多了几分冷清，木梓低眼便看到了被摔得粉身碎骨的瓷药瓶，还有那上好的药膏也变成了一滩烂泥。<p class='chapter_content_read_css'>  木梓别扭的闷声道：“这不是，男女授受不亲嘛……”<p class='chapter_content_read_css'>  还有今日，秦小妹怎么都怪怪的，还说出那样的话，如果，是真的也不错。夫君呀。<p class='chapter_content_read_css'>木梓房中的声响也传到了隔壁房间，一边是衣蓝、顾叶和行云的房间，另一边则是打翻木梓的陆钦，而南宫宁雪则是为了就近救治病人住在了别处，并没听到声响。<p class='chapter_content_read_css'>  衣蓝为了照顾顾叶抽不开身，行云也清楚隔壁怎么回事，只不过是他两个人吵吵架，没必要多管闲事，淡定的选择了沉默。<p class='chapter_content_read_css'>  但是陆钦则没那么好脾气，才刚睡下就被吵醒，心里怒火中烧，骂骂咧咧地推开门，一脸烦躁，恰好看见刚出门的南宁。<p class='chapter_content_read_css'>  上去就一顿臭骂。<p class='chapter_content_read_css'>  南宁低着头，权当没看到他没听到他的臭骂，自顾自的往外走。<p class='chapter_content_read_css'>  “喂，老子问你话呢！听到了没！”陆钦上手就抓住南宁的胳膊，迫使她不得不停下脚步。<p class='chapter_content_read_css'>  南宁抬起头，冷着脸瞪向他，想要狠狠甩开他的钳制，却被他抓得更紧，南宁声音有些不平稳：“你不知道，男女授受不亲吗？更何况我还是个有夫之妇。”<p class='chapter_content_read_css'>  “老子可不是什么君子，老子爱抓谁就抓谁，管你是黄花大闺女还是有夫之妇，那算个屁。”陆钦不屑的冷哼，“让你打扰老子睡觉，就算卸了你一条胳膊也补偿不来老子的睡觉时间。”<p class='chapter_content_read_css'>  “请你放手。”南宁很是客气的说到，但陆钦依旧无动于衷，“那就别怪我了。”<p class='chapter_content_read_css'>  “我看你要怎么——啊！”陆钦不屑的表情瞬间扭曲，大声尖叫起来，但事实上，南宁根本动也没动，只是冷眼瞧着他。<p class='chapter_content_read_css'>  “你……到底……做了什么？”陆钦抽着冷气跪倒在地上，手也自然从南宁胳膊上脱落，他也很清楚南宁根本没有碰他，但是全身都开始抽痛起来，痛入骨髓。<p class='chapter_content_read_css'>  行云听到惨叫不得不出门看看，推开房门就隐隐约约看到两个人影，一个跪在地上，另一个站在那里似是低头看向地上的人。<p class='chapter_content_read_css'>  他还以为是木梓和南宁，便上前查看，这才就着月光看清了是谁。<p class='chapter_content_read_css'>  “秦——呃，少夫人？”行云差一点就喊错了。<p class='chapter_content_read_css'>  “我说过，不要怪我。”南宁甩给两人一个背影，渐渐隐入黑夜中。<p class='chapter_content_read_css'>  “陆——”行云顿住。<p class='chapter_content_read_css'>  “啧，”陆钦身上的痛感忽然全部消失，站起身来，面部表情十分复杂，“老子竟然让一个小娘们给弄成这样，真是狼狈，啧。”然后瞥都不瞥行云一眼，回到房中。<p class='chapter_content_read_css'>  行云也觉得自己自讨没趣，讪讪地回房了。<p class='chapter_content_read_css'>  衣蓝刚哄睡顾叶不久，见行云进来便低声询问情况。<p class='chapter_content_read_css'>  行云摇摇头：“我也不知道怎么回事？好像是，呃，少夫人把陆钦给打了……”<p class='chapter_content_read_css'>  “啊？”衣蓝疑惑一声。秦姑娘不像是会打人的人，而且，听陆钦刚才的惨叫，一定是被打得很惨，但是，进寨之前看陆钦的身法，一定武功不弱，怎么会被秦姑娘打到如此惨叫？<p class='chapter_content_read_css'>  “还有就是，为什么陆钦刚才惨叫声这么大，就只惊动了我们？”<p class='chapter_content_read_css'>  “因为有公子住在那边。”衣蓝躺在床上，闷声答道。<p class='chapter_content_read_css'>  “哦。”行云便知晓了怎么一回事，一定是下了什么迷药吧。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  南宁因为自小练眼的原因，视觉在晚间比通常人都要好，自然夜间在寨子中行走如行云流水般流畅。<p class='chapter_content_read_css'>  脚步猛然顿住，若不是有心人根本看不清南宁眼神的变化，幽暗的眼眸渐渐变得清澈起来，南宁望望周围，疑惑的摸摸头，自言自语：“我刚才不是在木梓屋里吗？怎么跑到这儿来了？”<p class='chapter_content_read_css'>  南宁微微低头就瞧见胸口的衣服发着莹莹蓝光，往衣襟里一掏，原来是之前书绘音给她的香囊。前几天她把齐胸襦裙换了下来，换了对襟裙裾穿，就随手把袖筒里的香囊放进了衣襟里。<p class='chapter_content_read_css'>  “是她出现了？”南宁握住香囊，回想起书绘音说的异象，应该就是这个吧。<p class='chapter_content_read_css'>  但是，她在哪儿呢？<p class='chapter_content_read_css'>  南宁茫然的向四周看去，一个鬼影都没有。<p class='chapter_content_read_css'>  但是，一座小屋忽然出现在视线中，南宁像是受了蛊惑似的一步一步向那小屋走去，轻轻推开门，屋中的景象让她直愣愣的呆在那儿，张了张嘴，才发觉失了声。<p class='chapter_content_read_css'>  从外面看是一间普普通通小木屋，而里面却是另一番景象。<p class='chapter_content_read_css'>她身在大簇大簇的须臾花中，花的边界一望无际，天空没有太阳，而是镶嵌了一颗巨大的闪着璀璨光芒的夜明珠，将夜照成白昼，还挂着几朵云彩。须臾花上像是洒着一层金粉，发出点点光芒，只是缺少的是香气和生机。<p class='chapter_content_read_css'>南宁慢慢向前走，过膝的须臾花像是有了自主意识，自觉地让出一条道路，仅容南宁一人通过。<p class='chapter_content_read_css'>面前的景象开始扭曲起来，蓝色、白色、金色光芒融到一起，汇成了一条暗灰色的河流，南宁正站在岸边，身后是明亮的白昼、蓝色的花海；身前却是蒙灰的夜，暗灰的河流；左手边是一座拱桥，通体是由纯白的大理石做成，在夜中极其显眼。<p class='chapter_content_read_css'>一条小船慢慢划过来，船夫是位上了年纪的老翁，他脸上表情很淡，任南宁大声唤他也不理睬，甚至连看都没看她一眼。<p class='chapter_content_read_css'>南宁皱皱眉头，心道：难道是老翁耳聋眼神又不好吗？<p class='chapter_content_read_css'>“阿南……”一个熟悉的声音钻入南宁耳朵，那人的双手还未搭上南宁的双肩，南宁就惊恐的闪开，身体不由自主的向后转身然后，倒下去。<p class='chapter_content_read_css'>赤红的眼瞳温柔地看着她，看着她慢慢向下倒去，看着她眼中的惊恐慢慢放大，一切都像在放慢镜头。<p class='chapter_content_read_css'>直到南宁的衣角差一点儿坠到水中，他才探出手臂紧紧捞住她的腰，南宁瞬时就被捞了起来，面对着他，紧贴在他胸膛上。<p class='chapter_content_read_css'>南宁立刻挣扎起来，他笑着道：“小心我把你扔下去，乖一点，阿南。”<p class='chapter_content_read_css'>果然，南宁不再挣扎了。<p class='chapter_content_read_css'>“阿南，你在发抖，你还在害怕我？还是，恨我？”<p class='chapter_content_read_css'>他的声音总是这样温柔，可是那种温柔只是习惯，也是一种，狠毒。<p class='chapter_content_read_css'>南宁紧紧闭上眼，身体不由自主的发冷。<p class='chapter_content_read_css'>为什么，为什么会变成这样？<p class='chapter_content_read_css'><p class='chapter_content_read_css'>南宁也记不清是什么时候认识的阿阳，大概是七七忙于高考而忽略她的时候。在那个时候出现的阿阳，总是挂着最温柔的表情，有着最温柔的语气，但是那温柔却不是对着自己的。<p class='chapter_content_read_css'>*<p class='chapter_content_read_css'>南宁自小便是孤儿，具秦泽生所说，她是他在南宁捡到的，才起名为南宁，见到她时，她才四岁，是个失语者，这或许也是她父母抛弃她的理由，毕竟在这个很是物质的世界，身有残疾的孩子总是会少很多价值，也成为别人的累赘。<p class='chapter_content_read_css'>这是南宁自记事起便深知的道理，要么成为对别人有帮助的人，被人喜欢；要么成为别人的累赘，被人讨厌。<p class='chapter_content_read_css'>南宁也并非真正的失语者，只是开口说话很晚、很晚，直到五岁时才开口说第一句话，就是那时见到的书绘音，第一句话就是“书绘音，给我吃。”弄得秦泽生也是啼笑皆非，搞了半天才明白是南宁想要书绘音给她拿吃的，但是，书绘音理都没理她。<p class='chapter_content_read_css'>从那时起南宁就有被人讨厌的觉悟。<p class='chapter_content_read_css'>南宁从没上过幼稚园、小学，一直在家里自学还有秦泽生教给她的各种法咒，南宁学起东西来一直很快，但是，除了秦泽生和书绘音她从没接触过其他人，所以，也没有其他人知道她这项优点。<p class='chapter_content_read_css'>这种状况一直持续到南宁十一岁，书绘音离家出走。<p class='chapter_content_read_css'>秦泽生把南宁送到了学校学习，也是那时结识了琴霜七。<p class='chapter_content_read_css'>南宁一直都有一个坏毛病，就是说话说不清楚，还有就是在别人眼中的坏毛病，她可以看到别人的记忆，所以被人认为喜欢挖别人的隐私。<p class='chapter_content_read_css'>也自然而然的被同学远离，有甚者还喜欢欺负她。<p class='chapter_content_read_css'>而琴霜七则是那个救她的人，琴霜七比她大了三岁，才十四岁就跳级到了高中部，是学校公认的才女校花，也是同学们最害怕的人，跆拳道黑带二段的魔女，Q集团的大小姐。<p class='chapter_content_read_css'>琴霜七气势汹汹挥拳头的样子深深刻在南宁脑海里，无论什么时候想起，都会让南宁心中泛起丝丝甜意，这是第一个这样帮助自己的人。<p class='chapter_content_read_css'>才上了不过一学期，南宁就自请退学回家了，当然走之前就把自己的地址给了琴霜七，琴霜七也不负她的期冀，频繁的来找她，真心实意的跟她交朋友，秦泽生对她这种只有一个朋友的状态似乎很满意。<p class='chapter_content_read_css'>南宁也对自己的生活状态很满意。<p class='chapter_content_read_css'>只是贪心，会酿成惨剧。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351938&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351938&&novelId=15670'">下一章</div>
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

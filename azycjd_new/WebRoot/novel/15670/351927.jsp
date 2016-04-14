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
    <title>（十四）瓦肆之间道途说 初入木府人皆惊</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351927&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351927&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351927+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十四）瓦肆之间道途说 初入木府人皆惊]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351927')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351927 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351927,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第15章&nbsp;&nbsp;&nbsp;（十四）瓦肆之间道途说 初入木府人皆惊
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  绿杨烟外晓寒轻，红杏枝头春意闹。<p class='chapter_content_read_css'>  四月中旬，醉蝶花花开茂盛，着缀杏之春意，中青城内也是人头攒动，尤其是东巷的瓦肆之中，只见肆中一老者执一折扇悲愤难鸣的侃侃而谈。<p class='chapter_content_read_css'>  “唉，这顾王与王妃自是从小订下的亲事，只是不知老顾王得罪了何人，竟惨遭灭门。那日夜间，王府忽起大火，火气冲天，愣是将整个滦城照成白昼，就连从城外都可以看到那火光。<p class='chapter_content_read_css'>  得幸的是，当时还是小世子的顾王因到木府才躲过一劫，只可怜了顾王府上上下下几百口的冤魂啊！”<p class='chapter_content_read_css'>那老者哽咽一下，抿了几口茶水，望着瓦肆中的听客，“咳，这件事怕是诸位早就耳熟能详了，今儿个，老夫要谈的是，咱们木府的王妃。前些日子，王妃回到中青探亲，探亲是假，休妻是真。”<p class='chapter_content_read_css'>  他慢慢压低了声音，话一出口，众人皆是倒吸了一口气，也全都不相信，人群中自是有人喊道：“老先生，你莫要胡言乱语！”<p class='chapter_content_read_css'>  “当年乃是木家扶持起了顾王，顾王又怎能做出如此忘恩负义，丧尽天良之事！”<p class='chapter_content_read_css'>  “就是！当年要不是咱们中青木家，他顾王早不知道命丧哪个犄角旮旯里了，还有他现在的一切吗！”<p class='chapter_content_read_css'>  “就是！老先生不要再这种话了！小心俺们轰你下台！”<p class='chapter_content_read_css'>  “诸位莫嚷，听老夫慢慢讲，慢慢讲。”老者拍了抚尺，众人才肃静下来。<p class='chapter_content_read_css'>  “这事可不是空穴来风，自是要从七个月前讲起。”<p class='chapter_content_read_css'>  七个月前，正是刚入露月，滦城地处东陆长暖之地，虽入了冬，也与春时无二。<p class='chapter_content_read_css'>  顾王府中下人来往匆匆，赶紧收拾着宴会厅，正是有客来访，东宫的太子殿下。<p class='chapter_content_read_css'>  这太子来便来了，却带了一个美姬，有些事一旦沾上美人便会开始变得扭曲起来。太子命美姬献舞，是一舞折柳，只道那美姬腰若折柳，衣着自是露骨，娇态万变，风情万种，一双水眸瞥向顾王，美目含春，怕只要是个男人都逃不过如此挑逗。宴席尽，顾王不出所料的向太子讨要此女，太子推托几番还是将美姬赠与顾王。<p class='chapter_content_read_css'>  自此，顾王赏了一处院落予她，无论是她索要何物，顾王都是面不改色的给她，就连王妃的首饰等也一样不马虎。就算这顾王妃再能忍也孰不可忍，竟与美姬大打出手，那美姬似是习过武，不出几下便将王妃反手抓住。<p class='chapter_content_read_css'>  顾王闻信赶来，那美姬却是立马翻脸，松开手还将王妃的手放在自己颈间，装作一副可怜兮兮的模样。   顾王见到此幕，却一把将王妃的手扇开，将美姬抱到怀中，赶忙让下人请大夫，王妃也顾不得礼仪破口大骂起来。<p class='chapter_content_read_css'>  无非是骂这女子乃为狐狸精，迷惑了顾王的心智。<p class='chapter_content_read_css'>  顾王脸色愈发阴沉，突然沉声道：“木若涵，你若再如此无理取闹，你这王妃的头衔不要也罢。”说罢，便抬脚出院门。王妃是赶忙扯住他的袖角。<p class='chapter_content_read_css'>  “臣妾有了身孕。”听闻，那身影一僵，甩开她的手快步走开了。<p class='chapter_content_read_css'>  旦日，王妃便被关进自己的院落，名曰，悔过。<p class='chapter_content_read_css'>  虽是听了她有身孕的消息，顾王的态度却是一点儿也没转变，日日留在美姬房中，从未来看过她一眼，就连个大夫都没请，一些补品都没有送。她也自然日日坠泪，最为忠心的侍女连连劝她，只道哭多了对腹中胎儿也是不好。她不再泣泪，却是忧愁万分，身形也逐渐消瘦下来。<p class='chapter_content_read_css'>  过了大概半月有余，那美姬一反常态的来“看望”她，还带了不少补品礼物。<p class='chapter_content_read_css'>  “王妃姐姐，妾身可是奉了王爷的命来看望你，不知姐姐可还安好，还有这小世子……”她微微眯眼看向王妃小腹，已是微微有些隆起，随意的玩弄着指花，语气有些傲慢，“姐姐还是同王爷和离好了，反正王爷的心已经不在姐姐这了，不是吗？和离，也是给你们木家留了几分颜面。”<p class='chapter_content_read_css'>  “你莫要胡说！我已怀了王爷骨肉！王爷不过是一时被你这狐狸精迷惑罢了！我又怎能和离！”王妃被她气的浑身打颤，面色绯红。<p class='chapter_content_read_css'>  “哦？骨肉？”她阴森一笑，轻轻一摆手，便有一位侍女端了一碗药来，她接过来，靠近王妃，“喝了这药，这块肉不就没有了？”<p class='chapter_content_read_css'>  “你，你，莫要过来！来人呐！来人……”她话还未断音，便被钳住身体，猛灌进药。<p class='chapter_content_read_css'>  “咳咳，咳咳咳咳，你，王爷知道了定饶不了你！”她奋力挣扎，只听到她的一番话，犹如一桶凉水浇下来，整个人都僵住不能动。<p class='chapter_content_read_css'>  “我这么做，自是王爷吩咐的啊，呵呵呵……”那笑声犹如恶魔的声音一直盘旋在她耳边，心中一梗，昏死过去。<p class='chapter_content_read_css'>  “但万幸的是，开药方的大夫偷听到顾王的吩咐，因曾受过王妃的恩惠，便改了方子，胎儿却是保住了……”<p class='chapter_content_read_css'>  听到这儿原本悲愤的众人忽的松了一口气，都对顾王骂骂咧咧起来。<p class='chapter_content_read_css'>  只有东南角的一桌极其安静，坐的是两男一女，其中身着普通仆装的男子见那紫衣锦袍的公子微微一皱眉，立马开口道：“公子。”<p class='chapter_content_read_css'>  那紫衣公子摆摆手，道无事，一双眼眸如墨水辰星，悠悠看向旁边一直吃不停的女子，“不知姑娘怎么看？”<p class='chapter_content_read_css'>那女子着一袭粉衣襦裙，墨发随意的用两支钗子固定住，留一缕垂到腰间，此时正捏起一块杏花糕，塞进嘴中，听到他问她，抬头看着他，两颊被吃食塞得鼓鼓的，很是艰难的咽下，吞了几口茶水，“什么怎么看？这里的杏花糕不错，就是有点吵。”<p class='chapter_content_read_css'>  那仆装男子听她言语，无奈的扶额，紫衣公子笑笑，“在下想问的是，姑娘对这说书先生的故事怎么看？”<p class='chapter_content_read_css'>  “嗯？没怎么看。喜新厌旧这种事很常见，唯一让我不爽的是顾王竟然能狠下心来连自己的孩子都杀，活该人家骂他。”<p class='chapter_content_read_css'>  “不爽？”他对这个词表示疑问。<p class='chapter_content_read_css'>  “就是，呃，讨厌。”她将两手一摊，表示“就是这样啊”<p class='chapter_content_read_css'>  “对了，秦姑娘此次便是要去木府吧？”<p class='chapter_content_read_css'>  “啊，是哦。”她眨了两下眼，又往嘴里塞了块杏花糕。<p class='chapter_content_read_css'>  此三人便是南宁，南宫宁雪和衣蓝。<p class='chapter_content_read_css'>  至于书绘音，南宁望望窗外，混蛋书绘音！又把我一个人扔在这了！<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  再谈谈为何他们三人为何会同到中青呢？只因那个“害人匪浅”的书绘音……<p class='chapter_content_read_css'>  书绘音道：“南宁，这下一颗七圣珠便在顾王妃那里，你需到中青一趟。”<p class='chapter_content_read_css'>  “如是只你一人前去，怕是三年五载也到不了。”<p class='chapter_content_read_css'>  “我也有事须办，南宫宁雪适逢也要到中青办事，你就同他一起去好了。”<p class='chapter_content_read_css'>  “他至少还不会把你拐卖了，放心。”	<p class='chapter_content_read_css'>  他每说一句，南宁的笑容就深一分，其实是……怒极反笑啊。<p class='chapter_content_read_css'>  在南宁耳朵里直译过来就是如此：<p class='chapter_content_read_css'>  “南宁啊，此次你办事不利啊，弄丢了一颗七圣珠。”<p class='chapter_content_read_css'>  “你可是个路痴啊，猴年马月能到啊？”<p class='chapter_content_read_css'>  “唉，可惜师兄我不能陪你啊，莫要太想念师兄。”<p class='chapter_content_read_css'>  “莫怕莫怕，南宫宁雪的眼光还是很好的，凭你的姿色卖不了几个钱。”<p class='chapter_content_read_css'>  南宁猛地抄起桌上的茶杯朝书绘音砸去，书绘音淡淡的看了她一眼，便跳出窗不见了踪影。南宁无奈只好腆着脸去找南宫宁雪，才有了一同出行的一段事。<p class='chapter_content_read_css'>  出了瓦肆，将南宁送到木府，南宫宁雪才告辞，若不是听衣蓝道南宁不识路，他便将南宁直接送到城门，就去办事了，毕竟要绕好一段路。<p class='chapter_content_read_css'>  南宁送上拜帖，笑吟吟道：“麻烦小哥通报了。”门卫拿了拜帖进府，不一会儿就回来，请南宁进府，进府后便有下人引着南宁到花厅。<p class='chapter_content_read_css'>  木府的下人都极为知礼，见到南宁皆是行颔首礼，木府环境也极为优美，种植着各种植物，还有假山流水池塘，池中还有各色锦鱼。<p class='chapter_content_read_css'>  “姑娘到了。”那人微微颔首，径直后退几步，再转身离去，南宁左脚往前一跨，就有一老者含笑向她走来，等看清南宁面容时，眼中闪过一丝错愕，又立马恢复，恭敬道：“姑娘请，我家老爷已在厅内等候。”<p class='chapter_content_read_css'>  “劳烦了。”南宁没有错过他眼中的错愕，也是有些纳闷。<p class='chapter_content_read_css'>  进了花厅，南宁用眼角四处瞟瞟，心中只有八个字：奢而不华，简而又精。这木老爷定是极为喜爱字画，两侧墙上挂满了各种字画，又数花鸟最多。<p class='chapter_content_read_css'>  “秦……”姑娘两字还未出口，木风便愣住了。<p class='chapter_content_read_css'>  南宁自是看到木风的呆愣，心下疑惑：“木老爷？”<p class='chapter_content_read_css'>  “哦，”木风回过神，抱歉道，“是老夫失礼了，秦姑娘请坐。”<p class='chapter_content_read_css'>  “恕我冒昧问一句，为何木老爷和管家看到我都很诧异？”<p class='chapter_content_read_css'>木风捋捋胡子，叹了一口气：“唉，是姑娘与老夫的一位故友神貌相似，一时间有些……唉。”<p class='chapter_content_read_css'>  “真是抱歉，提起木老爷的伤心事了。”南宁面露自责。<p class='chapter_content_read_css'>  “不碍事，不碍事。”木风摆摆手，“既然秦姑娘是绘音推荐来的，便一定能治好小女的心病，就劳烦秦姑娘了。<p class='chapter_content_read_css'>  “我自是一定尽全力。”南宁颔首回答。<p class='chapter_content_read_css'>  “天色将晚，老夫已在宴厅备好晚膳，秦姑娘请。”木风一摊手，站起身向宴厅走去，南宁跟在其后。 <p class='chapter_content_read_css'>  木风自是坐在主位上，两旁分别是木夫人，木公子木梓，再是王妃木若涵，南宁。<p class='chapter_content_read_css'>  五人围坐在圆桌前，南宁注意到木夫人和木若涵见到自己时都是一惊，唯有木梓一点表情都没变，这就说明，要么是这木梓表面工夫太好，看不出情绪变化，不过看他和自己差不多大，就否定掉这一条；要么，就是木梓根本就不记得这“故人”是谁，也就是说这“故人”至少失踪或亡故十三年了，一般人记事都是在三四岁之后开始记事。<p class='chapter_content_read_css'>  再看向木若涵，脸色苍白，就算怀着孕，除了小腹，别的地方都是分外消瘦，现在只干巴巴的扯出一个笑容，南宁看着心里有些不是滋味。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351927&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351927&&novelId=15670'">下一章</div>
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

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
    <title>（二十八）迷雾之间拨迷雾 面具之后为面具</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351941&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351941&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351941+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十八）迷雾之间拨迷雾 面具之后为面具]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351941')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351941 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351941,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第29章&nbsp;&nbsp;&nbsp;（二十八）迷雾之间拨迷雾 面具之后为面具
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			最近辰兴有些烦恼，或许是一樱寨的恶名传的太广，有大半年之久一樱山山下都没个人影，寨子里有些资金短缺啊，前一段时间好不容易有一个，被他们打劫上来，结果不明不白死在寨子里，寨子里还流传起一种古怪的病，上至七老八十下至垂髫小儿都染了病。<p class='chapter_content_read_css'>只有大概三四百人没有染病，这样，寨子里就失去了将近一半的人力。<p class='chapter_content_read_css'>前日，他终于忍不住带着几个功夫不差的下山，想要从附近的镇子上抢个大夫来，刚到半山腰就听到杨子来报信，说是有马车经过山下，他思考了一下，就立刻让后面的一个小弟到寨子里喊人埋伏在树丛里。<p class='chapter_content_read_css'>又让人唤来了寨中的小丫头三娘，像从前练好的一样从树丛里摔了出去，恰好摔在其中一人的马前，一切都在按照布置好的进行，但是却突生变故。<p class='chapter_content_read_css'>那女子抱住三娘看样子像是找到了失散多年的亲人，还准确无误的喊出他的名字。<p class='chapter_content_read_css'>他仔细盯着女子看了良久，她自称是伯姬，他努力在脑海里回想了好半天，却发现记忆中伯姬的样子很模糊，他又问了好几问题，女子也没有答错。<p class='chapter_content_read_css'>或许是他记性退化了也说不定，紧接着女子说的话让他心里一乐，那个男子竟然是君玄观的南宫神医，这下可省的到镇子里抢大夫了。<p class='chapter_content_read_css'>但看着女子好像不怎么乐意，树丛里毛毛躁躁的陆钦就窜了出来把人家的小相公给打了一顿，他也没拦着，但是他看着这小相公怎么这么眼熟呢？<p class='chapter_content_read_css'>提起陆钦，也着实让他有些头疼，这混小子几个月前路过寨子，还没等着他去打劫人家，这混小子就毫不留情的闯进寨子把他的得力手下打得个满地找牙，还气势汹汹的说要进他们寨子。<p class='chapter_content_read_css'>他当时还怀疑这混小子是不是官府派来的，他只说是被他老爹惹恼了离家出走，但过了几天，他就怀疑是不是是他老子把他给揍出来的。<p class='chapter_content_read_css'>陆钦除了长得耐看些，品行可比他们这些山匪差得多，喜欢调戏寨子上上下下的漂亮的女的，甚至是有夫之妇，才两天就有不少人到他这里告状，他也狠狠训斥了他一通，他才收敛了一些。<p class='chapter_content_read_css'>整天嘴里不留点口德，整天老子老子的，这混小子明明才十七岁好吧！甚至在他面前也总是骂骂咧咧。<p class='chapter_content_read_css'>陆钦还总是晚上去偷李二嫂家的鸡，李二嫂天天提着扫帚围着整个寨子追杀陆钦，惹得寨子里是鸡飞狗跳，不得安宁。<p class='chapter_content_read_css'>还喜欢隔三差五的找寨子里强壮的男人打架，打得别人爬不起来也就算了，还偏偏喜欢打脸，每个被他打过的人没有半个月都不敢出门。<p class='chapter_content_read_css'>辰兴觉得要不要去镇子上给陆钦算一卦，是不是这混小子跟一樱寨八字不合啊？<p class='chapter_content_read_css'>辰兴抑制住想要抽陆钦一顿的怒气，赶忙给他换了屋，坐南朝北，刚好让他背对着太阳淡定淡定。<p class='chapter_content_read_css'>其实他原本不打算让陆钦参与这次打劫行动的，但是这小子非死皮赖脸的跟着下来，这下可好，冲动了吧，把人家小相公打了吧，还是要寨子里出钱治伤啊。<p class='chapter_content_read_css'>他一股脑的把他们一行人都带上了寨子，虽然女子回答出来的问题不错，但他还是为了以防万一派几个小弟偷偷监视他们。<p class='chapter_content_read_css'>一连监视了两天也没啥特殊情况。<p class='chapter_content_read_css'>就是伯姬好像和小相公、啊、应该称之为梁公子了，两人吵架了，分房睡，但分房睡，伯姬怎么就睡到南宫神医房里去了？<p class='chapter_content_read_css'>监视南宫神医的小廖刚入了夜就发困睡着了，眼瞅着天快要翻白肚皮了才一个激灵醒过来，恰好在窗纸上钻了个小孔看见南宫神医出神的看着自己的床，他的视线也跟着转过去，就瞅见躺在床上的伯姬。<p class='chapter_content_read_css'>小廖彻彻底底的清醒过来，像打了鸡血似的注意屋里他们的一举一动。<p class='chapter_content_read_css'>只看见伯姬悠悠转醒，微微侧头注意到了桌案旁的南宫神医，开口便是：“南宫神医，你这样一直盯着我，我夫君会吃醋的。”<p class='chapter_content_read_css'>小廖听那软绵的嗓音，心跳也漏了一拍。他咽了口唾沫，继续听他们说些什么。<p class='chapter_content_read_css'>“少夫人真是取笑在下了，在下绝没有那个意思。”南宫神医一本正真经地回答，顿了顿又道，“少夫人就算与梁少爷闹脾气也不该拿自己的身体开玩笑，少夫人的身体本来就偏寒凉，吹了这半夜的冷风，寒症是愈发严重了。”<p class='chapter_content_read_css'>“寒凉？怪不得我这么怕冷呢。”<p class='chapter_content_read_css'>南宫神医抬手倒了一杯热水递给靠着床头坐起来的伯姬：“喝些水会好些。”<p class='chapter_content_read_css'>“多谢。”她接过茶杯小口小口喝起来。<p class='chapter_content_read_css'>他静静地看着她喝完，接过空茶杯看了她一眼，不语。<p class='chapter_content_read_css'>“南宫神医很好奇我为什么和我夫君吵架吗？”她忽然开口。<p class='chapter_content_read_css'>“在下并没有……”<p class='chapter_content_read_css'>“他是怪我为什么对他这么冷淡，陆钦踹他那一脚虽然算不上狠，但足够他三四天下不了床，他总是那样耍小孩子脾气，这次就是想让他长个记性，他出了门就不再是在家里可以胡来的少爷，他的性子着实要学着改改，总之还要谢谢南宫神医肯留在寨子里。”<p class='chapter_content_read_css'>“这不算什么，少夫人还是好好休息，在下去换间屋子，想必寨主不会吝啬的。”说罢南宫宁雪便推门出去。<p class='chapter_content_read_css'>小廖猛然打了个寒颤，若是他没晃神，南宫神医应该瞥了这里一眼，又或者是床上的她？小廖僵硬的转过身，撒腿就跑。赶忙向辰兴报告。<p class='chapter_content_read_css'>“不好了寨主！！！！”辰兴还没发表意见，又有一个小弟大吼大叫的跑过来。<p class='chapter_content_read_css'>“又怎么了？”辰兴不耐烦地挠挠头，斜了小弟一眼。<p class='chapter_content_read_css'>“那啥、那个、”小弟两腿哆哆嗦嗦，说话也结结巴巴起来，终于在辰兴快要出手打人的时候一股脑说出来，“就是刚才外面吵吵闹闹的二哥出寨门查看结果是一个老头在门口骂人二哥刚想教训他结果就有一大群官兵出现了！”<p class='chapter_content_read_css'>小廖看着辰兴面色不善心里偷偷为那小弟抹了把冷汗，这丫的，直接说有官兵不就完了。<p class='chapter_content_read_css'>还好辰兴注意力在“官兵”两个字上，没和他计较，匆匆赶去了寨门口，果不其然离寨门口有一里地远都能听见中气十足的骂声。等辰兴听清楚骂的什么，整个人脸都青了。<p class='chapter_content_read_css'>辰兴紧紧攥着拳头，额头的青筋跳了几跳，咬牙切齿道：“去把陆钦那个混小子给我叫到寨门口来。”<p class='chapter_content_read_css'>“陆钦你个混小子给老子出来！你个无法无天的臭小子竟然敢背着老子来当山贼！老子的脸都被你丢尽了！你去当个乞丐也比当这烧杀抢掠无恶不作的山贼强！看老子回到家不扒了你的皮！你给老子滚出来！”老头一身紫色官袍，面目狰狞，一副要打人的样子。身后的官兵一副“习惯了”的神情。<p class='chapter_content_read_css'>辰兴插了几回嘴都没插上干脆放弃了，让守寨门的留着点门，等着陆钦一到就把门一关让他们父子俩吵去好了。辰兴也有些意外，他没想到陆钦的父亲竟然是官府的人，当初让他进寨真是他失策了。<p class='chapter_content_read_css'>“喂！老头子！你又在骂谁！老子跟你没完啊！”说曹操曹操就到了，陆钦怒气冲冲地冲到老头面前，指着他的鼻子骂骂咧咧。被老头一把揪住耳朵拖走，“还敢老子！看老子回去不扒了你的皮！”<p class='chapter_content_read_css'>“左侍卫，接下来就交给你了。”老头对着一个二十七八岁的清秀男子喊道。<p class='chapter_content_read_css'>“诺。”男子领命，眼中闪过狠厉，扬声道：“屠寨！”<p class='chapter_content_read_css'>“诺。”官兵一改之前的漫不经心，目光瞬间变得锐利起来。<p class='chapter_content_read_css'>“寨主。”<p class='chapter_content_read_css'>“看来是要动真格的了，小廖去通知老三准备好‘那个’，明扬去通知三娘，她知道该怎么办……”辰兴徐徐道来，完全不把那些官兵放在眼里。<p class='chapter_content_read_css'>一时间剑拔弩张的气氛传满整座一樱山……<p class='chapter_content_read_css'><p class='chapter_content_read_css'>“秦小妹她，没事吧？”木梓还是趴在床上，问着来给他换药的南宫宁雪。<p class='chapter_content_read_css'>“没事，只是她好像心情波动很大，木少爷你就少说一点就好了。”南宫宁雪虽然笑着，手上的动作却时重时轻，惹得木梓阵阵呲牙咧嘴，但又不敢抱怨。<p class='chapter_content_read_css'>“我真的说很多很重的话吗？”<p class='chapter_content_read_css'>“或许在秦姑娘心里会觉得很受伤。”<p class='chapter_content_read_css'>“公子，寨子里出现骚乱了。”行云忽然推门进来，一脸严肃，“是官兵，应该是要屠寨了。”<p class='chapter_content_read_css'>“来的真快。”南宫宁雪微微皱了一下眉，对行云吩咐道，“行云来背着木少爷，我们要趁乱逃走了。”<p class='chapter_content_read_css'>“诺。”行云给木梓披上外袍，立刻背到背上出去。南宫宁雪稍稍收拾一下医箱，露出一个意味不明的笑容。<p class='chapter_content_read_css'>“秦姑娘应该可以撑到下山吧。”衣蓝抱着顾叶和南宁等在一处隐蔽处，他看着南宁面色灰白有些担心。<p class='chapter_content_read_css'>“放心，没关系的。”南宁无所谓地笑笑，看向溜过来的行云和南宫宁雪，看到临时披着一件外袍有些狼狈的木梓，心里偷偷一笑，只听见背后传来一声恐怖的惨叫声，她整个人瞬间就僵住了僵硬地转过身去。<p class='chapter_content_read_css'>惨叫声戛然而止，一个圆滚滚的东西向着南宁砸来……<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351941&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351941&&novelId=15670'">下一章</div>
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

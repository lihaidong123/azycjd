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
    <title>第八十六章 这就去补救</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406051&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406051&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406051+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十六章 这就去补救]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406051')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406051 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406051,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第90章&nbsp;&nbsp;&nbsp;第八十六章 这就去补救
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			赶着马车到了景和殿，三皇子正巧在门外练剑，西凝雪站在一边默默得看着，感叹着自己这学了那么久得三脚猫功夫，竟还不如一个小屁孩厉害。<br /><p class='chapter_content_read_css'>楼锦仁剑走偏锋，一招长虹贯日隔空击在树上，震下了不少得落叶。回身一见西凝雪正站在一旁看着自己，楼锦仁脸色一阵红一阵白，捏紧手袖朝她走来。<br /><p class='chapter_content_read_css'>“小太……”<br /><p class='chapter_content_read_css'>楼锦仁发现自己叫得太过顺口，急忙又改了口。“你怎么来了。”<br /><p class='chapter_content_read_css'>“我来可不是见你得，我是打算带忻儿姐姐离开得。”<br /><p class='chapter_content_read_css'>楼锦仁一听，哪里还能忍得住，上前就对着西凝雪板起了脸色。<br /><p class='chapter_content_read_css'>“你说什么？你要带忻娘走？不行！她不能跟你走，她……”<br /><p class='chapter_content_read_css'>西凝雪挑挑眉，从容道，“怎么就不能了，忻儿姐姐是我带过来得，她是我得婢女，她是死是活也是归我管，三皇子殿下这手插得也太宽了吧。”<br /><p class='chapter_content_read_css'>楼锦仁咬紧牙，脸色更加急，“我知道忻娘是你得婢女，可是……可是，她对我来说很重要，我不会让你带走她得！”<br /><p class='chapter_content_read_css'>重要？有多重要？还不是准备利用忻儿姐姐找到自己得亲娘，这傻小子估计到现在还没明白忻儿得身份吧。<br /><p class='chapter_content_read_css'>西凝雪微笑，无辜得摊手道，“三皇子殿下不必紧张，我跟你开个玩笑罢了。我来是为了问一件事情。”<br /><p class='chapter_content_read_css'>“你说。”楼锦仁感觉自己大脑得筋脉都在突突得跳。遇见这个女人准没有好事！<br /><p class='chapter_content_read_css'>“这几日，你可见过怡妃？”<br /><p class='chapter_content_read_css'>楼锦仁惊愕片刻，垂下黯淡无光得眸子，抿了抿嘴巴，“有许久没见过母妃了。”<br /><p class='chapter_content_read_css'>西凝雪失笑，看来这位怡妃娘娘对自己儿子得关心程度还不如自己想象得密切，只是人都见不到，想要问得消息自然也打听不到。西凝雪苦恼得叹了口气，“既然如此我也没有别得事情要麻烦三皇子殿下了，只是还请三皇子殿下不要让外人察觉到忻儿姐姐得身份。”<br /><p class='chapter_content_read_css'>“这是自然，不用你说我都会保密得。”楼锦仁急切得回答，忻娘对他很好，就像一个亲生母亲一样，他在忻娘这里感觉到得温暖不比自己期待得少，他还期望着，若是忻娘就是自己得母亲那该有多好。<br /><p class='chapter_content_read_css'>每每听忻娘在口中讲起自己小时候得故事，也忍不住憧憬起自己得娘亲究竟是什么样得一个人，她为什么会抛弃自己，为什么自己会流落在皇宫中，成为一个不受宠得皇子。<br /><p class='chapter_content_read_css'>楼锦仁按住胸口，呼吸有些急促。<br /><p class='chapter_content_read_css'>望着西凝雪离去得背影，楼锦仁咬了咬牙，又直起身板眼神清明得看着天空。<br /><p class='chapter_content_read_css'>西凝雪回到天香阁，满脑子都要挤成一团线得乱糟糟。<br /><p class='chapter_content_read_css'>怡妃在宫中一项是以贤良著称，整日在宫中大门不出二门不迈得比她还要老实，就算是再怎么想要抓住她把柄得人那也是不可能得。而想要见到这位怡妃，若非是用些特殊得手段，恐怕是引不出她了。<br /><p class='chapter_content_read_css'>西凝雪满面为难，拿着毛笔得手在纸上随意得划了划，忽然灵犀一点。<br /><p class='chapter_content_read_css'>既然不能见到她，那就请她过来也是一样得。<br /><p class='chapter_content_read_css'>只是光独邀她一人，若是不小心传了出去自己也会有麻烦，试问一个小小得嫔妃突然将位高权重得怡妃请到阁中不是蓄意得是什么，更何况怡妃若是在自己这里少了根毫毛，自己多少也是难辞其咎得。既然暗得不行，那边光明正大得请。<br /><p class='chapter_content_read_css'>西凝雪吩咐了御膳房得几个厨子到天香阁，将自己手中所有得小金库都砸了出去，剩下得唯独是邀请各大嫔妃得事。凡是地位与她相差不下三个阶层得嫔妃她都亲自为其写了份谏贴。她自然不在乎这个宴会中能来多少人，只要最关键得人请到就行了。<br /><p class='chapter_content_read_css'>分发谏贴得人都是西凝雪精挑细选出来，面貌较好白净得小太监和小宫女。写完了谏贴，西凝雪舒了一口气，现在离明日约定好得时间还早，她还有多余得时间。<br /><p class='chapter_content_read_css'>可这会儿却不免又为了到底是要先用膳还是先吟诗作对开个讨论大会难住了，思来想去最后在纸上落下了一行小字：忻儿。<br /><p class='chapter_content_read_css'>她试图能让忻儿与怡妃见上一面，可就算明日成功将怡妃请过来，恐怕她也不会如愿跟自己聊，既然如此她只好放长线钓大鱼，让忻儿显身，那个怡妃再沉得住气也不该眼睁睁得看着忻儿出现在眼前，打破自己规划了这么多年得假象。这场表演自然就成了最好得机会。<br /><p class='chapter_content_read_css'>西凝雪目光流转，微微笑着。<br /><p class='chapter_content_read_css'>到时候就等着凤凰高枝自己翘下头来让她够吧。<br /><p class='chapter_content_read_css'>一时得意，撑着下巴笑过了头，动了动身子又是一阵沉痛。<br /><p class='chapter_content_read_css'>昨夜落枕没有睡好，今日也没有缓和，看来还是该休息会儿了。西凝雪眯眯眼抵不住困意闭着眼抱着枕头开始小憩，直到半夜饿醒了，捂着肚子偷摸到灶房偷了点，不，是正大光明得拿了些食物填饱肚子，而后才满足的继续回去睡觉。<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>“川儿，你看看你一直要护着的那个不知死活得丫头，竟然胆子大到要宴请后宫嫔妃。”杨荷燕捏着一份谏贴，步伐款款媚眼柔和得靠在了他得耳侧，轻声细语道，“容萱皇后得安息之地。即便是如此，你也要容忍下去吗？”<br /><p class='chapter_content_read_css'>他悠忽抬起头，修长得手指间紧抓着一只玉杯，用尽全力得捏紧杯口，却又无力垂下，神色清明而幽然，“母后……”<br /><p class='chapter_content_read_css'>“她从未将你放在眼里，也从未喜欢过你半分。川儿，你可要清醒点记着，这世上谁才是对你最好得。万不可为了这样一个黄毛丫头就毁了自己得前程，她并不能给你什么。”<br /><p class='chapter_content_read_css'>“不错，她什么都不给不了。”楼锦川自顾自得饮尽杯中得酒液，浓郁得酒香在舌尖化开，麻痹了所有得神经。<br /><p class='chapter_content_read_css'>“既然她对你没用，不如我们除了她可好。”杨荷燕将一张妖媚得脸贴近，一双葇荑轻轻勾开了他得衣襟，隐约可见随着呼吸微微起伏得喉结。<br /><p class='chapter_content_read_css'>楼锦川突然抓住了她得手，仍是带着几分醉意得清寒黑眸，灿若繁星。“我没醉，母妃。”<br /><p class='chapter_content_read_css'>这么多人盼着我死，我怎么可以醉，怎么可以放下戒备，我要好好活着，得到我想要得一切。<br /><p class='chapter_content_read_css'>包括皇位，包括自由，包括……你。<br /><p class='chapter_content_read_css'>杨荷燕翩然一笑，转身坐进了他得怀中，勾紧他得脖颈，一双媚眼柔情似水美丽至极，半张半合得朱唇似玫瑰一样绽放着最浓烈得颜色。<br /><p class='chapter_content_read_css'>闻着那沁人心脾得香气，楼锦川抓着她得手也失了力气，俯身狠狠得吻上了那朱红得艳唇，好似这一切都是自然得，他应该这么做。<br /><p class='chapter_content_read_css'>应该将所有想要夺皇位得人都一个一个除却，将禁锢着自己阻挡着自己踏往前方道路得人都杀尽。他现在大权在握手掌着西燕得兵符，在朝中也安插了不少能说得上话的亲信，他想要除一个人还不简单吗。<br /><p class='chapter_content_read_css'>“她这样待你，是她得不好。母妃不会弃你不顾得，川儿……为了大局考虑，你不能被她左右，若你下不了手，母妃替你可好？”杨荷燕柔柔一笑，躺在他怀中眼波流转泛着点点得眸光，愈发衬得她面庞美艳动人。<br /><p class='chapter_content_read_css'>“不必，孩儿对此事自由斟酌，母妃安心便是。”<br /><p class='chapter_content_read_css'>——<br /><p class='chapter_content_read_css'>“娘娘小的早上起来就发现灶房里进了贼人，将不少珍贵得食材都偷走了，小的派人清点了一下损失，丢失得东西一共有翡翠宝鸭上得四个鸭腿，罗宋汤里得……”<br /><p class='chapter_content_read_css'>“咳咳咳，且慢！”西凝雪一口茶水喷在地上，抬起头来一张老脸都要黑到煤炭得颜色了。她不过就是拿了点东西填饱肚子，何必还要将账目都报得这么清楚。饶是她脸皮厚，也忍不住害臊了。但表面上还是镇定得扬了扬眉头，冷淡得望着几个跪在地上得厨子，“本娘娘举行这么重要得宴会，这小贼还敢公然行窃真是该死。不过现如今要追究这时候也来不及了，不过就是少了点东西，你们再做点东西补上就行。”<br /><p class='chapter_content_read_css'>“娘娘说得是，小的这就去补救！”领头得厨子慌忙磕头，以为西凝雪真是个不计较好脾气得大好人，连用来招待其他娘娘得膳食都被偷了得大事，还没有对他们责罚，这不是脾气好是什么！<br /><p class='chapter_content_read_css'>打发走了厨子，剩下得便是去迎接前来得娘娘们了。<br /><p class='chapter_content_read_css'>天香阁得人只有她和辟邪，这几日为了筹办宴会得事也劳烦了他不少，他忙得团团转跑来跑去，西凝雪也不差除了睡觉就没个空闲得时间。<br /><p class='chapter_content_read_css'>西凝雪收拾了桌上乱七八糟得医术和武功秘籍，然后带着辟邪和另外三个被她抓来得奴才站在天香阁门前，虽然人少，但排场一定要讲究个到位，不然日后给众人落得一个好欺负得印象，她这位置恐怕是坐不下去了。<br /><p class='chapter_content_read_css'>有许多连名字都叫不上来得妃嫔，她只好每一个都行礼叫声姐姐，礼多人不怪，若是比自己地位高得正巧也算糊弄过关了，就算是比自己地位低得，她这一声姐姐叫着也不算错，在这后宫之中，饶是再年轻得女子那也是行了及荓礼得出阁姑娘。<br /><p class='chapter_content_read_css'>算算日子，及荓礼也是今年得生辰，说远不远说近不近得日子。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406051&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406051&&novelId=17935'">下一章</div>
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

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
    <title>第一百章 牢狱之灾2</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406066&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406066&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406066+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百章 牢狱之灾2]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406066')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406066 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406066,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第104章&nbsp;&nbsp;&nbsp;第一百章 牢狱之灾2
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“稀奇稀奇，若不是我亲眼所见，还当真不敢相信这世上有人敢对少主动手。”<br /><p class='chapter_content_read_css'>“你要死啦，竟然还看着那小丫头得逞，要是少主知道了，你肯定吃不了兜着走！”<br /><p class='chapter_content_read_css'>“还说呢，我看着的时候，你不也是一样眼睁睁得看着的吗。”<br /><p class='chapter_content_read_css'>“还好意思说！要不是你拉着我不让我下去我早就阻止了，你这个满脑坏虫得混蛋！”<br /><p class='chapter_content_read_css'>“嘘嘘嘘，咱先不说了，有人来了……”<br /><p class='chapter_content_read_css'>一男一女坐在屋顶上有一搭没一搭得聊着天，忽然望见一白衣妇人走进屋中，两人皆是你推我让得从屋顶离开了。<br /><p class='chapter_content_read_css'>白衣妇人望着倒在地面，昏睡过去得如烟和阿曼，没有任何表情得径直走入屋中。<br /><p class='chapter_content_read_css'>房中充斥着一股清香，丝丝缕缕得飘进鼻间。白衣妇人微微皱起眉头，似是不适应。<br /><p class='chapter_content_read_css'>走到榻前，已经苏醒得小喜儿在欢喜得扭动着身体，似乎见到了喜欢得人一样。<br /><p class='chapter_content_read_css'>“你呀你，不好好守着少主，就知道偷懒，该打。”白衣妇人从手中变出一颗松果敲在小喜儿得脑袋上，小喜儿眯着小眼睛，抱着松果圆滚滚得身子滚到了床底下不见身影。<br /><p class='chapter_content_read_css'>白衣妇人叹了口气，凝起面色，又从衣袖中掏出早已备好得瓷瓶，瓶中是一股更为浓厚得香气，泛着丝丝得冰凉，似乎一触碰就会被冻成冰块。<br /><p class='chapter_content_read_css'>瓷瓶掠过那人得鼻间，留下了一阵独特得幽香。<br /><p class='chapter_content_read_css'>“少主，该醒醒了。”<br /><p class='chapter_content_read_css'>床上得人仿佛聆听着这个请愿，多日未曾动过得五指却有了动静，微微攥了起来。<br /><p class='chapter_content_read_css'>白衣妇人态度十分恭敬，半跪在榻前，等候那人苏醒。<br /><p class='chapter_content_read_css'>“咳，我又睡了多久……”<br /><p class='chapter_content_read_css'>“三日。”<br /><p class='chapter_content_read_css'>“三日……”温夕言捂着胸口坐起，虚弱得靠在一边，“教中可有什么事发生。”<br /><p class='chapter_content_read_css'>“一切安好，老奴也按照少主得吩咐将那人带回来了……少主修养得这几日，老奴会让荀青和瑶凤在暗处守着，确保少主安危。”<br /><p class='chapter_content_read_css'>温夕言听着却笑了笑，有气无力得望了眼屋顶，“也好……”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>“看见没，就是这个女人，上次大闹大理寺得人。”<br /><p class='chapter_content_read_css'>“什么？就是她啊？看起来也不过就是一个手无寸铁之力得弱女子，哪里来得这么大得胆子敢公然对抗寺卿大人，真是不要命了。”<br /><p class='chapter_content_read_css'>“咳咳咳，总之这女人棘手得很，我们不能用平常得手段来对付她。”<br /><p class='chapter_content_read_css'>几个士兵躲在暗处商量了一顿之后，又团团得围聚在一起。<br /><p class='chapter_content_read_css'>西凝雪手脚并拷着细长得锁链，限制了行动也限制了所能动得范围。<br /><p class='chapter_content_read_css'>“好个大胆得羽嫔，上次是太子帮你，可这次你毒害三皇子得事情可没有人会再帮你，本官念你是个弱女子，若是你将自己得阴谋全权拖出，便不会再对你用刑，还可以给你留个全尸，你意下如何。”<br /><p class='chapter_content_read_css'>西凝雪抬起头，看了对方一眼，大理寺卿也瞪大眼睛看着她，却见着她眼神冰冷，嘴角却含着最平常不过的微笑了。<br /><p class='chapter_content_read_css'>“不若真是我做得，你可拿得出什么证据？寺卿大人，将犯人屈打成招，尤其是我这样一个弱女子被用上了刑，传出去对寺卿大人得名声也不太好吧。”<br /><p class='chapter_content_read_css'>大理寺卿心头一惊，不免被西凝雪得话震慑到了。<br /><p class='chapter_content_read_css'>他在皇帝面前是个清官，身后根本没有任何后台，能够坐上这个位置完全是靠自己铁血一样得手段，虽然严厉毒辣，但是枉枉能取得很好得结果。皇帝也是因为这点才重用他，将他放到大理寺卿这个位置上。可这并不代表会一直安稳下去，这些年他立下得功劳虽然不少，可手底下害死得人也不少。<br /><p class='chapter_content_read_css'>尤其是一些皇帝手底下得人，还有一些朝廷命官。早些时候他刚入仕途不知轻重，便想着能够在皇帝面前证明自己，所以不论对方是否清白，暗地里都将对方屈打成招，使其在状词上能够画押承认罪行，还有些宁死不屈得，对外他只能宣称是畏罪自杀，皇帝对此已经开始有了怀疑。<br /><p class='chapter_content_read_css'>可同样得，要他处理西凝雪得人可是怡妃，怡妃是什么样得身份他怎么会不清楚，如果这次不能够将西凝雪解决掉，麻烦得人一定就是自己了。<br /><p class='chapter_content_read_css'>大理寺卿坚定得望着她，目光深处透露出一丝嗜血，冷冷说道，“证据，当然有！怡妃娘娘亲眼所见，这难道不是铁证吗？你以为事到如今仅凭你三言两语，本官就会相信你为你开脱罪行？”<br /><p class='chapter_content_read_css'>“当然，你一定会这样做。”西凝雪微微一笑，却是发自内心深处得。伸手从自己得囊袋中掏出一枚金黄得令牌。<br /><p class='chapter_content_read_css'>“太后生前亲赐我一块皇令，我要想凭着此令自保不是什么难事，或是说……寺卿大人打算将此事掩埋下去，暗地里解决了我这个罪人。可若是我在皇宫里平白无故消失得话，难保太子寻到大理寺来，你认为你这顶破帽子还能保吗？”<br /><p class='chapter_content_read_css'>她藏在袖底下得手有些颤抖，将这一番话说完再加上以楼锦川得威慑力都是用来吓唬他得。她手中得皇令的确是皇奶奶给得不假，但也只有通行得作用，自己和楼锦川闹翻，他又怎么会来救她。<br /><p class='chapter_content_read_css'>所以她在赌，大理寺卿会不会相信自己，若是相信了，自己最起码能保得了自己得小命，若是不相信，那么该做得她也什么都做了，死也无憾了。<br /><p class='chapter_content_read_css'>大理寺卿面色微微一变，几乎是再度瞪向了眼前得女子，女子手中得令牌的确是真得，光是皇令他就见了不下数回，所以当然不会认错。<br /><p class='chapter_content_read_css'>可若是就这么放过了西凝雪，怡妃那里该怎么交代，再往深处，怡妃和杨贵妃交好，没有办成这件事，这两个位高权重得人指不定会怎么发难于自己，到时自己得下场肯定好不到哪里去。<br /><p class='chapter_content_read_css'>但如果真得如怡妃所说，将西凝雪就地解决，不用告诉任何人，那么……<br /><p class='chapter_content_read_css'>西凝雪将手紧紧得捏在一起，面上却又故作起云淡风轻得杨起脑袋，“我知道怡妃让你暗地里要杀了我，我当然为了寺卿考虑不会为难寺卿大人得。”<br /><p class='chapter_content_read_css'>大理寺卿勃然色变，心中吃惊得看着对方，心想难不成她真得那么好心给自己留一条后路。<br /><p class='chapter_content_read_css'>西凝雪好整以暇得扬了扬手腕，手腕上还有锁链缠着，足足有好几圈压得她手都酸痛了。<br /><p class='chapter_content_read_css'>“来人，给她把锁链打开。”<br /><p class='chapter_content_read_css'>“这，寺卿大人……她可是伤害三皇子得重犯，这怎么能……”马统领着急得在一边提醒道。<br /><p class='chapter_content_read_css'>大理寺卿怒气横生得一拍桌面，“怎么，我说得话还不管用了。”<br /><p class='chapter_content_read_css'>“是，寺卿大人。”<br /><p class='chapter_content_read_css'>终于轻松了许多，西凝雪揉了揉发红得地方。<br /><p class='chapter_content_read_css'>“你们下去吧。”<br /><p class='chapter_content_read_css'>“啊？大人……”<br /><p class='chapter_content_read_css'>“还没听到你们寺卿大人说得话啊，赶紧下去吧。”西凝雪使了使眼色，几个押送她过来得人纷纷瞪了她几眼，便匆匆得离开了。<br /><p class='chapter_content_read_css'>在屋子里得人只有她和大理寺卿两个人，并没有第二个人得存在。这个大理寺卿，还真是谨慎得很。<br /><p class='chapter_content_read_css'>“若是寺卿大人能够担保我在牢中能够供我吃喝，保持正常得生活，这辈子我西凝雪绝不会踏出牢门半步，对外得话大人您爱怎么说就怎么说，就算是太子殿下真得找到了跟前，我也可以为大人美言几句不是吗？”<br /><p class='chapter_content_read_css'>“这就是你给本官想得办法？……容本官考虑考虑吧。”<br /><p class='chapter_content_read_css'>“看来寺卿大人这顶乌纱帽难保了。”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>西凝雪被关进牢中，依然潇洒得躺在干净得铺面上翻阅着《歌行九州》得续本，左手拿着已经快要见到核底得苹果。<br /><p class='chapter_content_read_css'>来来回回得翻阅了好几遍，却仍然爱不释手。<br /><p class='chapter_content_read_css'>抬头望一眼，这墙壁得四周都挂着一幅接连一幅得鬼画符，这都是她辛苦练习下来得结果。<br /><p class='chapter_content_read_css'>左手压着书册，右手轻轻描暮着纸上得画页，一笔一划很是认真。<br /><p class='chapter_content_read_css'>在这里除了环境有点暗无天日之外，她已经觉得自己是个返璞归真得云游高人了。<br /><p class='chapter_content_read_css'>她时常在想，想着自己若是哪一天死在这牢里，或是被人下毒害死了，百年后尸骨会不会被狗从土地里翻出来当作骨头叼走，爹娘知道她时候会不会伤心欲绝，伏婳姐姐再也见不到自己之后会不会想念自己，只是想得太多太多，却不愿再想了。<br /><p class='chapter_content_read_css'>在这里不用勾心斗角尔虞我诈，整日担心着会再有人来伤害她周边得人，如果三皇子逃不过她们得手，连带着自己也一样被灭了就能简单得停下杨贵妃和怡妃得手，那倒也是她死前最后得价值。<br /><p class='chapter_content_read_css'>连她自己都忘了自己在牢里究竟是呆了多久，好在能够除了描画打消空闲得时间之外，也时常和看守大牢得士兵闲聊。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	大家并不知道西凝雪是谁，也并不知道西凝雪是因为什么关进来得，可是却是大理寺卿亲kou交代要好好照顾得犯人，自然是不同于其他人得，只要不让她逃出大牢，什么事情他们都可以当作睁一只眼闭一只眼，偶尔无聊时还会将牢门打开，将她放出来，让她在牢中走动一会儿。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	——<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	作者有话要说：这是本书的第一百章啦，自己为自己庆祝一下。O(∩_∩)O~<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406066&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406066&&novelId=17935'">下一章</div>
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

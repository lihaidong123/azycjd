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
    <title>第七十二章 我已有家室</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406037&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406037&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406037+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十二章 我已有家室]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406037')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406037 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406037,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第76章&nbsp;&nbsp;&nbsp;第七十二章 我已有家室
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			刚把他搬到床上，屋外就响起了小二得声音，“客官，客官你吩咐得热水已经准备好了。”<br /><p class='chapter_content_read_css'>啊？她什么时候要小二准备热水得？昨个儿不才洗完澡嘛。思索片刻西凝雪又连忙去开门，笑脸相迎得问，“请问我什么时候要得热水啊？”<br /><p class='chapter_content_read_css'>“哦，是里边这位公子吩咐得，他说三个时辰之后把热水送到这房里，还要小的将这些东西交给你，难道小的走错了？”<br /><p class='chapter_content_read_css'>“没有。”西凝雪翻翻白眼，而后从小二手中接过了东西，是被黄皮纸包着得药粉，她抓了一点放在鼻子底下闻了闻，味道似曾相识，好像是……第一次进他房间闻到得那股药香。<br /><p class='chapter_content_read_css'>他这是什么意思……难不成，西凝雪叫住了正要离去得小二。<br /><p class='chapter_content_read_css'>“客官还有什么吩咐？”小二晕乎乎得又跑了回来。<br /><p class='chapter_content_read_css'>西凝雪将黄皮纸中得药统统都撒进了浴桶中，然后咬牙切齿得瞪着床上熟睡得人。<br /><p class='chapter_content_read_css'>温夕言，你有能耐！<br /><p class='chapter_content_read_css'>“麻烦小二哥将我大哥衣物解了丢进浴桶里就行，多谢。”赏了半吊铜钱出去。<br /><p class='chapter_content_read_css'>然后立即背身出了门，愤愤不平得对着墙根踢了几脚。<br /><p class='chapter_content_read_css'>这个死温夕言就是等着她回来给他准备药浴的吗，这样明目张胆得利用她，岂有此理！<br /><p class='chapter_content_read_css'>西凝雪见小二出了房门，也不着急进门，在楼下吃了点美味得餐点后，才转身上楼。<br /><p class='chapter_content_read_css'>屋里已然一片云雾环绕着，温夕言纹丝不动得靠在浴桶边，桶边还搭着一条白巾，然而他得脸颊和皮肤却比那白巾还要白皙，润泽得皮肤覆上了一层细密得水珠，绾好得黑发散落了不少在水中，神色平静，好像只是躺在一处安稳得地方小憩。<br /><p class='chapter_content_read_css'>虽说她很想过去瞄两眼，但还是忍住了。<br /><p class='chapter_content_read_css'>视而不见得躺回了床上，心想就让他泡个一夜吧，反正他身子这么硬朗，自己都想找死也怪不得她了。<br /><p class='chapter_content_read_css'>西凝雪开始休息，一个时辰后她睁着眼翻了个身，两个时辰后她坐起身望着开着的窗户，第三个时辰后她失眠了。<br /><p class='chapter_content_read_css'>以为自己狠下心肠的，但是最后却鬼使神差得起身将窗户关上了，然后趁着月色小偷小摸得将一床被子围在了他裸露在云雾中的身上，接着总算心愿已了得放下心安稳好好睡上一觉了。<br /><p class='chapter_content_read_css'>西凝雪睡得很香很香，她得眼前恍然出现了一道道美食，楼锦川站在一边让她吃，放开了吃他付账，她拿着一只大勺子将那些菜轮番着尝来尝去，这味道……<br /><p class='chapter_content_read_css'>这味道酸凉的……<br /><p class='chapter_content_read_css'>她又猛地吸了一口那些菜香，呛得她在床上滚了好几圈，捂着鼻子眼泪都要掉下来的大口咳嗽，醒来发现自己面前站着个人，下意识得抄起枕头抱在怀里。此人不是别人。<br /><p class='chapter_content_read_css'>就是那个杀千刀得瘟神，而那股子酸凉得味道正是从他手中得银色小瓶子里散出来的，西凝雪还没睡醒，抱着枕头又缩到了角落里，“你想用迷香迷晕我是不是，没这么便宜得事！”<br /><p class='chapter_content_read_css'>“这是醒神香。”<br /><p class='chapter_content_read_css'>还好，不是迷香，也不是有毒得香气。<br /><p class='chapter_content_read_css'>西凝雪脑子过了一会儿终于清醒了点，收拾了自己得东西便起床梳洗，他叫醒自己得时辰正是午时，算起来离和明月楼老板约定的时间还有会儿，她又点了几盘包子准备开吃。<br /><p class='chapter_content_read_css'>半晌又看到笑意盈盈得温夕言在边坐着，才想起来应该还差一碗粥……<br /><p class='chapter_content_read_css'>这几日她总是会忽略身边还有一个人得存在，毕竟他从来没有开过口朝她讨要米粥吃，所以即便是他坐在一旁，她都能将所有得好东西都吃完然后问他你干嘛。<br /><p class='chapter_content_read_css'>西凝雪将粥从小二得手中端到他面前，还准备好了一双筷子。<br /><p class='chapter_content_read_css'>她想自己总是在无时无刻得心软，他明明没有提出来任何要求，但跟在他身边总知道他需要什么，然后不由自主得将他想要得 东西双手奉上。<br /><p class='chapter_content_read_css'>但是她并不刻意得去制止自己为他做些什么，一来自己随心所欲从未被什么束缚过，二来她就是打算一路养着他回去得。不过相伴一场，回到皇宫便再无瓜葛。<br /><p class='chapter_content_read_css'>吃完包子西凝雪就准备出发了，既然有了他得支持，她想这一千两总归是跑不了得。<br /><p class='chapter_content_read_css'>“公子留步。”一句悦耳得女声在身边响起，西凝雪停住脚步看向身边得女子，还是一个未行及笄之礼得姑娘，个还矮她半头。<br /><p class='chapter_content_read_css'>“有什么事吗？”西凝雪故作镇定，面带微笑道。<br /><p class='chapter_content_read_css'>“公子你……”<br /><p class='chapter_content_read_css'>“且慢！”<br /><p class='chapter_content_read_css'>第一次收到姑娘家得爱慕，西凝雪心花怒放得伸出了巴掌。<br /><p class='chapter_content_read_css'>且慢，容我点时间想个好得理由拒绝你。<br /><p class='chapter_content_read_css'>西凝雪知道自己魅力很大，也没想到这姑娘年龄虽小，胆子也不小，竟都敢上前表白心意了。<br /><p class='chapter_content_read_css'>“我已有家室了，小姑娘。”<br /><p class='chapter_content_read_css'>小姑娘抬头很真切得摇了摇头，道，“不，我是想说公子你踩死了我的蛐蛐。”<br /><p class='chapter_content_read_css'>“……”西凝雪脸一拉，沉下面色甩出了一吊子铜钱。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	这算什么？这算什么？！她好歹现在也是面如冠玉，峨冠博带得俊俏美男吧，这些人不识货，太肤浅了！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	告别了脚底下误踩死得蛐蛐，两人一行来到了明月楼。<br /><p class='chapter_content_read_css'>明月楼内仍是人声鼎沸，她刚走进大门，早就等候多时得众人簇拥而来，纷纷给她加油打气，支持她夺得最后一场胜利。西凝雪感动得和众人寒暄了一阵便上了台。<br /><p class='chapter_content_read_css'>明月楼老板见人来了，便客客气气得邀她到一边。<br /><p class='chapter_content_read_css'>“小哥，你终于来了。”<br /><p class='chapter_content_read_css'>“嗯。”才吃完最后一口糖串匆匆赶过来得。<br /><p class='chapter_content_read_css'>“那就赶快随我上二楼吧，云三公子在二楼等着您呢。”<br /><p class='chapter_content_read_css'>“二楼？”<br /><p class='chapter_content_read_css'>怎么这第三关不是在这台上吗？不过她也用不着太担心，如果明月楼老板打算谋财害命的话，不是还有温夕言在嘛，他以一抵十让她安全逃走还是没有问题得。<br /><p class='chapter_content_read_css'>这第三关要与那云三公子单独会面，众人不由扫了兴纷纷离去。<br /><p class='chapter_content_read_css'>“云三公子，那小哥我已经给您请过来了。”明月楼老板轻轻敲响房门，只听屋内传来了应声，明月楼老板笑眯眯得推开了门，“小哥里边请吧。”<br /><p class='chapter_content_read_css'>“走。”西凝雪架势十足得朝里走去。<br /><p class='chapter_content_read_css'>走进去不见人，西凝雪便绕过了屏风向里走去。<br /><p class='chapter_content_read_css'>这都是汉人得习惯，怕一进屋就瞧见自己那不堪得模样，设了屏障之后也好有时间来打理自己。<br /><p class='chapter_content_read_css'>“在下如何称呼兄台呢？”不同于常人得服侍，但仍是鲜卑族肤白发黑得特征，西凝雪记得那日远来得东晋太子便穿着这奇怪得长袖袍，戴着玉色得峨冠以橫荓固定，汉服与胡服最大得不同点就在于袖口得大小，和发饰得不同。他该不会是汉人吧？<br /><p class='chapter_content_read_css'>“你是汉人？”下一秒西凝雪就压不住心头得疑惑问道。<br /><p class='chapter_content_read_css'>“呵呵……”云三公子爽朗一笑，没想到她竟会如此问，但也毫不避讳得如实答道，“家父是汉族人，家母是鲜卑族，若论种族，我也算得上是汉人罢。”<br /><p class='chapter_content_read_css'>“原来如此。”西凝雪又想起他刚才得问题，便补充道，“我叫宁小肆，云公子叫我小肆就行。”<br /><p class='chapter_content_read_css'>云三公子点头致意。<br /><p class='chapter_content_read_css'>西凝雪把目光转向了四处，这屋里竟没个椅子，难不成自己要跪着与他谈话？想了想她也就入乡随俗了，跟着在他桌对面屈膝而坐。<br /><p class='chapter_content_read_css'>安稳得坐下以后，西凝雪才把目光转回到云三公子身上这人虽比不上温夕言，但那身儒雅得气质也是不可多得。<br /><p class='chapter_content_read_css'>若是换作以前，她肯定欢喜得奔上前握个手，套个近乎以便能够讨得他得欢心，顺利拿到那一千两，但她身后还带着一人呢，她可不想在他面前出丑。就是拿不到赏银，也不能丢了自己得面子！<br /><p class='chapter_content_read_css'>“云某想要给宁公子出得第三题便是这杯茶。”云三公子兀自端起了桌上得那杯茶，见西凝雪疑问得目光转过来，他继续解释得说道，“云某设下三关无非是想找一位知心得知己朋友，如宁公子能品出这茶中有多少味茶叶，并说出它们得名字便能得到公子想要得。”<br /><p class='chapter_content_read_css'>“品茶？！”西凝雪从他手中接过那杯茶，杯底沉着一堆得茶叶，她倒是能凭着茶叶得形状认出几味来，但要全部说出来那可就困难了。她常日里喝茶哪管什么品种得茶叶，就算真的品出来了也不知道叫什么名儿啊。<br /><p class='chapter_content_read_css'>万千思绪掠过，西凝雪佯装惋惜得摇了摇头，放下手中得茶杯。<br /><p class='chapter_content_read_css'>“云公子，实不相瞒，我想坦白一件事。”<br /><p class='chapter_content_read_css'>“宁公子请讲。”<br /><p class='chapter_content_read_css'>“其实……”西凝雪垂下头，憋屈得叹了口气，“宁公子想要找的朋友不是我，前两关都是家兄得杰作，他就是不愿意出风头，所以我这才替了他……”<br /><p class='chapter_content_read_css'>云三公子意料之外得挑了挑眉，“不知宁公子所说得那位仁兄现在何处？”<br /><p class='chapter_content_read_css'>西凝雪乐呵呵得将身后得人扯到身边，期间更是加了些力气紧紧握住他得手，然后他反手一捏，自己手骨就疼得没边了。她恼火，自己捏他就是想告诉他这一千两银子就交给你来品了，没想到他居然还反过来整她一下。<br /><p class='chapter_content_read_css'>西凝雪退到他身后对着他得后背伸出手指鄙视了一下。<br /><p class='chapter_content_read_css'>“那么这位是……”<br /><p class='chapter_content_read_css'>云三公子细致得打量着温夕言，而她还在他得后面做着各种鄙视得手势。<br /><p class='chapter_content_read_css'>西凝雪作为中间人，这才反应过来自己应该做些什么。由于事先就在路上对好了消息，所以她也就不客气得把编造好得家世背景交代了出来。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406037&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406037&&novelId=17935'">下一章</div>
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

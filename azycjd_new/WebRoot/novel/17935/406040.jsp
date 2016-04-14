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
    <title>第七十五章 只有一辈子</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406040&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406040&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406040+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第七十五章 只有一辈子]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406040')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406040 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406040,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第79章&nbsp;&nbsp;&nbsp;第七十五章 只有一辈子
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			芳儿沉默无声得向着一边扭过头去，辟邪仍是一脸老实相得埋头站在原处，若非是温夕言警告过她，否则她绝对不会将辟邪和叛徒联系起来。<br /><p class='chapter_content_read_css'>但现在她必须装作什么都不知道得，以免打草惊蛇。<br /><p class='chapter_content_read_css'>“芳儿，发生什么事了。”西凝雪上前扯她身上得被子，她死死拉住硬是与她僵持了十几回合不肯松手。<br /><p class='chapter_content_read_css'>“你再不说信不信我让辟邪来扯你被子。”<br /><p class='chapter_content_read_css'>芳儿猛然一惊，慌乱得望着一脸镇定得西凝雪，她挑挑眉示意让她自己将被子掀开，芳儿咬着牙妥协得松了手，西凝雪让辟邪退出去，芳儿毕竟是个女孩子，让人看光了名节也不保。<br /><p class='chapter_content_read_css'>把被子掀开之后，西凝雪当场就愣住了，这个芳儿居然是个男的！！！<br /><p class='chapter_content_read_css'>她和芳儿相处了小说也有半个月，竟一直未察觉到她是男儿身，难怪温夕言让她自己来查清楚。<br /><p class='chapter_content_read_css'>这么一想果然通了，那夜芳儿不愿意与自己同睡，也是应当如此。<br /><p class='chapter_content_read_css'>只可惜她没有趁早发现，不然她就不拉着芳儿给自己捶背捏肩，外加伺候沐浴更衣了。怪不得她每次拿着巾帕手都是一抖一抖得，她回过身一望他这没洗澡得比她正在洗澡得脸色还要发红。<br /><p class='chapter_content_read_css'>不过西凝雪不太在意沐浴得事，反正她又没有露全身，也不会这么粗俗得要求负责。<br /><p class='chapter_content_read_css'>思绪回到现在，西凝雪瞅了一眼地面得衣物，这总该不会是他自己撕下来得吧，那么辟邪又是何时就知道芳儿是个男子的呢。<br /><p class='chapter_content_read_css'>西凝雪面色凝重，收回了愕然得神情，“说吧，你是谁。”<br /><p class='chapter_content_read_css'>身份被识破他也不再为自己开脱，如实得答道，“景鸿。”<br /><p class='chapter_content_read_css'>“景鸿？名字不错。”西凝雪退身坐在了床榻上，继续盘问道，“那么你男扮女装混进天香阁，总该不会是真的想做我的婢女吧，你是谁派来的啊。”<br /><p class='chapter_content_read_css'>“是太尉大人让小的来保护小姐的。”<br /><p class='chapter_content_read_css'>“哦~我爹啊？”西凝雪装作惊讶得将余光瞄向房间门口，这个辟邪果真在偷听，不过他也没有料到自己得影子正挡着门缝底下透进来得光，她有意得笑出了声，转向了景鸿。<br /><p class='chapter_content_read_css'>“我凭什么相信你，我怎么知道你伪装成宫女进来不是来杀我陷害我的。”西凝雪冷着声音道，“我没这么傻，简简单单得就信你。”<br /><p class='chapter_content_read_css'>“……小姐，属下说的……句句都是真的！”景鸿着急得为自己辩解，但思来想去真的找不出能够证明自己身份得证据。<br /><p class='chapter_content_read_css'>“我不管你说的是不是真的，明天就收拾东西给我离开天香阁，我不需要你得保护！”西凝雪作势就要离开，门口得光线瞬间恢复了，西凝雪步子也变得缓慢。<br /><p class='chapter_content_read_css'>景鸿咬紧牙皱住眉头，“小姐既然让景鸿走，景鸿现在就走便是，不过娘娘自己当心着点，那个辟邪他武功不低……”<br /><p class='chapter_content_read_css'>“哈哈哈……”西凝雪悠忽发出得笑声让景鸿更加觉得自己不被信任得想要逃走，西凝雪笑眯眯得伸出爪子拍拍他得手，安慰道，“我没有真的要赶你走，你怎么说什么信什么啊。”<br /><p class='chapter_content_read_css'>“小姐，你……”景鸿又是羞又是气得绷紧身子，“小姐到底是打算如何……我离开不是，如小姐得意吗……”<br /><p class='chapter_content_read_css'>“行了行了不逗你了我说正事，既然你也知道辟邪存有异心，而我刚才那番话也是说给他听得，景鸿，你与他相处这么久知不知道他得真实身份是什么，来历如何？”<br /><p class='chapter_content_read_css'>景鸿收去了所有得神态，认真得回答，“我也不知道，不过方才……他，他以为我是女儿身想对我动手，我实在不敌……如果不是小姐来的及时，那个辟邪恐怕会趁机杀了我。”<br /><p class='chapter_content_read_css'>“什么？你说他对你什么？”西凝雪震惊得重复一遍。<br /><p class='chapter_content_read_css'>景鸿脸色彻底黑下来，沉声道，“娘娘……”<br /><p class='chapter_content_read_css'>“行行行我不问了，不过我在府里头这么多年，也没见过你啊。你到底是哪家得孩子啊，这么小就会武功了。”这也是西凝雪一直疑惑得，看模样这个景鸿不过十四、五岁，若非比一般男子骨骼略小，不然光是身形上就会被人认出来。<br /><p class='chapter_content_read_css'>“小姐是怎么知道我会……”景鸿惊愕得低声道。<br /><p class='chapter_content_read_css'>西凝雪本就没打算瞒他，便答道，“刚才我摸了你的手，有薄茧。”<br /><p class='chapter_content_read_css'>这也是温夕言教得，一般习武得人都会常年使用兵器，时间久了手中就留下一层比一般皮肤硬得薄茧。<br /><p class='chapter_content_read_css'>景鸿明亮得眸子有些黯然失神，声音也越来越低，“小姐不知道我得存在是应该得，我少时被大人捡回府中的，名字是夫人取得，大人将我送到龙翔佛寺与禅叶大师学武。<br /><p class='chapter_content_read_css'>我第一次见到小姐是在我刚出师后回到府邸得第二天，大人对我恩同再造，所以我发誓要誓死保护西家所有人，只是小姐进宫多日与府中失去了联系，老爷和夫人担心，才将我安排进天香阁照看小姐的。”<br /><p class='chapter_content_read_css'>“哦~你是说我见过你么？”西凝雪努力得回想了一下，可她真的对他没有半点印象，只好回神笑着搓了一下他得乱发，“还没我大呢，就说要保护我……我现在改变主意了，你明天就回去吧，这天香阁我一个人也可以打理得。”<br /><p class='chapter_content_read_css'>景鸿悠忽认真而又紧张得摇头，“不，我要留在小姐身边！请小姐不要赶景鸿走……”<br /><p class='chapter_content_read_css'>“那么你以为你留在我身边就有用吗？”西凝雪好笑的又把他得头发继续搓乱，“你现在连辟邪都打不过，你认为你能挡得住他几招？他若是动了杀心枉送得性命那就是两条，若你走了我一人尚且能够放开手脚，再说你现在武功又不高强怎么保护我，你还是回去再练练吧。”<br /><p class='chapter_content_read_css'>“不……小姐，就算真的打起来，景鸿也一定可以为小姐争取到离开得时间，小姐不要……”<br /><p class='chapter_content_read_css'>“什么不要，我可没对你动手动脚得。”<br /><p class='chapter_content_read_css'>西凝雪此刻穿着男装与他贴近，颇有几分暧昧。<br /><p class='chapter_content_read_css'>这调侃得语气让景鸿又开始羞愤了，虽然前段时间他也没少被满口都是奇怪言语得西凝雪笑话过，但他一直都未曾像现在一般坦露身份、坦露情感。<br /><p class='chapter_content_read_css'>“小姐，景鸿会勤加练武得，不要……赶我走。”<br /><p class='chapter_content_read_css'>西凝雪经他三番四次得恳求也有些心软了，但后宫这么乱她真的不想牵扯一个无辜得人进来，尤其还是得知景鸿这么可怜得身世，她就更不能让他受到危险。<br /><p class='chapter_content_read_css'>“我让辟邪把你赶出去也是一样的。”<br /><p class='chapter_content_read_css'>“小姐……”<br /><p class='chapter_content_read_css'>“不然我说有人故意混进天香阁把你丢出去也是一样的。”<br /><p class='chapter_content_read_css'>“你……”景鸿憋屈得快要落泪了，他得师父教他千罗万象得武术，却没教他如何面对一个刁钻得女人，何况他面对的还不是普通得女人，是脸比城墙厚得西凝雪。<br /><p class='chapter_content_read_css'>她虽然对着温夕言完全失去了攻击力，但在言语上胜过平时就一本正经得景鸿，那绝对是绰绰有余的。<br /><p class='chapter_content_read_css'>“后宫没你想的这么简单，不过我也没打算继续呆在天香阁了，等查清楚究竟是谁派辟邪来要来害我之后我就离开。”西凝雪放松得吐了一口气，“我要离开皇宫……你跟不了我一辈子得，景鸿。”<br /><p class='chapter_content_read_css'>“可是大人要我保护小姐。”景鸿没有底气了。<br /><p class='chapter_content_read_css'>“你错了景鸿，人只有一辈子得时间去潇洒，你生下来并不是就为了他人而活，你也要有自己得生活。你离开天香阁以后大可出宫去，娶妻生子儿孙满堂，也许说不定你得父母就在宫外等着你呢。”<br /><p class='chapter_content_read_css'>“小姐……”景鸿热泪盈眶得攥紧拳心，脑海里深深得记下了这番话，“小姐大恩大德，景鸿来世再报！”<br /><p class='chapter_content_read_css'>“别傻了哪还有什么来世啊，我都不信得。”西凝雪洒脱一笑，随即起身，“爹那边我会说的，你安心离开吧，以后我们若是有缘再见，你也当不认识我吧。”<br /><p class='chapter_content_read_css'>忘记一段记忆才能真正过属于自己的生活，虽然她自己做不到，但惊鸿一定可以，他是个心思单纯简朴得人，虽然有时候闷了点但总的来说是个好人。<br /><p class='chapter_content_read_css'>西凝雪背身离开了他得房间，没有丝毫留恋。<br /><p class='chapter_content_read_css'>因为她实在很饿了，从清晨就滴水未进还和景鸿进行了一场体力对话。她摸了摸瘪瘪得肚子，决定去先去灶房弄个两大碗瘦肉粥喝一喝。<br /><p class='chapter_content_read_css'>晃晃悠悠得走进灶房，朝大锅里倒了几升米，光是闻着米香西凝雪就恨不得直接抓起来生吃。<br /><p class='chapter_content_read_css'>但好歹还是又挨了片刻，才端着热粥回寝宫。<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	她一看自己寝宫外正站着个人，那身形还颇为熟悉，不过天色已晚，她又看的不太清楚，心想一定又是摊上什么大事了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪又瞄了两眼，心里头委实不愿意上前搭理，便找了块干净得石头坐着喝粥，望望这美丽得月色也是极为不错得。<br /><p class='chapter_content_read_css'>待她吃饱喝足伸伸懒腰心满意足之后，若遇上什么大事，吃饱了也有力气思考问题。<br /><p class='chapter_content_read_css'>西凝雪嚼了几口瘦肉粥，呆望着月色思绪停滞了稍许。<br /><p class='chapter_content_read_css'>小时候听闻如果望月亮望久了就会变成石头人，长子城得一处河流边就放着一尊石像，好像叫什么望石，这还是有典故得，那尊石像本是一个极美丽得姑娘，她嫁了一个极俊俏得郎君，后来她得如意郎君为了一家生计出海捕鱼就再也没有回来，美丽得姑娘整日站在河流边上望着，茶不思饭不想，能做得事只有想念一个男人，最后因为等待这个男人而变成了一尊永不能动得石像。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406040&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406040&&novelId=17935'">下一章</div>
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

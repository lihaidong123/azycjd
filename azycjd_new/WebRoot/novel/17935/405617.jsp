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
    <title>第五章 皇宫深似海</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=405617&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405617&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+405617+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五章 皇宫深似海]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('405617')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(405617 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(405617,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第9章&nbsp;&nbsp;&nbsp;第五章 皇宫深似海
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	她还正想着该怎么解决选秀的事情，娘亲的声音就在门外响起，西凝雪打开门就见娘亲哭丧着脸，不仅仅是被打了十巴掌的问题，这压根就是被打了十巴掌再加割了心头肉的模样。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“雪儿……”娘亲的眼泪在开口的一瞬间就砸落了下来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪装作什么事情都不知道的点头，顺便跟着一起冒着盈盈的泪光。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“娘和你爹接到了皇上的圣旨，三日后皇宫选秀，王公公会来一趟，到时候你随王公公去吧……”娘亲泣不成声的摸了摸她的后脑勺，心里铁定在惋惜：白养了这么多年的闺女啊，怎么就要送人了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪不露痕迹的挤出了几滴眼泪，“娘，我舍不得你啊！雪儿不想离开你啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“傻闺女，娘也舍不得你啊，可这是圣旨怎么能违抗呢，这一去也不知何年马月才能与你相见，且宫中的那些个嫔妃贵人个个都是攻于心计，娘就是担心你这么单纯又不懂得进退，万一惹急了这群贵人那可怎么办。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	娘，您再好好看看，我这张脸哪里长得像单纯的模样，这分明是充满了正义且豪放的脸，女儿以后可是一代大侠，别说惹急了那群吃软饭的白面女，就算是皇帝老子欺到头上来，她西凝雪也照样不客气的奉献出自己的拳头，换种说法叫：宁可犯下大罪，也绝对不要吃亏。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	当然这种话是绝对不可能对她亲爱的娘亲说出来的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“娘，女儿一定乖乖的不惹是生非，在宫里头也会想着你们的，若是女儿出人头地，一定会回来见你们的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“呜呜呜……娘都知道，你这孩子自己在宫里过的好便好，也别时常挂念着爹娘，免得伤心。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪无奈了，娘亲你可别哭了呀，女儿我就是去宫里走一遭，很快就会回来的。您哭成这样，搞得女儿我还没进宫呢就心塞了。但谁叫我是你女儿呢，安慰人这事女儿我义不容辞啊。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	唇枪舌战的和娘亲磨了好一阵子，然后老泪挥洒了几个时辰，终于苦口婆心得将娘亲送走。西凝雪累得当即就倒床合上了眼，睡得无比香甜，心中更是畅然的想着，皇帝老儿都三十多岁了还要纳妃，人家寻常百姓三妻四妾已是奢侈，您老坐拥三千后宫，本姑娘我可是如花似玉的黄花大闺女，才不要从了你呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	更何况她内心标准是文质彬彬为人仪表正派得美男子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	可惜了这游荡数十载，愣是没见着有哪个让她看上眼的美人，个个都是五大三粗，身材魁梧，说话谈吐低俗至极，要是真有一个美娇郎给她做夫婿，她肯定是做梦都要笑醒了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	结果她是被熏醒的，满屋子的香味直冲大脑，西凝雪勉勉强强的吸了几口气，浓郁的几乎要占满她整个肺部的气味，不由得压抑的低吼道，“小梅！！！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哎，小姐，来了来了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	小梅手里头还端着香炉，和放在她床边的香炉是如出一辙，见西凝雪怒气横生，小梅慌慌张张的解释，“老爷吩咐把檀香换成千步香，因为皇上喜欢带有体香的女子……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“……皇上喜欢香管我甚事，而且这没把我熏成带香的，先把我熏死了还差不多！”西凝雪头晕脑重的揉了揉眉心，不耐烦的摆手，“撤走撤走，把这千什么香的统统撤走。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	小梅难堪的咬了咬嘴唇，水灵灵的大眼睛楚楚可怜，“小姐，撤走的话奴婢会受老爷责罚的。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	最见不得小梅这套了，偏偏她还非抓着西凝雪唯一的软肋：对爱哭的人没辙，无论对方是男是女，是老是少，只要啪嗒啪嗒落了泪的还让她见着的，她这心里头难过，当然不是为她们难过，而是为自己的耳朵难过，你说这哭的悦耳动听也就罢了，那要是碰上了街妇之流的那简直就是挑战她的大脑神经。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪只好叹气，然后动了动嘴唇，“把香炉搬远点吧……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	只是这最后的日子还不能让她安稳的过，每日除了呆在房里闻着刺鼻的香气，就要在爹娘轮番的循循善诱之下，改了不少得谈吐与气质，而且还被迫记下了皇上的喜好，例如早晨起来要喝菊花茶、每日下午都要上书房练一会儿书法、皇上最喜欢吃的是桂花糕、皇上最喜欢的书是资治通鉴和吕氏春秋、皇上最不喜欢忤逆他意思之人等一系列鸡毛蒜皮的小事情……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这些消息是从主事的王公公那里，以重金换来的，对于这些，西凝雪只想说一句，何必呢？何必呢！她就是不算计着秀女的事情，凭着相貌她还是很有信心让皇帝给她封个什么昭仪、良容、才人之类的玩玩。连她都不担心，爹娘这急得怕她没人要，要赶紧把她嫁出去似的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	王公公来迎接时，西凝雪正忙着和爹娘客套的道别，王公公被小梅打发到了一边，也就是俗称的“照面”，秀女选秀实际也是比拼家财，要么有权有势，要么有钱有貌，否则就会被其他秀女欺压的很惨，西家不缺钱也不缺权，打点起来自然也是大手笔。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	王公公回来时笑容满面，一看就知道又多收了一笔囊中之财，你说你一太监敛这么多财，生不带来死不带去的，膝下又无儿无女的，将来老了这笔钱财还不歹送入棺材，或者被身边的小太监偷偷瓜分的一干二净，还图这份利益何必呢？何必呢？<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	直叹无奈的西凝雪低头沉思了许久，脑子清醒时发现自己已经被小梅扶着上了马车，连带着包袱一起打包扔了进来。拍拍脸蛋松了口气，一旦入选了秀女就身不由己了，身子是皇上的，心思也是皇上的，照理说她在府中听了爹娘那么多关于要紧紧扒在皇帝身边的手段和方法，但一想到皇帝老头子胡子拉碴的样子，就没了想要开口的欲望。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	就更别提和皇帝老头子在一起干一些不愿意的事情，所以这妃子不能做，但如若选不上妃子，又要为皇上在宫中守身两年方可回府婚嫁，但她西凝雪的时间如此宝贵，怎么会浪费在这个皇帝老头子身上呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	必须要找理由离开，不仅仅是为了自己的自由，也是为了自己的日后做打算，在宫里那么不方便展开手脚，她怎么去找世外高人去学绝世武功，然后独步天下，之后吃遍天下美食，杀遍天下负心人呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小姐，到了。”车夫大声的说道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哦。”西凝雪应了一声，把自己的思想停在了如何逃离景秀阁的办法上。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	下马车，拎起包袱就跟着神武门的小太监快步的朝里走去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	经过小太监的指引，西凝雪来到了景秀阁，也就是秀女住的地方，一个房间内摆着三张床，也就是说这房间里的除了她应该还有两个秀女要被安排进来，看来她来的还算早，其他两个还没有来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	自个安顿好了包袱以后闲来无事的坐在了床上，没成想刚坐下房里就进了个人，模样身形一瞧居然有点熟悉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小雪！”听到这一声唤，西凝雪才知道是自家好姐妹云沁来了，意料之外两姐妹相互搂在一块慰藉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“沁儿，真好……我们俩被分在一块啦！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“嗯。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪眉开眼笑的一边帮云沁整理东西一边问道，“我们可是上天都分不开的好姐妹，这不，房间都分在一块了。不过这第三个人会是谁呢……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“管她是谁，反正啊……就咱两姐妹永结同心，还怕没有什么解决不了的事情吗。”云沁放了铺子就欣喜的将西凝雪拉到门前观望廊外的一片花草树木，“你瞧，这景秀阁景色多好啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“嗯，挺美。”西凝雪一向都对什么花花草草、日日月月的美景没什么感觉，如果换做一个漂亮的美娇郎，她说不定还会兴奋的跑过来张望两眼，但云沁喜欢她也只能装作很喜欢的样子了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我听说这选秀分成两批，一批是家室在五品以上官员的女儿便可不经审查直接进入景秀阁，剩下的那一批平民女子和官阶低的还要到神武门经王公公挑牌子才准过，所以啊……这房里的第三个人肯定也是个高官之女。”这时云沁到想起来西凝雪方才问题的答案，便作为话题的引头道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“原来如此，不过你爹是从二品，我爹从一品，我倒要看看这位高官之女能高到哪里去。”西凝雪满心期待不加半点掩饰的笑道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	话才落下没多久，就有人无视两人走进了屋里，西凝雪朝里一看，正在收拾东西的那位倒真是个美人，然后她冷眼瞧了一眼西凝雪，那顾盼神飞的面容更加吸引人，“你们两个站在屋前，难不成都是这屋里头的人？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她一开口就让西凝雪对她的憧憬破灭了，原想还是个楚楚动人饱读诗书得闺秀，但是面前这美人显然是在府中受宠至极，明目张胆得打量她们二人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪笑眯眯答道，“没错，我叫西凝雪，她叫云沁，大家以后就是一个屋子的人了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哼，就你们两个穷酸女还想巴结我，我才没兴趣和你们接触！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪对这位嘴巴特臭得美女没了兴趣，知道对方不好打交道也就不自找没趣，她可不喜欢碰硬，适当的时候还是应该少理会这些自以为是的人，不然免得惹上了事反而闹得自己烦神，西凝雪转头对云沁扬眉道，“沁儿，我们去别处逛逛吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	云沁也不屑的盯了一眼臭嘴女，“当然，我可不想呆在这里受气。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你们！”臭嘴女看着两人离开，只好冷冰冰的哼了一声才作罢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪带着云沁悠闲的逛了会儿，正巧遇上管事的女官，凶巴巴的将两人叫到跟前，“你们两个，给我过来。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	慢悠悠的走到她面前，女官冷着眼瞥了两人一眼，“你们两个就是住在上房的秀女吧？既然来了就给我记清楚了，到了景秀阁不存在什么掌上明珠、官家小姐，我薛翠花都一视同仁，不过……你们房里头住的那位可是当今习大将军的亲侄女刘淑妙，我好心提醒你们两个可别没事找事惹上麻烦。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪夸张的捂住嘴，“啊呀，原来是习大将军的侄女啊……薛嬷嬷，我好怕啊……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	果然是有些身份，怪不得人家“没兴趣”和咱们接触，原来亲戚是官从一品正是皇上跟前的红人呢。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官还未听出话中的意思，轻蔑的音低了些，“怕什么，她又不是吃人的老虎，你们不惹是生非好好与她相处着也就罢，别的我也没什么好交代了，你们走吧。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	女官从两人身边路过，然后西凝雪冲着她的背影蔑视的笑道，“还说不偏袒呢，到头来还是怕得罪人家一品官员。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“掌上明珠、官家小姐~”学着女官的尖嗓子，云沁得意道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	两人不约而同的笑了，接着又慢悠悠的顺着弯曲的小径走回了自己的房间，西凝雪推了推门，没推动，又使了劲还是没推动分毫，而里面还传来窸窸窣窣的声音，那个刘淑妙肯定是在的，不仅在，而且还故意把她们挡在门外不让她们进来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“喂，里面那位，开门！”云沁不耐烦的吼了起来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	刘淑妙听的心惊，生怕云沁动了怒要闯进来，思忖了一会儿，还是起身将从里边反扣上的锁取了下来，然后才鼓起勇气朝云沁叫道，“好你个尖嘴的丫头，知道我是谁么你就敢这么吼我，难不成你想找麻烦！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪懒得跟她理论，直接把她往旁边推了推，“一边去，别挡路。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	管你是皇帝老儿还是什么了不起的大将军，正所谓天高皇帝远，这群人在她西凝雪眼里还是草芥一名！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你们，你们两个竟然……”刘淑妙的眼中立马涌出了几滴泪水，呜呜咽咽的苦嚷道，“你们俩给我等着，我去找薛姨找你们算账！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“来呀来呀，谁怕谁啊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪朝她做个鬼脸，然后把门一踹，和云沁两人偷偷的笑，刘淑妙跺了跺脚，气愤的转身离去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	果然还没到一盏茶的时间，刘淑妙引着女官又回来了，蝉露秋枝的哭了好一会儿才指着正在悠闲喝茶的两人，“薛姨，就是这两个人刚才欺负我，我再三忍让她们却一而再再而三的欺负我！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我们话都没跟你说上几句呢，什么叫一而再再而三？”云沁冷哼一声，“不如你说说，我们到底做什么了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你们……你们刚才骂我，还狠推了我一把！”刘淑妙思忖片刻，才想出这么个不正当的理由。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哎哟，看来这一推是把你推伤了是吧，不如让我来给你瞧瞧，我可是学过两手的，包治包好。”西凝雪作势就要过来抓她的膀子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	刘淑妙吓得浑身发抖，抓着女官的衣袖不由得加大了几分力气。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“都给我适可而止！”女官猛然喝道，神情震怒，“你们这几个黄毛丫头入了景秀阁还不知道收敛一下吗？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	刘淑妙不敢言语，西凝雪和云沁是懒得回答，女官自以为喝住了这三人，自然得意的哼了哼。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你们两个起来跟我走。”女官用凌厉的眼神示意着西凝雪和云沁。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那你后边那位呢？难不成她就没有半点责任？”云沁有些不服气的问。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“她怎么能跟你们比呢，你们两个也不想想刘小主的身份。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“得了，沁儿你可别说了，咱们还是跟着走一遭吧。”西凝雪真没想惹事的，无非就是刘淑妙那小心脏受不住，肯定是从小被爹娘惯得太养尊处优，一点气都受不住。况且自己也答应了爹娘不会惹是生非，万一真的出了什么事情，不仅仅是自己会遭罪，爹娘也一定会担心的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	再麻烦也只能随着这女官走一趟了，只要能够安稳的解决了此事，她也不愁没有机会找刘淑妙报仇。<p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=405617&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=405617&&novelId=17935'">下一章</div>
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

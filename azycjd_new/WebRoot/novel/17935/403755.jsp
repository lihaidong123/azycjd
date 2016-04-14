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
    <title>楔子 邂逅</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=403755&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=403755&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+403755+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[楔子 邂逅]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('403755')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(403755 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(403755,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第1章&nbsp;&nbsp;&nbsp;楔子 邂逅
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			<p class="MsoNormal"><p class='chapter_content_read_css'>	寿光二年，苻坚起兵造反，国中氐人纷起响应，占洛阳为城，后改国号为永兴，庙号：世祖，谥号：昭宣皇帝，即兴修国中水利，前秦日益强盛。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	建元二十年，西燕君主慕容泓以兴复燕国为号召，建元兴燕集关内外诸马牧鲜卑，屯兵华阴。举十万大军起兵反秦进犯边关，六合内人心惶恐百姓流离失所，秦军大将姚苌带领精锐远赴边境，届时，马啸金光现，百万雄师浴血奋战战鼓四起、狼烟奔腾起、铁马血河、倒戈卸甲。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	燕兴一年，前燕贵族，前任君主慕容泓之弟慕容冲掌权，兵临长安城于阿房继承皇位，改元更始，拟庙号：高宗，谥号：威帝。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	太元十一年，西燕皇室内乱思及西燕万军陷长安，纵兵暴掠，意东归威帝薨，数位前燕贵族和将领被拥立为君主，据记，西燕皇族楼随月于中兴一年称帝，谥号：武恒帝。武恒帝掌权后一统南抵轵关，北至新兴，东依太行，西临黄河。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	<span style="line-height:1.5;">雨后的春苑中有一片特别好看的荷花池，不仅仅香气怡人，还带着勾人心魄的清新气息，但西凝雪左摇头晃脑的转着身子专注的看，就是没觉得这片荷花池和她在后院圈下的一块养水草的地方有什么区别。</span><p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过今日带着任务来，见着这满池子的荷花自然心悦。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“还差一味初生的荷瓣，嘻……小荷才露尖尖角，正待出头栽我手。”西凝雪一边嘀咕一边埋下身子，伸着手去勾靠近岸边的荷花。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哎哟喂，我的小主子啊，可别掉进湖里了！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那成，摘荷瓣就交给你了，我去掏鸟蛋……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这，小主子您就别难为我了，要为太后煮粥这种事情让下人去做就行了，您万一伤着哪里了，太后才怕会担心坏了身子。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪恍若未闻的将方子塞进了宫女的手中，潇洒的留下了背影。“本姑娘现在去掏鸟蛋了，等你收集完荷瓣以后，送我房里放着就行了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	这群侍女也真是的，要不是这个不能动要不就是那个不能碰的，难道整日坐在闺阁里乖乖学女红画那惨不忍睹的水墨画才算好吗？我堂堂西凝雪女侠怎么会听你们的号令去做这些黄毛丫头才做的低俗事情。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一边阻止自己胡思乱想，一边放开心神兴奋的向着远处最大的柏树奔去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“今天辛苦你了，我就掏四个鸟蛋，以后本姑娘还你一窝鸟。”兴致勃勃的拍了拍雄壮的柏树，笑的欢快。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	抹了抹手，猛地发现手掌上染上了血斑，西凝雪一怔，朝着树身望去，只见树身上染得血迹比掌心的还要多，而且朴树的周围还有一大滩的血。血迹是来自前方的，沿向着不远处的护城河。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪刚想看看前方发生了什么事，一队官兵急匆匆的像是见到一堆黄金似的狂奔过来。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“西小主，您可看见方才有一红衣男童从此处路过，此人是大理寺关押的要犯。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“嗯……不知道啊，我只是来掏鸟蛋的……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪如实说完，然后不动声色的将手上的血迹下意识的藏起来，官兵粗略的扫过一两眼，西凝雪心虚便局促不安的低下头，官兵确认没有人之后又迅速朝着其他方向奔去。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪放松的吐了口气，准备去河边洗净脏手。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	河边早已被染成了血红色，似乎有人刻意在逗弄她，她本就怒火中烧的心情又添上了一笔，西凝雪懊恼的跺脚。“今儿是怎么了，碰上的全是血腥。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“啊……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“？！”有声音！西凝雪朝两旁望去发现没有人，又绕过了那颗大树查探一下声音的来源，眼前的一幕如扎了根的藤蔓一样紧紧的缠住了她的双足，不能走动半分。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	只见一红衣男童满身是血的靠着大树，西凝雪望见他的时候，他正小心翼翼的用清水清洗着手臂上的伤口，衣袍褪了大半，黑发挡住了他满是伤痕的背脊，浓重的血腥气味刺激着西凝雪敏感的鼻子。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	嚯……原来要抓的就是这个人……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪脚步放轻悄悄得走到了他的身后，抓抓喉咙，准备一举揭发这个死囚犯的呐喊道，“来人啊，囚犯在这里啊！！！快来人啊！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“！！！”他吃惊的转过身，那刹那间的惊慌似是一头被惊动的野鹿，竟给人一种惊艳至极、一幕难忘的感觉。然而他却趁着西凝雪发愣，动作敏捷的将西凝雪扑倒在草地上，无比嘶哑的声音和肮脏的小脸中一双墨色重瞳，“不要喊。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	说完他就喘了几口气，似乎有些力不从心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“唔唔唔……”西凝雪被他的捂的难过，便动了手肘子朝后顶去，他依旧要躲开，松开她嘴的瞬间，西凝雪张口咬在了他的虎口上。他痛的低声抽气，眉头紧皱在一块，没有任何防备得倒在了地面。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“还想把我捂死灭口是吧，我西凝雪也不是好……”停顿了一下，西凝雪见他身子没动，迟疑的推了推他，真的没有任何的反应，好像死尸一般，唯有那如玉似的苍白脸色入目。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她一吓，心中思绪万千。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不会这人就被她咬上一口就死了吧？怎么办怎么办……她平日里再怎么插科打诨，也还没干过杀人这种事呢，胆都快被吓破了朝他鼻前一探，那虚浮的鼻息让她松了口气……没死，谢天谢地！老天保佑啊！<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这个人现在只吊着一口气，若是真的将他交给官兵的话，恐怕用不了多久，他就会真的被那群凶恶的官兵给打死。”西凝雪犹豫不决，她也见过那些因为犯了罪入牢的犯人们，到了最后非死即伤，没有一个是好下场的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	恰巧她今日正好碰上了，她再怎么硬的性子见着那浑身是伤的同辈孩子，也不由得升起了怜悯之心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她不想这个人死。决定好自己的心思后，西凝雪就开始背他的身体，他看起来虽然瘦小，但是身上穿的可是沾着血水的湿衣，她背的吃劲，挪了几步就手酸脚酸了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪卯足了劲将他拖了几步，然后双腿一软，面向了大地。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哎哟，小主子！小主子！您这是怎么了。”宫女小梅紧张的过来扶她，目光无意的打量到了西凝雪身边的那个男童，不由得惊讶的说，“呀，这又是哪家的小主，怎么身上这么多的伤口。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪面无表情的吐掉了嘴里边的泥巴，不耐烦的招招小手，“多嘴什么，赶紧帮我把他抬回我房间里放着！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小主子……您该不会是想把这孩子也一并煮了吧？这可万万使不得，要是让老爷夫人知晓了小主子你要用人作……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我什么时候说要煮了他的？我这是要救他！”被误解的西凝雪还颇为委屈的哼了哼，说话声也加大了，“你按着我的话去做就是了，我去掏鸟蛋了！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小主子哎……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	一炷香后，鸟蛋成功的端了一窝下来，西凝雪站在树杈上哈哈大笑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	笑了半天又小心翼翼的从树上趴下来，然后浑身污泥的回到了府中，没想到娘亲已经站在大厅等候许久了，一见西凝雪从门口走进来，娘亲殷勤的走了过来，“雪儿，你怎么才回来啊，这都多晚了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“嘻嘻，爹爹不知道就没事。”西凝雪抹抹脸上的泥巴。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那我若是知道了呢？！”神色威严的老爹走了出来，手上还拿着戒尺，怒目圆睁的骂道，“你说说你，整日朝三暮四的，玩的疯了时间都忘了，今日不给点教训，我看你是不知道悔改了！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“别啊爹！”西凝雪动作极快的躲闪，老爹拿着戒尺追着她乱跑。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪毕竟是个小孩，体力战也持续不了多久，连忙停下脚步端起了孱弱的模样靠在一边，摇摇晃晃的打着飘，“爹爹你先别急着罚女儿，女儿今日在宫里遇上了一个刺客，那刺客险些发现女儿的行踪，女儿可是死里逃生才回来的，爹爹不信的话尽可查看！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪把自己的衣袖都摊了出来，未干的血迹还没来得及处理，自然都落入了众人的眼中，老爹立马丢了戒尺，神情流露出万分的慌张，“还愣着干嘛，快给小姐找大夫去！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪本想将计就计得继续装病，却想起房里还有个来路不明的要犯，她要救他的话自然不能暴露了他的行踪。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	也不能给爹爹发现她窝藏死囚犯，不然可就不是挨板子这种小小惩戒了，说不定老爹一气之下大义灭亲的把她和死囚犯一齐举报出去……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	狡黠的黑目一转，西凝雪按住了脑侧，弱柳迎风的继续踩着踉跄的步子，“爹爹，女儿身上的伤倒是没什么，我就是想休息休息，也许过一阵就好了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“好好好，你先去休息，一会儿娘派小梅把饭菜都送到你房间里去。”说话的是母亲。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“恩恩，那女儿休息了，爹爹和娘亲也不许进来……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	嘱咐完话，西凝雪小步小步虚弱的走回了房间，然后背身关门。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“呼……这么下去也不是长久之计啊。”坐在桌前倒了杯茶给自己压压惊，回头又望见自己床上没人，心想这死囚犯上何处去了，若是自己好不容易将他救回，他再来一个到处闲逛暴露了自己的身份，一样白费她的苦心。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她正胡思乱想着，这时屏风后却走出一人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	宛如戏子般的白面孔，容颜秀丽，却是遮不住的傲气，一双墨色的重瞳内深映着浑浊的戾气，让人不由得心生畏惧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他挽着有些破旧的衣袖，径直朝着她走来，她以为他是准备杀人灭口的，没想到他摊着手，掌心中是一个小药瓶。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“衣服和药……谢谢你。”不是初次时的嘶哑沉音，却是好听的鲜卑语，好似一块温玉般，每一个字都暖入心扉。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪愣了一下，然后伸出小手接过他手中的半瓶药，她估摸着多半是小梅留下的，这死囚犯误以为是她好心帮忙的。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	不过他人都醒了，要不要举报他也是个问题……本来她可是打定了主意，但看他这么有礼貌的份上，她又把人抓去见官似乎不太好吧。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	更何况他虽然遍体鳞伤，但块头还是比她大，万一他要是狗急了跳墙要宰了她那就更不妙了，思来想去还是……<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“你就藏在这里吧，等你伤好了再走也不迟。”西凝雪没有等他的回答，就自顾自的从柜子里拿出了另一床备用的被子铺在床上，“如果你不嫌弃的话，你就睡在我的床上，我睡床头你睡床尾。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	他点点头没有任何反驳，半晌却又忍不住的问，“我在这里不会牵连到你吗？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她把他留在这里也是临时的决定，虽然他和她并没有半点关系，她也犯不着为了保他一人牵连自己，但她对他很有好感，不，应该说对长得漂亮的可人都很有好感。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“当然不会，那些没脑子的士兵怎么可能会搜到这里，本姑……”西凝雪欲言又止的盯了他一眼，这人现在尚未知晓她的身份，若是他恩将仇报反过来要陷害她怎么办，西凝雪机灵的转了个弯子，“我可是这府上大小姐的丫鬟小雪，你呢，你叫什么？”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“慕容瑶。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“慕容……啊？！”慕容这个姓氏在西燕用的人并不多，因为在史官地记载里，慕容这个姓氏好像还和什么有着很大的联系。西凝雪并没有再在这个问题上多虑，反而眉尖一挑兴奋道，“你比我大，我就叫你小瑶好了。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小主子，夫人叫我送晚膳来了。”小梅的声音突兀的在门外响起。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	慕容瑶神色一凝，几乎是不假思索的就做出反应躲在了床后，好像他已经习惯了这样的躲避，但是他却没留意小梅喊的是什么。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	西凝雪怕自己的身份暴露，连忙将小梅拉到了跟前，并小声叮嘱。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“从现在开始叫我小雪。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这，这怎么能行！”小梅把饭菜往桌上一搁，面上带着无奈的神色道，“小主子您就别害我了，我方才还因为小姐受伤的事情被老爷责骂了一番，呜呜呜……”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“又没叫你当着我爹娘面前喊，你私底下这么叫就行，听见没！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这……”小梅没想到西凝雪会这么强制的要求她喊这个名字，正在踌躇不决的做着决策时，又听她说。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“这什么这，答不答应！”西凝雪不耐烦道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“那，好吧，小……雪。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小梅，顺便帮我把木桶的水换成干净的，麻烦你了。”西凝雪笑眯眯的拍了拍她的肩膀。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“我这就叫家丁来抬水。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	当暖暖的水滑过皮肤，西凝雪早就把关于什么慕容瑶、掏鸟蛋的事情抛到脑后去了，享受沐浴的快感才是她的首要任务。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	泡了半个时辰，发觉忘记把衣服搭在架子上了，这时才想起来屋里还有一个人。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“小梅，帮我把床头的衣物统统拿过来。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哪里？”慕容瑶神色间飞快的晃过一丝迟疑，但还是开口应声。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“床头！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“哦。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	慕容瑶把衣物扔了过去，一件掉在地上，一件搭在头上，还有一件挂在镜子上，西凝雪震怒的将自己的肚兜从脑袋上取下，“你什么意思，敢造反了是不是？！”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“怎么了？”慕容瑶疑惑的问道。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	“算了……没事。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	她刚才忽然记起来，心中又是高兴又是忐忑，高兴的是幸好自己没有多嘴，说漏了什么。忐忑的是，自己可还是个待字闺中的姑娘，怎可麻烦一个异性替自己取衣，这一来面子也挂不住了，二来她心里头也不好受了。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	但往常这个时候小梅都在屋里熏香，她自然以为，在屋子里的还是正熏着香的小梅。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p class="MsoNormal"><p class='chapter_content_read_css'>	无奈之下拍拍额头，唾气的说道，“瞧我这记性，小梅不是早就被吩咐去休息了嘛。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=403755&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=403755&&novelId=17935'">下一章</div>
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

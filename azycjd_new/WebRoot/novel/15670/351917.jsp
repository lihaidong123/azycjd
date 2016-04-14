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
    <title>（四）匆匆离去为厨娘 春言兰阁西闹鬼</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351917&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351917&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351917+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四）匆匆离去为厨娘 春言兰阁西闹鬼]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351917')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351917 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351917,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第5章&nbsp;&nbsp;&nbsp;（四）匆匆离去为厨娘 春言兰阁西闹鬼
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  无聊，很无聊，非常无聊。<p class='chapter_content_read_css'>  这是南宁唯一可以想到的话。<p class='chapter_content_read_css'>  大概半个月前，自己被无情的师父丢到了这个名叫南苧的国家来，莫名被一个跟宫雪长得十分相像的男子救下，又被那个跟自己很不熟的师兄丢在了这家酒楼里当厨子，真是……唉，最让自己烦恼的是要集齐什么七圣珠才能回到现代，怎么办，真的好想念电脑、暖气，重要的还有各种零食甜点啊，好吧是她又嘴馋了。<p class='chapter_content_read_css'>  南宁坐在院子里托着下巴，扫着以前做过的记忆交易，果然还是那个紫荆花墓最让人在意，不知怎的，眼前忽然闪过南宫宁雪的脸。<p class='chapter_content_read_css'>  那天，果然是衣蓝跟踪的自己，虽然是为了自己的安全，心里还是会有些不舒服，那种被人窥探的感觉。南宁回到南宫府中就拆开了书绘音留下的信，结果是一张推荐书，上面写着她做的吃食如何如何，于是就收拾了东西，告辞搬了出来，南宫宁雪还取了些银子给自己，脸上还是挂着温文尔雅的笑容，有些让人捉摸不透，不过，现在应该不关自己什么事吧，管他什么南宫宁雪还是宫雪的，最重要的还是，想办法回家吧！<p class='chapter_content_read_css'>  南宁刚合上书，想伸个懒腰，就被一个声音无情地打断了。<p class='chapter_content_read_css'>  “秦姑娘，好兴致，就在这偷懒着，也不怕被扣工钱。”同屋的流湘提了早饭放在南宁面前，打趣她一下。<p class='chapter_content_read_css'>  “不算偷懒吧。”南宁随手捏了一个包子，小口吃着，又顺着喝了一口粟粥，忽然想起了什么，问道：“对了，西院小诺的病还没好转吗？”<p class='chapter_content_read_css'>  提到这件事，流湘也露出了担忧的神情，执箸的手一顿，叹了口气，道：“还没好呢，也不是什么大病，就是普普通通的伤寒，你看沈老板请了那么多大夫，花了那么多钱买药，就是没好转，也幸亏咱们沈老板人心眼好，若是换了别家的当家，哼，谁知会怎样？”<p class='chapter_content_read_css'>  “还有就是啊，”她忽然压低声音说，“听别院的说，或许是鬼魅作祟。”<p class='chapter_content_read_css'>  “鬼魅？”南宁心中一动，竖起耳朵仔细听来。<p class='chapter_content_read_css'>  “是啊，”流湘神秘兮兮道，“小诺的病可不是特例了，早在几个月前住在西院的几个帮工也是突然得了病，虽是小病，却也是同样治不好反反复复，结果，那几个帮工都辞工回家，第二天病就好了，你说，奇不奇怪？”<p class='chapter_content_read_css'>  “自然是奇怪啊，不过，管我什么事？我只要好好做我的饭，拿好我的工钱，别人怎么样，与我何干？”南宁说完，吞下了最后一口包子，又拿帕子擦了一下嘴。<p class='chapter_content_read_css'>  流湘听她的话，看见她眼中散漫的光，叹了一口气：“确实是，不过，我也是提醒你一句，不管有没有鬼，最好还是不要去西院。”<p class='chapter_content_read_css'>  “我自然知道，我可是，很惜命的。”南宁感觉到袖筒里有些异动，道，“对了，你今天不去南厨房了吗？要是掌柜找来就不好了。”<p class='chapter_content_read_css'>  “是了，那我先走了，那些就靠你收拾了。”<p class='chapter_content_read_css'>  “好。”南宁轻轻笑了笑。<p class='chapter_content_read_css'>  见她走出院子，南宁从袖筒里掏出缩小的九世转魂书，揭掉上面的小字符，九世转魂书就恢复到原本的大小，自动的哗哗翻了几页，停到某一页，南宁瞥了一眼便了然，哎呀，果真是有鬼呢，虽然我很惜命，但是，不插一脚好像不行啊。<p class='chapter_content_read_css'>  九世转魂书所停留的那一页上，画着一个小小圆圈，下面有墨迹写道：“七圣之一，珠融于书后方可知其名、其由来。”<p class='chapter_content_read_css'>  南宁虽然很不想多管闲事，但是，既然关系到她的利益，那就不得不“多管闲事”。<p class='chapter_content_read_css'>  <p class='chapter_content_read_css'>  已是半夜三更天，春言兰阁的室院里静谧一片，各个院子卧房中都陷入了诡异的宁静，一个黑色的人影猫着腰偷偷潜入了西院，静谧的卧房里忽然传来几声咳嗽，浅浅的连续不断，像是快要断了气一般，一阵冷风袭来硬生生的吹开了房门，那咳嗽声戛然而止，反而换成了细细的呼救声，若不仔细听，就跟那细风的声音一般。<p class='chapter_content_read_css'>  潜入西院的黑色身影听见那声音时身影一顿，又脚步轻轻地趴在门框边，细观察着卧房里的情况。<p class='chapter_content_read_css'>  若是让常人看来，只能看到一个面色苍白的少女躺在床上，面容因看到了什么可怕的东西而诡异的扭曲着，两只眼睛瞪的大大的，露着恐惧，嘴唇一张一合，勉勉强强发出细微的声音。<p class='chapter_content_read_css'>  但事实并非如此。<p class='chapter_content_read_css'>  趴在门框边的人略微眯了一下眼，心想着要不要救她一命，但行动反而比思想更快。<p class='chapter_content_read_css'>  悄无声息地，双手便从身后偷袭死死掐住少女细颈的红衣女子，女子猛一闪身躲过了袭击，因为女子松手而得以呼吸的少女，放松了面色，大口喘着气。<p class='chapter_content_read_css'>  “啧。”红衣女子怨恨的望了偷袭她的人，不过瞬时便从腰间抽出剑，直刺向那人，那人慌忙一躲，黑色的斗篷滑落，将整张脸露了出来，淡淡的眸子看向她。<p class='chapter_content_read_css'>  “有话好好说，何必动手呢？”南宁后退一步，随意的拢了一下额前的碎发，嘴唇挂着浅浅的笑。<p class='chapter_content_read_css'>  女子见她闲淡的样子，心情竟是平静了几分，但还是警惕地拿剑指着她，道：“你是何人？为何袭击我？”<p class='chapter_content_read_css'>  “是你太激动了，我是在救人啊，你又何必对我如此警惕呢？你是一个鬼魂，已经死掉的人，是伤不了我的。你心里也清楚，不是吗？至于小诺，她是阴时阴刻出生的至阴之女，所以你才能伤了她，不是吗？还有之前的那些人，其实是你自毁阴命，下了咒，嗯？”南宁笑着用手握上刀刃，像影子一般穿过，没有一丝痛楚，也没有伤痕。<p class='chapter_content_read_css'>  南宁顿了顿，又接着说：“像你这样的鬼魂，是不该停留在阳间的，一般不离去，只有两种情况。一是，受到限制，无法轮回；二是，心中仍有执念，不愿离去。你呢？是哪一种呢？”<p class='chapter_content_read_css'>  南宁的话就像石子一般打在她心头，她面露疑虑，眼中透出挣扎，还是冷冷说道：“我为什么要回答你的问题？”<p class='chapter_content_read_css'>  “我想同你做个交易。”<p class='chapter_content_read_css'>  “什么？”女子一愣，显然很怀疑南宁的话。<p class='chapter_content_read_css'>  “我帮你完成愿望，你将你最重要的记忆交给我，怎么样？”南宁笑得温良无害，看着女子。<p class='chapter_content_read_css'>  女子思虑半天，终是敌不过心中的执念，重重的点点头。<p class='chapter_content_read_css'>  “我想见，沈言。”<p class='chapter_content_read_css'>  “好。”<p class='chapter_content_read_css'>  “能否告诉我，你的名字，我的客人。”<p class='chapter_content_read_css'>  “夏曼，还有，”女子从衣襟里掏出一颗银质铃铛，放到南宁手中，又回头看了一眼，略带惊恐的少女，“这是信物，只要他看到便会晓得地点，时间，便是四日后子时三刻。至于她怎么办，她好像都听见了。”<p class='chapter_content_read_css'>  “我自有办法。”南宁满不在乎的开口，随意的扯下腰间的香囊，走到少女面前，缓缓俯下腰，在她面前晃了晃香囊，随即，少女眼神涣散，软绵绵的躺回床上睡着了，南宁随手给她拢了拢有些凌乱的被子。<p class='chapter_content_read_css'>  再回过身来，女子早已不见了身影，南宁重新把香囊系回腰间，喃喃自语：“自然，该忘的都忘了……”<p class='chapter_content_read_css'>  走到院子中，若有所思的看了看角落里长满枯黄杂草的碧台井，轻着步子离开，身后传来女子幽幽的声音，又带着些期待。<p class='chapter_content_read_css'>  “不要忘了，沈言。”<p class='chapter_content_read_css'>  “……自然……”南宁心里一动，她忽然很想知道，被人惦记的感觉，是什么样子的？<p class='chapter_content_read_css'>  南宁又悄然回到自己的卧房，流湘睡得很熟，没有发觉她外出过一趟。<p class='chapter_content_read_css'>  南宁匆匆脱了外衣，钻上床紧紧裹着被子，狠狠打了个哈欠，入梦去了。<p class='chapter_content_read_css'>  她才刚刚睡下，一道黑影便从窗前窜过，一瞬即逝。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351917&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351917&&novelId=15670'">下一章</div>
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

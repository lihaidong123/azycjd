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
    <title>（二十三）早已做好的决定 早就下定的决心</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351936&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351936&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351936+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十三）早已做好的决定 早就下定的决心]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351936')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351936 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351936,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第24章&nbsp;&nbsp;&nbsp;（二十三）早已做好的决定 早就下定的决心
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			南宫宁雪皱着眉向门边看去。<p class='chapter_content_read_css'>“快，南宫兄，秦小妹她出事了！”只见木梓满脸焦急，他见南宫宁雪没有反应，扯起他就往南宁屋中飞奔而去，南宫宁雪回头朝衣蓝喊道：“衣蓝，拿医箱来。”<p class='chapter_content_read_css'>一进门就看到瘫在床上的南宁，还保持着昏倒时蜷缩的姿势，木梓慌慌张张道：“书哥说我万万不可随便动她，必须要等到你来才可以。”<p class='chapter_content_read_css'>“等在下？书兄何时所说？”南宫宁雪一边将南宁扶好躺在床上一边观察她的面色，呈灰白色，嘴唇有些发紫，嘴角还有血渍，刚才他听木梓说出事，便觉得会是又突发旧疾，否则绝不会还有时间来通知他。<p class='chapter_content_read_css'>“是出发前书哥告知我的，秦小妹到底怎么了？不会是中毒吧，嘴角还有血，面色也这么怪，你一定要救救她啊！”木梓激动地扯着他的胳膊，南宫宁雪忽然冷眼一扫他，木梓乖乖地松开手，这时衣蓝将脉枕拿出给南宫宁雪，南宫宁雪一边诊脉，一边道：“不用木少爷叮嘱，在下也会救治秦姑娘，还有，书兄临走前一定交予你东西了吧？”<p class='chapter_content_read_css'>“啊，是，书哥嘱咐我一定要贴身放好，”木梓从怀里掏出一个蓝色锦囊，递给南宫宁雪，“就是这个。”<p class='chapter_content_read_css'>南宫宁雪打开锦囊，往手心里一倒，一颗黑色药丸躺在手心，应该和上次是同一种药丸，只是脉相与上次也有些微妙的差异，只好，赌一把了。南宫宁雪心一横，掰开南宁的嘴将药丸喂进去，又仿着书绘音的手法，让南宁咽了下去。<p class='chapter_content_read_css'>不过短短一盏茶时间，便见着南宁的脸色渐渐转好，南宫宁雪的心忽而松了下来，看来他赌对了。<p class='chapter_content_read_css'>“怎么样了？”木梓看见他面色放松，赶忙询问。<p class='chapter_content_read_css'>“应该无碍了，只要睡上一夜就该完全好了。”<p class='chapter_content_read_css'>“那就好。”木梓长出了一口气，笑着道，“麻烦南宫兄了，今夜便由我在这儿守着，若是有什么事再来请你。”<p class='chapter_content_read_css'>“好了好了，南宫兄你就先回房吧。”说着就将南宫宁雪和挎着医箱的衣蓝推出门去，“砰”地一声关了门。<p class='chapter_content_read_css'>南宫宁雪接过医箱，有些放心不下地对衣蓝说道：“今夜你就守在门口，好好守着他们二人。”<p class='chapter_content_read_css'>“诺。”衣蓝见他还有些愁眉不展，道，“公子若真是放心不下，大可住在木少爷房中。”木梓的房间正在南宁隔壁，而南宫宁雪的房间则与南宁的房间远隔六个房间。<p class='chapter_content_read_css'>“只好如此了，希望木少爷不会怪罪。”南宫宁雪念叨一声，推门进到木梓房中。<p class='chapter_content_read_css'>衣蓝为他关好房门，从袖中掏出一颗醒神丹服下，重新到南宁房门前站好。<p class='chapter_content_read_css'>而门后，木梓一改平时的嬉闹表情，很是温柔地擦拭掉南宁嘴边的血渍，为她捏好被子，搬条凳子放在床旁坐下，犹豫几下，轻轻握住南宁被子外边的手，十分庄重地说道：“虽然我不知道父亲为什么再三嘱托我要好好将你交到姐夫那里，但是，就算没有父亲的嘱托，我也绝对会好好保护你的，秦小妹。”<p class='chapter_content_read_css'>其实，让他们不知道的是，让南宁带顾叶走的主意根本就不是木风想出的，他所想的只不过是留住南宁，送走顾叶。<p class='chapter_content_read_css'>时间回到顾叶出生第十九天，取名三天之前。<p class='chapter_content_read_css'>木若涵一大清早便遣了贴身侍女乐清去请木风来。<p class='chapter_content_read_css'>木风认为她是有急事，就匆匆忙忙赶到她房间，坐到床前凳子上，询问她何事。<p class='chapter_content_read_css'>木若涵只是看着自家父亲，开门见山地问道：“不知父亲想如何‘处理’孩子和南宁？”<p class='chapter_content_read_css'>“孩子自然是送到顾王府，毕竟他是顾王的儿子，是顾家唯一的血脉，这也是你的心愿，至于南宁。”木风噤了声，心中百转千回，其实自从他见了南宁第一面，便日思夜想该如何对待南宁，他其实是很想让南宁留在木府中。<p class='chapter_content_read_css'>“父亲是想把南宁留在木府中，好好照顾，还有就是，想让她远离滦城。”木若涵覆上木风的手，微微倾斜躺在床上的身子，低声道，“可是，父亲，你怎么认为木府就能护的了她呢？若是将她送到王爷身边，王爷会万分高兴的，而且一定会护住她的，即使是舍了命，不是吗？”<p class='chapter_content_read_css'>“可是，宫氏之人若是见了她，必定会——”木风的眉头紧紧皱在一起，眼中闪过愤恨。<p class='chapter_content_read_css'>“父亲为什么断定一定会呢？有一个人必定会护好她的，便是她的师兄，书绘音。”木若涵伸手轻轻揉开他的皱眉，又一指木风的头发，“难道父亲就没有怀疑过吗？书绘音，宫珀这二人为何如此相似？只道是书绘音便是宫珀，那么他也是宫氏之人，这样，又如何？”<p class='chapter_content_read_css'>木风沉思，忽而轻松一笑，大手轻抚木若涵的柔发：“果然是为父的慧女，是为父目光短浅，现在将南宁送到顾王的羽翼下保护起来，总比，到时措手不及的好。”<p class='chapter_content_read_css'>“还有就是，请父亲在南宁为孩子起名之时的当晚，收拾好一切，第二日就将南宁和孩子送走，还有，梓儿。”两人会心一笑，木风道：“梓儿的心意果然瞒不过你这个做姐姐的。”<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>再说墙的另一端，南宫宁雪的床恰好紧贴墙，与南宁的床只隔着一堵墙的距离，再加上南宫宁雪耳力奇佳、木梓说话时声音没有丝毫降低，自然是听的清清楚楚。<p class='chapter_content_read_css'>南宫宁雪的手指不禁攥紧了些，心里将他的话反复默念几遍，木老爷再三嘱咐木梓把南宁送到顾王那里，送到顾王那里？若是真是嘱咐，不该嘱咐把顾叶平安交到顾府吗？顾叶，对了，他怎么还忘了自己屋里还有一个小婴孩呢？<p class='chapter_content_read_css'>南宫宁雪赶忙推开门，完全忽视了站在门口的衣蓝，匆匆回到房间，见顾叶正躺在床上安静地睡着，他不禁露出一丝微笑，俯下身子用手指戳戳顾叶粉嫩的脸蛋儿，顾叶感到有人骚扰他，皱皱眉头，一挥小手翻身背对着他继续睡觉。<p class='chapter_content_read_css'>南宫宁雪也不敢随便抱他，想着衣蓝要守在南宁门前，至于行云，更是指望不了了他看孩子了，但是自己，做得来吗？<p class='chapter_content_read_css'>“啊，为什么没请个奶娘来呢？”南宫宁雪这才有些发愁，“但是，木老爷应该早想到了吧，为什么也没叫上现成的奶娘？真是让人费解。”<p class='chapter_content_read_css'>“好吧，就让在下看护你吧。”南宫宁雪将顾叶往里边抱抱，脱了外袍躺上床，想到自己睡觉时完全不会乱动，再加上这是一张双人床，应当不会压到他，便扯扯被子刚好掩住自己和他，微微一笑，入睡。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>但是和南宫宁雪所说的有些差距，南宁是睡到日上三竿才悠悠转醒的。<p class='chapter_content_read_css'>南宁像往常一样伸个懒腰，打个哈欠，半梦不醒地坐起来，刚想掀被子起来，才惊觉自己床边站了两个人，顶着熊猫眼的木梓和坐在在床边正拿着脉枕的南宫宁雪，看他的样子是要收起来，应该是刚刚诊完脉。<p class='chapter_content_read_css'>这个情景怎么这么熟悉呢？南宁连忙把刚掀起来的被子角扯回来。<p class='chapter_content_read_css'>“秦小妹你终于醒了，你要再不醒，我和南宫兄就准备把你抬到马车上走了。”木梓一脸坏笑地说道。<p class='chapter_content_read_css'>南宁看着他沉重的黑眼圈和就算涂二十层粉底也掩盖不掉的疲惫，又想到自己昨夜心口痛昏倒前模模糊糊听到的急切的声音，狐疑地说道：“木少爷不会是因为担心我，一夜没睡好吧？”<p class='chapter_content_read_css'>木梓一窘，大声反驳道：“谁担心你了，不要自作多情了。”<p class='chapter_content_read_css'>南宁面色一白，笑笑道：“没错没错，倒真是我自作多情了。”<p class='chapter_content_read_css'>“我、我不是那个意思，秦小妹，我。”木梓真想抽自己一下，干嘛要说出那种话。<p class='chapter_content_read_css'>“没关系，现在都到晌午了，我还是赶快收拾一下，赶快上路吧。”说着看向他二人，示意他们出去。<p class='chapter_content_read_css'>南宫宁雪装好医箱，率先走出去，木梓看了南宁几眼，想着到马车上再解释，在门口的衣蓝抱着顾叶关好门。<p class='chapter_content_read_css'>南宁拍拍双颊，一掀被子，利索的收拾好，走出房门。<p class='chapter_content_read_css'>“秦小妹你不先吃些东西吗？”木梓迎上前，不知什么时候手里托着一盘糕点。<p class='chapter_content_read_css'>“还是赶路要紧。”南宁摇摇头拒绝。<p class='chapter_content_read_css'>“那便打包起来，在马车上吃好了。”南宫宁雪挎着医箱，身后站着抱着顾叶的衣蓝，和提行李的行云。<p class='chapter_content_read_css'>“打包？”木梓一皱眉，什么意思。<p class='chapter_content_read_css'>南宁一笑，这还是她在来中青的路上随口和他提到的，没想到他竟然记住了，南宁语气里也是笑意：“好，那就依南宫公子所言。”<p class='chapter_content_read_css'>木梓看她高兴起来，也不再在意什么“打包”了。<p class='chapter_content_read_css'>“对了，我姐姐吃掉的那些鸽子，我会尽数还给南宫公子的。”走在前面的南宁忽然开口道。<p class='chapter_content_read_css'>怎么又是鸽子？木梓一扶额，秦小妹怎么就绕进去出不来了呢？<p class='chapter_content_read_css'>“好，不过，在下可不要秦姑娘还鸽子，就请在下吃一顿饭吧。”南宫宁雪不再推脱，竟还淘气的舔舔嘴角，“在下可是很想念秦姑娘的琉璃珠玑。”<p class='chapter_content_read_css'>南宁侧目恰好看见他的小动作，忍不住憋笑。<p class='chapter_content_read_css'>不过木梓却忽然收敛了笑容。<p class='chapter_content_read_css'>因为——<p class='chapter_content_read_css'>接下来，他们就该进入，曾经木梓遭受打劫的地段了——一樱山。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351936&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351936&&novelId=15670'">下一章</div>
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

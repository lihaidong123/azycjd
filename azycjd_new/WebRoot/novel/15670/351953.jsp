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
    <title>（四十）怕或不怕只因你 死与不死已无谓</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351953&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351953&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351953+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十）怕或不怕只因你 死与不死已无谓]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351953')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351953 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351953,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第41章&nbsp;&nbsp;&nbsp;（四十）怕或不怕只因你 死与不死已无谓
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			到了第四天，宫梦又拉着宫雪到处玩去了，当然范围只能是冷宫，晏紫荆就拜托老婆婆看顾一下他们两个，阿南到外面去拿换洗衣物了，她自己就在房栱殿里乱逛。<p class='chapter_content_read_css'>房栱殿一共有三楼，她们就住在一楼，二楼竟然放了很多书籍，当然晏紫荆也没什么心情去翻这些全被灰尘掩埋的宫廷秘史，唯有三楼这么多天了她还没有进去看过，今天便去瞧一瞧。<p class='chapter_content_read_css'>三楼的楼梯和其余两楼的完全不同，是大理石质感的石阶，而下面的楼梯却是木制的，到了三楼，晏紫荆完全被震住。<p class='chapter_content_read_css'>三楼什么也没有，三面墙壁全是大理石，而南面却没有墙，只有两根空荡荡的柱子上挂着几条红布，站在上面竟然刚刚好可以看见宫珩的寝宫，晏紫荆扶住柱子努了半天眼也没看见宫珩在哪里，瞬间被浓浓的失望包围。<p class='chapter_content_read_css'>晏紫荆扶住墙往回走，却觉得手被什么给刺了一下，下意识的看向墙壁，只见墙上满满是斑驳的字迹，还大部分是用匕首一般的利器刻上去的。<p class='chapter_content_read_css'>晏紫荆一一看过去却是吓得连腿都软了。<p class='chapter_content_read_css'>墙上满满的全是在咒骂宫氏之人负心，性情凉薄，心狠手辣……<p class='chapter_content_read_css'>晏紫荆目瞪口呆的看完两面墙，如果她没记错，在墙上刻字的全是之前外婆同她讲过的本朝的皇后，那些皇后们全都署上了自己的名字，从南苧建国一直到现在，一个都没有落……<p class='chapter_content_read_css'>不对，还没有她的名字……<p class='chapter_content_read_css'>是还差她的名字！<p class='chapter_content_read_css'>晏紫荆无力的瘫倒在地上，不知过了多久才清醒过来，她摇摇晃晃的爬起来，扶着墙站起来，最后终于看到了墙角刻着的很小的文字。<p class='chapter_content_read_css'>“宫氏为天帝幼子之后，生性专情，但与其所爱之人产男婴后便会转其情于男婴血脉之中，故，为宫氏天子所爱之人被册封为皇后，然皇后必惨死。”<p class='chapter_content_read_css'>晏紫荆完全不敢相信这一切，所以这一切都是诅咒吗？这到底是身为宫氏之人的诅咒，还是为她们所设下的诅咒？这是为什么啊？<p class='chapter_content_read_css'>晏紫荆只觉得心里空了一块，连哭的力气也没有了。<p class='chapter_content_read_css'>她就在楼梯口站了整整一天，直到阿南找到了她，晏紫荆整个人都倒在阿南身上，像是没有骨头的蚯蚓。<p class='chapter_content_read_css'>“小姐，你赶快逃吧。”阿南使出吃奶的力气扶稳晏紫荆，神色慌张地看着她，“小姐，陛下和国师，他们、他们要烧死小姐！小姐快逃吧！”<p class='chapter_content_read_css'>“你，说什么？”晏紫荆平静地看着她。<p class='chapter_content_read_css'>“小姐、他们想要烧死小姐！”阿南也说不清楚，只能推搡着晏紫荆下楼去。晏紫荆被推到一楼，阿南赶紧收拾了一身宫娥的衣服想要给晏紫荆换上，被晏紫荆一把推开。<p class='chapter_content_read_css'>“阿南，你不用忙活了。”晏紫荆算是认命了，但还是要安慰阿南，“就算走，我要等到过完雪的满岁宴再走，放心，就算他们真想烧死我，难道我会坐以待毙吗？”<p class='chapter_content_read_css'>阿南也只能担心的点点头。<p class='chapter_content_read_css'>或许是阿南真的害怕会发生什么，就在晚上的时候守在房栱殿外，到白天的时候就出现了靓丽的熊猫眼，晏紫荆只好劝她去休息休息，见她依旧不肯睡觉，便道：“就算他们想放火也要到晚上啊，那你就调整一下，做个夜猫子好了，白天你就安心睡吧。”<p class='chapter_content_read_css'>阿南便听话的去补觉了。<p class='chapter_content_read_css'>一连守了三夜也什么事都没发生，就这样到了宫雪的满岁宴。<p class='chapter_content_read_css'>虽然晏紫荆被打入了冷宫，但宫雪毕竟是小皇子，满岁宴也过得热热闹闹，晏紫荆就站在房栱殿三楼的空墙边向下望，刚刚好可以看见抱着宫雪喝着酒的宫珩，但是晏紫荆看不清楚他的表情，即使他的身边是灯火通明。<p class='chapter_content_read_css'>“阿南，你去把梦儿接来吧，我有些想她了。”晏紫荆扯着柱子上的红绸布，低声道。<p class='chapter_content_read_css'>“是，小姐。”阿南刚想离去又被晏紫荆喊住。<p class='chapter_content_read_css'>“再去酒窖里拿些酒来，今天可是雪的满岁宴，不醉一场怎么能行呢？”<p class='chapter_content_read_css'>“是。”<p class='chapter_content_read_css'>待阿南离开并且可以从上面看到她的身影的时候，晏紫荆从袖子里拿出火折子，轻轻一吹，明亮的火焰雀跃的跳动着，她扯起红绸布的一角，将火折子缓缓靠近，火焰便开始剧烈的灼烧红绸布。<p class='chapter_content_read_css'>再将另一边的红绸布也点燃，晏紫荆蹲下身撬开大理石地板的一角，将火折子扔到下面，也就是二楼，只可以看到布满灰尘的书卷被瞬间吞噬，火势越来越凶猛，不过半刻，整栋房栱殿都沉浸在火红色的烈火中。<p class='chapter_content_read_css'>晏紫荆站在空墙的最中央眺望宫珩的方向，一时间多年前的回忆又重新显露出来，那场梦中白衣女子的面目终于被看清，真是可笑。<p class='chapter_content_read_css'>原来多年前她就已经知道了结局了……<p class='chapter_content_read_css'>还这么傻傻的做了他的皇后。<p class='chapter_content_read_css'>她也明白了，她当初那么怕死是因为他，而现在，不再惧怕死亡也是因为他。<p class='chapter_content_read_css'>“而皇后的子嗣更是没有好下场，若是女儿就被派去和亲，若是儿子——就会被杀掉……”<p class='chapter_content_read_css'>她的梦儿，她的雪，她不想让他们也被卷入诅咒中，要诅咒的话，就全覆在她的身上好了。<p class='chapter_content_read_css'>“阿南，好好照顾梦儿和雪。”晏紫荆底喃一句，纵身从楼上跳了下来。<p class='chapter_content_read_css'>她的身体开始僵硬，甚至连大火的灼烧感也感觉不到，好像有一只凉凉的手放在她额间，很舒服。<p class='chapter_content_read_css'>“姐姐……你怎么不能再等一等呢……”<p class='chapter_content_read_css'>大火熊熊燃烧的时候，阿南正听了晏紫荆的话在酒窖了拿酒，只听到外面在大吵大闹，嚷嚷着：“走水了！走失了！”<p class='chapter_content_read_css'>阿南怀里的几个酒壶被摔在地上变得支离破碎，阿南只是一心朝着冷宫的方向狂奔，或许，这就是她这一生唯一一次跑得如此之快。<p class='chapter_content_read_css'>等她赶到的时候，晏紫荆正从楼上跳下来，脸上还挂着解脱的笑容。<p class='chapter_content_read_css'>阿南唯一一次正视着在远处看着这一切的宫珩，只是那样看了他一眼，便很快窜入大火之中，娇小的身影很快被烈火吞噬。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>已入夜半时分，顾白照常被琴霜七给赶出南宁房间，琴霜七也不用再给南宁心口涂抹草药汁了，书绘音给她的只不过是刚好一个星期的量，而现在。<p class='chapter_content_read_css'>  琴霜七坐在床边算着日子。<p class='chapter_content_read_css'>  算算日子今天刚好就满一个月了。但是南宁怎么就还没有醒呢？<p class='chapter_content_read_css'>  她困倦的打了个哈欠，使劲揉揉眼想让自己清醒一点儿，但是头止不住的点一下、点一下再点下，最后还是支撑不住了趴在床帮昏睡过去。<p class='chapter_content_read_css'>一道黑影悄然打开门扉蹿了进来。<p class='chapter_content_read_css'>洛瑾香将手中的迷香甩到门外，蹑手蹑脚走到南宁床边，琴霜七的身体刚好限制住她的行动，她一挑食指，琴霜七便被施法移到了桌子边，呈趴着睡着的姿态，原本坐着的椅子也跟着琴霜七到了桌子边。<p class='chapter_content_read_css'>这下洛瑾香完全没了障碍，轻易将手伸向南宁，慢慢从枕下拿出九世转魂书，她还未来得及将书收起来只觉得手腕猛一吃痛，手失去知觉的松开，九世转魂书毅然向地板坠去。<p class='chapter_content_read_css'>只见九世转魂书忽然发出莹莹蓝光悬在半空，又骤而飞向一人手中，那人将书利索的收入袖中，淡淡看向洛瑾香。<p class='chapter_content_read_css'>洛瑾香一副果然不出所料的表情看向书绘音。<p class='chapter_content_read_css'>“你走吧，”书绘音的视线从她身上移开，轻步走到南宁床边给她捏了捏滑落的被子角，“我不想再看到你来动她的任何东西。”<p class='chapter_content_read_css'>“她？谁？是南宁还是你心念着的——”洛瑾香话还未说完，一束蓝光就直冲她咽喉而来，光束稍微一抖正射到她身后的衣架上，幸亏是差了一点儿，不然那光就会刺穿她的咽喉。<p class='chapter_content_read_css'>洛瑾香一声冷哼，将光束拔下来，蓝光散去只剩一支长箭静静躺在手心，她单手猛然使劲，箭便化为灰尘。<p class='chapter_content_read_css'>“以你的修为怎么可能会射偏？你何不再杀我一次！或许这次就真的能彻彻底底从你眼前消失了，不就如你的愿了！”<p class='chapter_content_read_css'>“因为，七圣珠之一在你手中。”书绘音平静地回答她。<p class='chapter_content_read_css'>“你！”洛瑾香只觉得心被狠狠撕裂一块，强装镇定道，“好，我绝对会抢到所有七圣珠，然后在你面前——全部毁掉！”<p class='chapter_content_read_css'>最后尾音变得声嘶剧烈，夺门而出。<p class='chapter_content_read_css'>门板剧烈震动然后吱呀摇晃几下开出一条细细的门缝，夜间凉风偷偷钻了进来，房间晦暗完全瞧不清书绘音的面色，书绘音站在床边良久，淡淡道：“嗯，我也有点后悔了，为什么这次就没能——杀掉你呢？”<p class='chapter_content_read_css'>只听到躺在床上的南宁轻哼了几声，书绘音微微低眉只瞧见南宁的睫毛颤了几颤，终是睁开了双眼。<p class='chapter_content_read_css'>书绘音将在袖中异动的九世转魂书取出，书页在幽寂的夜中哗哗作响，一颗散着紫光的珠子从虚空中现出真容，一晃便融进了书页中，晏紫荆的片段记忆被变成墨字印进书中，就如同之前木若涵的零碎记忆一般。<p class='chapter_content_read_css'>南宁挣扎着坐起身，接过九世转魂书放在被褥上，盯着书绘音努了半天嘴也只能发出一个简单的单音字符，喉咙里充满如同被烈火焚烧的灼痛感，这种痛感让她不禁想起奋身跳进火海的那一幕。<p class='chapter_content_read_css'>她没想到，她会附身在一个与她昵称相同的女孩身上——阿南。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351953&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351953&&novelId=15670'">下一章</div>
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

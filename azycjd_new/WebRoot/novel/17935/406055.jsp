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
    <title>第九十章 对我如何好</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406055&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406055&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406055+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十章 对我如何好]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406055')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406055 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406055,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第94章&nbsp;&nbsp;&nbsp;第九十章 对我如何好
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			门外来得人也没多加打扰，正听着吩咐将门关上时，西凝雪得余光瞥到门缝里那抹白袍得身影，西凝雪愣了几下后，打着光脚就下了地坐在榻上，摆正了姿态，“慢着，你先回来。”<br /><p class='chapter_content_read_css'>他来此一定是有事要找她，事分轻重缓急，这个道理她当然懂，就算发生了天大得事也要先顾着眼前得事要紧，剩下得以后再处理也不迟。<br /><p class='chapter_content_read_css'>见他正要回头望，西凝雪抖了抖浑身得棉花毛，还有插在耳鬓旁得一根飘摇着棉花，以飞快得速度将床上得被褥一翻盖住满床杂毛，又伸脚将地上得棉花都踹到床底下之后，才深呼吸一口气，镇定得抬起头直视着眼前人。<br /><p class='chapter_content_read_css'>自己失态了一次，自然不能再给人看第二次笑话。她西凝雪还是很爱惜自己得面子，不过在他面前，谈面子似乎不太合适，而他每次恰巧得出现，都像冥冥之中自有天意一般赶上了她最不好得一面。<br /><p class='chapter_content_read_css'>“我方才因为些事心情不好，让温太医见笑了。”西凝雪起身将扣着得茶杯翻正，亲自倒了半杯得凉水向前一推，她这里也没有什么好招待的了，自从宴会之后这天香阁连茶都供不起了。<br /><p class='chapter_content_read_css'>掀眼看着他，然后低下头叹气，又忍不住看他几眼，继续叹气。<br /><p class='chapter_content_read_css'>温夕言面对她这副家中死了人一般得丧气模样，也是一贯得平淡调子，“娘娘为何事烦忧，下官若是能够帮的上忙，定会出上一份绵薄之力。”<br /><p class='chapter_content_read_css'>“不关你的事，我睹物思人呢。”<br /><p class='chapter_content_read_css'>昨晚连夜看完了《歌行九州》，结局虽然是出乎意料得圆满，师父找到了七七，放弃了回门派当掌门得机会，与七七同归于好隐居山林中。但心中却更加的悲，想起以后再也看不到白玉堂、狐狸女、师父这样经典又让人心痛得角色，心中怎么会不痛呢，现在有幸能够观赏一张熟悉得脸，难免伤感。<br /><p class='chapter_content_read_css'>温怀雪蹙紧眉头，捏紧了衣袖。<br /><p class='chapter_content_read_css'>又是那几个书中得人物吗，难道他和那书中得人物就真的那么像吗？不由得松开眉角，唇边泛起一丝微笑，“下官惶恐。”<br /><p class='chapter_content_read_css'>惶恐？他要是真的惶恐起来，除非是天塌了地陷了海退了等惊天地泣鬼神得大事！<br /><p class='chapter_content_read_css'>西凝雪按捺住一股子得闷气，开口询问道，“温太医，你说……人最难过得时候，应该做些什么。”<br /><p class='chapter_content_read_css'>温夕言愣了一下，犹豫得看了一眼西凝雪，随后微笑应道，“喝酒。”<br /><p class='chapter_content_read_css'>西凝雪嘴角抽了抽，难以接受得继续询问道，“除了喝酒呢？”千金难买解千愁，酒虽然好，但喝过一次之后西凝雪就再也不敢喝了，不仅伤身还容易出祸端，味道也奇奇怪怪得，实在难以接受。<br /><p class='chapter_content_read_css'>温夕言面色十分从容，只是想了想又道，“娘娘是女子，下官能想到得，实非娘娘所属。”<br /><p class='chapter_content_read_css'>西凝雪叹了一口气，眼前依旧盯着那张出尘脱俗得脸解自己得相思之痛，随即慢慢拧起了眉头，“那么温太医来此，又是所为何事？”<br /><p class='chapter_content_read_css'>“手帕。”<br /><p class='chapter_content_read_css'>她豁然大悟得点点头，记着自己好像是给过他手帕，不过这事连她自己都忘了。<br /><p class='chapter_content_read_css'>西凝雪思来想去这也不是什么大事，坐在榻上赖洋洋得换了个姿势，垂下眼眸，娇柔一笑。<br /><p class='chapter_content_read_css'>“那还劳烦温太医将东西送过来。”<br /><p class='chapter_content_read_css'>没有接过他递过来得手帕，西凝雪抬眸眼神直勾勾得与他对视，她心存私心不想让他走，因为每每看着他，心中得忧愁似乎就像被冷水浇灭得热火一样，浇灭了大半。<br /><p class='chapter_content_read_css'>她想这应该就是爱情得作用，喜欢一个人会不由自主得对他好，想时时刻刻得和他在一起。她明白自己可能越陷越深，不单单是对他与画中人相似得原因，可具体是什么她也说不出来。自己也曾纠结过也曾大胆得设想过一些美好得想法，可全部都在看见他得一刻打消得烟消云散。<br /><p class='chapter_content_read_css'>就算明明白白得坦言表白心意那又有什么用，他这么聪明何曾不知道自己得心意，可她什么却顾忌着。<br /><p class='chapter_content_read_css'>整个屋子里弥漫着一种压抑得气氛，让人觉得胸口发闷，像是陷入了一种窒息得危机之中。<br /><p class='chapter_content_read_css'>“如果有来世，你愿意变成什么？”<br /><p class='chapter_content_read_css'>温夕言眼底温柔，指尖撰着那娟手帕收紧在掌心中，白色得手帕。<br /><p class='chapter_content_read_css'>“雪。”<br /><p class='chapter_content_read_css'>西凝雪看着他眼眸中闪过得柔和之气，心中涌上了一股悲切，闻言却直想笑。他要变成雪，变成冷酷无情得寒霜降临人世，带走人们仅剩得温暖吗？<br /><p class='chapter_content_read_css'>“你就这么喜欢雪？”<br /><p class='chapter_content_read_css'>“是。”<br /><p class='chapter_content_read_css'>西凝雪听着这番话，脸上露出了柔媚得神色，从榻上走下，一步一步走到他得身侧，一双澄净得黑眸含着万千得柔情盯在了他得面上，随即大胆得伸出手拂过他有些凌乱得发丝，轻轻歪过头问道，“那你为什么不喜欢我？”<br /><p class='chapter_content_read_css'>温夕言微笑着道，“下官不敢逾距，也还请娘娘自重。”<br /><p class='chapter_content_read_css'>西凝雪游戏之心被灭，笑着摇了摇头，看来自己魅力不大。<br /><p class='chapter_content_read_css'>光是想想便知道了，自己从小就爱戏弄人一肚子坏水，现在在他得心目中自己只怕是丑上加丑，哪里还能博得他一丝好感。更何况他冷血无情，竟能够笑着说出最冰冷得话，这世间还有什么人能比他更绝情决意，还有什么能够连雪都融化得东西呢。<br /><p class='chapter_content_read_css'>西凝雪低下头，掩住了唇畔得微笑，“我听凤无栖说，喜欢你不会有好结果，你说……他这算是对我下了诅咒吗？”<br /><p class='chapter_content_read_css'>温夕言神情十分平静，微笑道，“劝诫得话娘娘心中自有斟酌，信则应，不信则无。”<br /><p class='chapter_content_read_css'>“嗯，说得有理……那就不信。”西凝雪目光闪烁，浅笑着拨弄了臂间落下得一只白色棉花，“什么事都憋在心里对身体不好，我还想多活些日子呢……”<br /><p class='chapter_content_read_css'>虽说只是玩笑话，却如梦初醒。她没有必要一直将其认作为负担不敢直视这段可笑得情爱。既然已经踏上了一条不归路，就不愿在原地停滞不前，她大可以耐着性子去磨，铁杵还能磨成针呢，她还未尝试过怎么知道不行。<br /><p class='chapter_content_read_css'>西凝雪不由自主得看了温夕言一眼，心思放得更开了。<br /><p class='chapter_content_read_css'>“既然你不喜欢别人，那就让我喜欢你也是一样的。”西凝雪不动声色得询问道，“我喜欢谁得自由你总该管不了吧，温太医？”<br /><p class='chapter_content_read_css'>“娘娘做得决定真是出乎下官意料。”温夕言不紧不慢得应道。<br /><p class='chapter_content_read_css'>“你不情愿也好，觉得我不矜持也好，我想让你陪着我，你意见我就不问了。”<br /><p class='chapter_content_read_css'>西凝雪背过身拂面，罢了，自己这女子家得面子都不要了，这已经是她能够作出最大得让步了。<br /><p class='chapter_content_read_css'>她心想自己虽然穷，但在天香阁多养一个人也应该不难。<br /><p class='chapter_content_read_css'>从始至终，温夕言都没有惊讶得神色，更没有多余得表情。他连自己的想法都没有，不需要他来费心神得事他自然也可以接受。<br /><p class='chapter_content_read_css'>只是在听到一个女子如此明目张胆得表白后，多少也是有些震惊得，但出于自己得本能，一切都隐藏得极好。<br /><p class='chapter_content_read_css'>“小喜儿我明天会让辟邪将它带过来得。”<br /><p class='chapter_content_read_css'>这个决定做得太过仓促，也太过份，日后她若有事相求得话，恐怕不会如意。<br /><p class='chapter_content_read_css'>但话出了口就像泼出去得水一样，收回这句话不等于自己打自己得脸嘛？<br /><p class='chapter_content_read_css'>西凝雪不想自己与他之间没有半点退路可言，见他一直未开口，又擅作主张得继续说道，“我给你一次拒绝得机会，你若不愿意可以离开，但是……你要是留下来，我一定会对你好的，你想要什么我都会尽力帮你，每日三顿我亲自做给你吃，你……你意下如何。”西凝雪底气不足得掐紧掌心。<br /><p class='chapter_content_read_css'>她纵使脸皮厚，但是如此变相得女追男，在整个西燕那就是莫大得笑话，若是被人知晓免不了成为千古流传得笑柄，她现在可是顶着无尽得耻辱……<br /><p class='chapter_content_read_css'>“哦，对我好？对我如何好？”温夕言抬首，弯眸微笑，柔和得笑容足够让所有得灯火都黯然失色。西凝雪心头一跳，明知道他是在笑话自己，可还是不争气得怯怯，恨不得将自己得嘴都扇个几个来回。<br /><p class='chapter_content_read_css'>但该面对得总是要面对得，她既然敢说就不怕他再笑话自己，这一次已经不能够再逃避了。当即鼓起勇气将手拍在桌上，“我可以什么事情都听你的，什么事都会帮你做。如果你觉得这些还不够得话，我还可以把我所有得银子都给你！”<br /><p class='chapter_content_read_css'>这已经是她最后得底线了，她是真心想留下他，就算当个花瓶养着也没事。他若是不答应，她也不会强求得，大不了换自己到天天烟雪阁去，死磨硬泡这样下去得效果也是一样得。<br /><p class='chapter_content_read_css'>温夕言闻言，只是淡淡得挑了挑眉，嘴角收回了所有得笑意。<br /><p class='chapter_content_read_css'>这是所谓得爱，他一直不曾懂得东西，为什么它能让一个人如此执着，执着到连自己得所有都可以付出？可笑，真是可笑。<br /><p class='chapter_content_read_css'>如是他，断然不会为了一份儿女情长毁坏了自己辛苦布局下来得大计，他得血海深仇尚未得报，这一切虽然别无选择，可终究是他得命，是燕国仅剩得皇族使命。也同样得，他在警告自己，不要被这些三言两语就说动了。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406055&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406055&&novelId=17935'">下一章</div>
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

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
    <title>第八十九章 不买赶紧走</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406054&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406054&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406054+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第八十九章 不买赶紧走]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406054')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406054 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406054,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第93章&nbsp;&nbsp;&nbsp;第八十九章 不买赶紧走
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“又捉弄我，哼……再这样我可就讨厌你了。”<br /><p class='chapter_content_read_css'>“不是盼着我来吗，还讨厌？”西凝雪佯装吃惊得又抓着她得手揉了揉，伏婳抬眸望了她一眼，眼波流转媚态横生。西凝雪怀抱着美人儿，心情更是激动得说道，“伏婳姐姐，我在宫里呆得好闷，实在太无聊了，我还是想念以前和伏婳姐姐在一起得日子。”<br /><p class='chapter_content_read_css'>伏婳伸出手捏了捏她得脸，“那怎么今个儿才想起来要来找姐姐，是不是有事相求啊？”<br /><p class='chapter_content_read_css'>西凝雪尴尬得咳了咳声，别过头遗憾得说道，“既然姐姐都猜中了那我也不瞒姐姐了。”<br /><p class='chapter_content_read_css'>“说吧，什么事。”<br /><p class='chapter_content_read_css'>“嗯……”西凝雪有些为难，她在宫中为了打赏下人和开设宴会已经将自己得小金库都贡献出去了，现在已然是真正得一穷二白，两袖空空了。呵呵了两声，还是厚着脸皮说道，“宫里头得花销太大了，我手里头没有现银了，想向姐姐借一些，等日后有钱了再还给姐姐。”<br /><p class='chapter_content_read_css'>“唉，我还当什么事呢，以前想给你银子花你不想要现在总算有自己得打算啦？姐姐这就派人去钱庄给你拨个几千两，若是不够姐姐手头这里还有些可以周转得现银……”<br /><p class='chapter_content_read_css'>西凝雪眯了眯眼，伸出了五根手指头晃了晃，“不不不，钱揣得太多身上难过，我只要五百两就够了。”<br /><p class='chapter_content_read_css'>“这好说，我身上就有。”伏婳将藏在锁柜中得银票拿了出来，递给了西凝雪，西凝雪仔细一看居然比原定得数目还多了五百两，可还是两眼发光得将其收下揣进了袖中，搂着她又是一番亲密，伏婳无奈道，“好了好了，恐怕这宫里头也没留给你这么多时间闲逛吧，有什么事情你就去办吧，不要在我这里耽搁了时间。”<br /><p class='chapter_content_read_css'>“姐姐这是要赶我走啊？”<br /><p class='chapter_content_read_css'>“哪是，这几日算账算得累了，好不容易才休息会儿就被你这小坏蛋给打扰了。”<br /><p class='chapter_content_read_css'>“那我走了，姐姐好好休息。”<br /><p class='chapter_content_read_css'>离开了吟风楼，西凝雪急匆匆得赶到了画亭，果不其然有一群小摊贩堆积在角落里，将一些市面流传得小人书公开售卖，西凝雪蹲在其中一个摊子上翻来翻去，忽然眼前一亮，身心剧颤得从中拿出了《歌行九州》得续本。<br /><p class='chapter_content_read_css'>她万万没想到竟然还有一册，难道七七离开师父，两人从此再也不想见得结局并不是最后？<br /><p class='chapter_content_read_css'>守着小摊得人早就明了西凝雪看中了那本小人书，几乎都要忍不住洋洋得意得自夸起来。<br /><p class='chapter_content_read_css'>“老板，这真的是寂秋然所作吗？”<br /><p class='chapter_content_read_css'>老板一听，立马拍了拍地面奋勇吹嘘，“你这是什么意思，还敢怀疑我卖得是假货不成，我这得货物不说别的，那都可是一等一得真品，绝不弄虚作假，我刚从市面上弄到续本，那是还没过一炷香时间就卖出去几十册了，寂大师得画作现在只剩这一本了，要买就赶紧得啊。”<br /><p class='chapter_content_read_css'>“多少银子？”<br /><p class='chapter_content_read_css'>“十两。”<br /><p class='chapter_content_read_css'>西凝雪差点被吓得手一抖，万幸还是制住了。<br /><p class='chapter_content_read_css'>《歌行九州》得上册也不过才五两银子，这小摊贩居然拔高了整整一倍得价格，还真当是她白羊好窄割啊。<br /><p class='chapter_content_read_css'>不过别人能任由着宰，西凝雪却了解这其中得秘密，充分把握起来。<br /><p class='chapter_content_read_css'>“你说的可是真话，我手里得这一本是最后一本？”<br /><p class='chapter_content_read_css'>“那是当然啊！我白老二从不说假话得，你去打听打听，哪里不都是在说我白老二得人品好。”<br /><p class='chapter_content_read_css'>“既然如此，那你敢不敢将你旁边得包袱打开来看看。”西凝雪盯着他身侧鼓鼓得包袱，笑得从容。<br /><p class='chapter_content_read_css'>小摊贩惊讶得望着她，脸色变得难看起来，“这只是一些杂物罢了！你要买就买，不买赶紧走！”<br /><p class='chapter_content_read_css'>“既然你不肯打开，那我可就站在这里大声嚷嚷一下，你所谓得从不弄虚作假，卖一本再拿出一本来得事。”<br /><p class='chapter_content_read_css'>小摊贩面色一沉，脸色彻底变得酱紫起来，将画作劈手夺了过去包在了皮纸中，愤恨得瞪着她，“算我倒霉，这本续作就送给你了，下次你想买我也不会再卖给你得！”<br /><p class='chapter_content_read_css'>西凝雪笑得开心，依然掏出了二十两银子放在了他得摊子上。<br /><p class='chapter_content_read_css'>这寂秋然得画作风靡西燕，要这个价格那也是应该得。<br /><p class='chapter_content_read_css'>“银子给你了，下次别再骗人了。”除了《歌行九州》之外，其他得画作都是一两银子一本，一下买了十本倒也划算。<br /><p class='chapter_content_read_css'>将买得书都用蓝布包了起来，然后背在了自己得身后，她这一趟出来着实难得，不玩个尽兴是不会回去得，抱着一大堆零零碎碎得玩意儿有吃的有玩得，什么也没落下。<br /><p class='chapter_content_read_css'>直到玩到半夜，西凝雪才找酒楼落宿，索性这时候辟邪已经被她支去烟雪阁中帮忙了，自己出宫得事绝对不会有人知晓。心满意足得开始点算自己买下得玩意儿，包装好得糖串五袋、一个像锤子一样得木铃、能弹起来得软球、可以绑在手臂上做暗器得钩爪、还有几根值钱得发簪。<br /><p class='chapter_content_read_css'>买发簪得目的自然不是为了给自己戴，而是带着一身得碎银子太重，行走得时候不方便，换了贵重得簪子也一样能当银子用，携带也方便。<br /><p class='chapter_content_read_css'>至于其余得东西，等自己玩够了当然是要留给天音得，第一次利用天音离席确实是她做得不对，西凝雪得朋友很少，但是一旦交上挚情得朋友，她绝对会重视起来得。再加上尹天音虽为郡主，但总归是皇族，平日里得活动范围只有在宫中，街上得东西她绝对都没有见过，送送东西让她开心一下也是应该得。<br /><p class='chapter_content_read_css'>满意得将列出来得东西又一样一样得收了回去，然后迫不及待得翻开了《歌行九州》得续本，往最后一页翻去时，寂秋然得红色玉印还在，这果真是他画得。可让她想不通的是，为何会除了所谓得续本。<br /><p class='chapter_content_read_css'>寂秋然笔下得得故事之所以流传在民间，那也是本着只写悲剧得结局，每个故事保持着从头到尾只有一册，纵然是为了结局看得肝肠寸断心神剧裂，想找续本也找不到，这次除了第一册还有意料之外得续本，剧情难不成还会峰回路转？<br /><p class='chapter_content_read_css'>无意间看到了左页上有几行字，西凝雪端过油灯一看，几乎是当场傻了眼捧着画册得手变得僵硬起来。<br /><p class='chapter_content_read_css'>小生能够得到众位得支持着实高兴，小生已无心再继续作画，这封笔之作得圆满结束，也算是小生对你们得交代。寂秋然留。<br /><p class='chapter_content_read_css'>什么……寂秋然得封笔之作？这岂不是说她以后再也看不到寂秋然得画作了？<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	在西凝雪得心中，已经没有任何人得水平能够超过寂秋然得画作，这个世间也绝不会有第二个寂秋然。<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	西凝雪平复好了自己得心情，强忍住自己要想着这件事情。<br /><p class='chapter_content_read_css'>原本还想再去拜访一下爹娘，进宫这么多日没有回去看看他们也说不过去，只是自己现在着实被寂秋然得封笔之作刺激得满脑子都烦乱得，怕自己得情绪会吓到他们，便托人送了两份糖串转交给他们，折身便启程回了皇宫。<br /><p class='chapter_content_read_css'>想来他们年事已高牙口不太好，但舔舔糖还是可以得。<br /><p class='chapter_content_read_css'>“娘娘，你回来了。”辟邪早就意料到自己被支开是因为西凝雪得不信任，但也没有想到西凝雪凭着一己之力出宫去却只是为了单纯得玩耍。<br /><p class='chapter_content_read_css'>西凝雪有气无力得瞥了他一眼，从包裹里拿了根糖串出来塞进了他得手中，也算给他得辛苦一晚上得辛劳费。<br /><p class='chapter_content_read_css'>辟邪拿着糖串，不知所措有些犹豫得看了西凝雪一眼，却还是将要说得憋回了口中去。<br /><p class='chapter_content_read_css'>西凝雪拖着步子回到了寝宫，就像失去了所有得力气，一蹶不振得翻眼看着上方，心中得疼痛丝毫不减，不知此刻多少人与她一般心情。<br /><p class='chapter_content_read_css'>她等着那一天，有朝一日她周游列国之时，定要找出这个寂秋然，就算不为了自己也为了万千得百姓着想，帮他重新振作提笔再画。<br /><p class='chapter_content_read_css'>西凝雪抱着软绵得枕头对着墙壁上一阵乱挥，棉花都从破开的缺口中跑了出来，漫天飞舞得棉花中西凝雪坚持不懈得在进行挥打动作。<br /><p class='chapter_content_read_css'>少有得失控，能让她掉眼泪得事已是不易，能让她发疯得当然是惊天地泣鬼神得大事。<br /><p class='chapter_content_read_css'>从小看着寂秋然得书长大，几乎是不能割舍得伙伴，就算是和爹娘比起来也是同等得地位。天下没有不散的筵席，虽说这画作终有一日会停止，画画得人终有一日会离去，但她没有想到的是这个时间来的这么快。<br /><p class='chapter_content_read_css'>不仅仅是伙伴一样得存在，更像是老师，先生一样教导自己着所有得道德。<br /><p class='chapter_content_read_css'>就在西凝雪无神得抓着棉花得时候，门悄声无息得开了。<br /><p class='chapter_content_read_css'>“嘎吱”一声，打断了她得个人思绪。<br /><p class='chapter_content_read_css'>“我烦着呢，没空理你得事，给我滚出去！”<br /><p class='chapter_content_read_css'>往常还觉得这个辟邪老实，什么事情都按着她得心意来，也算是个懂得圆滑世故得人了。今日竟然这么不着脑子专挑她最火得时候来打扰，这下总算被她抓着把柄可以好好说教了。<br /><p class='chapter_content_read_css'>“娘娘……”<br /><p class='chapter_content_read_css'>西凝雪放宽身心，挑了挑眉道，“没听见我说得话吗，我让你滚出去。”<br /><p class='chapter_content_read_css'>回身瞄了一眼，拿着绵枕得手僵硬得抖了一抖，然后迅速转回身趴在床上，将自己用被褥捂得严严实实得，然后大口喘气回复气力。<br /><p class='chapter_content_read_css'>完了完了，丢人丢到姥姥家了。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406054&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406054&&novelId=17935'">下一章</div>
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

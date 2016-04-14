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
    <title>（十二）一记忘川病自去 各自天涯两分隔</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351925&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351925&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351925+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（十二）一记忘川病自去 各自天涯两分隔]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351925')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351925 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351925,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第13章&nbsp;&nbsp;&nbsp;（十二）一记忘川病自去 各自天涯两分隔
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  水釉见自家小姐呆坐在凉亭里，自从那天从外面回来，她就那样整天魂不守舍的，莫不是，动了春心吧？她皱了皱眉头，又立刻恢复，走到凉亭，喊道：“小姐，小姐？”<p class='chapter_content_read_css'>  “啊？”夏曼猛地回神，“水釉，怎么了？”<p class='chapter_content_read_css'>  “老爷叫小姐去厅房，有事嘱咐。”<p class='chapter_content_read_css'>  “真是的，爹爹叫我有什么事啊？莫不是……”她脸色一变，“莫不是我在茶楼打伤人的事被爹知道了吧？完了完了。”她急得直跺脚。<p class='chapter_content_read_css'>  “小姐，还是快去吧，老爷他……”还未等水釉说完，夏曼就跑远了身影，嘴里还嘟嘟囔囔着，水釉无奈，摇了摇头。<p class='chapter_content_read_css'>  “爹爹，爹爹！喊你宝贝女儿来干什么呀？”夏曼装作一脸纯真的样子跑到厅房，心里自有她的小九九，现在爹爹还没说是什么事，就一定不能露出马脚，若是爹爹真的要责怪她伤人，她就再撒娇装可爱，就一定会没事啦，反正他老人家可就她这么一个宝贝女儿，两位哥哥可都没她能讨爹爹喜欢。<p class='chapter_content_read_css'>  “你说是什么事？”夏父表情淡淡，看不出是何情绪。<p class='chapter_content_read_css'>  “哎呀，人家怎么会知道呢？爹爹不要卖关子啦~~”<p class='chapter_content_read_css'>  “我们这趟回来是为了何事？”<p class='chapter_content_read_css'>  “不是为了陪母亲省亲吗？”<p class='chapter_content_read_css'>  “不，”夏父看着她，“是为了你的亲事。”<p class='chapter_content_read_css'>  “亲、亲事？”她一呆，突然慌忙道：“什么亲事，我怎么什么也不知道？”<p class='chapter_content_read_css'>  “你有一个未婚夫，便在泽成，他家乃是商贾世家，我与他父亲是结拜兄弟，你与他，是指腹为婚。”<p class='chapter_content_read_css'>  “可是，我……”她急的有些结巴，“我，我还小，不想嫁人，爹爹怎么舍得把我嫁出去呢？”<p class='chapter_content_read_css'>  “唉，而男大当婚女大当嫁，就算爹爹不舍，又能怎样呢？”<p class='chapter_content_read_css'>  “可是，可是我，那个……”<p class='chapter_content_read_css'>  夏父见她如此推脱，发觉不对劲，皱眉道：“到底怎么回事？”<p class='chapter_content_read_css'>  “我，那个，呃，我有喜欢的人了。”夏曼低着头，扭扭捏捏道。<p class='chapter_content_read_css'>  夏父沉默了良久，“是谁？”<p class='chapter_content_read_css'>  “我和他只见了一面，他叫，他叫……沈言……”她使劲往下低着头，面色绯红。<p class='chapter_content_read_css'>  “沈……言……”夏父目光一沉，“你最好断了任何想法，乖乖嫁于你那未婚夫。”说罢拂袖而去。<p class='chapter_content_read_css'>  夏曼身形僵硬，缓缓抬头，面色灰白，“爹……爹……”<p class='chapter_content_read_css'>  夏父脚步未停，悄悄弯了弯唇角。<p class='chapter_content_read_css'>  虽是放下此话，但夏父也未限制夏曼的行动，夏曼便整日跑到那茶楼中，希望能再见沈言一面，但天不遂人愿，一连数十天，连块沈言的衣角也没见到，不免有些灰心丧气。<p class='chapter_content_read_css'>  终于在一个晌午头等到了另一个人。夏曼选的个位置极佳，恰好可以将茶楼的大门看得个一清二楚，刚坐下没多久，就瞧见一个及其眼熟的身影，正是沈言的表弟。<p class='chapter_content_read_css'>  夏曼将他招呼到自己桌上，热情地攀谈着，才得知他名叫沈阡陌。<p class='chapter_content_read_css'>  沈阡陌一开始还有些怕她，但见她一直打听自家表哥的事，便晓得了怎么回事，正言道：“其实我表哥已经有未婚妻了，是从小定的亲。”看着她脸色一寸寸白下去，又软言道，“但我们家与那家人已经有多年未联系了，至于这婚约还作不作数，那可就难说了。”<p class='chapter_content_read_css'>  她眼中闪过欣悦。沈阡陌偷偷瞥了她一眼，“其实吧，我做月老什么的，也很在行的哎……”<p class='chapter_content_read_css'>  “请喝茶，我那个啥，就麻烦你了。”夏曼偷偷红了脸颊。<p class='chapter_content_read_css'>  “好，自然自然，嘿嘿。”于是沈阡陌便暗中牵线，促成两人交往。<p class='chapter_content_read_css'>  不知不觉间竟已过了半年时光，夏父那边竟也不催促夏曼成婚，让她一直在偷乐，却也小心翼翼，害怕着难得的幸福会突然离去。<p class='chapter_content_read_css'>  果然，让她最害怕的事还是来临了，那日夏父强拉着她去到茶楼说是见她的未婚夫，商量婚事，她拗不过父亲只好过去，对方来得更晚，她整张脸都快低垂到桌子下面了，只听见门外男子很不情愿的声音。<p class='chapter_content_read_css'>  “父亲，孩儿已经有喜欢的人了，这婚约什么的，还是取消了吧。”<p class='chapter_content_read_css'>  “你真的想取消？”<p class='chapter_content_read_css'>  “当然。”<p class='chapter_content_read_css'>  “曼儿？”夏父轻拍夏曼后背，轻叹了一口气，“看来对方也不想履行婚约，不如……”<p class='chapter_content_read_css'>  “爹，我也要推掉婚约，我才不要嫁给什么不认识的人。”<p class='chapter_content_read_css'>  “这是你的真心话”<p class='chapter_content_read_css'>  “当然！”两个声音同时响起，还伴着开门的声音。<p class='chapter_content_read_css'>  “曼、曼儿（言哥哥）！”<p class='chapter_content_read_css'>  两人面面相觑，夏父与沈父相视而笑，“哈哈哈，老夏，真有你的，这两个孩子真是，哈哈哈哈哈哈。”良久才止住笑声。<p class='chapter_content_read_css'>  “现在怎么样？既然你们两人都不想履行婚约，那就……”夏父故作婉叹道。<p class='chapter_content_read_css'>  “不要！”夏曼嗔视夏父，“爹爹，你怎么可以这样呢！你知道我、我、我，唔呜呜呜……”说着竟红了眼眶，大哭起来。沈言连忙上前，也顾不得其他，为她拭泪。<p class='chapter_content_read_css'>  “老夏，你这下可玩过了，把曼儿都气哭了，怎么办呢？”<p class='chapter_content_read_css'>  “不是还有你宝贝儿子了吗？唉，女大不中留喽。”<p class='chapter_content_read_css'>  “你就放心吧，我们会照顾好曼儿的。”二老互相看看，都是一笑。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  随即便是挑个黄道吉日成亲，让两家人都卸了担子。<p class='chapter_content_read_css'>  离着成亲的日子没有几天了，却又出了事故，沈言病倒了。<p class='chapter_content_read_css'>  大夫请了无数，汤药吃了不计其数，沈言没有一丝好转的迹象，甚至更加严重，两家头顶都围着重重的阴郁。<p class='chapter_content_read_css'>  “这可怎么办，言儿的病情越发严重，若是有个万一，那曼儿可怎么办？”沈母满脸担忧。<p class='chapter_content_read_css'>  “我们决不能拖累曼儿，不如，就将这婚约，推掉吧……”沈父的最后一句话也是沉重异常。<p class='chapter_content_read_css'>  “也，只能是如此了。”<p class='chapter_content_read_css'>  “唔。”夏曼蹲在墙角，使劲捂住嘴，努力不让自己哭出来，怎么办……怎么办……言哥哥……呜呜呜呜呜呜……<p class='chapter_content_read_css'>  天色渐渐暗下来，夏曼悠悠醒转，就瞧见眼前站着个人，应当是个男子，全身黑衣，戴着帷帽方巾，只露出一双赤色眼瞳，直勾勾的盯着自己。<p class='chapter_content_read_css'>  “你、你是谁？”她这才发现自己早已不在沈院中，心中愈发惊恐。<p class='chapter_content_read_css'>  “听闻你夫君病了。”<p class='chapter_content_read_css'>  她慢慢点了点头。<p class='chapter_content_read_css'>  “你可知忘川花？”<p class='chapter_content_read_css'>  可让死人复生，活人延寿的阴司之花。她又点了点头。<p class='chapter_content_read_css'>  “这便是了。”说着竟凭空变出一朵火红妖艳的花朵，“可以救你夫君的神花。”<p class='chapter_content_read_css'>  她眼中闪着期冀。<p class='chapter_content_read_css'>  “你只要帮我做一件事就好。”他盯向她，如同猎物一般，血光从眼中一闪而过。<p class='chapter_content_read_css'>  忘川之花，一生，数死。<p class='chapter_content_read_css'>  夏曼不知道这个决定会改变原有的轨迹，让一切不由自主的朝着最坏的方向行进。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>  第二日夏曼便遵照男子说的方法煎好了忘川花，喂沈言服下，沈言面色果然好了几分。夏曼便不疑有他，每日到说好的地点拿取忘川花，虽然每次见到男子时夏曼心里就会一哆嗦，但为了沈言，她还是乖乖和他见面。<p class='chapter_content_read_css'>  自从食了夏曼带来的草药不过短短数日，沈言就已经好得差不多了。但是夏父有些奇怪她是从何处取来如此神药，一直在追问于她，却只换来了潦草敷衍。煎药喂药一直由夏曼亲力亲为，任何人都插手不得，又或者是在防着他人，夏父心中升起一种不祥的预感。<p class='chapter_content_read_css'>  果然，不祥来临了。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351925&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351925&&novelId=15670'">下一章</div>
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

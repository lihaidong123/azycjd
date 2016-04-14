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
    <title>（三十八）真失忆是假失忆 假戏又或是真做</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351951&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351951&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351951+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（三十八）真失忆是假失忆 假戏又或是真做]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351951')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351951 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351951,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第39章&nbsp;&nbsp;&nbsp;（三十八）真失忆是假失忆 假戏又或是真做
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			晏紫荆直直等了好几天才等来她二哥，二哥还是一副风流快活的模样，还带来了李娘家的红豆包子。<p class='chapter_content_read_css'>晏紫荆刚摸到包子就觉得不对劲，“二哥，这包子怎么是凉的？不会是昨天的吧？你坑我呐。”<p class='chapter_content_read_css'>“哎呀呀，当然不是昨天的啦，其实是六天前的。”说完二哥耸耸肩，一脸好笑的看着她。<p class='chapter_content_read_css'>“怎么会？”晏紫荆嫌弃的把包子丢掉，“你干嘛不今天买？”<p class='chapter_content_read_css'>“哈哈，这么远就算我现在买也要过六天才能送到啊，”二哥敲敲她的脑袋，“不过还好我把李娘带来了，这样你什么时候想吃就可以吃了。”<p class='chapter_content_read_css'>“还是二哥好哦。”晏紫荆亲昵的搂住二哥的胳膊，“二哥你给我说说最近又碰上什么好玩的了……”说着将二哥拉进房间里，将宫娥们全部赶走。<p class='chapter_content_read_css'>“这下只有我们兄妹两人了，有什么话就说吧。”二哥自顾自的在房间里转转，视线停留在晏紫荆脸上。<p class='chapter_content_read_css'>“二哥你说什么呀，我只是想问问你最近干嘛呢。”晏紫荆坚持装糊涂。<p class='chapter_content_read_css'>“哎呀呀，小妹妹，你忘了你是谁带大的吗？就你那点小心思能瞒过我吗？”二哥就着拍了晏紫荆屁股一下。<p class='chapter_content_read_css'>晏紫荆随即翻了个白眼给他。<p class='chapter_content_read_css'>“我一听宫珩说你失忆了就觉得有事，”二哥满不在乎的直呼宫珩的大名，“失忆这种事你会摊上？哎呦喂，你从小就缺根筋，再失忆那不就彻底白痴了？”<p class='chapter_content_read_css'>“你才白痴了！”晏紫荆鼓着腮帮子怒视他。<p class='chapter_content_read_css'>“哎呀呀，好了啦，”二哥使劲蹂躏着晏紫荆的脸蛋儿，晏紫荆整个脸都皱在一起，“说吧说吧，干什么装失忆？”<p class='chapter_content_read_css'>说起这，晏紫荆又扭扭捏捏起来。<p class='chapter_content_read_css'>“是因为宫珩？”<p class='chapter_content_read_css'>晏紫荆点点头。<p class='chapter_content_read_css'>“听说你是在册封皇后的晚上跑路的？怎么，反悔了，不想嫁给宫珩了？”<p class='chapter_content_read_css'>晏紫荆点点头又摇摇头。<p class='chapter_content_read_css'>“你是说跑路是真的但又想嫁给宫珩？”不愧是亲哥，晏紫荆的心思一下就被猜到，“所以说，是为什么？既然想嫁那你嫁给他做皇后不就好了，干嘛两个人折腾来折腾去的？”<p class='chapter_content_read_css'>“可是我不想做皇后。”<p class='chapter_content_read_css'>二哥古怪的看着晏紫荆，摸着下巴道：“你说人家姑娘都巴不得嫁个有情人，最好这个有情人还有权有势有钱，你这两样都占了咋还就不同意了？”<p class='chapter_content_read_css'>“我不要做皇后，外婆难道没有告诉过你吗？做皇后是要被剥皮抽筋然后惨死的。”晏紫荆故意用很恐怖的声调说道。<p class='chapter_content_read_css'>听完，二哥哈哈大笑，就差没在地上打滚了。<p class='chapter_content_read_css'>“所以、所以你就跑路，然后撞到头装失忆？哎呦喂，晏紫荆你可笑死我了！”<p class='chapter_content_read_css'>“二哥！你再笑我真打你了！”晏紫荆亮出魔爪来。<p class='chapter_content_read_css'>“好好，我不笑了。”二哥止住了笑声，抹去眼角的泪花，脸色严肃的告诉晏紫荆。<p class='chapter_content_read_css'>“皇后会不会惨死我不知道，我只知道若是一个男人真的爱一个女人的话，这个男人绝对会豁出命来来保护她，当然，若是你真的被嫌弃了话，就回来，二哥养你啊。”<p class='chapter_content_read_css'>“二哥……”晏紫荆感动的都快要哭了，二哥又突然大笑道：“放心，二哥可比你活的时间长，会把棺材钱给你准备好的，啊哈哈哈……”<p class='chapter_content_read_css'>“二哥……”晏紫荆默默扶额，好不容易感动一回怎么就撑不了一会儿呢？<p class='chapter_content_read_css'>……<p class='chapter_content_read_css'>听完二哥的开导——呃，算是开导吧，晏紫荆终于决定去跟宫珩坦白，她是在装失忆啊，她其实很想嫁给他的。<p class='chapter_content_read_css'>但是还没等她去找宫珩，宫珩就浑身酒气的钻到她的房间里了。<p class='chapter_content_read_css'>宫珩脚步摇晃的往前直栽碰倒了不少椅子，晏紫荆只好上前扶住他，被他一把抱住，他把头埋在她胸口喃喃自语。<p class='chapter_content_read_css'>“紫荆，你原谅我，原谅我好不好……”宫珩被晏紫荆丢到床上，他面色酡红眼神迷离的看着晏紫荆。<p class='chapter_content_read_css'>“你，我根本就没有怪你。”晏紫荆看他醉成那个样子可能也什么都听不到，就想收拾了被褥到旁边房间去睡。<p class='chapter_content_read_css'>“不要走。”晏紫荆没想到他醉成那个样子还能准确地捉住她的手腕然后将她压在床上，“不要走。”<p class='chapter_content_read_css'>宫珩的身体没有她想象中的那么沉重，只是很是灼热，像是要把她也连着烧掉，宫珩凝视她一会儿，俯身吻上她的唇，并不是上前几次一样只是单单吻住唇瓣，而是将舌头滑进她的嘴里，细细舔舐着她的上颚、舌头、牙齿……<p class='chapter_content_read_css'>混合着酒的气味的津液混在一起，晏紫荆渐渐被宫珩给带入到炽热中。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>那天晚上发生的事晏紫荆越想越不对劲，跑去跟二哥说道，刚瞅见二哥的一片衣角就听到女子的嬉笑声。<p class='chapter_content_read_css'>“二哥。”晏紫荆轻咳一声，走进鸟房里，果不其然她二哥在调戏人家小宫娥。<p class='chapter_content_read_css'>“哎呀呀，紫荆你有什么事吗？”二哥问道。<p class='chapter_content_read_css'>“就是有点私事。”晏紫荆瞅瞅那几个打扫的宫娥示意她们退下。等到整个鸟房里只剩下二哥和她时，她才扭扭捏捏张了张嘴，又把话咽了下去。<p class='chapter_content_read_css'>“怎么了？”二哥诧异地看着她，“怎么又扭扭捏捏起来了？到底什么事还不能让二哥我知道了？”<p class='chapter_content_read_css'>“就是那什么……”晏紫荆想了半天才想了个措词，“就是那个如果男的喝的伶仃大醉还能——洞房吗？”<p class='chapter_content_read_css'>“哈？”最后三个字若不是二哥尖着耳朵就肯定听不到了，“你说什么？洞房？”<p class='chapter_content_read_css'>晏紫荆一下子红了脸，点了点头。<p class='chapter_content_read_css'>“哦——我知道了，一定是你和宫珩洞房了吧？”二哥用手指扣住下巴，认真道，“如果是真的喝的伶仃大醉的话一定没力气干那种事了，你哥哥我可是过来人，酒嘛，最多算是个催化剂，也就壮壮胆增加点情调罢了。”<p class='chapter_content_read_css'>再低头就又看见晏紫荆快要哭出来的表情。<p class='chapter_content_read_css'>“怎么？他拿发酒疯的幌子跟你……”二哥挑挑眉。<p class='chapter_content_read_css'>“嗯。”晏紫荆委屈地点点头。<p class='chapter_content_read_css'>“唉，那就没办法了，生米已经煮成熟饭，你总不能让它脱水再变成生米吧？”二哥语重心长的劝诫她，“既然都这样了，你就要好好跟他过日子了，但他毕竟是皇帝，可跟寻常百姓还有那些王公贵族不一样，你也要脑子活泛些，知道了不？”<p class='chapter_content_read_css'>二哥揉了揉她的脑袋。<p class='chapter_content_read_css'>“对了，怎么我来了这么些天也没见着阿南啊？你把她藏哪了？”<p class='chapter_content_read_css'>晏紫荆面色一变，摇摇头，心虚道：“我也不知道。”<p class='chapter_content_read_css'>二哥揉揉她的脸，“怎么？那次跑路是阿南帮你的？宫珩罚她了还是把她赶出宫了？”<p class='chapter_content_read_css'>“好像是……”<p class='chapter_content_read_css'>外面突然一阵吵闹，晏紫荆和二哥赶忙到外面看看。<p class='chapter_content_read_css'>鸟房的南面就是是一片荷塘，再南面就是浣衣局。<p class='chapter_content_read_css'>“好像是有人落水了，紫荆。”二哥拍怕晏紫荆的肩膀。<p class='chapter_content_read_css'>晏紫荆听到水里微弱的呼救声面色忽然惨白，抖着手指向荷塘的方向，“是、是、是阿南，二哥……”<p class='chapter_content_read_css'>随即是二哥跳入水中的声音，晏紫荆连忙趴到水边，她没听错，落水的人就是阿南。<p class='chapter_content_read_css'>晏紫荆呆着见二哥将阿南救上来，“对不起”三个字就哽在喉咙里说不出来。阿南被二哥直接抱到太医院，晏紫荆只能傻傻跟在后面。<p class='chapter_content_read_css'>“怎么样了？”听闻消息的宫珩也赶了过来，将晏紫荆搂住问二哥。<p class='chapter_content_read_css'>“情况有些严重，之前，你是不是罚了阿南板子？”二哥严肃的问道。<p class='chapter_content_read_css'>“板子？有，之前阿南帮着紫荆逃跑就自己去领了板子，然后就自己请求去了浣衣局，怎么了？”宫珩回答，然后一顿，“难道是板子的伤出的问题？”<p class='chapter_content_read_css'>“不止如此，阿南除了板子的伤还有手上脚上手肘腿部各处的伤，最主要的是她伤口溃烂，还发起了高烧，太医说若是今天这烧退不下去，恐怕就无力回天了。”<p class='chapter_content_read_css'>“怎么会有这么多伤……朕想起来了之前顾王妃上过一本折子说是让朕好好管理管理那些宫娥们，莫不是她们私下动了私刑？这帮人真是越来越无法无天了。”<p class='chapter_content_read_css'>“是我不好……”晏紫荆蹲下身捂住脸痛哭起来，她早就该发觉的，阿南明明早就受了这么多苦了，自己怎么就没有发现呢？自己怎么就只顾着自己了呢？<p class='chapter_content_read_css'>“紫荆，是我不好，是我不该罚阿南，再让她去浣衣局的，你不要……”宫珩被二哥截住了话。<p class='chapter_content_read_css'>“她想哭就让她哭个痛快，憋在心里反而不好受。”二哥居高临下的看着晏紫荆从双肩耸动到直接趴在宫珩怀里。<p class='chapter_content_read_css'>等晏紫荆哭够了站起来，一抹脸上的泪，信誓旦旦道：“我以后绝对会好好保护阿南的。从现在起我就守在阿南床前了，你们谁也不要拦我。”<p class='chapter_content_read_css'>二哥伸手想要摸摸她的头又在空中画了个圈摸了摸自己的下巴，“放心，我们没想拦着你。”<p class='chapter_content_read_css'>晏紫荆说到做到除了出恭之外没离开阿南床前半步，就连洗澡也不去，就那样守了整整三天三夜，阿南才彻底退了烧醒了过来。<p class='chapter_content_read_css'>晏紫荆又给阿南换药喂饭换衣服，什么事都亲力亲为。阿南养了一个多月身上的伤终于好得差不多，晏紫荆却在端药的时候闷头一黑晕了过去。<p class='chapter_content_read_css'>不得不说晏紫荆的肚子很争气，才一夜就怀孕了。<p class='chapter_content_read_css'>宫珩和二哥听了这个消息也是喜上眉梢。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351951&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351951&&novelId=15670'">下一章</div>
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

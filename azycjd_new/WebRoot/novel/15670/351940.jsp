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
    <title>（二十七）往事云烟已成灰 你我不必再纠葛</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351940&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351940&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351940+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（二十七）往事云烟已成灰 你我不必再纠葛]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351940')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351940 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351940,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第28章&nbsp;&nbsp;&nbsp;（二十七）往事云烟已成灰 你我不必再纠葛
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			南宁一直低着头，回忆在大脑里终结，原本她以为可以完完全全忘记这些事，不会再见到这个人，结果没想到她还是见到了，还在这里见到的，原本简单单纯的穿越事件变得匪夷所思起来。<p class='chapter_content_read_css'>  “阿南，当年我不知道事情的真相，冤枉你，还故意害你出事，是我的错，你能原谅我吗？”他紧紧抱住她，像是握住绝世珍宝。<p class='chapter_content_read_css'>  南宁捂上双耳，她不敢听他的声音，她害怕听到那痛入骨髓的话。<p class='chapter_content_read_css'>  “好啊，我相信你呢。”<p class='chapter_content_read_css'>  “你滚！你滚，你滚！”南宁也顾不得身后的长河，拼死挣扎，挣脱阿阳的禁锢，跌跌撞撞地向后退，只两步就踏入了河中，却在像平地一般稳稳站住。<p class='chapter_content_read_css'>  阿阳见她反应如此激烈，便撤了幻术，花海、暗河、大理石桥和一分为二的天际瞬时消失，就连那小屋也是假的，一同消失。<p class='chapter_content_read_css'>  阿阳不以为意地笑笑，伸手摸摸南宁的头顶，身影隐入夜色中，声音散入风中：“阿南，我还会来找你的……”<p class='chapter_content_read_css'>  南宁怔怔的站在原地，也不知听没听见他的话，放在双耳上的手缓缓滑落，砰地一声跪在地上，身体微微颤抖。<p class='chapter_content_read_css'>  *<p class='chapter_content_read_css'>  南宫宁雪给寨子里的人下完安神香不过短短一个时辰，就听到后屋一声惨叫，赶忙穿了外袍前去查看。<p class='chapter_content_read_css'>  他到时行云都已经脱了外袍要睡了，他原先以为是木梓发出的声音，先去了木梓房中，房门大开，他给南宁的药膏被砸碎在地上惨不忍睹，木梓则趴在床上，一脸讪讪。<p class='chapter_content_read_css'>  他还没问怎么回事，木梓就和盘托出。<p class='chapter_content_read_css'>  “秦小妹她也不知道今日是怎么回事，非要给我抹药，还要我自己脱衣服，我不好意思脱嘛，她就要扒我衣服，我就反抗了一下，然后就，就发展成地上那堆了，再就是秦小妹跑出去了，你看我这样子也追不出去，最后就是听到秦小妹跟那啥，姓陆的那小子吵起来了，也不是吵吧，就听见姓陆的一个人在骂骂咧咧，最后就，一声惨叫。”木梓挠挠头，“不会真出什么事吧？”<p class='chapter_content_read_css'>  出门之前南宫宁雪又看了一眼地上的药膏，额角的青筋跳了两跳，重抚过额头勉强平静下来，顺便给木梓带上了门。<p class='chapter_content_read_css'>南宫宁雪还没靠近隔壁的门，行云就先一步套上了外袍，右手摸上枕边的长剑，衣蓝一个翻身瞥了他一眼，然后闭眼继续睡。<p class='chapter_content_read_css'>“公、公子？”行云刚拔了剑，就看清是南宫宁雪，吓得差点儿把剑扔到地上，心中暗道：幸亏刚才我没把剑刺过去，不然一定会被卸掉的。<p class='chapter_content_read_css'>“行云，刚才到底出什么事了？”南宫宁雪也不管他刚才干了什么事，摸黑踱到床边，居高临下对着行云。<p class='chapter_content_read_css'>“啊？没什么，就是，就是。”行云抖着手把剑收回剑鞘。<p class='chapter_content_read_css'>“干什么吞吞吐吐！”南宫宁雪身上不自觉的发着杀气。<p class='chapter_content_read_css'>“就是秦姑娘把，把陆钦给打了。”行云不禁咽了口唾沫。<p class='chapter_content_read_css'>“你没说反？”南宫宁雪语气也十分不信。<p class='chapter_content_read_css'>“属下确定绝没说错，确实是秦姑娘把陆钦打了。”行云觉得说完后周围的杀气忽然削弱下来。<p class='chapter_content_read_css'>“然后呢？”<p class='chapter_content_read_css'>“然后秦姑娘就往南边去了。”行云话音刚落，南宫宁雪就从视线内消失，留下吱吱呀呀乱响的房门。<p class='chapter_content_read_css'>“快点把门关上去吧，小心进冷风冻了小少爷。”衣蓝忽然开口。<p class='chapter_content_read_css'>行云慢慢的扭头，看向右手边床铺上的闭着眼的衣蓝：“你刚才没睡着？”<p class='chapter_content_read_css'>“你说呢？”<p class='chapter_content_read_css'>“那为什么你不提醒我要进来的是公子啊！”行云自然是知晓衣蓝自小便跟在公子身边，公子的种种他也会是无比熟悉，所以刚才他绝对是早就知道来人是公子才不动生息的，但是，为什么也不提醒他一声啊！<p class='chapter_content_read_css'>“是你笨，别人都睡了，能敢闯咱俩房间的人也只有公子了。”衣蓝抛了个白眼给他。<p class='chapter_content_read_css'>“我哪知道公子会带着这么重的杀气啊，我还以为是被打的陆钦。”<p class='chapter_content_read_css'>“刚才公子去了木少爷房中。”衣蓝淡淡提醒他。<p class='chapter_content_read_css'>“那又为什么？”<p class='chapter_content_read_css'>衣蓝这下连个白眼都不愿意给他，彻底不搭理他了，心里吐槽：朽木不可雕也。<p class='chapter_content_read_css'>行云闷哼了一声，连外袍也不脱蒙上被子就睡。<p class='chapter_content_read_css'>睡在衣蓝里侧的顾叶砸吧砸吧嘴，嘴角还微微流着口水，睡眠质量丝毫没受影响。<p class='chapter_content_read_css'>南宫宁雪愈往南边走就觉得愈发奇怪，植物变得越来越少，偶尔看见几棵树也是枯黄的叶子，没有丝毫生机。<p class='chapter_content_read_css'>“你滚！你滚，你滚！”突然传来南宁的尖叫声，南宫宁雪连忙跑过去，只看见南宁闷声跪在地上，双臂紧紧环抱着，身影如蝉翼一般在夜色中抖动。<p class='chapter_content_read_css'>“秦……姑娘？”南宁的脸朦胧在夜色中，完全看不清神情，南宫宁雪微微向前倾身子，却措不及防的被南宁一把环住腰，顺着也跪到了地上。<p class='chapter_content_read_css'>南宁紧紧环抱住他的腰，脸深埋在他前胸衣襟里。<p class='chapter_content_read_css'>南宫宁雪顿了一下，不但没有拨开她的手，反而回抱起她，眼神忽然变得深邃起来。<p class='chapter_content_read_css'>南宁的身子很冷，像是千年不化的寒冰那样，像是受尽委屈的小兽，在他怀里低声呜咽起来。<p class='chapter_content_read_css'>他的眼睛直直望向她的身后，是——一壁断崖。<p class='chapter_content_read_css'><p class='chapter_content_read_css'>南宫宁雪刚烧了一壶热水放在桌旁，觉着羊皮袋里的水该凉下来了，便将被子掀开一个小角把放在南宁怀里的羊皮袋拿出来，把里面变得透凉的水倒到另一个水盆里，紧接着换上热水，放到南宁怀里。<p class='chapter_content_read_css'>南宫宁雪用手背贴上南宁的额头脸颊，经过大约一个时辰热水的烘暖，南宁的体温才渐渐恢复正常值，南宫宁雪将被子又往上提了提，给南宁裹严实。<p class='chapter_content_read_css'>南宫宁雪坐在椅子上，一手托住下巴，一手缓慢的敲着桌子。<p class='chapter_content_read_css'>“咚、咚、咚……”<p class='chapter_content_read_css'>他低着眉仔细看着熟睡中的南宁，他从未如此认真的看过一个女子，眉眼之中并无娇艳，姿色平平，说话谈吐算得上礼貌却算不得大家闺秀，做派有时也很奇奇怪怪，身上还藏着——了不得的秘密。<p class='chapter_content_read_css'>但她有个地方和他很像，笑。<p class='chapter_content_read_css'>他能感觉到她的笑时常是虚与委蛇，很难是出自真心。他也是如此，小时候母亲早亡，父亲对他不管不顾，还不允许姐姐来看望他，只有一个小侍卫衣蓝陪着他，衣蓝只不过比他大两岁而已，却处处散着大人的味道，从来不敢与他说笑。<p class='chapter_content_read_css'>因为这些，所以他从来不和他人多说一句话，就连他的父亲也是如此，他不晓得要怎么笑，总是冷着脸，直到后来遇到师父。<p class='chapter_content_read_css'>师父道：“你为何要对他人如此冷淡？”<p class='chapter_content_read_css'>他答道：“我又为何不对他人如此冷淡？”<p class='chapter_content_read_css'>师父一本正经地勾起笑容，道：“为师要教于你行医之道，笑便是其中一记药方，无论你自愿与否，都要对他人笑，即使那是假的。”<p class='chapter_content_read_css'>他被师父捏起唇角，嘴里含糊：“为何？”<p class='chapter_content_read_css'>“日后你便知道了。”<p class='chapter_content_read_css'>师父的声音散在风中，很快就消散了。<p class='chapter_content_read_css'>后来他悟出一个道理，谦谦君子，温文尔雅，笑乃君子所为，笑亦可以隐藏心事，亦可以震慑人心。<p class='chapter_content_read_css'>笑容，有时是最厉害的武器。<p class='chapter_content_read_css'>他终究还是学会温文尔雅的笑容，踏遍各地游历，行医救人，人们看不懂他的笑意，只当他性格温雅，善解人意。<p class='chapter_content_read_css'>其实他心里还是恨的，他恨他父亲，恨他独宠大哥而对他不管不顾，恨他明明知晓是大哥的娘派人来杀他也无动于衷，恨他将姐姐当做筹码一般的嫁掉，恨他隐瞒母亲的死因。<p class='chapter_content_read_css'>其实他完全不记得母亲的样子，母亲死时他才刚刚满一岁，但是姐姐却整日在他耳边说起母亲，虽然后来父亲给姐姐下令，让她不能在与他相见，但是还是晚了，他已经知道他母亲是个多么好的人，深深刻进了骨子里，再也忘不掉。<p class='chapter_content_read_css'>母亲喜爱紫荆花，所以生前在院子里种满了紫荆花，一到花开时节，花香便会溢出院子，那时似乎全城的蝴蝶都会聚在母亲的院子中。<p class='chapter_content_read_css'>母亲剑术很是厉害，就连他的父亲也打不赢她。母亲很疼爱他和姐姐，总是喜欢抱着他和姐姐入睡，为他们唱晚安曲，就算不会女红还是拼命学习，亲手为他们缝制衣服。<p class='chapter_content_read_css'>母亲很是亲近下人，与她的贴身侍女以姐妹相待，她总是笑着，很是爽朗又很温柔的笑。每当说起这些，姐姐脸上就会溢出很是温暖的笑容。<p class='chapter_content_read_css'>六岁那年他在郊外遇到了师父，师父未问他是谁便要收他为徒，他对家中也无留恋，便什么也没收拾就拉着衣蓝一同到了君山。<p class='chapter_content_read_css'>师父是认识母亲的，师父常常会感慨母亲这么好的一个丫头怎么就嫁给了他父亲了呢？真是暴殄天物啊！<p class='chapter_content_read_css'>师父他老人家总是抱怨这两句，接着就不再说，每每都是吊着他的好奇心，直至十四岁那年，师父将陌雪阁交给了他，还告诉他。<p class='chapter_content_read_css'>他母亲的死其实另有隐情。<p class='chapter_content_read_css'>他想，他是该做些什么，他想要知道母亲的死因，即使他对她没有一星半点儿的记忆，但那是他无法跨越过去的心坎，他想找一个能够支撑起他的理由。<p class='chapter_content_read_css'>南宫宁雪看着熟睡的南宁，他不知道她经历过什么，有没有比他经历过的还要痛苦，他只知道一个稍微正常点儿的女孩是绝对不会一个人在大晚上跑到一壁断崖前面，除非是想不开要自杀。<p class='chapter_content_read_css'>还有他听到的她崩溃的怒吼声，一定是有人在她身边刺激到她，不过，他有仔细观察过，那断崖除了他上来的路，是没有第二条路可以离开的，除非，那人从断崖上跳下去。<p class='chapter_content_read_css'>“南宫神医，你这样一直盯着我，我夫君会吃醋的。”南宁不知道什么时候醒过来，侧着头微笑着看着他。<p class='chapter_content_read_css'>南宫宁雪心跳猛地漏了一拍。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351940&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351940&&novelId=15670'">下一章</div>
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

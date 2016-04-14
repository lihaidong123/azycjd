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
    <title>（四十七）崖壁底险象求生 坐等三日待生机</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=351964&&novelId=15670";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351964&&novelId=15670";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+351964+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[（四十七）崖壁底险象求生 坐等三日待生机]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('351964')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(351964 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','15670','公子，请上钩','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(351964,15670,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第52章&nbsp;&nbsp;&nbsp;（四十七）崖壁底险象求生 坐等三日待生机
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			  南宫宁雪是在河流的中游处找到南宁的。<p class='chapter_content_read_css'>  南宫宁雪身上只不过受了几处刮伤，他心里可是明明白白，他之所以只受了这一点轻伤的原因全是在下坠之时南宁翻身为他阻挡住了大部分的冲击力，虽然万幸的是他们坠入了一条宽河之中，但是水流甚急，他虽是攀住了河中岩石没有被冲走，但却没能抓紧南宁。<p class='chapter_content_read_css'>  他清清楚楚的听到了坠入水中那一瞬间南宁发出的闷哼，怕是又撞到了什么水中的底岩了，他费尽了力气爬上了河岸，一刻都不敢喘息的顺着河的流向赶忙去寻找南宁，南宁的狐毛披风晕满了血色被撕裂了数道巨口，挂在了河岸岩石上，被激烈的水流一遍又一遍拍打在河岸线上。<p class='chapter_content_read_css'>  南宫宁雪团了披风跌跌撞撞的继续往下寻找，河中的血色愈发艳丽，也愈发触目惊心，他的心也狠狠悬了起来。<p class='chapter_content_read_css'>  终于，在河流中游的岩石堆间发现了南宁，南宁此时已是伤痕累累，气息微弱。<p class='chapter_content_read_css'>  南宫宁雪拧着眉小心翼翼的将南宁从岩石堆里抱出来，虽然他已是尽量不触碰到她的伤口，但南宁还是痛苦的呻吟几声，细眉拧成一团，怎么也舒展不开。<p class='chapter_content_read_css'>  “秦姑娘，秦姑娘，秦姑娘……”南宫宁雪只能背着她才能不弄痛她的伤口，一边寻着能够栖身的山洞，一边不断的呼唤着南宁，但南宁只是安静的伏在他的背上，有时甚至连吹在他脖颈的她的鼻息也感觉不到了。<p class='chapter_content_read_css'>  他从未如此慌张过，好像他都不再是他了，恐惧像潮水一般向他袭来，慢慢席卷了他的整个身心，声音慢慢变得低沉嘶哑起来。<p class='chapter_content_read_css'>  “秦姑娘，秦，南宁，南宁，南宁，南宁，你醒醒啊，醒醒啊。”<p class='chapter_content_read_css'>  南宁的鼻息忽然加重，南宫宁雪惊喜的停住脚步，微微侧头看她，只见南宁睫毛微颤，缓缓睁开了失焦的双眼，定定的看了他半晌，才恢复了清明，喑哑的喉咙里吐出几个字。<p class='chapter_content_read_css'>  “七、七，书、绘、音，不能，阿……”<p class='chapter_content_read_css'>  喉头一哽，竟是又昏了过去。<p class='chapter_content_read_css'>  南宫宁雪只好咬着牙继续寻找着栖息的山洞，终于在河的下游处寻到了一处山洞，山洞之中有篝火的痕迹，还有几具森森白骨，怕是和他们差不多遭遇的人没有找到出路，活活死在这里了吧。<p class='chapter_content_read_css'>  幸好还有几堆稻草，他铺了厚厚一层，小心翼翼的让南宁平趴在稻草上，自己则捡了一些柴火烧起了篝火，他将撕裂了好几道口的狐毛披风用树枝撑起来烤干，又从自己湿漉漉的衣袖里翻找着什么有用的伤药，还好瓷瓶的密封很好并没有进水。<p class='chapter_content_read_css'>  南宫宁雪道声失礼，慢慢掀开了南宁的衣物，虽然衣物被岩石刮得破烂不堪，可她背上只有几道浅显的血痕，但腰部却有一大片淤青，南宫宁雪克制住手抖将药抹在她背上，动作轻缓却很费力气，额头冒出了密密麻麻的冷汗。<p class='chapter_content_read_css'>  南宁不时地哼吟几声，眼皮挣扎了半天却还是没有睁开。<p class='chapter_content_read_css'>  南宁最重的伤在左肩胛骨和右腿上。左肩胛骨处划了一道长约三寸深到甚至可以看见里面的骨头的伤口；右小腿骨两处骨折，还有几处大片的淤青。<p class='chapter_content_read_css'>  南宫宁雪光是为她止住肩胛骨处的血就花了有半刻钟，再加上处理别处的伤口，一共整整处理了一个时辰。恰好狐毛披风也干了，他便红着脸褪去了南宁身上湿漉漉的衣服给她裹上了披风。<p class='chapter_content_read_css'>   天色渐暗，见着南宁还未有苏醒的迹象，南宫宁雪猛然想到山洞中的累累白骨，敛了敛眉，不知从何处寻了一把铁楸，不多时就刨了一个深坑，屏息将那些白骨踢入坑中，这次便施了一个诀将坑洞填平，原本躺在脚下的铁锹也不见了踪影。<p class='chapter_content_read_css'>  他又往火堆中投了一些木材，这时，天才真真正正落下了夜幕。 <p class='chapter_content_read_css'>   他坐在已经烘干的石头上，空荡荡的山洞里只能听到木材燃烧的霹雳啪啦的声音，他静下心来，竟是低低叹了一口气。<p class='chapter_content_read_css'>   其实昨夜他便知晓他大哥派了刺客来刺杀他，他是早已有了心理准备，恰在这时风大小姐身患重病，他便有了理由来这山崖引出这些刺客，没想到还引来了南宁，只是这南宁一路跟踪他，他竟然丝毫没有发现，待发现之时却落得了这般境地，幸得他沿途做了标记，虽说心里对书绘音不是甚悦，但也只能靠他了。<p class='chapter_content_read_css'>  他坐的地方正好可以看见南宁，一想到刚才为她裹披风的场面，脸刷的就红了起来，就连耳根都是滚烫着的，慌张地捏着耳朵念了好一会儿清心咒，脸颊的绯红才退了两退。<p class='chapter_content_read_css'>  不多时，外面竟传来了低哑沉闷的雷声，他站起身向洞口走去，夜色阴沉没有一颗星辰，豆大的雨点猝不及防的打了下来，恰好落在了他的脚边，雨势越来越大，在他脚下华丽丽的划出了一道水陆分明的界限。<p class='chapter_content_read_css'>  远远的瞧见了一点绿光一闪而过，他正想再看清楚一些，一声嘶哑的尖叫和一道凌厉的闪电同时响起。他骤然回身，南宁正痛苦的蜷缩着身子。<p class='chapter_content_read_css'>  披风褶皱得有些凌乱，隐隐露出南宁的光洁肩膀，南宫宁雪快步上前手掌一扬便又将她紧紧裹在披风里面，只露出满是骇然的脸蛋儿。<p class='chapter_content_read_css'>  南宁紧闭着眼牙花咬的咯咯直响，身子是止不住的颤栗，手指死死抠着身下的稻草，南宫宁雪连忙掰开她的手，她手指尖满是密密麻麻的血痕和稻草屑。<p class='chapter_content_read_css'>  他还未来得及给她清洗伤口上药，便被她紧紧攀住了胳膊不能动弹，南宁直接将头埋进了他的腿间，他跪坐在地上，鬼使神差的摸了摸南宁还有些湿漉漉的头发，南宁则似受到了安抚身子渐渐平静下来，只是手还是紧紧攥着南宫宁雪的袖子。<p class='chapter_content_read_css'>  忽而一声闷雷划破了苍穹，南宁使劲抖了一下身子，他像是明白了些什么，抽出右手在她耳边揉了揉，淡淡地低声一句，语气是他也没有想到的温柔。<p class='chapter_content_read_css'>  今晚，注定是个不眠之夜。<p class='chapter_content_read_css'>  ************<p class='chapter_content_read_css'>  “书绘音，这到底是不是南宁他们留下来的啊！”琴霜七提着一盏雕花灯，看着书绘音不紧不慢地看着地上奇怪的图案，心里急的恨不得想要破口大骂。再看看那深不见底的悬崖，心里更是既拔凉又可恨，虽说她比书绘音晚来了一步，但还是瞧见了被处理掉的尸体的一角，即使天色昏暗，就她戴着隐形眼镜就有二点零的视力来说，那断崖边触目惊心的鲜血也是让她战栗良久。<p class='chapter_content_read_css'>  若是、若是，南宁和南宫他们俩真的掉了下去，那可是会，是会……<p class='chapter_content_read_css'>  “混蛋！”琴霜七猛地将灯盏摔在了地上，虽然有什么英雄救美、落崖得秘籍、女主角不死定论！可是啊！这根本就不是什么小说啊！也不是什么可以重启的文档啊！俗话说没有一万也有万一，如果真的出了事可怎么办啊！<p class='chapter_content_read_css'>书绘音微微抬头看向她，不由得愣了愣，慢慢起身，手往衣袖里一掏，落了个空，这才想到他唯一的那方帕子早就被他做成香囊给南宁了，只好抬起衣袖向琴霜七脸上碰去。<p class='chapter_content_read_css'>  琴霜七像是受了惊吓，向后退了一步，这才发觉不知什么时候脸上布满了密密麻麻的泪痕，她狠狠别过头用袖子粗鲁的抹了两把，强装镇定，但语气里还是带着些许鼻音。<p class='chapter_content_read_css'>  “怎么样，到底是不是南宁他们留下的？”<p class='chapter_content_read_css'>  书绘音缓缓移开了在她身上的视线，看着无一星辰的浓黑夜空，淡淡道：“一半罢了。”<p class='chapter_content_read_css'>  “什么意思？”琴霜七被书绘音拉了一把撞在他怀里，刚想挣扎，就听见一声闷雷，紧接着就是惶急的雨声，但雨滴没有如她所料的打在身上，她微微抬头，一把十二指骨伞正布在头顶，撑伞人正是刚才拉她的书绘音。书绘音的手还停在她的胳膊上，琴霜七只觉得背后有些阴凉，微微打了个冷战。<p class='chapter_content_read_css'>  “放心，”书绘音收回手，忽然不着痕迹的向后斜了一眼，一股暖气又包裹在了琴霜七周围，“他们二人自是无事。”<p class='chapter_content_read_css'>  “你怎么会知道的？”琴霜七虽是隐隐觉得书绘音神通广大，但心里还是忍不住在质疑，他怎么可以如此笃定一个人的死活？<p class='chapter_content_read_css'>  “那人我是不知晓，若是南宁的话，必定无事，只是身子上会有多少多重的伤，我自是不敢确定。”再看着她眼里的不解，书绘音竟是无奈的解释道，“我是在南宁身上下了咒，若是她当真有了性命之忧，我身上必定会遭到反噬，你看，我现在不就好好的站在你面前。”书绘音也不明白自己为何要多费口舌的跟她解释着这些，他微微压了一下银白色的发丝。<p class='chapter_content_read_css'>  忽然一道闪电直直劈在了断崖的一棵树上，立刻便有了糊焦的味道。<p class='chapter_content_read_css'>  琴霜七面色一寸一寸的惨白下去，僵硬的抬头看着书绘音，像是蹦豆子似的一个字一个字向外吐着。<p class='chapter_content_read_css'>  “南宁她、最害怕、闪电、和、雷声了……”<p class='chapter_content_read_css'>  书绘音安抚似的触了触她的背。<p class='chapter_content_read_css'>  “放心，无事的。只要……撑过三天便好了。”最后一句他说的声音极低，甚至连他自己也没有听清楚，但琴霜七的注意力只在了前半句上，并没注意只听了半截的“只要……”<p class='chapter_content_read_css'>  “南宁，你千万要没事啊……”琴霜七紧紧攥着手，喃喃道。<p class='chapter_content_read_css'>  身后忽然传来了一阵阴冷之气，书绘音不着痕迹的负过手，阴冷之气被轻易化解。<p class='chapter_content_read_css'>  树后的人狠狠攥了攥手，很不甘心的负气离去。<p class='chapter_content_read_css'>  今晚，当真是个不眠之夜。<p class='chapter_content_read_css'>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=351964&&novelId=15670'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/15670/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=351964&&novelId=15670'">下一章</div>
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

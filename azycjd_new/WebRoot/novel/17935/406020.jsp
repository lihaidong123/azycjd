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
    <title>第五十五章 你与那贱人</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406020&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406020&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406020+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第五十五章 你与那贱人]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406020')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406020 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406020,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第59章&nbsp;&nbsp;&nbsp;第五十五章 你与那贱人
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			萧怜月回过身，妖娆得面上怒意逐渐散去，转而是一片冰冷。<br /><p class='chapter_content_read_css'>“谁给你这样得胆子？”带着浓烈得恨意，似要穿透这片天地得天寒地冻，字字犹如彻骨得冰锥落入人的心头，“十七，枉我如此费尽心思一手带出你，你却成为这百年来的第一人，真当以为我不会杀了你吗？”<br /><p class='chapter_content_read_css'>西凝雪愕然，这长生殿竟有百年的历史了，然而却在江湖上没有传出过半点得消息。<br /><p class='chapter_content_read_css'>而温夕言为了她不惜触怒这个女教主，也是心头有别的打算吧。他不像是这么好心得人，会三番两次得救一个无关得人。<br /><p class='chapter_content_read_css'>“三年前，教主就应当知道十七得意愿，十七，也甘愿死在教主手下。”温夕言无比平静得说道。<br /><p class='chapter_content_read_css'>然而知道他是有目的而为，还是免不了攥紧指尖，心如擂鼓。<br /><p class='chapter_content_read_css'>“是啊，这三年我一人在这长生殿中守着，守来得却是你为了这个女人求情，我该是为了你有情而高兴呢？还是为了你对我无情而难过呢？”萧怜月目光陡然阴寒起来，嘴角咧开一丝极致得笑容，“你有胆当着我的面保她，我倒要看看你是否真的肯为了她破功。”<br /><p class='chapter_content_read_css'>现场算上一些所谓的护法和守卫，其它得弟子已经回到了月庭，西凝雪未曾想过局势会发展如此，她想向凤无栖求救来着，但是这样无非就是让他也加入被萧怜月发气的对象。<br /><p class='chapter_content_read_css'>她只能愣愣得看着，萧怜月像个母老虎一样，没有半分顾忌得撕烂了温夕言左半边衣衫，白皙得皮肤暴露在空气中，温夕言仍是从容的站着，好似一切都挑不起他的慌乱。<br /><p class='chapter_content_read_css'>连西凝雪望着那露出来得肌肤，不由得打了个冷颤。但眼睛还是紧紧贴在那边，一瞬不瞬的紧盯着，这种机会难得，难免要多望几眼才是，全然忘记了自己得疼痛，奋力得想要绕过萧怜月得身体多瞄几眼。<br /><p class='chapter_content_read_css'>也不知萧怜月在看什么，直勾勾得盯着他半晌，才喃喃道，“怎么可能，宫砂还在……你与那贱人……”<br /><p class='chapter_content_read_css'>哟，她什么时候从女人荣升为贱人了？看来这长生殿主对自己得情敌，可真是不客气。<br /><p class='chapter_content_read_css'>“她是十七收得徒弟。”<br /><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	“徒弟？”萧怜月一听怔了怔，半信半疑得又将他拉在自己怀里，似是叹息得眼底闪烁着柔弱得泪光，“没有……还好你没有……任何人都可以背叛我，倘若你这么做，我一定……让你尝尽这世间所有得痛。”<p class='chapter_content_read_css'></p><p class='chapter_content_read_css'><p><p class='chapter_content_read_css'>	凤无栖表情有些凝重，当然不是因为这边相拥得这对，而是因为我失血过多。凑巧不小心多望了几眼，然后气血上涌更加抑制不住得狂吐了一口精血，眼睛一翻，倒地不起。<br /><p class='chapter_content_read_css'>后来不知到底发生了什么事，西凝雪就糊里糊涂得被送到了主殿里住着，就是那个传闻只有教主一人住得地方，连最尊贵得偏殿弟子都在不经允许得情况下也不准踏足半步。<br /><p class='chapter_content_read_css'>然而趁着这修习得空档，她就在估摸着温夕言和萧怜月之间一定有什么，她不是没有想过是萧怜月一心单恋温夕言，可温夕言这么铁石心肠绝没有半点情谊得人，除非是为了自己得利益，又怎肯平白无故屈服于人呢。<br /><p class='chapter_content_read_css'>而她总觉得，萧怜月对他的感情，也不是普通的男女之情一样，这只是一种预感。只是她受到的惊吓着实不小，脑子一片混乱什么都想不出来。<br /><p class='chapter_content_read_css'>她不是要妄加揣测这之间的玄机，而是如果不这么猜，连一点脑子都不肯动，那么自己就会一直处于被动得情况下，那么一直被温夕言等人牵在手底下走，她不想自己再被利用，参入进温夕言那看似柔情似水得局中，实际上却是充满了万般危险得陷阱里。<br /><p class='chapter_content_read_css'>在任何时候都不能放松警惕，有一丝一毫得机会也要为自己争取。这便是寂秋然大师从小到大传给她得道理。<br /><p class='chapter_content_read_css'>可惜了这上好得雪蛤和千年灵芝，她阅读得医书不少，当看到这日日送来得一碗价值千金得补药，还是心疼的哇凉哇凉的。但自己得病诚然是拖不了，虽被那长生殿主打了几掌没有死，但也只剩半条命了，这几天好不容易把半条命补回来了，身子还是虚得厉害，走个路头就昏昏沉沉得。<br /><p class='chapter_content_read_css'>还想趁着这时候把这一碗千金药汤留下来，到时候指不定可以拿出去卖个千两银子呢。<br /><p class='chapter_content_read_css'>惋惜是惋惜，还是乖乖得将这碗药喝得干净，一滴不剩得砸了砸嘴。说实话这味道可不咋地。<br /><p class='chapter_content_read_css'>“怎么，我长生殿得药还不入你的口么？”<br /><p class='chapter_content_read_css'>“哎哟娘的……”一声突如其来得声音吓得她把手里头得碗打翻，她吓了好大一跳，不过幸好手里头得是金碗，就算扔在地上几十次也不会摔坏。<br /><p class='chapter_content_read_css'>察觉到身后得人是谁，西凝雪无比乖巧得贴在地面行礼，“见过教主。”<br /><p class='chapter_content_read_css'>萧怜月始终都对她一副鄙夷不屑得目光，但还是摆摆手让她起来，自己却坐在了一边得矮几上，可惜了好好得一张几被当做凳子来坐。这长生殿主不稀罕，她稀罕得心头都在流血，这都是银子啊！银子啊！<br /><p class='chapter_content_read_css'>“我此次来，就是想要知道，十七在长生殿外到底在做什么，我要你一五一十得告诉我。”<br /><p class='chapter_content_read_css'>西凝雪暗地里不屑得哼了哼，你要我说我就说啊？我是什么人，怎么会为了保全自己出卖别人呢。<br /><p class='chapter_content_read_css'>一双碧蓝得双眸凝视着她，恍惚而又迷惘得心神再一次被勾起。西凝雪知道那劳什子得什么月和凤无栖一样，会一种能够探听人内心得秘术，而这种秘术正是她现如今最忌惮的，她却无从反抗。<br /><p class='chapter_content_read_css'>“我不想在这浪费时间，你说是不说。”<br /><p class='chapter_content_read_css'>“我真得什么都不知道！”抗住那重压，西凝雪掐紧掌心以保持神智得望着萧怜月，“他不会撒谎的，你若要问些什么他也会答，你何不亲自去问他。”<br /><p class='chapter_content_read_css'>“我念在你是十七徒弟得份上，用了我最珍贵得药材治好你的病，现如今看来你是敬酒不吃吃罚酒了。”<br /><p class='chapter_content_read_css'>“……教主，我不喜欢喝酒。”<br /><p class='chapter_content_read_css'>萧怜月得眼一横，白了一眼她。<br /><p class='chapter_content_read_css'>“你不说也罢了，总之你给我好好呆在这主殿里，就算你要下山我也会派人送你出去，不过你要记着，十七，他永远都会在这里陪着我，恐怕是不能和你再见面了。”<br /><p class='chapter_content_read_css'>哎哟，陪着你就陪着你呗，还特地跑过来跟我讲什么，跟我炫耀他是你的？别了，我西凝雪是有志气得人，我可以再找一个、二个、三个、几百个温夕言，原本我就没想赖着他这死瘟神，别说他相貌只是我中意得，比他美上千万倍得美男子在这世间也是比比皆是，我稀罕什么？<br /><p class='chapter_content_read_css'>他只算得上天下无双、独一无二，但绝不会是这天下最好得，轮着个来排，我西凝雪要选也选不上他这样冷血心肠得人。<br /><p class='chapter_content_read_css'>当然，想是这么想得，说是不敢这么说。就是这些日子在这主殿闷了，憋屈得慌，况且主殿不比月庭可以随意出入，只是踏出了三两步得距离，就会被轰回来，不知这长生殿主是不是真的以为把她变相囚禁在这里，就可以用来威胁温夕言。<br /><p class='chapter_content_read_css'>可她要是真的是他得弱点，她早就出去跳个几次崖，到海里也扑腾个几次，这样掏心窝得宝贝称号还是留给小喜儿吧。<br /><p class='chapter_content_read_css'>“教主说得是，我跟了师父也才半年左右，这半年来我别的不知道，我就是时常看见我师父他老爱在房里发呆，每次发呆都是几个时辰，好像是在想念什么人一样，而每到月圆之夜，他经常会站在院子里一个人赏月得，有时候还会拉着我一起赏月！”<br /><p class='chapter_content_read_css'>这些虽是假的，但为了讨好这厮也是她应该做得，这样一来，不仅她能过得好一点，托她这番话没准让温夕言也过上好日子呢。<br /><p class='chapter_content_read_css'>没想到萧怜月一听她这样说，眼睛那是顿时就亮了，表面却不动声色得勾了勾嘴角，“你说得可是真的？那他还做了什么没有？”<br /><p class='chapter_content_read_css'>“没有，除此之外师父就在捻磨草药和阅读书卷。”<br /><p class='chapter_content_read_css'>有时候慌开得大那可就吹了，她得谎言只是让长生殿主和温夕言之间得关系变得微妙，长生殿主只会以为他这样冷血心肠只是表面现象，实际上很喜欢她却不明着说出来，除非长生殿主真得厚得下这个脸皮去问他，不然这谎言多半是并不会被拆穿的。<br /><p class='chapter_content_read_css'>萧怜月得面容温和了些，口气也不由自主得柔软了些道，“再过些日子，我会和祈言商量送你出山，你就先等着点吧。”<br /><p class='chapter_content_read_css'>祈言？祈言又是谁？能让长生殿主提起得人来头也不小啊，不过听名字应该也是个美男子吧，难不成就是那偏殿其中得一个？<br /><p class='chapter_content_read_css'>还未等她多想，萧怜月已经离开了。<br /><p class='chapter_content_read_css'>不过能让她离开，远离这是非实地便是好的。到时候管它什么长生殿，她一人自个儿逍遥快活去，岂不是更好。<br /><p class='chapter_content_read_css'>只是现在不该想这些有的没有的，萧怜月下的可是死手，若非她天生右脏，现在恐怕她来见到的只会是一具冰冷得尸体。而温夕言这个家伙也是，明明能够阻止萧怜月得毒手，还那么有恃无恐得慢悠悠得走过来，好像就等着她被萧怜月一掌轰死一样。<br /><p class='chapter_content_read_css'>在主殿里修养了多日，彻底与外界失去了联系。<br /><p class='chapter_content_read_css'></p>
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406020&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406020&&novelId=17935'">下一章</div>
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

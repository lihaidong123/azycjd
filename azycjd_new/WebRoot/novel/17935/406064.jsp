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
    <title>第九十八章 绝不要犹豫</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406064&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406064&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406064+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第九十八章 绝不要犹豫]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406064')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406064 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406064,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第102章&nbsp;&nbsp;&nbsp;第九十八章 绝不要犹豫
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			“我是知道。”西凝雪目光清幽，反手将他推开，“我现在说得一字一句你都听清楚，忻娘，兰忻。当年得与宫外人私逃得兰淑仪，她与宫外男子相爱两人远走高飞，并在旅途中生下一子，后来兰淑仪被抓了回去，那孩子被人抱走了。这几年，兰忻忍辱负重了许多，只是为了见那个孩子一面。”<br /><p class='chapter_content_read_css'>楼锦仁怔了一下，眸中闪过了不可置信得震惊，脸色刹那间变得苍白失去人色，内心中挣扎了许久，几乎是瞬间得崩溃。<br /><p class='chapter_content_read_css'>忻娘，那个宫女……那个一直陪在他得身侧的人……<br /><p class='chapter_content_read_css'>为了确认他心中得猜想，西凝雪缓缓说道，“那是你娘，是含辛茹苦十月怀胎将你生下得亲娘，而怡妃和杨贵妃却是害死你娘得凶手。”<br /><p class='chapter_content_read_css'>楼锦仁双眉紧皱，眼脸重重垂下，整个人摔在了地面，早就听闻殿中动静得老太监跑了过来，赶紧扶起了他。<br /><p class='chapter_content_read_css'>“三殿下，您没事吧，没有伤着哪里吧！”<br /><p class='chapter_content_read_css'>“没有，权叔……你下去吧，我有事要与她谈。”楼锦仁站稳身子，面容上覆着一层冰冷却坚定得神色。“我要为我娘报仇，我要杀了她们！我要杀了她们，你告诉我，我到底要怎么才可以杀了她们！”<br /><p class='chapter_content_read_css'>西凝雪诧异得挑眉，没有想到他竟是这样坚定得心智。<br /><p class='chapter_content_read_css'>一个孩子得年龄，听见亲娘死去不该是痛哭流涕伤心欲绝得嘛，怎么这小子没有丝毫悲痛之色。<br /><p class='chapter_content_read_css'>西凝雪上前一步，抬手按住他得肩膀，“三皇子，我告诉你这些并不是让你成为被仇恨驱使得人，你娘希望你安安稳稳得生活着，永远都不要有事。就算你真得想要报仇，凭你现在得能力根本不足以对抗她们，你又能拿什么打败她们呢？”<br /><p class='chapter_content_read_css'>楼锦仁捏紧拳头，脸色涨红，“弑亲之仇不共戴天，就算我现在杀不了她们，我也一定要让她们不得安稳，我会拼进我得所有！”<br /><p class='chapter_content_read_css'>“所有？你得所有？能有什么，是一手遮天得权势，还是富可敌国得财势？三皇子，你有没有想过，你如果出了什么事，你怎么能对得起你得娘亲，兰忻将你嘱托给我，我便有义务护着你，所以我不希望你去做傻事，反之，我还会极力得阻止你，在时机没有成熟之前。”<br /><p class='chapter_content_read_css'>听了她得话，楼锦仁眸光雪亮，像是充斥了一些不曾有过得东西。<br /><p class='chapter_content_read_css'>“我明白了，那么我要做些什么。”<br /><p class='chapter_content_read_css'>“诈死，离开皇宫。”<br /><p class='chapter_content_read_css'>“不！我不会离开得，我要留在皇宫里！”<br /><p class='chapter_content_read_css'>“三皇子殿下，我并不是在赶你离开，而是你必须要离开。”西凝雪牵起了他得手，认真说道，“她们不会放过你得，在这之前你必须逃走，离开皇宫好好生活。你年纪虽小，但是却有着一身得才能，将来也必是不凡之人，在宫外培养自己得势力白手起家想必也不是什么难事，至于银两得事你也不必担心，我在长子城中认识一人，那人是我得至亲是可以信任得人，到时你可以逃离到那里，她会帮你安排一切得。”<br /><p class='chapter_content_read_css'>“可，我……”<br /><p class='chapter_content_read_css'>“想要报仇，所做得第一步那就是绝对不要犹豫，杨贵妃手段毒辣怡妃心思阴毒你必须比她们更加厉害，更加不能轻易被撼动内心。如果连这点小事都要犹豫不决，那殿下还是趁早去她们面前送死得好，免得我耗费心思还要护着你。”西凝雪又拍了拍头，也只有自己知道，自己这番话纯属是在糊弄人，情急之下搪塞用得借口。<br /><p class='chapter_content_read_css'>可少年却将眼睛睁得很大，似乎是深信不疑得点下了头。<br /><p class='chapter_content_read_css'>眼见着自己终于将他忽悠成功了，西凝雪终于松了口气，弯唇一笑，“我会找马车偷偷将你运送出城，到了地方之后，你拿着这块手帕给楼中楼主，她会知道我得意思。一切都不会有人知道，那么现在，我希望再见到三殿下时不会再像现在这般，殿下一定会出人头地得是吧。”<br /><p class='chapter_content_read_css'>楼锦仁凝起面容，嘴边却展开一丝笑容，衬得眸子别外得黑亮，“自然。”<br /><p class='chapter_content_read_css'>西凝雪微微含笑，心里头却开始着手计算着接下来得所有事。<br /><p class='chapter_content_read_css'>杨贵妃一双眼虎视眈眈得在宫里望着，她是巴不得让自己和三皇子一齐去死，就像对付兰忻一样。<br /><p class='chapter_content_read_css'>“殿下，老奴刚才望见有怡妃娘娘带着一批官兵前来势汹汹得闯入了景和殿得前院，恐怕再有一会儿，就……就……”<br /><p class='chapter_content_read_css'>“该死！那个坏女人！”楼锦仁立身站起，还没有来得及说些什么突然捂住了胸口，神色痛苦得跌在地上。<br /><p class='chapter_content_read_css'>西凝雪吓了一跳，上前将他扶起，当看清楚人得时候忍不住浑身一震，紧张得抓起了楼锦仁得手，他双唇发紫，像个木人一样垂着头坐在榻上，双眼也是紧闭着的。<br /><p class='chapter_content_read_css'>老太监跟着跪在一边，面无人色得惊叫道，“殿下！殿下！三殿下……你怎么了啊三殿下！”<br /><p class='chapter_content_read_css'>西凝雪皱紧眉头，凝神把脉，企图从他紊乱得体内找出病因，时间不够，她也做不来解毒得事。<br /><p class='chapter_content_read_css'>那么楼锦仁究竟是什么时候中得毒，为何还偏偏是自己来得时候中毒。<br /><p class='chapter_content_read_css'>“羽嫔娘娘！怡妃娘娘已经带着人闯进来了，怎么办。”老太监跑到门口，惶恐得张望着。<br /><p class='chapter_content_read_css'>西凝雪心中一沉，下意识得看了一眼殿门口。<br /><p class='chapter_content_read_css'>“羽嫔妹妹造访景和殿，看来是身子好些了，空档也闲下来了。”一个女人走进殿内。<br /><p class='chapter_content_read_css'>西凝雪面色平静，并没有一丝一毫得焦虑。<br /><p class='chapter_content_read_css'>“哪里比得上怡妃娘娘呢。”<br /><p class='chapter_content_read_css'>算起来那时锦纤哥哥在得时候，这怡妃还是一副脾气好心地好得后宫标榜，现在知道她真面目时，才觉得这天底下没有多少东西是真的，尤其是人得情感。<br /><p class='chapter_content_read_css'>怡妃惊讶得绽开了嘴角得笑容，袖袍一摆姿势端庄得坐在一边，神色如常得看着西凝雪。<br /><p class='chapter_content_read_css'>“我看你倒是牙尖嘴利，是个聪明得丫头，仁儿……你说对吧。”怡妃笑着将楼锦仁抱在怀里。<br /><p class='chapter_content_read_css'>此刻楼锦仁虽陷入了昏睡状态，可闻着怡妃身上那股莲香味，却仍旧浑身打着颤无法挣动丝毫。<br /><p class='chapter_content_read_css'>他要杀了这个女人，给娘报仇！杀了她，杀了她……<br /><p class='chapter_content_read_css'>“我哪里能比得上娘娘呢，娘娘才是这后宫最聪颖得人。”<br /><p class='chapter_content_read_css'>怡妃听着这话却突然一笑，笑得勾魂摄魄，“这耍嘴皮子得话怎么到了你得口中却愈发不中听了呢，不过今日我倒不是来听你奉承得。来人，去将马统领请过来，就说下毒得人已经找到了。还有这个和羽嫔串通在一起准备毒害仁儿得老太监，作为仁儿身边得贴身太监，竟然放任凶手肆意下毒，先给我把他拖出去杖毙！”<br /><p class='chapter_content_read_css'>西凝雪猛然瞪大眼睛，拧紧了自己得衣袖。<br /><p class='chapter_content_read_css'>唯一得人证便是楼锦仁身边得老太监，可是如果连他都被杀了，那么就再也没有人能够证明自己的清白了。<br /><p class='chapter_content_read_css'>怡妃望着西凝雪苍白得面色，更加得意得笑着，五指轻轻抚摸着楼锦仁得脸庞，像是在抚摸一件精美无比的瓷器。<br /><p class='chapter_content_read_css'>“羽嫔不必害怕，我向来是不会冤枉人得，只是现在所有得证据都指着羽嫔妹妹，妹妹就先随我去大理寺一躺，待我将此事上报给皇上，请皇上断定之后，定会还妹妹一个清白。羽嫔妹妹，你不要怪我，我爱子心切，实在容不得别人要加害我得血亲，尤其是我得仁儿。”<br /><p class='chapter_content_read_css'>西凝雪有口解释不清，就算是再开解释为自己开脱也是枉然，看来这样得情况只能先随着这群人去一趟了。<br /><p class='chapter_content_read_css'>“娘娘请。”早就赶来，等着受命得马统领前来押送她。<br /><p class='chapter_content_read_css'>西凝雪被几人团团围住，然后不得不离开了大殿。<br /><p class='chapter_content_read_css'>半晌，空荡得殿内忽然走进了一人，身姿婀娜，一身艳丽得衣裙耀人眼球。<br /><p class='chapter_content_read_css'>“娘娘，我看那女人已经让这小子知晓了兰忻得身份，再留着他也是招惹麻烦，不如一不做二不休杀了这小子，永绝后患。”<br /><p class='chapter_content_read_css'>怡妃只是微微一笑，转头望着面色依旧没有血色，青紫色得毒液可见得布满了他得全身，只要再过半个时辰他就会因为中毒而毒发身亡，一条小小得生命就要消失在世界上了。<br /><p class='chapter_content_read_css'>“锦仁啊，你说这么些年我对你还算好吧，可你偏偏要与我作对，还和那小贱人串通一气起了歪心思对付我和姐姐，这让我怎么能留你呢。不过在你临死前，我便好心告诉你一条消息，这几日是我命人在你得饭菜中下了阿拉雅得药散，那种药散无色无味不会有人察觉到，更不会被人发现，不过那药散得作用可就奇了。只要接触到一丝香气便会让你五脏六腑中积聚得毒液都满布全身，我得仁儿啊，是最讨厌用香得人，所以啊，可别怪母妃狠心了，要怪就怪那姓兰得小贱人，还有那个妄想撼动我地位得西凝雪。”<br /><p class='chapter_content_read_css'>“仁儿不要怕，等你死了以后，母妃会整日念经诵佛给你超度，让你下一世投胎到一个好地方，不怕。”<br /><p class='chapter_content_read_css'>怡妃美丽得笑容一凝，眼神阴狠起来，两手突然扼住了楼锦仁的脖子。<br /><p class='chapter_content_read_css'>“去死吧……”<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406064&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406064&&novelId=17935'">下一章</div>
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

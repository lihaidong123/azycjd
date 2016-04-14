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
    <title>第一百零七章 你执念太深</title>
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
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&chapterId=406073&&novelId=17935";
				}else if(e.keyCode==37){
					window.location.href="<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406073&&novelId=17935";
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
			$.jBox("iframe:"+path+"/report_reason.jsp?chapterId="+406073+"&&novelId="+novelId, {
				title: "<div style='font-size:14px;'>我要举报[第一百零七章 你执念太深]</div>",
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
  	 		<a href="javascript:;" onclick="buyChapter('406073')">购买</a>
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
	    			<p style="padding-top: 15px;"><a href="javascript:loadReportReasonJsp(406073 )">举报</a></p>
	    			<p><img src="images/9_p_1.png" alt="" /><a href="javascript:;" onclick="daShangNovel(3,'${loginUsers.id}','17935','江湖险恶医女求生记','yes')">打赏</a></p>
	    			<p><img src="images/9_p_5.png" alt="" /><a href="javascript:;" onclick="shuqian(406073,17935,this)">书签</a></p>
	    		</div>
	    	</div>
	    	<div class="read_content_center">
	    		<div style="font-size: 20px; font-weight: bold;text-align: center !important; padding-top:40px;line-height: 40px;">
	    			第111章&nbsp;&nbsp;&nbsp;第一百零七章 你执念太深
	    		</div>
	  			<c:if test="${not empty buyInfo }">
		  	 		<div class="buyInfo_css">${buyInfo }</div>
		  	 	</c:if>
	  			<div id="novel_content" style="font-size: 14px;padding: 20px; width: 80%;margin: 0 auto;">
		  			　西凝雪心头一跳，看向他得神色多了一丝复杂。他这番话本就是特意说给她听得，他想找机会杀了温夕言，就像对付杨贵妃一样。可是她什么都不能说，也什么都不能做，在这件事情中她根本没有任何得立场，无论是帮任何一人并不会对自己有好处。<br /><p class='chapter_content_read_css'>可楼锦川想得太简单了，自以为能够掌控所有人，包括这西燕、包括这皇位，只是她不愿意留在这里，也从始至终都没想过要与太子有半点牵扯。<br /><p class='chapter_content_read_css'>一国太子，未来掌控天下得君王，就算现在说再多得甜言蜜语，可到了时候仍是三宫六院、粉黛三千，她西凝雪一生只会爱一个人，也不会允许自己所爱得人将爱分给其他得人。唯独是这点，楼锦川永远都做不到，就算他真得做到了那又如何，西燕众臣绝不会容纳她一人独占后位，到了时候便成为众矢之千人嫌万人骂。<br /><p class='chapter_content_read_css'>西凝雪垂下眼眸，淡淡说道，“我累了，我要休息。”<br /><p class='chapter_content_read_css'>楼锦川目光涌出了复杂得神色，最后还是叹了口气，“好，快睡吧，明日本宫会带你去金龙殿一趟。”<br /><p class='chapter_content_read_css'>西凝雪也不再多想了，这次是真得很累了，也不管接下来会发生什么事情，待到翌日晨晓，西凝雪是被一声惊炸吓醒得，她头晕脑胀得抚着额头朝前望去，一个婢女正手忙脚乱得收拾地上得瓷杯碎片。<br /><p class='chapter_content_read_css'>“慢着。”西凝雪晃晃脑袋让自己清醒了点，“你叫什么名字。”<br /><p class='chapter_content_read_css'>婢女抬头惶恐得看了她一眼，又犹如惊弓之鸟一般低下头沉默。<br /><p class='chapter_content_read_css'>“……没关系，你再去端一杯漱茶吧。”西凝雪原想问问楼锦川去哪里了，不过看着阵势她们一定将她和楼锦川都同化了，她再想从她们口中套出什么消息来那可就难了。<br /><p class='chapter_content_read_css'>脑袋还是昏昏沉沉得，西凝雪翻身坐起，揉了揉腰，每次起来都腰酸背痛得，也不知道是什么毛病。<br /><p class='chapter_content_read_css'>慢悠悠得梳洗一番，将自己打理得干净后，才记起楼锦川昨日说要带她去面圣，不知道是什么时候去，她也好准备准备。<br /><p class='chapter_content_read_css'>时间空闲下来，西凝雪在东宫逛了逛，顺带搜罗了不少得翡翠玉饰。<br /><p class='chapter_content_read_css'>正当她对一尊金佛像难以割舍得时候，婢女进屋吩咐她楼锦川回来了，她叹了口气，只好将那尊金佛像摆回原处，三步并两步得朝外走去。<br /><p class='chapter_content_read_css'>她已经多日没有在东宫闲逛了，现在走着东宫得路，竟有些生疏绕了好大一个圈才找到自己得屋子在何处，径直走进去之后，迎面而来得是他微凝得神色。<br /><p class='chapter_content_read_css'>“这么多人竟然连一个人都照看不好，看来你们是领着奉银偷懒了？”<br /><p class='chapter_content_read_css'>“没有啊我们真得没有啊，李管家，我们……”<br /><p class='chapter_content_read_css'>“闭嘴！拖下去打二十大板，罚去一个月得奉银，让你们这群不长脑子得人长长记性。”李管家冷哼一声，又将笑脸转向了楼锦川，“太子殿下，您看人已经都罚了，这……”<br /><p class='chapter_content_read_css'>“下去吧。”<br /><p class='chapter_content_read_css'>西凝雪还没明白发生了什么事情，眼见着两个伺候她得婢女被拖出去，她毫不犹豫得大步走了过去。<br /><p class='chapter_content_read_css'>“她们又没有做错什么事情，为什么要杖责她们？”<br /><p class='chapter_content_read_css'>楼锦川声音平稳，目光清明，“就算是在东宫也不可以掉以轻心，除了那个女人还有她得妹妹怡妃在看着，本宫不能让你独自一人出屋子，就算要离开这里也必须要由人陪同。”<br /><p class='chapter_content_read_css'>“可这与她们无关！是我要她们不要跟着我得！她们也是听我得命令才……”<br /><p class='chapter_content_read_css'>“本宫才是这东宫得主子，若是连本宫得吩咐都不听，这样得人还留着有什么意思？”<br /><p class='chapter_content_read_css'>西凝雪心中憋闷，却无话可说了。<br /><p class='chapter_content_read_css'>这地方的确是他楼锦川得，那两个婢女也是他手底下得，若是她手底下得人见异思迁得抛弃了她这个原主子投靠别人，她也一样会生气，可至少不会这样严厉得惩罚她们，比起这点，楼锦川倒是不折手段得多。可到底也是为了自己，她也不会不明白，自己从大牢中出来之后，将会有更多得危机等着自己。<br /><p class='chapter_content_read_css'>见着西凝雪沉默，楼锦川径直走到她得身侧，略一沉吟，片刻道，“本宫要得只是你得安危，小肆，你要理解本宫。”<br /><p class='chapter_content_read_css'>西凝雪抬头勉强一笑，却不再理会他，径直走过他得身侧与他擦肩而过。<br /><p class='chapter_content_read_css'>楼锦川搁在袖袍下得手微微颤抖了一下，很轻得颤抖，轻得连他自己都不曾察觉。他捏紧掌心，放柔了声音，“你不想随本宫去见见那个人吗？”<br /><p class='chapter_content_read_css'>那个人？……温夕言吗？<br /><p class='chapter_content_read_css'>西凝雪心头一动，神色却依旧淡然，没有露出丝毫雀跃得回头望了他一眼，“我想不想去还不是殿下一句话得事情，何必要征求我得意见。”<br /><p class='chapter_content_read_css'>楼锦川皱起了眉头，他知道这样淡淡得语气和那样平静得神情意味着什么，他也知道她现在心怀着怨仇，可他还是忍不住为了那句话而心头一颤，眸中染上了几分微怒。<br /><p class='chapter_content_read_css'>“小肆，你是在生本宫得气？气本宫惩罚了那两个无关紧要得女婢？”<br /><p class='chapter_content_read_css'>“没有。那是殿下应该有得权利，我一个外人阻碍不了。”西凝雪坐在梳妆台前将自己得发髻绾好，回过头微微一笑道，“那么殿下不是说要去面圣吗，现在时候应该差不多了吧。”<br /><p class='chapter_content_read_css'>“好，走吧。”<br /><p class='chapter_content_read_css'>……<br /><p class='chapter_content_read_css'>西凝雪靠着椅背，眼眸微闭着，心思又回到了前几日大牢得那一幕，心中微微闪过了几丝疑惑。<br /><p class='chapter_content_read_css'>西凝雪突兀得睁开眼睛，脱口问道，“当日你是怎么发现我在大理寺得牢中得？”<br /><p class='chapter_content_read_css'>杨贵妃知道她在此处，想必一定是不小心走漏了消息。杨贵妃那么谨慎得一个人，如果知道了她在大理寺得消息之后，肯定会将所有知道秘密得人都在暗中封了口。那么楼锦川便是再有能力，也不会再查到她得消息了。<br /><p class='chapter_content_read_css'>楼锦川并不意外得挑了挑眉尖，从容说道，“本宫早就派暗卫跟随在她身边，观察她得一举一动了。”他不相信西凝雪会死，这件事情一定是杨贵妃动得手脚，那么只要通过她便可以知晓一切得真相，而那个女人也的的确确让他失望了，先是欺瞒后是背叛，已经是他所不能容忍得极致。<br /><p class='chapter_content_read_css'>西凝雪若有所思，面上露出了些许惊讶得神情，“你是什么时候开始探查她得？”<br /><p class='chapter_content_read_css'>或是说什么时候就发现了什么不对，而让她出乎意料得是，楼锦川竟然真得会为了她去监视杨贵妃，还是说因为什么别得原因。<br /><p class='chapter_content_read_css'>楼锦川唇角泛起和煦得得笑容，从袖中抽出了一张皱巴巴得薄纸，而这张薄纸恰巧就是因为西凝雪偷懒，所以写来塞到他衣服里得那张。<br /><p class='chapter_content_read_css'>西凝雪感觉自己得神经都在跳动，不可思议得问道，“你就这么信我？若是我骗了你……故意让你心生猜疑……”<br /><p class='chapter_content_read_css'>“先前本宫也只是怀疑，她在背地里瞒着本宫有所动作，只是这一次，不能再容忍罢了。”<br /><p class='chapter_content_read_css'>西凝雪微微一笑，原来他是早有决策，那么自己这张字条也不过只是起了推导得作用，真正害了她得人还是她自己。<br /><p class='chapter_content_read_css'>“二哥，你心中执念太深了。为什么非一定要将注定能够得到手得东西弄得鲜血淋漓呢。”西凝雪转过头，笑容既是灿烂却也含有深意。而她所要表达得这点，他分明也是知道得。<br /><p class='chapter_content_read_css'>楼锦川听见这番话，凝着笑得俊朗面庞一僵，神色也是十分复杂得盯着她，似乎为此扰乱了心神。<br /><p class='chapter_content_read_css'>他越是要掩埋得东西，可到头来却一件件得被人挖出来，不论埋藏得有多深有多痛苦。<br /><p class='chapter_content_read_css'>楼锦川缓了缓面色，恢复了往日得平静说道，“本宫要用自己得方式夺到想要得东西，而不是做一个被人安排了一生得傀儡，如他得意随他得愿，一生做一个一事无成得帝王。”<br /><p class='chapter_content_read_css'>西凝雪动动嘴还是没能说出什么来。她得神情十分得平淡没有任何得变化，就算是现在她劝诫着也不会有半点得作用，相比起自己来恐怕那个位置才是重要许多，于他而言自己是个可以随意拿捏得万物，于她而言，要安稳得生活在宫中只能依靠他，这种纠结与矛盾不知要持续多久，她已经越来越累了。<br /><p class='chapter_content_read_css'>忽然觉得那只是和自己一步之遥得宫门，却成了遥不可及得距离，一次次想离开这里，却又因为不同得理由留在了这里，真不知道什么时候才能够结束这一切。<br /><p class='chapter_content_read_css'>楼锦川得目光在她稍露疲惫得面上扫了一眼，只觉得她那一双澄净得眸子里似乎流露出一丝极端复杂得神色，让他越来越看不透，而他也不知道究竟要用什么方式，才能消除两人之间得隔阂，若是放任如此下去，他们之间得鸿沟也只会越来越深。<br /><p class='chapter_content_read_css'>他轻轻叹了一口气，似是在凝息，“小肆，但愿在这世上我还有一人能信，否则，我将再也没有能支撑下去得理由了。”楼锦川将她得身子扳向自己，西凝雪眼中得哀叹让他不由自主得更加提起心弦，用着不可抑止得颤声道，“我只剩你了。”<br /><p class='chapter_content_read_css'>是，你所需要得是我。而我所需要得却不是你，我想要得东西有很多，可是这些……留在你得身边却一样也不能实现。<br /><p class='chapter_content_read_css'>西凝雪只是笑，楼锦川对她如此得信任与迷恋，这一切本都是一场绝好得殊荣。但终有一日如果连这些都被颠覆，他会变成什么样。<br />
	    		</div>
	    		<div style="padding-left: 240px; margin-top: 20px;">
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=up&chapterId=406073&&novelId=17935'">上一章</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/novel/17935/index.jsp'" style="float: left;">主目录</div>
	    			<div class="self_btn" style=" float: left;margin-left: 42px;" onclick="window.location.href='<%=request.getContextPath()%>/anzhichapter/upAndNext.do?looktype=next&&chapterId=406073&&novelId=17935'">下一章</div>
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

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="m_head.jsp"></jsp:include>
<style type="text/css">
	#menu_div_head{ display:none;}
	#footer_div{ display:none;}
	.options_div{ position:absolute;background-color:#CCCCCC; margin-top:15px; overflow:auto; padding-right:10px; padding-bottom:10px;}
	.options_div div{ float:left; background-color:#fffff !important; margin-left:15px; margin-top:10px; width:75px; height:30px; line-height:30px; border-radius:5px; text-align:center; font-size:12px; cursor:pointer;}
</style>
<script language="javascript">var readAddress='${param.readAddress}';</script>
<script language="javascript">
	$(function(){
		if(readAddress!=''){
	    	($(window).scrollTop(parseInt(readAddress)));
	    }
		$("#ziti_div div").click(function(){
			var t=$(this)[0].id;
			t=t.substring(0,2);
			$("#chapterContent").css("font-size",t+"px");
			
			SetCookie("novel_font_size",t);
			$("#zitidivparent").html(""+t+"");
			$("#ziti_div").slideUp();
			$("#beijing_div").slideUp();
		});
		$("#beijing_div div").click(function(){
			if($("#baitianClass")[0].className=="baitianClass"){
				var t=$(this)[0].id;
				$("#chapterContent").css("background-color","#"+t);
				
				SetCookie("novel_bg_color",t);
			    SetCookie("novel_bg_color_name",$(this).html());
			    SetCookie("heiyeBg","no");
			    $("#beijingdivparent").html(""+$(this).html()+"");
			}
			$("#ziti_div").slideUp();
			$("#beijing_div").slideUp();
		});
		
		var novel_font_size=getCookie("novel_font_size");
	    if(novel_font_size!=null&&novel_font_size!=undefined){
	    	$("#chapterContent").css("font-size",novel_font_size+"px");
	    	$("#zitidivparent").html(""+novel_font_size+"");
	    }
	    var heiyeBg=getCookie("heiyeBg");
	    if(heiyeBg!=null&&heiyeBg!=undefined&&heiyeBg=="yes"){
	    	$("#baitianClass")[0].className="heiyeClass";
	    	$("#heibaiimg")[0].src=path+"/mobile/images/baitian.png";
			$("#chapterContent").css("background-color","#484b4d");
			$("#chapterContent").css("color","#a7adb0");
			SetCookie("heiyeBg","yes");
	    }else{
	    	var novel_bg_color=getCookie("novel_bg_color");
		    var novel_bg_color_name=getCookie("novel_bg_color_name");
		    if(novel_bg_color!=null&&novel_bg_color!=undefined){
		    	$("#chapterContent").css("background-color","#"+novel_bg_color);
		    	$("#beijingdivparent").html(""+novel_bg_color_name+"");
		    }
		    SetCookie("heiyeBg","no");
	    }
	    
	});
	
	function changeHeiBai(obj){
		if(obj.className=="baitianClass"){
			obj.className="heiyeClass";
			$("#heibaiimg")[0].src=path+"/mobile/images/baitian.png";
			$("#chapterContent").css("background-color","#484b4d");
			$("#chapterContent").css("color","#a7adb0");
			SetCookie("heiyeBg","yes");
		}else{
			obj.className="baitianClass";
			$("#heibaiimg")[0].src=path+"/mobile/images/yejian.png";
			var novel_bg_color=getCookie("novel_bg_color");
		    var novel_bg_color_name=getCookie("novel_bg_color_name");
		    if(novel_bg_color!=null&&novel_bg_color!=undefined){
		    	$("#chapterContent").css("background-color","#"+novel_bg_color);
		    	$("#beijingdivparent").html(""+novel_bg_color_name+"");
		    }else{
		    	$("#chapterContent").css("background-color","#ffffff");
		    	$("#beijingdivparent").html("默认(白)");
		    }
		    $("#chapterContent").css("color","#272828");
		    SetCookie("heiyeBg","no");
		}
	}
	
	/**
	 * 章节加入书签
	 * @param id
	 */
	function shuqian(chapterId,novelId,obj){
		if(memberId==""){
			window.location.href=path+"/mobile/m_login.jsp";
			return;
		}
		obj.style.display="none";
		$.post(path+"/anzhibookmark/addAnzhiBookmark.do",{bookmarkType:1,chapterId:chapterId,novelId:novelId,readAddress:$(document).scrollTop()},function(res){
			if(res=="yes"){
				autoBuy=0;
				alert("成功加入书签！");
			}else{
				alert(res);
			}
			obj.style.display="block";
		});
		
	}
	
	function dashang(novelId){
		if(memberId==""){
			window.location.href=path+"/mobile/m_login.jsp";
		}else{
			window.location.href="<%=request.getContextPath() %>/anzhinovel/loadDaShangJsp.do?novelId="+novelId+"&&divIndex=0&&con=no&&pageName=mobile/m_dashang";
		}
		
	}
	
	function slideShuQian(obj){
		if($(obj).width()==14){
			$(obj).css("background","url("+path+"/mobile/images/joinmarkb.png) no-repeat");
			$(obj).animate({width:"137px",height:"78px"});
		}else{
			$(obj).css("background","url("+path+"/mobile/images/joinmarks.png) no-repeat");
			$(obj).animate({width:"14px",height:"60px"});
		}
	}
</script>
	<c:if test="${readFlag eq 'no' }">
  	 	<div class="no_read_flag_css">
  	 		该章节是VIP章节。
  	 		${errorInfo }
  	 		<a href="javascript:;" onclick="buyChapter(${pojo.id},'${loginUsers.id}')">购买</a>
  	 	</div>
  	 </c:if>
	<c:if test="${readFlag eq 'yes' }">
		<div id="novel_head_css_t" style="background-color:#FFFFFF; height:40px; padding-top:10px;">
			<table width="100%" border="0">
			  <tr>
				<td style="padding-left:10px; font-size:16px; font-weight:bold;">
					${pojo.novelTitle }
				</td>
				<td style="font-size:12px; cursor:pointer;" width="65" onclick="$('#ziti_div').slideToggle();$('#beijing_div').slideUp();">
					<img src="<%=request.getContextPath() %>/mobile/images/9_p_3.png" style="vertical-align:middle; margin-right:5px;"/>[<span id="zitidivparent">12</span>号]
				</td>
				<td style="font-size:12px; cursor:pointer;" width="105" onclick="$('#beijing_div').slideToggle();$('#ziti_div').slideUp();">
					<img src="<%=request.getContextPath() %>/mobile/images/huanfu.png" style="vertical-align:middle; margin-right:5px;" width="51"/>[<span id="beijingdivparent">浅绿</span>]
				</td>
			  </tr>
			</table>
			<div id="ziti_div" class="options_div" style="display:none;">
				<div id="10hao">10号</div>
				<div id="12hao">12号</div>
				<div id="14hao">14号</div>
				<div id="16hao">16号</div>
				<div id="18hao">18号</div>
				<div id="20hao">20号</div>
				<div id="22hao">22号</div>
			</div>
			<div id="beijing_div" class="options_div" style="display:none;">
				<div style="background-color: #ffffff;" id="ffffff">默认(白)</div>
				<div style="background-color: #e1e8b2;" id="e1e8b2">浅绿</div>
				<div style="background-color: #bdebe1;" id="bdebe1">浅蓝</div>
				<div style="background-color: #cfd5bb;" id="cfd5bb">浅灰</div>
				<div style="background-color: #ebd1de;" id="ebd1de">小粉</div>
				<div style="background-color: #bfe1c6;" id="bfe1c6">青色</div>
			</div>
		</div>
		<div style="width:14px; height:60px; position:fixed; top: 55%; background:url(<%=request.getContextPath()%>/mobile/images/joinmarks.png) no-repeat; " onclick="shuqian(${pojo.id},${pojo.novelId },this)"></div>
		<div style=" font-size:16px; font-weight:bold; margin-top:20px; text-align:center; line-height:40px;">
			${pojo.chapterTitle }
		</div>
		<c:if test="${not empty buyInfo }">
  	 		<div class="buyInfo_css">${buyInfo }</div>
  	 	</c:if>
		<div id="chapterContent" style="padding:10px; background-color:#FFFFFF; padding-bottom:20px;">
			${pojo.chapterContent }
		</div>
		
		<div class="footer" style="width:100%;" id="other_foot">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" height="60">
			  <tr>
				<td width="20%" style="background-color: #bfbfbf;">
					<div style="margin-top:0px;" onclick="window.location.href='<%=request.getContextPath()%>/mobile/readChapter.do?chapterId=${upChapter }'"><img src="<%=request.getContextPath() %>/mobile/images/shangyizhang.png" style="width:43px;"/></div>
				</td>
				<td width="20%">
					<div onClick="dashang(${param.novelId})"><img src="<%=request.getContextPath() %>/mobile/images/dashang.png" style="width:55px;"/></div>
				</td>
				<td width="20%">
					<div onclick="loadNovel(${novelId})"><img src="<%=request.getContextPath() %>/mobile/images/mulu.png"/></div>
				</td>
				<td width="20%">
					<div class="baitianClass" id="baitianClass" onclick="changeHeiBai(this)"><img id="heibaiimg" src="<%=request.getContextPath() %>/mobile/images/yejian.png"/></div>
				</td>
				<td width="20%" style="background-color: #bfbfbf;">
					<div style="margin-top:0px;" onclick="window.location.href='<%=request.getContextPath()%>/mobile/readChapter.do?chapterId=${nextChapter }'"><img src="<%=request.getContextPath() %>/mobile/images/xiayizhang.png" style="width:43px;"/></div>
				</td>
			  </tr>
			</table>
		</div>
	</c:if>
	
<jsp:include page="m_foot.jsp"></jsp:include>
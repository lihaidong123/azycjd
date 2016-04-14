<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Random r=new Random();
	String d=r.nextDouble()+"";
	d="end"+d.substring(3,d.length())+"leixing";
	request.setAttribute("mainDivId", d);
 %>
<div style="clear:both; overflow:auto;overflow-x: hidden;" id="articePageMainDiv${mainDivId }">
	<c:forEach items="${anzhinovelList.list }" var="s" varStatus="ind">
		<div class="article_items" id="article_items${s.id }" <c:if test="${ind.index%5==0 }">style="margin-left: 0px;clear:left;"</c:if>>
			<div class="noval_img" id="${s.id}novalImg${param.beishu }0<%=d%>${param.paihangbangleixing }${s.id}">
				<img src="${s.novelImg }" width="177" height="234"/>
			</div>
			<div class="noval_title" title="${s.novelTitle }">
				${fn:substring(s.novelTitle,0,9) }
			</div>
			<div class="noval_info_css">
				${fn:substring(s.vote,0,26) }...
			</div>
			<div class="noval_author"  title="${s.authorWriterName }">
				by ${fn:substring(s.authorWriterName,0,4) }<font class="acticle_add_time"><fmt:formatDate value="${s.updateTime}" pattern="yyyy/MM/dd HH:mm"/></font>
			</div>
			<div class="article_type_css" style="height:25px;">
				${s.novelType }
			</div>
			<div class="article_items_foot">
				<table width="100%" border="0">
				  <tr>
					<td class="zannum_css" title="总字数">${s.totalCharNum }</td>
					<td class="read_num_css" title="点击数">${s.clickNum }</td>
					<td class="end_article">${novelStateArr[s.state] }</td>
				  </tr>
				</table>
			</div>
		</div>
	</c:forEach>	
</div>
<input type="hidden" id="${param.timenow }" value="${anzhinovelList.totalNum }" />
<script type="text/javascript">
	$(function(){
		$("#articePageMainDiv${mainDivId } .noval_img").hover(function(){
			$("#book_info_css_div").remove();
			clearInterval(removeBookBaiscTimer);
			getBookBasicObject=$(this)[0];
			if($(this).data("novelId")==null){
				//说明没有加载
				loadNovelPartInfo(getBookBasicObject);
			}else{
				novelImg=$(this).data("novelImg");
				novelTitle=$(this).data("novelTitle");
				authorWriter=$(this).data("authorWriter");
				clickNum=$(this).data("clickNum");
				readNum=$(this).data("readNum");
				novelVote=$(this).data("novelVote");
				novelId=$(this).data("novelId");
				getBookBasicTimer=setTimeout("getBookBasicInfo()",400);
			}
		},function(){
			clearInterval(getBookBasicTimer);
			getBookBasicObject=null;
			novelImg=null;
			novelTitle=null;
			authorWriter=null;
			clickNum=null;
			readNum=null;
			novelVote=null;
			novelId=null;
			removeBookBaiscTimer=setTimeout("removeBookBasic()",1000);
		});
		$("#articePageMainDiv${mainDivId } .noval_img").each(function(){
			var ids=$(this)[0].id;
			var novleId=ids.substring(0,ids.indexOf("novalImg"));
			$(this).children("img").click(function(){
				window.open(path+"/novel/"+novleId+".jsp");
			});
		});
	});
</script>

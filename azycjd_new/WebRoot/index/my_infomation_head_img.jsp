<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="index_head.jsp" flush="false"></jsp:include>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.Jcrop.min.js"></script>
	<style type="text/css">
		.head_img_manage div{ margin-top:15px;}
		.head_img_manage ul{ list-style:none; padding:0px; margin:0px;}
		.head_img_manage li{ float:left; margin-left:25px; margin-top:15px; cursor:pointer;}
	</style>
	<script type="text/javascript">
	    var x;  
	    var y;  
	    var width;  
	    var height; 
	    var jcrop_api, boundx, boundy;   
	    
		function updatePreview(c) {
			if (parseInt(c.w) > 0) {
				$('#preview').css({
					width : Math.round(c.w * boundx) + 'px',
					height : Math.round(c.h * boundy) + 'px',
					marginLeft : '-' + Math.round(200 / c.w * c.x) + 'px',
					marginTop : '-' + Math.round(200 / c.h * c.y) + 'px'
				});
				$('#width').val(c.w);
				$('#height').val(c.h); //c.h 裁剪区域的高  
				$('#x').val(c.x); //c.x 裁剪区域左上角顶点相对于图片左上角顶点的x坐标  
				$('#y').val(c.y); //c.y 裁剪区域顶点的y坐标</span>  
			}
		}
		
		function inniit(ids){
			$('#'+ids).Jcrop({  
	            onChange: updatePreview,  
	            onSelect: updatePreview,  
	            aspectRatio: 1
	        },function(){  
	            // Use the API to get the real image size  
	            var bounds = this.getBounds();  
	            boundx = bounds[0];  
	            boundy = bounds[1];  
	            // Store the API in the jcrop_api variable  
	            jcrop_api = this;  
	        });
		}
	</script>
	<script language="javascript">
		$(function(){
			$(".user_head_img img").click(function(){
				if(confirm("您确定将选中的头像设置为当前头像吗？")){
					$("#now_head")[0].src=$(this)[0].src;
					$.post("anzhi/updateHeadImg.do",{oldHeadImg:$(this)[0].src},function(res){
						alert(res);
					});
				}
			});
		});
	</script>
	<form class="formCss" id="update_head_img" action="<%=request.getContextPath() %>/anzhimember/updateHeadCutImg.do" method="post">
		<div id="update_head_img_div" style="display: none;width:400px;">
			
		</div>
		<div style="margin-top: 15px;padding-left: 240px;">
			<input type="hidden" name="x" id="x"/>  
		    <input type="hidden" name="y" id="y"/>  
		    <input type="hidden" name="width" id="width"/>  
		    <input type="hidden" name="height" id="height"/> 
		    <input type="submit" id="saveImgBtn"  style="visibility: hidden;" value="保存头像"  class="resetBtnCss">
		</div>
		<div class="head_img_manage">
			<div class="divItemsCss">头像上传：<input type="text" style="width:360px;" class="txtCss" id="memberHeadImg" name="memberHeadImg" value="${loginUsers.memberHeadImg }">&nbsp;&nbsp;&nbsp;<input type="button" id="memberHeadImgBtn" value="浏览" class="uploadBtnCss"></div>
			<div>当前使用中的头像</div>
			<div style="padding-left:15px;">
				<img id="now_head" src="${loginUsers.memberHeadImg }" width="41" height="41">
			</div>
			
			<div style="margin-top:30px;">
				使用过的头像
			</div>
			<div>
				<ul>
					<c:forEach items="${anzhiheadimguserecordList.list}" var="a">
						<li class="user_head_img">
							<img  src="${a.useImg}" width="41" height="41">
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</form>
<jsp:include page="index_foot.jsp" flush="false"></jsp:include>